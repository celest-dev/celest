import 'dart:convert';

import 'package:cedar/cedar.dart';
import 'package:celest/http.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud/src/grpc.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_auth/src/model/order_by.dart';
import 'package:celest_cloud_auth/src/model/page_token.dart';
import 'package:celest_cloud_hub/src/auth/auth_interceptor.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/gateway/gateway_handler.dart';
import 'package:celest_cloud_hub/src/model/interop.dart';
import 'package:celest_cloud_hub/src/model/protobuf.dart';
import 'package:celest_cloud_hub/src/model/type_registry.dart';
import 'package:celest_cloud_hub/src/services/service_mixin.dart';
import 'package:drift/drift.dart' show OrderBy, OrderingMode, OrderingTerm;
import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';

final class ProjectEnvironmentsService extends ProjectEnvironmentsServiceBase
    with ServiceMixin {
  ProjectEnvironmentsService(this._db, this.authorizer);

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

  static final Map<String, GatewayHandler> $handlers = {};

  @override
  final Logger logger = Logger(apiId);

  final CloudHubDatabase _db;
  @override
  final Authorizer authorizer;

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

    logger.info('Checking for existing environment');
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
    final principal = call.expectPrincipal();

    final membership =
        await _db.userMembershipsDrift
            .findUserMembership(
              userId: principal.uid.id,
              parentType: 'Celest::Project',
              parentId: project.id,
            )
            .getSingleOrNull();

    final resource = Entity(
      uid: EntityUid.of('Celest::Project::Environment', environmentId.encoded),
      parents: [EntityUid.of('Celest::Project', project.id)],
    );

    await authorize(
      principal: switch (membership?.membershipId) {
        final membershipId? => EntityUid.of(
          'Celest::Project::Member',
          membershipId,
        ),
        _ => principal,
      },
      action: CelestAction.create,
      resource: resource,
    );

    logger.info('Creating project environment');
    return _db.withoutForeignKeys(() async {
      final environment =
          (await _db.projectEnvironmentsDrift.createProjectEnvironment(
            id: environmentId.encoded,
            parentType: 'Celest::Project',
            parentId: project.id,
            projectEnvironmentId: request.projectEnvironmentId,
            state: 'ACTIVE',
            annotations:
                request.projectEnvironment.annotations.isEmpty
                    ? null
                    : jsonEncode(request.projectEnvironment.annotations),
            displayName: request.projectEnvironment.displayName,
          )).first;

      // Add the user as the owner of the project
      await _db.userMembershipsDrift.createUserMembership(
        membershipId: typeId('mbr'),
        userId: principal.uid.id,
        parentType: 'Celest::Project::Environment',
        parentId: environment.id,
        role: 'owner',
      );

      final operationResponse = environment.toProto().packIntoAny();
      final createOperation =
          (await _db.operationsDrift.createOperation(
            id: typeId('op'),
            ownerType: principal.uid.type,
            ownerId: principal.uid.id,
            resourceType: 'Celest::Project::Environment',
            resourceId: environment.id,
            response: jsonEncode(
              operationResponse.toProto3Json(typeRegistry: typeRegistry),
            ),
          )).first;

      return createOperation.toProto();
    });
  }

  @override
  Future<Operation> deleteProjectEnvironment(
    ServiceCall call,
    DeleteProjectEnvironmentRequest request,
  ) async {
    final (projectId, environmentId) = switch (request.name.split('/')) {
      ['projects', final projectId, 'environments', final environmentId] => (
        projectId,
        environmentId,
      ),
      _ =>
        throw GrpcError.invalidArgument(
          'Invalid name format. Expected "projects/{project_id}/environments/{environment_id}".',
        ),
    };

    final environment =
        await _db.projectEnvironmentsDrift
            .lookupProjectEnvironment(
              projectId: projectId,
              projectEnvironmentId: environmentId,
            )
            .getSingleOrNull();
    if (environment == null) {
      if (request.allowMissing) {
        // TODO(dnys1): How to represent this on the client?
        return Operation(done: true);
      }
      throw GrpcError.notFound('No environment found with ID $environmentId');
    }

    final principal = call.expectPrincipal();
    final membership =
        await _db.userMembershipsDrift
            .findUserMembership(
              userId: principal.uid.id,
              parentType: 'Celest::Project::Environment',
              parentId: environment.id,
            )
            .getSingleOrNull();

    await authorize(
      principal: switch (membership?.membershipId) {
        final membershipId? => EntityUid.of(
          'Celest::Project::Environment::Member',
          membershipId,
        ),
        _ => principal,
      },
      action: CelestAction.delete,
      resource: EntityUid.of('Celest::Project::Environment', environment.id),
    );

    if (request.etag.isNotEmpty && request.etag != environment.etag) {
      throw GrpcError.failedPrecondition('Etag mismatch');
    }

    final deletedEnvironment =
        (await _db.projectEnvironmentsDrift.deleteProjectEnvironment(
          id: environment.id,
        )).first;

    final operationResponse = deletedEnvironment.toProto().packIntoAny();
    final operation =
        (await _db.operationsDrift.createOperation(
          id: typeId('op'),
          ownerType: principal.uid.type,
          ownerId: principal.uid.id,
          resourceType: 'Celest::Project::Environment',
          resourceId: environment.id,
          response: jsonEncode(
            operationResponse.toProto3Json(typeRegistry: typeRegistry),
          ),
        )).first;

    return operation.toProto();
  }

  @override
  Future<Operation> deployProjectEnvironment(
    ServiceCall call,
    DeployProjectEnvironmentRequest request,
  ) async {
    throw GrpcError.unimplemented(
      'DeployProjectEnvironment is not implemented',
    );
  }

  @override
  Future<ProjectEnvironment> getProjectEnvironment(
    ServiceCall call,
    GetProjectEnvironmentRequest request,
  ) async {
    final (projectId, environmentId) = switch (request.name.split('/')) {
      ['projects', final projectId, 'environments', final environmentId] => (
        projectId,
        environmentId,
      ),
      _ =>
        throw GrpcError.invalidArgument(
          'Invalid name format. Expected "projects/{project_id}/environments/{environment_id}".',
        ),
    };

    final environment =
        await _db.projectEnvironmentsDrift
            .lookupProjectEnvironment(
              projectId: projectId,
              projectEnvironmentId: environmentId,
            )
            .getSingleOrNull();
    if (environment == null) {
      throw GrpcError.notFound(
        'No environment found with ID $environmentId for project $projectId',
      );
    }

    final principal = call.expectPrincipal();
    final membership =
        await _db.userMembershipsDrift
            .findUserMembership(
              userId: principal.uid.id,
              parentType: 'Celest::Project::Environment',
              parentId: environment.id,
            )
            .getSingleOrNull();

    await authorize(
      principal: switch (membership?.membershipId) {
        final membershipId? => EntityUid.of(
          'Celest::Project::Environment::Member',
          membershipId,
        ),
        _ => principal,
      },
      action: CelestAction.get,
      resource: EntityUid.of('Celest::Project::Environment', environment.id),
    );

    return environment.toProto();
  }

  @override
  Future<ListProjectEnvironmentsResponse> listProjectEnvironments(
    ServiceCall call,
    ListProjectEnvironmentsRequest request,
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
      throw GrpcError.notFound('No project found with ID $projectId');
    }

    final principal = call.expectPrincipal();
    final membership =
        await _db.userMembershipsDrift
            .findUserMembership(
              userId: principal.uid.id,
              parentType: 'Celest::Project',
              parentId: project.id,
            )
            .getSingleOrNull();

    await authorize(
      principal: switch (membership?.membershipId) {
        final membershipId? => EntityUid.of(
          'Celest::Project::Member',
          membershipId,
        ),
        _ => principal,
      },
      action: CelestAction.list,
      resource: EntityUid.of('Celest::Project', project.id),
    );

    if (request.filter.isNotEmpty) {
      throw GrpcError.invalidArgument('Filter is not supported');
    }

    PageToken? pageData;
    try {
      pageData =
          request.pageToken.isNotEmpty
              ? PageToken.parse(request.pageToken)
              : null;
    } on FormatException {
      throw GrpcError.invalidArgument('Invalid page token');
    }

    var pageSize = request.pageSize;
    final pageOffset = pageData?.offset ?? 0;
    const defaultPageSize = 10;
    if (pageSize == 0) {
      pageSize = defaultPageSize;
    }

    final startTime =
        pageData?.startTime ??
        DateTime.timestamp().add(const Duration(seconds: 1));

    OrderByClause? orderByClause;
    if (request.orderBy.isNotEmpty) {
      orderByClause = OrderByClause.parse(request.orderBy);
    }

    final rows =
        await _db.projectEnvironmentsDrift
            .listProjectEnvironments(
              userId: principal.uid.id,
              parentId: projectId,
              offset: pageOffset,
              limit: pageSize,
              startTime: startTime,
              order_by: switch (orderByClause) {
                final orderBy? =>
                  (tbl) => OrderBy(orderBy.toOrderingTerms(tbl).toList()),
                _ =>
                  (tbl) => OrderBy([
                    OrderingTerm(
                      expression: tbl.createTime,
                      mode: OrderingMode.desc,
                    ),
                  ]),
              },
            )
            .get();

    final environments = rows.map((it) => it.projectEnvironments.toProto());
    final nextPageToken =
        rows.isEmpty || rows.length < pageSize
            ? null
            : PageToken(
              startTime: startTime,
              offset: rows.last.rowNum,
            ).encode();

    return ListProjectEnvironmentsResponse(
      nextPageToken: nextPageToken,
      projectEnvironments: environments,
    );
  }

  @override
  Future<Operation> updateProjectEnvironment(
    ServiceCall call,
    UpdateProjectEnvironmentRequest request,
  ) async {
    final (projectId, environmentId) = switch (request.projectEnvironment.name
        .split('/')) {
      ['projects', final projectId, 'environments', final environmentId] => (
        projectId,
        environmentId,
      ),
      _ =>
        throw GrpcError.invalidArgument(
          'Invalid name format. Expected "projects/{project_id}/environments/{environment_id}".',
        ),
    };

    var environment =
        await _db.projectEnvironmentsDrift
            .lookupProjectEnvironment(
              projectId: projectId,
              projectEnvironmentId: environmentId,
            )
            .getSingleOrNull();
    if (environment == null) {
      throw GrpcError.notFound('No environment found with ID $environmentId');
    }

    final principal = call.expectPrincipal();
    final membership =
        await _db.userMembershipsDrift
            .findUserMembership(
              userId: principal.uid.id,
              parentType: 'Celest::Project::Environment',
              parentId: environment.id,
            )
            .getSingleOrNull();

    await authorize(
      principal: switch (membership?.membershipId) {
        final membershipId? => EntityUid.of(
          'Celest::Project::Environment::Member',
          membershipId,
        ),
        _ => principal,
      },
      action: CelestAction.update,
      resource: EntityUid.of('Celest::Project::Environment', environment.id),
    );

    final updateMask = request.updateMask.paths;
    T? mask<T extends Object?>(String field, T value) {
      final include = updateMask.isEmpty || updateMask.contains(field);
      if (!include) {
        return null;
      }
      return value;
    }

    environment =
        (await _db.projectEnvironmentsDrift.updateProjectEnvironment(
          id: environment.id,
          displayName: mask<String?>(
            'display_name',
            request.projectEnvironment.hasDisplayName()
                ? request.projectEnvironment.displayName
                : null,
          ),
          annotations: mask<String?>(
            'annotations',
            request.projectEnvironment.annotations.isEmpty
                ? null
                : jsonEncode(request.projectEnvironment.annotations),
          ),
        )).first;

    final operationResponse = environment.toProto().packIntoAny();
    final operation =
        (await _db.operationsDrift.createOperation(
          id: typeId('op'),
          ownerType: principal.uid.type,
          ownerId: principal.uid.id,
          resourceType: 'Celest::Project::Environment',
          resourceId: environment.id,
          response: jsonEncode(
            operationResponse.toProto3Json(typeRegistry: typeRegistry),
          ),
        )).first;

    return operation.toProto();
  }
}
