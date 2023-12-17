import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/analyzer/celest_analyzer.dart';
import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli/compiler/api/local_api_runner.dart';
import 'package:celest_cli/frontend/resident_compiler.dart';
import 'package:celest_cli/project/project_builder.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_core/protos.dart' as proto;
import 'package:mason_logger/mason_logger.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:watcher/watcher.dart';

final class CelestFrontend implements Closeable {
  factory CelestFrontend({
    required String projectRoot,
    String? outputsDir,
    required Logger logger,
    required bool verbose,
  }) {
    final projectPaths = init(
      projectRoot: projectRoot,
      outputsDir: outputsDir,
    );
    final analyzer = CelestAnalyzer(
      projectPaths: projectPaths,
      logger: logger,
    );
    return CelestFrontend._(
      analyzer: analyzer,
      logger: logger,
      verbose: verbose,
    );
  }

  CelestFrontend._({
    required this.analyzer,
    required this.logger,
    required this.verbose,
  });

  final CelestAnalyzer analyzer;
  final Logger logger;
  final bool verbose;

  int _logErrors(List<AnalysisException> errors) {
    logger.err('Project has errors:');
    for (final error in errors) {
      logger.err(error.toString());
    }
    return 1;
  }

  final _readyForChanges = StreamController<void>();
  late final _watcher = StreamQueue(
    StreamGroup.merge([
      FileWatcher(projectPaths.projectDart).events,
      DirectoryWatcher(projectPaths.apisDir).events,
    ]).buffer(_readyForChanges.stream),
  );

  final _stopSignal = Completer<ProcessSignal>.sync();
  bool get stopped => _stopSignal.isCompleted;

  ResidentCompiler? _residentCompiler;
  LocalApiRunner? _localApiRunner;
  var _didFirstCompile = false;

  Future<int> run() async {
    // TODO: Queue changed paths and only recompile changes
    unawaited(
      StreamGroup.merge([
        ProcessSignal.sigint.watch(),
        // SIGTERM is not supported on Windows. Attempting to register a SIGTERM
        // handler raises an exception.
        if (!Platform.isWindows) ProcessSignal.sigterm.watch(),
      ]).first.then((signal) {
        logger.detail('Got exit signal: $signal');
        _stopSignal.complete(signal);
      }),
    );
    try {
      while (!stopped) {
        final progress = logger.progress(
          _didFirstCompile ? 'Reloading Celest...' : 'Starting Celest...',
        );
        _residentCompiler ??= ResidentCompiler.start(
          logger: logger,
        );
        final project = await _analyzeProject();
        if (project != null) {
          final generatedOutputs = await _generateBackendCode(project);
          final _ = await _buildProject(project);
          if (project.apis.isNotEmpty) {
            final port = await _startLocalApi([
              ...generatedOutputs,
              ...project.apis.values.map(
                (api) =>
                    // TODO: Make a property of the API
                    p.join(projectPaths.apisDir, '${api.name}.dart'),
              ),
            ]);
            progress.complete(
              'Celest is running at http://localhost:$port',
            );
          } else {
            progress.complete('Celest is running');
          }

          _didFirstCompile = true;
        }
        _readyForChanges.add(null);
        await Future.any([
          _watcher.next.then(
            (events) => logger.detail(
              '${events.length} watcher events since last compile',
            ),
          ),
          _stopSignal.future,
        ]);
      }
      return 0;
    } on CancellationException {
      return 0;
    } finally {
      await close();
    }
  }

  /// Analyzes the project and reports if there are any errors.
  Future<ast.Project?> _analyzeProject() async {
    logger.detail('Analyzing project...');
    final (:project, :errors) = await analyzer.analyzeProject();
    if (stopped) {
      throw const CancellationException('Celest was stopped');
    }
    if (errors.isNotEmpty) {
      _logErrors(errors);
    } else {
      assert(
        project != null,
        'Project should not be null if there are no errors',
      );
    }
    return project;
  }

  /// Generates code for [project] and writes to the output directory.
  ///
  /// Returns the list of paths generated.
  Future<List<String>> _generateBackendCode(ast.Project project) async {
    logger.detail('Generating backend code...');
    final codeGenerator = CodeGenerator();
    project.accept(codeGenerator);
    final outputsDir = Directory(projectPaths.outputsDir);
    if (outputsDir.existsSync() && !_didFirstCompile) {
      await outputsDir.delete(recursive: true);
    }
    if (stopped) {
      throw const CancellationException('Celest was stopped');
    }
    for (final MapEntry(key: path, value: contents)
        in codeGenerator.fileOutputs.entries) {
      assert(p.isAbsolute(path));
      final file = File(path);
      await file.create(recursive: true);
      await file.writeAsString(contents);
    }
    if (stopped) {
      throw const CancellationException('Celest was stopped');
    }
    return codeGenerator.fileOutputs.keys.toList();
  }

  /// Builds the project into Protobuf format, applying transformations for
  /// things such as authorization.
  Future<proto.Project> _buildProject(ast.Project project) async {
    logger.detail('Building project...');
    final projectBuilder = ProjectBuilder(
      project: project,
      projectPaths: projectPaths,
      residentCompiler: _residentCompiler,
    );
    final projectProto = await projectBuilder.build();
    if (stopped) {
      throw const CancellationException('Celest was stopped');
    }
    return projectProto;
  }

  Future<int> _startLocalApi(List<String> additionalSources) async {
    if (_localApiRunner == null) {
      _localApiRunner = await LocalApiRunner.start(
        path: projectPaths.localApiEntrypoint,
        logger: logger,
        verbose: verbose,
        enabledExperiments: analyzer.enabledExperiments,
        // additionalSources: generatedOutputs,
      );
    } else {
      await _localApiRunner!.recompile(additionalSources);
    }
    if (stopped) {
      throw const CancellationException('Celest was stopped');
    }
    return _localApiRunner!.port;
  }

  @override
  Future<void> close() async {
    await _watcher.cancel(immediate: true);
    await _readyForChanges.close();
    await _localApiRunner?.close();
    await _residentCompiler?.stop();
  }
}

class _DirectoryWatcher implements Closeable {
  _DirectoryWatcher(this.directory, {required this.onChange}) {
    _listenForEvents();
  }

  final String directory;
  final Future<void> Function() onChange;
  late final StreamSubscription<WatchEvent> _subscription;

  void _listenForEvents() {
    final eventStream = DirectoryWatcher(directory).events;

    Future<void>? currentOperation;
    CancelableOperation<void>? nextOperation;
    _subscription = eventStream.listen((_) {
      if (currentOperation == null) {
        currentOperation = onChange();
        return;
      }

      var canceled = false;
      nextOperation?.cancel();
      nextOperation = CancelableOperation.fromFuture(
        currentOperation!.whenComplete(() {
          if (canceled) return;
          currentOperation = onChange();
          nextOperation = null;
        }),
        onCancel: () => canceled = true,
      );
    });
  }

  @override
  Future<void> close() => _subscription.cancel();
}
