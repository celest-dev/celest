import 'dart:async';
import 'dart:io' as io show Platform;
import 'dart:io';

import 'package:async/async.dart';
import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/analyzer/analysis_error.dart';
import 'package:celest_cli/analyzer/analysis_result.dart';
import 'package:celest_cli/analyzer/celest_analyzer.dart';
import 'package:celest_cli/ast/project_diff.dart';
import 'package:celest_cli/codegen/api/dockerfile_generator.dart';
import 'package:celest_cli/codegen/client_code_generator.dart';
import 'package:celest_cli/codegen/cloud_code_generator.dart';
import 'package:celest_cli/compiler/api/entrypoint_compiler.dart';
import 'package:celest_cli/compiler/api/local_api_runner.dart';
import 'package:celest_cli/env/config_value_solver.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/project/project_resolver.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/exceptions.dart';
import 'package:celest_cli/src/repositories/organization_repository.dart';
import 'package:celest_cli/src/repositories/project_environment_repository.dart';
import 'package:celest_cli/src/repositories/project_repository.dart';
import 'package:celest_cli/src/utils/json.dart';
import 'package:logging/logging.dart';
import 'package:mason_logger/mason_logger.dart' show Progress;
import 'package:stream_transform/stream_transform.dart';
import 'package:watcher/watcher.dart';

enum RestartMode { hotReload, fullRestart }

final class CelestFrontend {
  factory CelestFrontend() => instance ??= CelestFrontend._();

  CelestFrontend._() {
    // Initialize immediately instead of lazily since _stopSub is never accessed
    // directly until `close`.
    _stopSub = StreamGroup.merge([
      ProcessSignal.sigint.watch(),
      // SIGTERM is not supported on Windows. Attempting to register a SIGTERM
      // handler raises an exception.
      if (!io.Platform.isWindows) ProcessSignal.sigterm.watch(),
    ]).listen((signal) {
      logger.fine('Got exit signal: $signal');
      if (!_stopSignal.isCompleted) {
        _stopSignal.complete(signal);
      }
    });
    // Windows doesn't support listening for SIGUSR1 and SIGUSR2 signals.
    if (!platform.isWindows) {
      _reloadStream = StreamQueue(
        StreamGroup.mergeBroadcast([
          ProcessSignal.sigusr1.watch(),
          ProcessSignal.sigusr2.watch(),
        ]).sample(_readyForChanges.stream),
      );
    }
  }

  static CelestFrontend? instance;
  static final Logger logger = Logger('CelestFrontend');
  final CelestAnalyzer analyzer = CelestAnalyzer();

  ProjectRepository get projects =>
      ProjectRepository(celestProject.cloudDb, cloud);

  ProjectEnvironmentRepository get projectEnvironments =>
      ProjectEnvironmentRepository(celestProject.cloudDb, cloud);

  OrganizationRepository get organizations =>
      OrganizationRepository(celestProject.cloudDb, cloud);

  int _logErrors(List<CelestAnalysisError> errors) {
    for (final error in errors) {
      logger.severe(error.toString());
    }
    return 1;
  }

  void _logWarnings(List<CelestAnalysisError> warnings) {
    for (final warning in warnings) {
      logger.warning(warning.toString());
    }
  }

  /// Signals that Celest is ready for the next batch of [_watcherSub] changes.
  ///
  /// Used to buffer [_watcherSub] in the time while a project is being (re-)built.
  final _readyForChanges = StreamController<void>.broadcast();

  /// Watches for filesystem changes in the project root.
  DirectoryWatcher? _watcher;

  /// Queues changes detected by [_watcher].
  StreamQueue<List<WatchEvent>>? _watcherSub;

  /// The list of paths changed since the last frontend pass.
  Set<String>? _changedPaths;

  /// The pending operations of [_nextChangeSet].
  ///
  /// Used to cancel in-progress operations in [close].
  final List<CancelableOperation<Object?>> _pendingOperations = [];

