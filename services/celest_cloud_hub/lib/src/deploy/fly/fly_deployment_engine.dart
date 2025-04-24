import 'dart:async';
import 'dart:convert';
import 'dart:io' show ProcessException, gzip;
import 'dart:isolate';
import 'dart:math';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:celest_ast/celest_ast.dart'
    show ResolvedCelestDatabaseConfig, ResolvedProject;
import 'package:celest_cli/src/codegen/api/dockerfile_generator.dart';
import 'package:celest_cli/src/utils/process.dart';
import 'package:celest_cloud/celest_cloud.dart'
    as pb
    show DeployProjectEnvironmentResponse, LifecycleState, ProjectAsset_Type;
import 'package:celest_cloud/src/proto/google/rpc/status.pb.dart' as pb;
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/database/schema/project_environments.drift.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_api.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_app_config.dart';
import 'package:celest_cloud_hub/src/model/protobuf.dart';
import 'package:celest_cloud_hub/src/model/type_registry.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:drift/isolate.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:logging/logging.dart';
import 'package:process/process.dart';

typedef ProjectAsset =
    ({
      pb.ProjectAsset_Type type,
      String filename,
      Uint8List inline,
      String? etag,
    });

final class FlyDeploymentEngine {
  FlyDeploymentEngine({
    required this.db,
    required String flyApiToken,
    required this.projectAst,
    required this.kernelAsset,
    required this.flutterAssetsBundle,
    required this.environment,
  }) : flyApi = FlyMachinesApiClient(authToken: flyApiToken),
       _flyApiToken = flyApiToken;

  final CloudHubDatabase db;
  final String _flyApiToken;
  final FlyMachinesApiClient flyApi;

  final ProjectEnvironment environment;
  final ResolvedProject projectAst;
  final ProjectAsset kernelAsset;
  final ProjectAsset? flutterAssetsBundle;

  static Future<void> deployIsolated({
    required String operationId,
    required DriftIsolate dbConnection,
    required String flyApiToken,
    required ResolvedProject projectAst,
    required ProjectEnvironment environment,
    required ProjectAsset kernelAsset,
    required ProjectAsset? flutterAssetsBundle,
  }) async {
    await Isolate.run(() async {
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen((record) {
        final loggerName = record.loggerName.split('.').last;
        print(
          '${record.time} [$loggerName] ${record.level.name}: '
          '${record.message}',
        );
        if (record.error != null) {
          print(record.error);
        }
        if (record.stackTrace != null) {
          print(record.stackTrace);
        }
      });

      final connection = await dbConnection.connect(
        isolateDebugLog: false,
        singleClientMode: true,
      );
      final db = CloudHubDatabase(connection);
      final engine = FlyDeploymentEngine(
        db: db,
        flyApiToken: flyApiToken,
        projectAst: projectAst,
        kernelAsset: kernelAsset,
        flutterAssetsBundle: flutterAssetsBundle,
        environment: environment,
      );
      try {
        final state = await engine.deploy();
        final response = pb.DeployProjectEnvironmentResponse(
          project: projectAst.toProto().packIntoAny(),
          uri: 'https://${state.domainName}',
        );
        await db.operationsDrift.updateOperation(
          id: operationId,
          response: jsonEncode(
            response.packIntoAny().toProto3Json(typeRegistry: typeRegistry),
          ),
        );
        engine._logger.info('Successfully deployed environment');
      } on Object catch (e, st) {
        final grpcError = e is GrpcError ? e : GrpcError.unknown(e.toString());
        engine._logger.severe('Failed to deploy environment', e, st);
        final error = pb.Status(
          code: grpcError.code,
          message: grpcError.message,
          details: grpcError.details?.map((it) => it.packIntoAny()),
        );
        await db.operationsDrift.updateOperation(
          id: operationId,
          error: jsonEncode(error.toProto3Json(typeRegistry: typeRegistry)),
        );
      } finally {
        engine.close();
        await db.close();
      }
    });
  }

  static const String _flyOrgSlug = 'celest-809';
  static const FileSystem _fileSystem = LocalFileSystem();
  static const ProcessManager _processManager = LocalProcessManager();
  late final Logger _logger = Logger('FlyDeploymentEngine.${environment.id}');

  void close() {
    flyApi.close();
  }

