import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/analyzer/analysis_error.dart';
import 'package:celest_cli/analyzer/analysis_result.dart';
import 'package:celest_cli/analyzer/celest_analyzer.dart';
import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/ast/project_diff.dart';
import 'package:celest_cli/ast/resolved_ast.dart';
import 'package:celest_cli/codegen/client/client_types.dart';
import 'package:celest_cli/codegen/client_code_generator.dart';
import 'package:celest_cli/codegen/cloud_code_generator.dart';
import 'package:celest_cli/compiler/api/local_api_runner.dart';
import 'package:celest_cli/database/database.dart';
import 'package:celest_cli/frontend/resident_compiler.dart';
import 'package:celest_cli/project/project_resolver.dart';
import 'package:celest_cli/src/context.dart';
import 'package:logging/logging.dart';
import 'package:mason_logger/mason_logger.dart' show Progress;
import 'package:stream_transform/stream_transform.dart';
import 'package:watcher/watcher.dart';

enum RestartMode {
  hotReload,
  fullRestart;
}

final class CelestFrontend implements Closeable {
  factory CelestFrontend() => instance ??= CelestFrontend._();

  CelestFrontend._() {
    // Initialize immediately instead of lazily since _stopSub is never accessed
    // directly until `close`.
    _stopSub = StreamGroup.merge([
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
  }

  static CelestFrontend? instance;
  static final Logger logger = Logger('CelestFrontend');
  final CelestAnalyzer analyzer = CelestAnalyzer();

  int _logErrors(List<AnalysisError> errors) {
    for (final error in errors) {
      logger.severe(error.toString());
    }
    return 1;
  }

  /// Signals that Celest is ready for the next batch of [_watcher] changes.
  ///
  /// Used to buffer [_watcher] in the time while a project is being (re-)built.
  final _readyForChanges = StreamController<void>.broadcast();

  /// Watches for filesystem changes in the project root.
  StreamQueue<List<WatchEvent>>? _watcher;

  /// The list of paths changed since the last frontend pass.
  Set<String>? _changedPaths;

  /// Notifies the watcher that we're listening for filesystem changes.
  Future<void> _nextChangeSet() async {
    logger.finer('Waiting for changes...');

    // Initialize [_watcher] lazily since it's only needed after the first
    // compile.
    _watcher ??= StreamQueue(
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
          // Ignore changes to generated files
          .where((event) => !p.equals(projectPaths.resourcesDart, event.path))
          .where((event) => !p.equals(ClientTypes.clientClass.uri, event.path))
          .where(
            (event) => !p.isWithin(projectPaths.clientOutputsDir, event.path),
          )
          .buffer(_readyForChanges.stream),
    );
    _readyForChanges.add(null);

    await Future.any([
      _watcher!.next.then(
        (events) {
          final paths = events.map((event) => event.path).toList();
          logger.finest(
            '${events.length} watcher events since last compile: ',
            '$_changedPaths',
          );
          _changedPaths = paths.toSet();
          return celestProject.invalidate(_changedPaths!);
        },
      ),
      _stopSignal.future,
    ]);
  }

  /// Ensures projects are recorded in the DB
  Future<void> _addProjectToDb(String projectName) async {
    logger.finest('Checking if project exists in DB...');
    final dbProject = await celestProject.database
        .findProjectByPath(projectPaths.projectRoot);
    logger.finest('Found project in DB: $dbProject');
    if (dbProject == null) {
      logger.finest('Creating project in DB...');
      await celestProject.database.createProject(
        ProjectsCompanion.insert(
          name: projectName,
          path: projectPaths.projectRoot,
        ),
      );
      logger.finest('Created project in DB');
    } else if (dbProject.name != projectName) {
      logger.finest('Updating project name in DB...');
      await celestProject.database.updateProjectName(
        projectName: projectName,
        projectPath: projectPaths.projectRoot,
      );
      logger.finest('Updated project name in DB');
    }
    // TODO(dnys1): Update if project path changes.
  }

  /// Signals that a SIGINT or SIGTERM event has fired and the CLI needs to
  /// shutdown.
  final _stopSignal = Completer<ProcessSignal>.sync();

  /// Whether a SIGINT or SIGTERM signal has been received and the frontend
  /// is no longer operational.
  bool get stopped => _stopSignal.isCompleted;

  /// Subscription to [ProcessSignal.sigint] and [ProcessSignal.sigterm] which
  /// forwards to [_stopSignal] when triggered.
  late final StreamSubscription<ProcessSignal> _stopSub;

  ResidentCompiler? _residentCompiler;
  LocalApiRunner? _localApiRunner;
  var _didFirstCompile = false;

  /// The current project being compiled.
  ///
  /// Will be `null` if there are errors or if the project has not been
  /// analyzed yet.
  ast.Project? currentProject;

  Future<int> run() async {
    Progress? currentProgress;
    try {
      while (!stopped) {
        currentProgress = cliLogger.progress(
          _didFirstCompile ? 'Reloading Celest...' : 'Starting Celest...',
        );
        _residentCompiler ??= await ResidentCompiler.ensureRunning();

        final analysisResult = await _analyzeProject();
        switch (analysisResult) {
          case AnalysisFailureResult(:final errors):
          case AnalysisSuccessResult(:final errors) when errors.isNotEmpty:
            currentProgress.fail(
              'Project has errors. Please fix them and save the '
              'corresponding files.',
            );
            _logErrors(errors);
          case AnalysisSuccessResult(:final project):
            var restartMode = RestartMode.hotReload;
            if (currentProject case final currentProject?) {
              // Diff the old and new projects to see if anything changed.
              final differ = ProjectDiff(currentProject);
              project.accept(differ);
              if (differ.requiresRestart) {
                restartMode = RestartMode.fullRestart;
              }
            }
            currentProject = project;
            final generatedOutputs = await _generateBackendCode(project);
            final resolvedProject = await _resolveProject(project);
            final projectOutputs = await _startLocalApi(
              [
                ...generatedOutputs,
                if (_changedPaths != null)
                  ..._changedPaths!
                else
                  ...project.apis.values.map(
                    (api) => projectPaths.api(api.name),
                  ),
              ],
              resolvedProject: resolvedProject,
              restartMode: restartMode,
            );
            await _generateClientCode(
              project: project,
              projectOutputs: projectOutputs,
            );
            currentProgress.complete(
              'Celest is running and watching for updates',
            );

            if (!_didFirstCompile) {
              _didFirstCompile = true;
              await _addProjectToDb(project.name);
            }
        }
        await _nextChangeSet();
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
  Future<CelestAnalysisResult> _analyzeProject() =>
      performance.trace('CelestFrontend', 'analyzeProject', () async {
        logger.fine('Analyzing project...');
        final result = await analyzer.analyzeProject();
        if (stopped) {
          throw const CancellationException('Celest was stopped');
        }
        return result;
      });

  /// Generates code for [project] and writes to the output directory.
  ///
  /// Returns the list of paths generated.
  Future<List<String>> _generateBackendCode(ast.Project project) =>
      performance.trace('CelestFrontend', 'generateBackendCode', () async {
        logger.fine('Generating backend code...');
        final codeGenerator = CloudCodeGenerator();
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

  /// Resolves the project AST applying transformations for things such as authorization.
  Future<ResolvedProject> _resolveProject(ast.Project project) =>
      performance.trace('CelestFrontend', 'resolveProject', () async {
        logger.fine('Resolving project...');
        final projectResolver = ProjectResolver();
        project.accept(projectResolver);
        return projectResolver.resolvedProject;
      });

  Future<ast.LocalDeployedProject> _startLocalApi(
    List<String> invalidatedPaths, {
    required ResolvedProject resolvedProject,
    RestartMode restartMode = RestartMode.hotReload,
  }) async {
    final envVars = resolvedProject.envVars.map((envVar) => envVar.name);
    if (_localApiRunner == null) {
      await performance.trace('LocalApiRunner', 'start', () async {
        _localApiRunner = await LocalApiRunner.start(
          path: projectPaths.localApiEntrypoint,
          envVars: envVars,
          verbose: verbose,
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
              envVars: envVars,
              verbose: verbose,
            );
          });
      }
    }
    if (stopped) {
      throw const CancellationException('Celest was stopped');
    }
    return ast.LocalDeployedProject.from(
      projectAst: resolvedProject,
      port: _localApiRunner!.port,
    );
  }

  Future<void> _generateClientCode({
    required ast.Project project,
    required ast.DeployedProject projectOutputs,
  }) =>
      performance.trace('CelestFrontend', 'generateClientCode', () async {
        logger.fine('Generating client code...');
        final generator = ClientCodeGenerator(
          project: project,
          projectOutputs: projectOutputs,
        );
        await generator.generate().write();
      });

  @override
  Future<void> close() =>
      performance.trace('CelestFrontend', 'close', () async {
        logger.finest('Stopping Celest frontend...');
        await _stopSub.cancel();
        await _watcher?.cancel(immediate: true);
        await _readyForChanges.close();
        await _localApiRunner?.close();
        logger.finest('Stopped Celest frontend');
      });
}
