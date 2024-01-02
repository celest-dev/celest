import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/analyzer/celest_analyzer.dart';
import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/ast/project_diff.dart';
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli/compiler/api/local_api_runner.dart';
import 'package:celest_cli/frontend/resident_compiler.dart';
import 'package:celest_cli/project/project_builder.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:celest_core/protos.dart' as proto;
import 'package:logging/logging.dart';
import 'package:mason_logger/mason_logger.dart' show Progress;
import 'package:stream_transform/stream_transform.dart';
import 'package:watcher/watcher.dart';

enum RestartMode {
  hotReload,
  // TODO: Support hot restart. Requires a shell wrapper which can hotswap
  // the isolate configuration like the Flutter shell does.
  // hotRestart,
  fullRestart;
}

final class CelestFrontend implements Closeable {
  CelestFrontend() {
    // Initialize immediately instead of lazily so that _readyForChanges has
    // a listener registered before firing.
    _watcher = StreamQueue(
      DirectoryWatcher(projectPaths.projectRoot)
          .events
          // Ignore creation of new directories and files (they'll be empty)
          .where((event) => event.type != ChangeType.ADD)
          // Ignore events from the .dart_tool directory
          .where(
            (event) => !p.isWithin(
              p.join(projectPaths.projectRoot, '.dart_tool'),
              event.path,
            ),
          )
          // Ignore changes to the generated resources.dart file
          .where((event) => !p.equals(projectPaths.resourcesDart, event.path))
          .buffer(_readyForChanges.stream),
    );
  }

  static final Logger logger = Logger('CelestFrontend');
  final CelestAnalyzer analyzer = CelestAnalyzer();

  int _logErrors(List<AnalysisException> errors) {
    logger.severe('Project has errors:');
    for (final error in errors) {
      logger.severe(error.toString());
    }
    return 1;
  }

  final _readyForChanges = StreamController<void>.broadcast();
  late final StreamQueue<List<WatchEvent>> _watcher;

  late final _stopSub = StreamGroup.merge([
    ProcessSignal.sigint.watch(),
    // SIGTERM is not supported on Windows. Attempting to register a SIGTERM
    // handler raises an exception.
    if (!Platform.isWindows) ProcessSignal.sigterm.watch(),
  ]).listen((signal) {
    logger.fine('Got exit signal: $signal');
    if (!_stopSignal.isCompleted) {
      _stopSignal.complete(signal);
    }
  });
  final _stopSignal = Completer<ProcessSignal>.sync();
  bool get stopped => _stopSignal.isCompleted;

  ResidentCompiler? _residentCompiler;
  LocalApiRunner? _localApiRunner;
  var _didFirstCompile = false;
  ast.Project? _currentProject;

  Future<int> run() async {
    // TODO: Queue changed paths and only recompile changes
    Progress? currentProgress;
    try {
      List<String>? changedPaths;
      while (!stopped) {
        currentProgress = cliLogger.progress(
          _didFirstCompile ? 'Reloading Celest...' : 'Starting Celest...',
        );
        _residentCompiler ??= ResidentCompiler.start();
        final project = await _analyzeProject(changedPaths);
        if (project != null) {
          var restartMode = RestartMode.hotReload;
          if (_currentProject case final currentProject?) {
            // Diff the old and new projects to see if anything changed.
            final differ = ProjectDiff(currentProject);
            project.accept(differ);
            if (differ.requiresRestart) {
              restartMode = RestartMode.fullRestart;
            }
          }
          _currentProject = project;
          final generatedOutputs = await _generateBackendCode(project);
          final _ = await _buildProject(project);
          if (project.apis.isNotEmpty) {
            final port = await _startLocalApi(restartMode: restartMode, [
              ...generatedOutputs,
              if (changedPaths != null)
                ...changedPaths!
              else
                ...project.apis.values.map(
                  (api) =>
                      // TODO: Make a property of the API
                      p.join(projectPaths.apisDir, '${api.name}.dart'),
                ),
            ]);
            currentProgress.complete(
              'Celest is running at http://localhost:$port',
            );
          } else {
            currentProgress.complete('Celest is running');
          }

          _didFirstCompile = true;
        }
        logger.finer('Waiting for changes...');
        _readyForChanges.add(null);
        await Future.any([
          _watcher.next.then(
            (events) {
              logger.finer(
                '${events.length} watcher events since last compile',
              );
              changedPaths = events.map((event) => event.path).toList();
            },
          ),
          _stopSignal.future,
        ]);
      }
      return 0;
    } on CancellationException {
      return 0;
    } finally {
      currentProgress?.cancel();
      await close();
    }
  }

  /// Analyzes the project and reports if there are any errors.
  Future<ast.Project?> _analyzeProject(List<String>? invalidatedFiles) =>
      performance.trace('CelestFrontend', 'analyzeProject', () async {
        logger.fine('Analyzing project...');
        final (:project, :errors) =
            await analyzer.analyzeProject(invalidatedFiles);
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
      });

  /// Generates code for [project] and writes to the output directory.
  ///
  /// Returns the list of paths generated.
  Future<List<String>> _generateBackendCode(ast.Project project) =>
      performance.trace('CelestFrontend', 'generateBackendCode', () async {
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
        await Future.wait([
          for (final MapEntry(key: path, value: contents)
              in codeGenerator.fileOutputs.entries)
            Future<void>(() async {
              assert(p.isAbsolute(path));
              final file = File(path);
              await file.create(recursive: true);
              await file.writeAsString(contents);
            }),
        ]);
        if (stopped) {
          throw const CancellationException('Celest was stopped');
        }
        return codeGenerator.fileOutputs.keys.toList();
      });

  /// Builds the project into Protobuf format, applying transformations for
  /// things such as authorization.
  Future<proto.Project> _buildProject(ast.Project project) =>
      performance.trace('CelestFrontend', 'buildProject', () async {
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
      });

  Future<int> _startLocalApi(
    List<String> invalidatedPaths, {
    RestartMode restartMode = RestartMode.hotReload,
  }) async {
    if (_localApiRunner == null) {
      await performance.trace('LocalApiRunner', 'start', () async {
        _localApiRunner = await LocalApiRunner.start(
          path: projectPaths.localApiEntrypoint,
          verbose: verbose,
          enabledExperiments: analyzer.enabledExperiments,
        );
      });
    } else {
      switch (restartMode) {
        case RestartMode.hotReload:
          await performance.trace('LocalApiRunner', 'hotReload', () async {
            await _localApiRunner!.hotReload(invalidatedPaths);
          });
        case RestartMode.fullRestart:
          await performance.trace('LocalApiRunner', 'fullRestart', () async {
            logger.fine('Restarting local API...');
            await _localApiRunner!.close();
            _localApiRunner = await LocalApiRunner.start(
              path: projectPaths.localApiEntrypoint,
              verbose: verbose,
              enabledExperiments: analyzer.enabledExperiments,
            );
          });
      }
    }
    if (stopped) {
      throw const CancellationException('Celest was stopped');
    }
    return _localApiRunner!.port;
  }

  @override
  Future<void> close() =>
      performance.trace('CelestFrontend', 'close', () async {
        logger.finest('Stopping Celest frontend...');
        await _stopSub.cancel();
        await _watcher.cancel(immediate: true);
        await _readyForChanges.close();
        await _localApiRunner?.close();
        _residentCompiler?.stop();
        logger.finest('Stopped Celest frontend');
      });
}