  Future<ProjectEnvironmentState> deploy() async {
    final pb.LifecycleState next, onFailure;
    final current = pb.LifecycleState.values.firstWhere(
      (state) => state.name == environment.state,
    );
    switch (current) {
      case pb.LifecycleState.ACTIVE:
        next = pb.LifecycleState.UPDATING;
        onFailure = pb.LifecycleState.UPDATE_FAILED;
      case pb.LifecycleState.CREATION_FAILED:
        next = pb.LifecycleState.CREATING;
        onFailure = pb.LifecycleState.CREATION_FAILED;
      case pb.LifecycleState.DELETION_FAILED:
        next = pb.LifecycleState.DELETING;
        onFailure = pb.LifecycleState.DELETION_FAILED;
      case pb.LifecycleState.UPDATE_FAILED:
        next = pb.LifecycleState.UPDATING;
        onFailure = pb.LifecycleState.UPDATE_FAILED;
      case pb.LifecycleState.LIFECYCLE_STATE_UNSPECIFIED ||
          pb.LifecycleState.CREATING:
        next = pb.LifecycleState.CREATING;
        onFailure = pb.LifecycleState.CREATION_FAILED;
      case pb.LifecycleState.DELETED:
        throw GrpcError.failedPrecondition(
          'Project environment has been deleted.',
        );
      case pb.LifecycleState.DELETING:
        throw GrpcError.failedPrecondition(
          'Project environment is being deleted.',
        );
      case pb.LifecycleState.UPDATING:
        throw GrpcError.failedPrecondition(
          'Project environment is being updated.',
        );
      default:
        throw GrpcError.failedPrecondition(
          'Project environment is in an unknown state: ${current.name}',
        );
    }

    _logger.fine(
      'Deploying project environment: '
      '${environment.state} -> ${next.name}',
    );
    await db.projectEnvironmentsDrift.updateProjectEnvironment(
      id: environment.id,
      state: next.name,
    );
    try {
      final state = await _deployProjectEnvironment();
      await db.projectEnvironmentsDrift.updateProjectEnvironment(
        id: environment.id,
        state: 'ACTIVE',
      );
      return state;
    } on Object catch (e, st) {
      _logger.severe('Failed to deploy project environment', e, st);
      await db.projectEnvironmentsDrift.updateProjectEnvironment(
        id: environment.id,
        state: onFailure.name,
      );
      rethrow;
    }
  }

  String _generateFlyAppName() {
    var projectId = projectAst.projectId.toLowerCase();

    // Only lowercase letters, numbers, and dashes are allowed.
    projectId = projectId.replaceAll(RegExp(r'[^a-z0-9]'), '-');

    // Restricted to 63 characters total.
    final suffix = _randomSuffix;
    final maxLength = 63 - suffix.length;
    if (projectId.length > maxLength) {
      projectId = projectId.substring(0, maxLength);
    }
    return '$projectId-$suffix';
  }

