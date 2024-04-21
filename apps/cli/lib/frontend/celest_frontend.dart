import 'dart:async';
import 'dart:io' as io show Platform;
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:api_celest/api_celest.dart';
import 'package:api_celest/ast.dart' as ast;
import 'package:api_celest/ast.dart';
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
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/project/project_resolver.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/port_finder.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:hub/context.dart' show EnvironmentConfig, HubMetadata, context;
import 'package:hub/user_hub/user_hub_configuration.dart';
import 'package:hub/user_hub/user_hub_server.dart';
import 'package:hub/util/email.dart';
import 'package:logging/logging.dart';
import 'package:mason_logger/mason_logger.dart' show Progress;
import 'package:platform/platform.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:watcher/watcher.dart';
import 'package:yaml_edit/yaml_edit.dart';

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

  int _logErrors(List<AnalysisError> errors) {
    for (final error in errors) {
      logger.severe(error.toString());
    }
    return 1;
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
            (event) => logger.finest(
              'Watcher event (${event.type}): ${event.path}',
            ),
          )
          .where((event) => event.type != ChangeType.ADD)
          .where((event) {
        final isReloadable = _isReloadablePath(event.path);
        if (!isReloadable) {
          logger.finest('Ignoring non-reloadable path: ${event.path}');
        }
        return isReloadable;
      }).buffer(_readyForChanges.stream),
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

    await Future.any([
      reloadComplete.future,
      _stopSignal.future,
    ]);
    await _cancelPendingOperations();
  }

  // TODO(dnys1): There is a marked difference in behavior when invalidating
  // just the changed paths, vs invalidating all project files. To be
  // safe, we invalidate all files on every reload. This is not ideal, but
  // it's the safest option for now.
  Future<Set<String>> _invalidateAllProjectFiles() async {
    final allProjectFiles = await fileSystem
        .directory(projectPaths.projectRoot)
        .list(recursive: true)
        .whereType<File>()
        .toList();
    // Invalidate all paths.
    typeHelper.reset();
    final toInvalidate =
        allProjectFiles.map((f) => f.path).where(_isReloadablePath).toList();
    logger.finest('Invaliding paths: $toInvalidate');
    return {
      ...toInvalidate,
      ...await celestProject.invalidate(toInvalidate),
    };
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
  StreamQueue<ProcessSignal>? _reloadStream;

  ResidentCompiler? _residentCompiler;
  LocalApiRunner? _localApiRunner;
  UserHubServer? _userHub;
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
          currentProgress = cliLogger.progress('Reloading Celest');
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
            final LocalDeployedProject projectOutputs;
            try {
              projectOutputs = await _startLocalApi(
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
                proxyPort: secureStorage.getLocalUri(project.name).port,
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
              projectUris: (
                localUri: secureStorage.setLocalUri(
                  project.name,
                  Uri.http('localhost:${projectOutputs.port}'),
                ),
                productionUri: secureStorage.getProductionUri(project.name),
              ),
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

  /// Gets or creates a project with the given [projectName] in the authenticated
  /// user's organization.
  Future<String?> _getOrCreateProject({
    String? projectId,
    required String projectName,
  }) async {
    if (projectId != null) {
      logger.finest('Checking project existence in org');
      try {
        final GetProjectResponse(:project) =
            await projectService.getProject(projectId: projectId);
        if (project != null) {
          if (project.projectId != projectId) {
            throw StateError(
              'Project ID mismatch: $projectId != ${project.projectId}',
            );
          }
          return projectId;
        }
      } on Exception catch (e, st) {
        logger.finest('Error retrieving project', e, st);
      }
      logger.finest('Checking ability to deploy to project: $projectId');
      // TODO(dnys1): Actually check ability to deploy
    }
    logger.finest('Getting project ID for: $projectName');
    final GetProjectResponse(:project) =
        await projectService.getProject(projectName: projectName);
    logger.finest('Found project: $project');
    if (project != null) {
      return project.projectId;
    }
    final shouldCreate = cliLogger.confirm(
      'Would you like to create a new project?',
    );
    if (!shouldCreate) {
      return null;
    }
    final quotas = await projectService.precheckProject(
      projectName: projectName,
    );
    logger.finest('Project Quotas: $quotas');
    final availableProjectTypes = [
      if (quotas.limits.remainingFree > 0) ProjectType.free,
      if (quotas.limits.remainingPremium > 0) ProjectType.premium,
    ];
    if (availableProjectTypes.isEmpty) {
      cliLogger.err(
        'Unfortunately, you have no remaining projects in your '
        'organization. Please upgrade your plan to create more projects.',
      );
      return null;
    }
    final projectType = cliLogger.chooseOne(
      'Great! Which project type would you like to create?',
      choices: availableProjectTypes,
      display: (type) => type.displayName,
    );
    logger.finest('Creating project with type: $projectType');
    final response = await projectService.createProject(
      projectName: projectName,
      projectType: projectType,
    );
    projectId = response.projectId;
    logger.finest('Created project: $projectId');
    await _saveProjectId(projectId);
    cliLogger.success('Your project has been created! Starting deployment...');
    return projectId;
  }

  /// Builds the current project for deployment to the cloud.
  Future<int> build() async {
    Progress? currentProgress;
    var projectId = await _loadProjectId();
    try {
      while (!stopped) {
        if (projectId != null) {
          currentProgress ??= cliLogger.progress('🔥 Warming up the engines');
        }
        _residentCompiler ??= await ResidentCompiler.ensureRunning();

        void fail(List<AnalysisError> errors) {
          currentProgress!.fail(
            'Project has errors. Please fix them and save the '
            'corresponding files, then run `celest deploy` again.',
          );
          currentProgress = null;
          _logErrors(errors);
        }

        final analysisResult = await _analyzeProject();
        switch (analysisResult) {
          case AnalysisFailureResult(:final errors):
          case AnalysisSuccessResult(:final errors) when errors.isNotEmpty:
            fail(errors);
            await _nextChangeSet();
          case AnalysisSuccessResult(:final project):
            projectId = await _getOrCreateProject(
              projectId: projectId,
              projectName: project.name,
            );
            if (projectId == null) {
              // CX declined creation or can't create more.
              return 0;
            }

            currentProgress ??= cliLogger.progress('🔥 Warming up the engines');
            await _generateBackendCode(project);
            final resolvedProject = await _resolveProject(project);

            var iteration = 0;
            final timer = Timer.periodic(const Duration(seconds: 10), (_) {
              const messages = [
                '✨ Contacting the Celestials',
                '🚀 Deploying to Celest Cloud',
              ];
              final index = min(iteration, messages.length - 1);
              final message = messages[index];
              if (iteration < messages.length) {
                currentProgress!.complete();
                currentProgress = cliLogger.progress(message);
              }
              iteration++;
            });
            final projectOutputs = await _deployProject(
              projectId: projectId,
              resolvedProject: resolvedProject,
            );
            await _generateClientCode(
              project: project,
              projectUris: (
                localUri: secureStorage.getLocalUri(project.name),
                productionUri: secureStorage.setProductionUri(
                  project.name,
                  projectOutputs.baseUri,
                ),
              ),
            );

            timer.cancel();
            currentProgress!.complete();
            cliLogger.success('💙 Your Celest project has been deployed!');
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
              final file = fileSystem.file(path);
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
    required int? proxyPort,
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
      _userHub = await _startUserHub(
        proxyPort: proxyPort,
        localApiPort: _localApiRunner!.port,
        resolvedProject: resolvedProject,
      );
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
              port: _localApiRunner?.port,
              envVars: envVars,
              verbose: verbose,
            );
          });
      }
      assert(_userHub != null);
      _userHub!.config.resolvedProject = resolvedProject;
    }
    if (stopped) {
      throw const CancellationException('Celest was stopped');
    }
    return ast.LocalDeployedProject.from(
      projectAst: resolvedProject,
      port: _userHub!.port,
    );
  }

  Future<UserHubServer> _startUserHub({
    required int? proxyPort,
    required int localApiPort,
    required ast.ResolvedProject resolvedProject,
  }) async {
    return performance.trace('CelestFrontend', 'startUserHub', () async {
      final dbDir =
          celestProject.config.configDir.childDirectory(resolvedProject.name);
      await dbDir.create();

      final metadata = storage.getMetadata(resolvedProject.name) ??
          storage.setMetadata(resolvedProject.name, HubMetadata.test());
      final envConfig = EnvironmentConfig(
        dbDir: dbDir.path,
        metadata: metadata,
        logDatabaseStatements: false,
      );
      await context.init(
        serverName: 'UserHub',
        config: envConfig,
        emailProvider: EmailPrinter(),
        platform: FakePlatform.fromPlatform(platform).copyWith(
          // Clear out the environment for the user hub so that sensitive info
          // in the local environment is not used by mistake.
          environment: {},
        ),
        logger: logger,
      );
      final port = await const DefaultPortFinder().checkOrUpdatePort(proxyPort);
      return UserHubServer.start(
        port: port,
        userApiUri: Uri.http('localhost:$localApiPort'),
        config: UserHubConfiguration.development(
          rpName: resolvedProject.name,
          resolvedProject: resolvedProject,
        ),
      );
    });
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

  Future<String?> _loadProjectId() async {
    final pubspecFile = fileSystem.file(projectPaths.pubspecYaml);
    if (!pubspecFile.existsSync()) {
      throw StateError('No pubspec.yaml found');
    }
    final pubspec = YamlEditor(await pubspecFile.readAsString());
    try {
      final projectId =
          pubspec.parseAt(['celest', 'project', 'id']).value as String?;
      logger.finer('Loaded project ID from pubspec.yaml: $projectId');
      return projectId;
    } on Object {
      logger.finer('No project ID found in pubspec.yaml');
      return null;
    }
  }

  Future<void> _saveProjectId(String? projectId) async {
    logger.finer('Saving project ID to pubspec.yaml: $projectId');
    final pubspecFile = fileSystem.file(projectPaths.pubspecYaml);
    final pubspec = YamlEditor(await pubspecFile.readAsString());
    if (projectId != null) {
      pubspec.update(
        ['celest'],
        {
          'project': {
            'id': projectId,
          },
        },
      );
    } else {
      try {
        pubspec.remove(['celest']);
      } on Object {
        // OK
      }
    }
    await pubspecFile.writeAsString(pubspec.toString());
  }

  Future<ast.RemoteDeployedProject> _deployProject({
    required String projectId,
    required ast.ResolvedProject resolvedProject,
  }) =>
      performance.trace('CelestFrontend', 'deployProject', () async {
        logger.fine('Creating deployment');
        final createResult = await deployService.createDeployment(
          projectId: projectId,
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
        analytics.capture(
          'start_deployment',
          properties: {
            'deployment_id': deploymentId,
          },
        );
        if (ongoingDeployments.isNotEmpty) {
          // TODO: Handle multiple ongoing deployments
        }
        try {
          final entrypointCompiler = EntrypointCompiler(
            logger: logger,
            verbose: verbose,
            enabledExperiments:
                celestProject.analysisOptions.enabledExperiments,
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
          // Maximum allowable time. If it takes longer than this, something is
          // really wrong.
          const timeoutDuration = Duration(minutes: 3);
          final timeout = Future<void>.delayed(timeoutDuration);
          while (!stopped) {
            final deployState = await deployService.getDeployment(
              deploymentId: deploymentId,
            );
            logger.fine('Deploy state: $deployState');
            switch (deployState) {
              case DeploySucceeded(:final projectId, :final deployedProject):
                await _saveProjectId(projectId);
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
              timeout.then(
                (_) => throw TimeoutException(
                  'Timed out after $timeoutDuration',
                ),
              ),
            ]);
          }
          logger.finer('Canceling deployment');
          await deployService.cancelDeployment(deploymentId: deploymentId);
          throw const CelestException('Deployment was canceled');
        } on Exception catch (e, st) {
          if (e case CancellationException() || CelestException()) {
            analytics.capture(
              'cancel_deployment',
              properties: {
                'deployment_id': deploymentId,
              },
            );
            rethrow;
          }
          Error.throwWithStackTrace(
            CelestException(
              'Failed to deploy project. Please contact the Celest team and '
              'reference deployment ID: $deploymentId',
              additionalContext: {
                'deploymentId': deploymentId,
                'error': '$e',
              },
            ),
            st,
          );
        }
      });

  Future<void> _generateClientCode({
    required ast.Project project,
    required CelestProjectUris projectUris,
  }) =>
      performance.trace('CelestFrontend', 'generateClientCode', () async {
        logger.fine('Generating client code...');
        final generator = ClientCodeGenerator(
          project: project,
          projectUris: projectUris,
        );
        await generator.generate().write();
      });

  @override
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
          Future.value(_userHub?.close(force: true)),
        ]);
        logger.finest('Stopped Celest frontend');
      });
}

final class EmailPrinter implements EmailProvider {
  @override
  Future<void> sendTransactionalEmail({
    required String to,
    required TransactionalEmail email,
  }) async {
    final otpCode = (email as OtpCodeEmail).otp;
    cliLogger.info('[$to] Received OTP code: $otpCode');
  }
}
