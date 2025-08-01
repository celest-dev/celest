import 'dart:async';
import 'dart:convert';
import 'dart:io' show gzip;
import 'dart:math';

import 'package:archive/archive_io.dart';
import 'package:celest_ast/celest_ast.dart'
    show ResolvedCelestDatabaseConfig, ResolvedProject;
import 'package:celest_cli/src/codegen/api/dockerfile_generator.dart';
import 'package:celest_cloud/celest_cloud.dart' as pb show Region;
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/database/schema/project_environments.drift.dart';
import 'package:celest_cloud_hub/src/deploy/deployment_engine.dart'
    show ProjectAsset;
import 'package:celest_cloud_hub/src/deploy/fly/fly_app_config.dart';
import 'package:celest_cloud_hub/src/model/regions.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:logging/logging.dart';

final class FlyDeploymentEngine {
  FlyDeploymentEngine({
    required this.db,
    required this.projectAst,
    required this.kernelAsset,
    required this.flutterAssetsBundle,
    required this.region,
    required this.environment,
  });

  final CloudHubDatabase db;

  /// The region to deploy to.
  final pb.Region region;
  final ProjectEnvironment environment;
  final ResolvedProject projectAst;
  final ProjectAsset kernelAsset;
  final ProjectAsset? flutterAssetsBundle;

  static const FileSystem _fileSystem = LocalFileSystem();
  late final Logger _logger = Logger('FlyDeploymentEngine.${environment.id}');

  static String generateFlyAppName(String projectId) {
    projectId = projectId.toLowerCase();

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

  Future<ProjectEnvironmentState> deploy(
    ProjectEnvironmentState currentState,
    TursoDatabase? database,
  ) async {
    ProjectEnvironmentStatesCompanion? updates;

    final String flyAppName;
    if (currentState.flyAppName case final appName?) {
      flyAppName = appName;
      _logger.fine('Using Fly app: $flyAppName');
    } else {
      // Create a new Fly app
      flyAppName = generateFlyAppName(projectAst.projectId);
      _logger.fine('Creating Fly app: $flyAppName');
      await context.fly.createApp(appName: flyAppName);
      _logger.fine('Fly app created');

      updates = ProjectEnvironmentStatesCompanion(
        flyAppName: Value(flyAppName),
        domainName: Value('$flyAppName.fly.dev'),
      );
    }

    if (currentState.flyVolumeName case final volumeName?) {
      final volumeId = await context.fly.getVolumeId(
        appName: flyAppName,
        volumeName: volumeName,
      );
      _logger.fine('Deleting Fly volume: $volumeName (id=$volumeId)');

      // First, detach the volume from the app
      final machine = await context.fly.getMachine(appName: flyAppName);
      _logger.fine('Machine: ${machine?.toJson()}');
      if (machine != null) {
        _logger.fine('Detaching Fly volume from app: $flyAppName');
        await context.fly.detachVolume(
          appName: flyAppName,
          machineId: machine.id,
          volumeId: volumeId,
        );
        _logger.fine('Fly volume detached from app');
      } else {
        _logger.warning('No machine ID found for app $flyAppName');
      }

      await context.fly.deleteVolume(volumeId: volumeId, appName: flyAppName);
      _logger.fine('Fly volume deleted');

      updates = (updates?.copyWith ?? ProjectEnvironmentStatesCompanion.new)(
        flyVolumeName: const Value(null),
      );
    }

    if (updates != null) {
      final result =
          await (db.projectEnvironmentStates.update()..where(
                (tbl) => tbl.projectEnvironmentId.equals(environment.id),
              ))
              .writeReturning(updates);
      currentState = result.first;
    }

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
        primaryRegion: region.flyRegion,
        build: FlyAppBuildConfig(dockerfile: 'Dockerfile'),
        httpService: FlyAppHttpServiceConfig(
          checks: [
            FlyAppHttpServiceCheckConfig(
              method: 'GET',
              path: '/v1/healthz',
              gracePeriod: '5s',
              interval: '1s',
              timeout: '2s',
            ),
          ],
        ),
        vms: [FlyAppVmConfig(size: 'shared-cpu-1x')],
        env: {
          for (final variable in projectAst.variables)
            if (variable.value.isNotEmpty) variable.name: variable.value,

          if (database != null)
            for (final projectDatabase in projectAst.databases.values)
              ...switch (projectDatabase.config) {
                ResolvedCelestDatabaseConfig(:final hostname) => {
                  hostname.name: database.databaseUrl,
                },
              },
        },
      );

      final secrets = {
        for (final secret in projectAst.secrets)
          if (secret.value.isNotEmpty) secret.name: secret.value,
        for (final projectDatabase in projectAst.databases.values)
          if (database != null)
            ...switch (projectDatabase.config) {
              ResolvedCelestDatabaseConfig(:final token) => {
                token.name: database.databaseToken,
              },
            },
      };
      await context.fly.setSecrets(appName: flyAppName, secrets: secrets);

      final flyConfigFile = dir.childFile('fly.json');
      await flyConfigFile.writeAsString(jsonEncode(flyConfig.toJson()));

      _logger.fine('Running fly deploy...');
      await context.flyCtl.deploy(flyConfigJsonPath: flyConfigFile.path);
    });

    final app = await context.fly.getApp(appName: flyAppName);
    _logger.fine('App successfully deployed: ${app.toJson()}');

    return currentState;
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
