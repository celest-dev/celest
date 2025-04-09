import 'dart:convert';

import 'package:cedar/cedar.dart';
import 'package:celest/http.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud/celest_cloud.dart' show DateTimeProto;
import 'package:celest_cloud/src/grpc.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_auth/src/util/typeid.dart';
import 'package:celest_cloud_hub/src/auth/auth_interceptor.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/model/lifecycle_state.dart';
import 'package:celest_cloud_hub/src/model/protobuf.dart';
import 'package:celest_cloud_hub/src/model/type_registry.dart';
import 'package:celest_core/celest_core.dart';
import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';
import 'package:protobuf/protobuf.dart';

final class ProjectEnvironmentsService extends ProjectEnvironmentsServiceBase {
  ProjectEnvironmentsService(this._db, this._authorizer);

  static const String apiId = 'celest.cloud.v1alpha1.ProjectEnvironments';
  static const EntityUid apiUid = EntityUid.of('Celest::Api', apiId);

  static final ResolvedApi api = ResolvedApi(
    apiId: ProjectEnvironmentsService.apiId,
    functions: {
      'CreateProjectEnvironment': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'CreateProjectEnvironment',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.post,
            path: '/v1alpha1/{parent=projects/*}/environments',
          ),
        ),
      ),
    },
    policySet: PolicySet(
      templateLinks: [
        TemplateLink(
          templateId: 'cloud.functions.authenticated',
          newId: ProjectEnvironmentsService.apiId,
          values: {SlotId.resource: ProjectEnvironmentsService.apiUid},
        ),
      ],
    ),
  );

  static final Logger _logger = Logger('ProjectEnvironmentsService');

  final CloudHubDatabase _db;
  final Authorizer _authorizer;

  @override
  Future<Operation> createProjectEnvironment(
    ServiceCall call,
    CreateProjectEnvironmentRequest request,
  ) async {
    final projectId = switch (request.parent.split('/')) {
      ['projects', final projectId] => projectId,
      _ =>
        throw GrpcError.invalidArgument(
          'Invalid parent format. Expected "projects/{project_id}".',
        ),
    };
    final project =
        await _db.projectsDrift.getProject(id: projectId).getSingleOrNull();
    if (project == null) {
      throw GrpcError.notFound('Project with ID $projectId not found.');
    }

    final organization =
        await _db.organizationsDrift
            .getOrganization(id: project.parentId)
            .getSingle();

    _logger.info('Checking for existing environment');
    final existingEnvironment =
        await _db.projectEnvironmentsDrift
            .lookupProjectEnvironment(
              projectId: projectId,
              projectEnvironmentId: request.projectEnvironmentId,
            )
            .getSingleOrNull();
    if (existingEnvironment != null) {
      throw GrpcError.alreadyExists(
        'Project environment with ID ${request.projectEnvironmentId} already exists.',
      );
    }

    final environmentId = TypeId('env');
    final resource = Entity(
      uid: EntityUid.of('Celest::Project::Environment', environmentId.encoded),
      parents: [
        EntityUid.of('Celest::Project', projectId),
        EntityUid.of('Celest::Organization', organization.id),
      ],
    );
    try {
      await _authorizer.expectAuthorized(
        action: const EntityUid.of('Celest::Action', 'create'),
        resource: resource,
        principal: call.principal,
      );
    } on CloudException catch (e, st) {
      Error.throwWithStackTrace(e.toGrpcError(), st);
    }

    _logger.info('Creating project environment');

    final environment =
        (await _db.projectEnvironmentsDrift.createProjectEnvironment(
          id: environmentId.encoded,
          projectEnvironmentId: request.projectEnvironmentId,
          state: LifecycleState.creating,
          annotations:
              request.projectEnvironment.annotations.isEmpty
                  ? null
                  : jsonEncode(request.projectEnvironment.annotations),
          displayName: request.projectEnvironment.displayName,
        )).first;

    final pbEnvironment =
        request.projectEnvironment.deepCopy()
          ..name = 'environments/${environment.id}'
          ..uid = environmentId.uuid.hexValue
          // ..parent = 'projects/'
          ..projectEnvironmentId = environment.projectEnvironmentId
          ..createTime = environment.createTime.toProto()
          ..updateTime = environment.updateTime.toProto()
          ..state = environment.state.toProto()
          ..etag = environment.etag
          ..reconciling = false;

    final operationResponse = pbEnvironment.packIntoAny();
    final createOperation =
        (await _db.operationsDrift.createOperation(
          id: typeId('op'),
          resourceType: 'Celest::Project::Environment',
          resourceId: environment.id,
          response: jsonEncode(
            operationResponse.toProto3Json(typeRegistry: typeRegistry),
          ),
        )).first;

    return Operation(
      name: 'operations/${createOperation.id}',
      response: operationResponse,
      done: true,
    );
  }

  @override
  Future<Operation> deleteProjectEnvironment(
    ServiceCall call,
    DeleteProjectEnvironmentRequest request,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Operation> deployProjectEnvironment(
    ServiceCall call,
    DeployProjectEnvironmentRequest request,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<ProjectEnvironment> getProjectEnvironment(
    ServiceCall call,
    GetProjectEnvironmentRequest request,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<ListProjectEnvironmentsResponse> listProjectEnvironments(
    ServiceCall call,
    ListProjectEnvironmentsRequest request,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Operation> updateProjectEnvironment(
    ServiceCall call,
    UpdateProjectEnvironmentRequest request,
  ) {
    throw UnimplementedError();
  }
}
