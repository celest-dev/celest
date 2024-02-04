import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:async/async.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/analyzer/analysis_error.dart';
import 'package:celest_cli/analyzer/analysis_result.dart';
import 'package:celest_cli/analyzer/celest_analyzer.dart';
import 'package:celest_cli/codegen/client/client_types.dart';
import 'package:celest_cli/codegen/client_code_generator.dart';
import 'package:celest_cli/codegen/cloud_code_generator.dart';
import 'package:celest_cli/compiler/api/entrypoint_compiler.dart';
import 'package:celest_cli/compiler/api/local_api_runner.dart';
import 'package:celest_cli/database/database.dart';
import 'package:celest_cli/frontend/resident_compiler.dart';
import 'package:celest_cli/project/project_resolver.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:celest_proto/ast.dart' as ast;
import 'package:celest_proto/ast.dart';
import 'package:celest_proto/celest_proto.dart';
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
    _reloadStream = StreamQueue(
      // Windows doesn't support listening for SIGUSR1 and SIGUSR2 signals.
      platform.isWindows
          ? Stream.fromFuture(Completer<ProcessSignal>().future)
          : StreamGroup.mergeBroadcast([
              ProcessSignal.sigusr1.watch(),
              ProcessSignal.sigusr2.watch(),
            ]).sample(_readyForChanges.stream),
    );
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
          .where((event) => _isReloadablePath(event.path))
          .buffer(_readyForChanges.stream),
    );
    _readyForChanges.add(null);

    var reloading = false;
    final reloadComplete = Completer<void>.sync();
    unawaited(
      _watcher!.next.then(
        (events) async {
          if (reloading) return;
          reloading = true;
          (_changedPaths ??= {}).addAll(
            events.map((event) => event.path),
          );
          logger.finest(
            '${events.length} watcher events since last compile: ',
            _changedPaths!.join('\n'),
          );
          // TODO(dnys1): Improve cache invalidation to only invalidate
          // necessary types.
          typeHelper.reset();
          await celestProject.invalidate(_changedPaths!);
          reloadComplete.complete();
        },
      ),
    );
    unawaited(
      _reloadStream.next.then((signal) async {
        if (reloading) return;
        reloading = true;
        logger.fine('Got reload signal: $signal');
        final allProjectFiles = await fileSystem
            .directory(projectPaths.projectRoot)
            .list(recursive: true)
            .whereType<File>()
            .toList();
        // Invalidate all paths.
        typeHelper.reset();
        final toInvalidate = allProjectFiles
            .map((f) => f.path)
            .where(_isReloadablePath)
            .toList();
        logger.finest('Invaliding paths: $toInvalidate');
        await celestProject.invalidate(toInvalidate);
        reloadComplete.complete();
      }),
    );

    await Future.any([
      reloadComplete.future,
      _stopSignal.future,
    ]);
  }

  /// Whether [path] is eligible for watching and reloading.
  bool _isReloadablePath(String path) {
    // Ignore files from the .dart_tool directory
    if (p.isWithin(
      p.join(projectPaths.projectRoot, '.dart_tool'),
      path,
    )) {
      return false;
    }
    // Ignore generated files
    if (p.equals(projectPaths.resourcesDart, path)) {
      return false;
    }
    if (p.equals(ClientTypes.clientClass.uri, path)) {
      return false;
    }
    if (p.isWithin(projectPaths.clientOutputsDir, path)) {
      return false;
    }
    // Ignore test files
    if (p.isWithin(
      p.join(projectPaths.projectRoot, 'test'),
      path,
    )) {
      return false;
    }
    return true;
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

  /// A broadcast stream of [ProcessSignal.sigusr1] and [ProcessSignal.sigusr2]
  /// signals which triggers a hot reload.
  ///
  /// This mimicks the `flutter run` command which responds to these signals by
  /// performing a hot reload (SIGUSR1) and a full restart (SIGUSR2).
  late final StreamQueue<ProcessSignal> _reloadStream;

  ResidentCompiler? _residentCompiler;
  LocalApiRunner? _localApiRunner;
  var _didFirstCompile = false;

  /// The current project being compiled.
  ///
  /// Will be `null` if there are errors or if the project has not been
  /// analyzed yet.
  ast.Project? currentProject;

  Future<int> run({
    required Progress currentProgress,
  }) async {
    try {
      while (!stopped) {
        if (_didFirstCompile) {
          currentProgress = cliLogger.progress('Reloading Celest...');
        }
        _residentCompiler ??= await ResidentCompiler.ensureRunning();

        void fail(List<AnalysisError> errors) {
          currentProgress.fail(
            'Project has errors. Please fix them and save the '
            'corresponding files.',
          );
          _logErrors(errors);
        }

        final analysisResult = await _analyzeProject();
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
              project.accept(differ);
              if (differ.requiresRestart) {
                restartMode = RestartMode.fullRestart;
              }
            }
            logger.finest('Performing reload with mode: ${restartMode.name}');
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

            if (!_didFirstCompile) {
              _didFirstCompile = true;
              await _addProjectToDb(project.name);
            }

            // Only clear changed paths once a full restart has been completed
            // which included those changes. Replacing the changed paths before
            // this happens could mean a loop where the changes are dropped
            // because the project had errors.
            _changedPaths = null;

            currentProgress.complete(
              'Celest is running and watching for updates',
            );
        }

        await _nextChangeSet();
      }
      return 0;
    } on CancellationException {
      return 0;
    } finally {
      currentProgress.cancel();
      await close();
    }
  }

  /// Builds the current project for deployment to the cloud.
  Future<int> build({
    required String email,
  }) async {
    Progress? currentProgress;
    try {
      while (!stopped) {
        currentProgress = cliLogger.progress('Deploying Celest project...');
        _residentCompiler ??= await ResidentCompiler.ensureRunning();

        void fail(List<AnalysisError> errors) {
          currentProgress!.fail(
            'Project has errors. Please fix them and save the '
            'corresponding files, then run `celest deploy` again.',
          );
          _logErrors(errors);
        }

        final analysisResult = await _analyzeProject();
        switch (analysisResult) {
          case AnalysisFailureResult(:final errors):
          case AnalysisSuccessResult(:final errors) when errors.isNotEmpty:
            fail(errors);
            await _nextChangeSet();
          case AnalysisSuccessResult(:final project):
            await _generateBackendCode(project);
            final resolvedProject = await _resolveProject(project);
            final projectOutputs = await _deployProject(
              email: email,
              resolvedProject: resolvedProject,
            );
            await _generateClientCode(
              project: project,
              projectOutputs: projectOutputs,
            );

            currentProgress.complete(
              '🚀 Your Celest project has been deployed!',
            );
            return 0;
        }
      }
      return 0;
    } on CancellationException {
      currentProgress?.fail('Canceled deployment');
      return 0;
    } on Object {
      currentProgress?.cancel();
      rethrow;
    } finally {
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

  S _checkDeployState<S extends DeployState>(DeployState state) {
    if (state case DeployFailed(:final error)) {
      throw CelestException(error.message);
    }
    if (state is DeployCanceled) {
      throw const CancellationException();
    }
    if (state is! S) {
      throw StateError('Expected $S got ${state.runtimeType}');
    }
    return state;
  }

  Future<ast.RemoteDeployedProject> _deployProject({
    required String email,
    required ast.ResolvedProject resolvedProject,
  }) =>
      performance.trace('CelestFrontend', 'deployProject', () async {
        final baseUri = Uri.http('localhost:8080');
        final deployService = DeployClient(
          baseUri: baseUri,
          httpClient: httpClient,
        );
        logger.fine('Creating deployment');
        final createResult = await deployService.createDeployment(
          email: email,
          projectName: resolvedProject.name,
          ast: resolvedProject,
        );
        if (stopped) {
          throw const CancellationException();
        }
        final DeployCreated(
          :deploymentId,
          :missingAssetIds,
          :ongoingDeployments,
        ) = _checkDeployState<DeployCreated>(createResult);
        if (ongoingDeployments.isNotEmpty) {}
        final entrypointCompiler = EntrypointCompiler(
          logger: logger,
          verbose: verbose,
          enabledExperiments: celestProject.analysisOptions.enabledExperiments,
        );
        final assets = Stream.fromFutures([
          entrypointCompiler.compile(
            resolvedProject.id,
            projectPaths.localApiEntrypoint,
          ),
        ]);
        logger.fine('Created deployment: $deploymentId');
        logger.finest('Missing assets: ${missingAssetIds.join('\n')}');
        await assets.concurrentAsyncMap((compilationResult) async {
          logger.fine('Submitting asset for: ${compilationResult.nodeId}');
          if (stopped) {
            throw const CancellationException();
          }
          final submitAssetResult = await deployService.submitAsset(
            deploymentId: deploymentId,
            assetId: AssetId(
              node: compilationResult.nodeId,
              type: AssetType.dartKernel,
            ),
            asset: compilationResult.outputDill,
            assetSha256: Uint8List.fromList(
              compilationResult.outputDillSha256.bytes,
            ),
          );
          final checkedResult =
              _checkDeployState<DeploySubmittedAsset>(submitAssetResult);
          logger.fine('Submitted asset: ${checkedResult.assetId}');
        }).drain<void>();
        logger.fine('Starting deployment');
        final startResult =
            await deployService.startDeployment(deploymentId: deploymentId);
        _checkDeployState<DeployStarted>(startResult);
        logger.fine('Deployment started');
        while (!stopped) {
          final deployState = await deployService.getDeployment(
            deploymentId: deploymentId,
          );
          logger.fine('Deploy state: $deployState');
          switch (deployState) {
            case DeploySucceeded(:final deployedProject):
              return deployedProject;
            case DeployFailed(:final error):
              throw CelestException(error.message);
            case DeployCanceled():
              throw const CelestException('Deployment was canceled');
            default:
              break;
          }
          await Future.any([
            Future<void>.delayed(const Duration(seconds: 5)),
            _stopSignal.future,
          ]);
        }
        await deployService.cancelDeployment(deploymentId: deploymentId);
        throw const CancellationException();
      });

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
        await _reloadStream.cancel(immediate: true);
        await _readyForChanges.close();
        await _localApiRunner?.close();
        logger.finest('Stopped Celest frontend');
      });
}