  Future<void> _cancelPendingOperations() async {
    await Future.wait(_pendingOperations.map((op) => op.cancel()));
    _pendingOperations.clear();
  }

  // TODO(dnys1): If pubspec.yaml changes, we should run pub get and create
  // a new analysis context.

  /// Notifies the watcher that we're listening for filesystem changes.
  Future<void> _nextChangeSet() async {
    logger.finer('Waiting for changes...');

    // Initialize [_watcher] lazily since it's only needed after the first
    // compile.
    _watcher ??= DirectoryWatcher(projectPaths.projectRoot);
    _watcherSub ??= StreamQueue(
      _watcher!.events
          // Ignore creation of new directories and files (they'll be empty)
          .tap(
            (event) =>
                logger.finest('Watcher event (${event.type}): ${event.path}'),
          )
          .where((event) => event.type != ChangeType.ADD)
          .where((event) {
            final isReloadable = _isReloadablePath(event.path);
            if (!isReloadable) {
              logger.finest('Ignoring non-reloadable path: ${event.path}');
            }
            return isReloadable;
          })
          .buffer(_readyForChanges.stream),
    );
    _readyForChanges.add(null);

    var reloading = false;
    final reloadComplete = Completer<void>();
    assert(
      _pendingOperations.isEmpty,
      'No operations should be in progress when called',
    );
    _pendingOperations.add(
      _watcherSub!.cancelable((watcher) async {
        final events = await watcher.next;
        final changedPaths = events.map((event) => event.path).toSet();
        logger.finest(
          '${events.length} watcher events since last compile: ',
          changedPaths.join(io.Platform.lineTerminator),
        );
        if (reloading) return;
        reloading = true;

        try {
          logger.finest('Reloading with watcher events');

          // TODO(dnys1): Improve cache invalidation to only invalidate
          // necessary types.
          typeHelper.reset();
          _changedPaths = await _invalidateAllProjectFiles();
          reloadComplete.complete();
        } on Object catch (e, st) {
          reloadComplete.completeError(e, st);
        }
        return null;
      }),
    );
    if (_reloadStream case final reloadStream?) {
      _pendingOperations.add(
        reloadStream.cancelable((reloadStream) async {
          final signal = await reloadStream.next;
          logger.finest('Got reload signal: $signal');
          if (reloading) return;
          reloading = true;

          try {
            logger.finest('Reloading with signal');
            _changedPaths = await _invalidateAllProjectFiles();
            reloadComplete.complete();
          } on Object catch (e, st) {
            reloadComplete.completeError(e, st);
          }
          return null;
        }),
      );
    }

    await Future.any([reloadComplete.future, _stopSignal.future]);
    await _cancelPendingOperations();
  }

  // TODO(dnys1): There is a marked difference in behavior when invalidating
  // just the changed paths, vs invalidating all project files. To be
  // safe, we invalidate all files on every reload. This is not ideal, but
  // it's the safest option for now.
  Future<Set<String>> _invalidateAllProjectFiles() async {
    final allProjectFiles =
        await fileSystem
            .directory(projectPaths.projectRoot)
            .list(recursive: true)
            .whereType<File>()
            .toList();
    // Invalidate all paths.
    typeHelper.reset();
    final toInvalidate =
        allProjectFiles.map((f) => f.path).where(_isReloadablePath).toList();
    logger.finest('Invaliding paths: $toInvalidate');
    return {...toInvalidate, ...await celestProject.invalidate(toInvalidate)};
  }

