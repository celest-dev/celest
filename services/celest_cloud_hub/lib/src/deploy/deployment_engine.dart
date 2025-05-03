import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:celest_ast/celest_ast.dart' show ResolvedProject;
import 'package:celest_cloud/celest_cloud.dart'
    as pb
    show
        DeployProjectEnvironmentResponse,
        LifecycleState,
        ProjectAsset_Type,
        Region;
import 'package:celest_cloud/src/proto/google/rpc/status.pb.dart' as pb;
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/database/schema/project_environments.drift.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_deployment_engine.dart';
import 'package:celest_cloud_hub/src/deploy/turso/turso_deployment_engine.dart';
import 'package:celest_cloud_hub/src/model/protobuf.dart';
import 'package:celest_cloud_hub/src/model/type_registry.dart';
import 'package:drift/isolate.dart';
import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';

typedef ProjectAsset =
    ({
      pb.ProjectAsset_Type type,
      String filename,
      Uint8List inline,
      String? etag,
    });

/// Orchestrates the deployment of a project environment across Fly and Turso.
final class DeploymentEngine {
  DeploymentEngine({
    required this.db,
    required this.region,
    required this.environment,
    required this.projectAst,
    required ProjectAsset kernelAsset,
    required ProjectAsset? flutterAssetsBundle,
  }) : _fly = FlyDeploymentEngine(
         db: db,
         projectAst: projectAst,
         region: region,
         kernelAsset: kernelAsset,
         flutterAssetsBundle: flutterAssetsBundle,
         environment: environment,
       ),
       _turso = TursoDeploymentEngine(
         db: db,
         region: region,
         projectAst: projectAst,
         turso: context.turso,
       );

  final CloudHubDatabase db;

  final pb.Region region;
  final ProjectEnvironment environment;
  final ResolvedProject projectAst;

  final FlyDeploymentEngine _fly;
  final TursoDeploymentEngine _turso;

  late final Logger _logger = Logger('DeploymentEngine.${environment.id}');

  static Future<void> deployIsolated({
    required String operationId,
    required DriftIsolate dbConnection,
    required pb.Region region,
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
      final engine = DeploymentEngine(
        db: db,
        region: region,
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
        context.httpClient.close();
        await db.close();
      }
    });
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
          'Project environment has been deleted. You must first undelete it '
          'before deploying.',
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

  Future<ProjectEnvironmentState> _deployProjectEnvironment() async {
    final currentStateResult =
        await db.projectEnvironmentsDrift
            .getProjectEnvironmentState(projectEnvironmentId: environment.id)
            .getSingle();

    final (currentState, currentTursoDb) = switch (projectAst
        .databases
        .isNotEmpty) {
      true => await _turso.deploy(
        currentStateResult.projectEnvironmentStates,
        currentStateResult.tursoDatabases,
      ),
      false => (
        currentStateResult.projectEnvironmentStates,
        currentStateResult.tursoDatabases,
      ),
    };

    return _fly.deploy(currentState, currentTursoDb);
  }
}
