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
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:celest_core/protos.dart' as proto;
import 'package:logging/logging.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:watcher/watcher.dart';

final class CelestFrontend implements Closeable {
  factory CelestFrontend({
    required String projectRoot,
    String? outputsDir,
    required bool verbose,
  }) {
    final projectPaths = init(
      projectRoot: projectRoot,
      outputsDir: outputsDir,
    );
    final analyzer = CelestAnalyzer(
      projectPaths: projectPaths,
    );
    return CelestFrontend._(
      analyzer: analyzer,
      verbose: verbose,
    );
  }

  CelestFrontend._({
    required this.analyzer,
    required this.verbose,
  });

  static final Logger logger = Logger('CelestFrontend');
  final CelestAnalyzer analyzer;
  final bool verbose;

  int _logErrors(List<AnalysisException> errors) {
    logger.severe('Project has errors:');
    for (final error in errors) {
      logger.severe(error.toString());
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
        logger.finer('Got exit signal: $signal');
        _stopSignal.complete(signal);
      }),
    );
    try {
      while (!stopped) {
        final progress = cliLogger.progress(
          _didFirstCompile ? 'Reloading Celest...' : 'Starting Celest...',
        );
        _residentCompiler ??= ResidentCompiler.start();
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
            (events) => logger.finer(
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
    logger.fine('Analyzing project...');
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
    logger.fine('Generating backend code...');
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
    logger.fine('Building project...');
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