  /// Whether [path] is eligible for watching and reloading.
  bool _isReloadablePath(String path) {
    // Ignore generated items.
    if (p.isWithin(projectPaths.generatedDir, path)) {
      return false;
    }
    // Reload top-level files.
    if (p.equals(p.dirname(path), projectPaths.projectRoot)) {
      return p.basename(path) == 'pubspec.yaml' || p.extension(path) == '.dart';
    }
    // Otherwise, reload only handwritten backend code.
    return p.isWithin(projectPaths.projectLib, path);
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

  /// A broadcast stream of [ProcessSignal.sigusr1] and [ProcessSignal.sigusr2]
  /// signals which triggers a hot reload.
  ///
  /// This mimicks the `flutter run` command which responds to these signals by
  /// performing a hot reload (SIGUSR1) and a full restart (SIGUSR2).
  StreamQueue<ProcessSignal>? _reloadStream;

  LocalApiRunner? _localApiRunner;
  var _didFirstCompile = false;

  /// The current project being compiled.
  ///
  /// Will be `null` if there are errors or if the project has not been
  /// analyzed yet.
  ast.Project? currentProject;

  Future<int> run({
    required bool migrateProject,
    required Progress? currentProgress,
  }) async {
    try {
      while (!stopped) {
        currentProgress ??= cliLogger.progress('Reloading Celest');

        void fail(List<CelestAnalysisError> errors) {
          currentProgress?.fail(
            'Project has errors. Please fix them and save the '
            'corresponding files.',
          );
          currentProgress = null;
          _logErrors(errors);
        }

        final analysisResult = await _analyzeProject(
          migrateProject: migrateProject,
        );
        migrateProject = false;

        _logWarnings(analysisResult.warnings);
        switch (analysisResult) {
          case AnalysisFailureResult(:final errors):
            fail(errors);
          case AnalysisSuccessResult(:final project, :final errors)
              when errors.isNotEmpty:
            currentProject = project;
            fail(errors);
          case AnalysisSuccessResult(:final project):
            var restartMode = RestartMode.hotReload;
            if (currentProject case final currentProject?) {
              // Diff the old and new projects to see if anything changed.
              final differ = ProjectDiff(currentProject);
              project.acceptWithArg(differ, (
                parent: project,
                old: currentProject,
              ));
              if (differ.requiresRestart) {
                restartMode = RestartMode.fullRestart;
              }
            }
            logger.finest('Performing reload with mode: ${restartMode.name}');
            currentProject = project;
            final resolvedProject = await _resolveProject(
              project,
              environmentId: 'local',
            );
            final generatedOutputs = await _generateBackendCode(
              project: project,
              resolvedProject: resolvedProject,
            );
            final Uri localUri;
            try {
              localUri = await _startLocalApi(
                [
                  ...generatedOutputs,
                  if (_changedPaths != null)
                    ..._changedPaths!
                  else
                    ...project.apis.values.map(
                      (api) => projectPaths.api(api.name),
                    ),
                ],
                environmentId: 'local',
                resolvedProject: resolvedProject,
                restartMode: restartMode,
                port:
                    (await isolatedSecureStorage.getLocalUri(
                      project.name,
                    )).port,
              );
            } on CompilationException catch (e, st) {
              cliLogger.err(
                'Project has errors. Please fix them and save the '
                'corresponding files.',
              );
              performance.captureError(e, stackTrace: st);
              break;
            }

            await _generateClientCode(
              project: project,
              resolvedProject: resolvedProject,
              projectUris: (
                localUri: await isolatedSecureStorage.setLocalUri(
                  project.name,
                  localUri,
                ),
                productionUri: await isolatedSecureStorage.getProductionUri(
                  project.name,
                ),
              ),
            );

            // Only clear changed paths once a full restart has been completed
            // which included those changes. Replacing the changed paths before
            // this happens could mean a loop where the changes are dropped
            // because the project had errors.
            _changedPaths = null;

            if (!_didFirstCompile) {
              _didFirstCompile = true;
              currentProgress!.complete(
                'Celest is running and watching for updates',
              );
              cliLogger.detail('Local API running at: $localUri');
            } else {
              currentProgress!.complete('Reloaded project');
            }

            currentProgress = null;
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

  /// Builds the current project for deployment to the cloud.
  Future<int> build({
    required bool migrateProject,
    required Progress currentProgress,
    required String environmentId,
  }) async {
    try {
      int fail(List<CelestAnalysisError> errors) {
        currentProgress.fail(
          'Project has errors. Please fix them and save the '
          'corresponding files.',
        );
        return _logErrors(errors);
      }

      final analysisResult = await _analyzeProject(
        migrateProject: migrateProject,
      );
      migrateProject = false;

      _logWarnings(analysisResult.warnings);
      switch (analysisResult) {
        case AnalysisFailureResult(:final errors):
          return fail(errors);
        case AnalysisSuccessResult(:final errors) when errors.isNotEmpty:
          return fail(errors);
        case AnalysisSuccessResult(:final project):
          final resolvedProject = await _resolveProject(
            project,
            environmentId: environmentId,
          );
          await _generateBackendCode(
            project: project,
            resolvedProject: resolvedProject,
          );
          try {
            await _writeProjectOutputs(
              project: project,
              resolvedProject: resolvedProject,
              environmentId: environmentId,
            );
          } on CompilationException catch (e, st) {
            cliLogger.err('Project has errors. Please fix them and try again.');
            performance.captureError(e, stackTrace: st);
            return 1;
          }

          currentProgress.complete(
            'Celest project has been built for deployment',
          );

          final buildDir = p.relative(
            projectPaths.buildDir,
            from: projectPaths.projectRoot,
          );
          cliLogger.detail(
            'Outputs have been written to the `$buildDir` directory.',
          );
          return 0;
      }
    } on CancellationException {
      return 0;
    } finally {
      currentProgress.cancel();
      await close();
    }
  }

  /// Analyzes the project and reports if there are any errors.
  Future<CelestAnalysisResult> _analyzeProject({
    required bool migrateProject,
  }) => performance.trace('CelestFrontend', 'analyzeProject', () async {
    logger.fine('Analyzing project...');
    final result = await analyzer.analyzeProject(
      migrateProject: migrateProject,
    );
    if (stopped) {
      throw const CancellationException('Celest was stopped');
    }
    return result;
  });

  /// Generates code for [project] and writes to the output directory.
  ///
  /// Returns the list of paths generated.
  Future<List<String>> _generateBackendCode({
    required ast.Project project,
    required ast.ResolvedProject resolvedProject,
  }) => performance.trace('CelestFrontend', 'generateBackendCode', () async {
    logger.fine('Generating backend code...');
    final codeGenerator = CloudCodeGenerator(
      project: project,
      resolvedProject: resolvedProject,
    );
    final outputs = codeGenerator.generate();
    final outputsDir = Directory(projectPaths.outputsDir);
    if (outputsDir.existsSync() && !_didFirstCompile) {
      await outputsDir.delete(recursive: true);
    }
    if (stopped) {
      throw const CancellationException('Celest was stopped');
    }
    await (outputs.write(), celestProject.invalidate(outputs.keys)).wait;
    if (stopped) {
      throw const CancellationException('Celest was stopped');
    }
    return codeGenerator.fileOutputs.keys.toList();
  });

  /// Resolves the project AST applying transformations for things such as authorization.
  Future<ResolvedProject> _resolveProject(
    ast.Project project, {
    required String environmentId,
  }) => performance.trace('CelestFrontend', 'resolveProject', () async {
    logger.fine('Resolving configuration values...');
    final configValues =
        await ConfigValueSolver(
          project: project,
          environmentId: environmentId,
        ).solveAll();
    logger.fine('Resolving project...');
    final projectResolver = ProjectResolver(
      configValues: configValues,
      environmentId: environmentId,
    );
    project.acceptWithArg(projectResolver, project);
    return projectResolver.resolvedProject;
  });

  Future<void> _writeProjectOutputs({
    required Project project,
    required ResolvedProject resolvedProject,
    required String environmentId,
  }) async {
    final entrypointCompiler = EntrypointCompiler(
      logger: logger,
      verbose: verbose,
      enabledExperiments: celestProject.analysisOptions.enabledExperiments,
    );
    final kernel = await entrypointCompiler.compile(
      resolvedProject: resolvedProject,
      entrypointPath: projectPaths.localApiEntrypoint,
    );

    final buildOutputs = fileSystem.directory(projectPaths.buildDir);
    if (!buildOutputs.existsSync()) {
      await buildOutputs.create(recursive: true);
    }

    await buildOutputs
        .childFile('celest.aot.dill')
        .writeAsBytes(kernel.outputDill);

    final dockerfile = DockerfileGenerator(project: project);
    await buildOutputs
        .childFile('Dockerfile')
        .writeAsString(dockerfile.generate());

    await buildOutputs
        .childFile('celest.json')
        .writeAsString(
          prettyPrintJson(resolvedProject.toProto().toProto3Json()),
        );
  }

  Future<Uri> _startLocalApi(
    List<String> invalidatedPaths, {
    required String environmentId,
    required ResolvedProject resolvedProject,
    RestartMode restartMode = RestartMode.hotReload,
    required int? port,
  }) async {
    final configValues = {
      for (final env in resolvedProject.variables) env.name: env.value,
      for (final secret in resolvedProject.secrets) secret.name: secret.value,
    };
    if (_localApiRunner == null) {
      await performance.trace('LocalApiRunner', 'start', () async {
        _localApiRunner = await LocalApiRunner.start(
          resolvedProject: resolvedProject,
          path: projectPaths.localApiEntrypoint,
          environmentId: environmentId,
          configValues: configValues,
          verbose: verbose,
          port: port,
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
              resolvedProject: resolvedProject,
              path: projectPaths.localApiEntrypoint,
              environmentId: environmentId,
              port: _localApiRunner?.port,
              configValues: configValues,
              verbose: verbose,
            );
          });
      }
    }
    if (stopped) {
      throw const CancellationException('Celest was stopped');
    }
    return Uri.parse('http://localhost:${_localApiRunner!.port}');
  }

  Future<void> _generateClientCode({
    required ast.Project project,
    required ast.ResolvedProject resolvedProject,
    required CelestProjectUris projectUris,
  }) => performance.trace('CelestFrontend', 'generateClientCode', () async {
    logger.fine('Generating client code...');
    final generator = ClientCodeGenerator(
      project: project,
      resolvedProject: resolvedProject,
      projectUris: projectUris,
    );
    await generator.generate().write();
    if (celestProject.parentProject case ParentProject(
      type: ast.SdkType.flutter,
      :final path,
    ) when project.databases.isNotEmpty) {
      final webDir = fileSystem.directory(path).childDirectory('web');
      if (webDir.existsSync()) {
        final sqliteWasm = webDir.childFile('sqlite3.wasm');
        if (!sqliteWasm.existsSync()) {
          final downloadedSqliteWasm = celestProject.config.configDir.childFile(
            'sqlite3.wasm',
          );
          if (downloadedSqliteWasm.existsSync()) {
            await downloadedSqliteWasm.copy(sqliteWasm.path);
          } else {
            cliLogger.warn('''
To use Celest Data in your Flutter Web project, follow the steps in the Drift
documentation to add the SQLite3 WASM file to your project:

https://drift.simonbinder.eu/web/
''');
          }
        }
      }
    }
  });

  Future<void> close() =>
      performance.trace('CelestFrontend', 'close', () async {
        logger.finest('Stopping Celest frontend...');
        // Cancel any pending operations which depend on StreamQueues
        // before trying to close stream queues.
        //
        // If these operations are not first canceled, then `queue.cancel`
        // will hang forever.
        await _cancelPendingOperations();
        // Cancel subscriptions in order of dependencies
        await _readyForChanges.close();
        await Future.wait([
          _stopSub.cancel(),
          Future.value(_reloadStream?.cancel()),
          Future.value(_watcherSub?.cancel()),
          Future.value(_localApiRunner?.close()),
        ]);
        logger.finest('Stopped Celest frontend');
      });
}