  Future<ProjectEnvironmentState> _deployProjectEnvironment() async {
    var currentState =
        await db.projectEnvironmentsDrift
            .getProjectEnvironmentState(projectEnvironmentId: environment.id)
            .getSingleOrNull();

    final String flyAppName;
    if (currentState?.flyAppName case final appName?) {
      flyAppName = appName;
      _logger.fine('Using Fly app: $flyAppName');
    } else {
      // Create a new Fly app
      flyAppName = _generateFlyAppName();
      _logger.fine('Creating Fly app: $flyAppName');
      await flyApi.apps.create(
        request: CreateAppRequest(appName: flyAppName, orgSlug: _flyOrgSlug),
      );
      _logger.fine('Fly app created');
    }

    final String flyVolumeName;
    if (currentState?.flyVolumeName case final volumeName?) {
      flyVolumeName = volumeName;
      _logger.fine('Using Fly volume: $flyVolumeName');
    } else {
      _logger.fine('Creating Fly volume');
      flyVolumeName = environment.id;
      final volume = await flyApi.volumes.create(
        appName: flyAppName,
        request: CreateVolumeRequest(
          name: flyVolumeName,
          region: 'lax', // TODO
          sizeGb: 1,
        ),
      );
      _logger.fine('Created Fly volume: ${volume.toJson()}');
    }
    currentState =
        (await db.projectEnvironmentsDrift.upsertProjectEnvironmentState(
          projectEnvironmentId: environment.id,
          flyAppName: flyAppName,
          flyVolumeName: flyVolumeName,
          domainName: '$flyAppName.fly.dev',
        )).first;

    // Deploy using `flyctl deploy`
    await _withTempDirectory((dir) async {
      if (kernelAsset.etag case final etag?) {
        final computed = md5.convert(kernelAsset.inline).toString();
        if (etag != computed) {
          throw GrpcError.failedPrecondition('Kernel asset has been modified');
        }
      }

      // Write the kernel file to disk
      var kernelAssetData = kernelAsset.inline;
      var kernelAssetFilename = kernelAsset.filename;
      if (kernelAssetFilename.endsWith('.gz')) {
        kernelAssetData = gzip.decode(kernelAssetData) as Uint8List;
        kernelAssetFilename = kernelAssetFilename.substring(
          0,
          kernelAssetFilename.length - '.gz'.length,
        );
      }
      _logger.fine('Writing kernel asset to disk: $kernelAssetFilename');
      final kernelFile = dir.childFile(kernelAssetFilename);
      await kernelFile.writeAsBytes(kernelAssetData);

      if (flutterAssetsBundle case final flutterAssetsBundle?) {
        if (flutterAssetsBundle.etag case final etag?) {
          final computed = md5.convert(flutterAssetsBundle.inline).toString();
          if (etag != computed) {
            throw GrpcError.failedPrecondition(
              'Flutter assets bundle has been modified',
            );
          }
        }
        // Write the Flutter assets bundle to disk
        final flutterAssetsFile = dir.childFile(flutterAssetsBundle.filename);
        await flutterAssetsFile.writeAsBytes(flutterAssetsBundle.inline);
        await extractFileToDisk(
          flutterAssetsFile.path,
          dir.childDirectory('flutter_assets').path,
        );
      }

      // Write celest.json to disk
      final celestJsonFile = dir.childFile('celest.json');
      await celestJsonFile.writeAsString(
        jsonEncode(projectAst.toProto().toProto3Json()),
      );

      // Generate the dockerfile for the project.
      final generator = DockerfileGenerator(
        project: projectAst,
        assetType: kernelAsset.type,
      );
      final dockerfile = generator.generate();
      final dockerfileFile = dir.childFile('Dockerfile');
      await dockerfileFile.writeAsString(dockerfile);

      // Write the app config.
      final flyConfig = FlyAppConfig(
        appName: flyAppName,
        primaryRegion: 'lax', // TODO
        build: FlyAppBuildConfig(dockerfile: 'Dockerfile'),
        mounts: [FlyAppMountConfig(source: flyVolumeName, destination: '/db')],
        httpService: FlyAppHttpServiceConfig(),
        vms: [FlyAppVmConfig(size: 'shared-cpu-1x')],
        env: {
          for (final variable in projectAst.variables)
            if (variable.value.isNotEmpty) variable.name: variable.value,
          for (final secret in projectAst.secrets)
            if (secret.value.isNotEmpty) secret.name: secret.value,
          for (final database in projectAst.databases.values)
            ...switch (database.config) {
              ResolvedCelestDatabaseConfig(:final hostname) => {
                hostname.name:
                    Uri.file('/db/${database.databaseId}.db').toString(),
              },
            },
        },
      );
      final flyConfigFile = dir.childFile('fly.json');
      await flyConfigFile.writeAsString(jsonEncode(flyConfig.toJson()));

      _logger.fine('Running fly deploy...');
      await _flyctl([
        'deploy',
        '--config',
        'fly.json',
        '--remote-only',
      ], workingDirectory: dir.path);
    });

    final app = await flyApi.apps.show(appName: flyAppName);
    _logger.fine('App successfully deployed: ${app.toJson()}');

    return currentState;
  }

  Future<Map<String, Object?>> _flyctl(
    List<String> args, {
    String? workingDirectory,
  }) async {
    final process = await _processManager.start(
      ['flyctl', ...args, '--access-token', _flyApiToken],
      workingDirectory: workingDirectory,
      environment: {'NO_COLOR': '1'},
    );
    final stdout = StringBuffer();
    final stderr = StringBuffer();
    process
      ..captureStdout(sink: _logger.finer)
      ..captureStdout(sink: stdout.writeln)
      ..captureStderr(sink: _logger.finer)
      ..captureStderr(sink: stderr.writeln);

    final exitCode = await process.exitCode;
    if (exitCode != 0) {
      final exception = ProcessException('flyctl', args, '$stderr', exitCode);
      _logger.severe('Failed to deploy', exception);
      throw GrpcError.internal('Failed to deploy app');
    }

    if (args.contains('--json')) {
      final output = stdout.toString();
      return jsonDecode(output) as Map<String, Object?>;
    }
    return const {};
  }

  Future<void> _withTempDirectory(
    Future<void> Function(Directory) action,
  ) async {
    final tempDir = _fileSystem.systemTempDirectory.createTempSync('hub_');
    try {
      await action(tempDir);
    } finally {
      unawaited(tempDir.delete(recursive: true));
    }
  }
}

String get _randomSuffix {
  final random = Random.secure();
  final codes = [for (var i = 0; i < 3; i++) random.nextInt(256)];
  return hex.encode(codes);
}
