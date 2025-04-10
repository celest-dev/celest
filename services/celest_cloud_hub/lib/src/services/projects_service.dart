import 'dart:convert';

import 'package:cedar/cedar.dart' hide Value;
import 'package:celest/http.dart';
import 'package:celest_ast/celest_ast.dart' hide Project;
import 'package:celest_cloud/celest_cloud.dart' show LifecycleState, Operation;
import 'package:celest_cloud/src/proto.dart' as pb;
import 'package:celest_cloud/src/proto/celest/cloud/v1alpha1/projects.pbgrpc.dart';
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
import 'package:celest_core/_internal.dart';
import 'package:drift/drift.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:grpc/src/server/call.dart';
import 'package:logging/logging.dart';
import 'package:protobuf/protobuf.dart' as pb;
import 'package:shelf/src/request.dart';

final class ProjectsService extends ProjectsServiceBase with ServiceMixin {
  ProjectsService(this._db, this.authorizer);

  final CloudHubDatabase _db;

  @override
  final Authorizer authorizer;

  @override
  final Logger logger = Logger(apiId);

  static const String apiId = 'celest.cloud.v1alpha1.Projects';
  static const EntityUid apiUid = EntityUid.of('Celest::Api', apiId);

  static final ResolvedApi api = ResolvedApi(
    apiId: apiId,
    functions: {
      'CreateProject': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'CreateProject',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.post,
            path: '/v1alpha1/{parent=organizations/*}/projects',
          ),
        ),
      ),
      'GetProject': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'GetProject',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.get,
            path: '/v1alpha1/{name=organizations/*/projects/*}',
          ),
        ),
      ),
      'ListProjects': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'ListProjects',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.get,
            path: '/v1alpha1/{parent=organizations/*}/projects',
          ),
        ),
      ),
      'UpdateProject': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'UpdateProject',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.patch,
            path: '/v1alpha1/{project.name=organizations/*/projects/*}',
          ),
        ),
      ),
      'DeleteProject': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'DeleteProject',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.delete,
            path: '/v1alpha1/{name=organizations/*/projects/*}',
          ),
        ),
      ),
      'UndeleteProject': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'UndeleteProject',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.post,
            path: '/v1alpha1/{name=organizations/*/projects/*}:undelete',
          ),
        ),
      ),
      'RenameProject': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'RenameProject',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.post,
            path: '/v1alpha1/{name=organizations/*/projects/*}:rename',
          ),
        ),
      ),
    },
    policySet: PolicySet(
      templateLinks: [
        TemplateLink(
          templateId: 'cloud.functions.authenticated',
          newId: apiId,
          values: {SlotId.resource: apiUid},
        ),
      ],
    ),
  );

  static final Map<String, GatewayHandler> $handlers = {
    'CreateProject': _CreateProjectGatewayHandler(),
    'GetProject': _GetProjectGatewayHandler(),
    'ListProjects': _ListProjectsGatewayHandler(),
    'UpdateProject': _UpdateProjectGatewayHandler(),
    'DeleteProject': _DeleteProjectGatewayHandler(),
    'UndeleteProject': _UndeleteProjectGatewayHandler(),
    'RenameProject': _RenameProjectGatewayHandler(),
  };

  @override
  Future<Operation> createProject(
    ServiceCall call,
    CreateProjectRequest request,
  ) async {
    final principal = call.expectPrincipal();
    final organizationId = switch (request.parent.split('/')) {
      ['organizations', final organizationId] => organizationId,
      _ => throw GrpcError.invalidArgument('Invalid parent'),
    };

    final organization =
        await _db.organizationsDrift
            .getOrganization(id: organizationId)
            .getSingleOrNull();
    if (organization == null) {
      throw GrpcError.notFound('No organization found with ID $organizationId');
    }

    final project =
        await _db.projectsDrift
            .getProject(id: request.projectId)
            .getSingleOrNull();
    if (project != null) {
      throw GrpcError.alreadyExists(
        'Project with ID ${request.projectId} already exists',
      );
    }

    final membership =
        await _db.userMembershipsDrift
            .findUserMembership(
              userId: principal.uid.id,
              parentType: 'Celest::Organization',
              parentId: organization.id,
            )
            .getSingleOrNull();

    final resource = Entity(
      uid: EntityUid.of('Celest::Project', request.projectId),
      parents: [EntityUid.of('Celest::Organization', organization.id)],
    );
    await authorize(
      principal: switch (membership?.membershipId) {
        final membershipId? => EntityUid.of(
          'Celest::Organization::Member',
          membershipId,
        ),
        _ => principal,
      },
      action: CelestAction.create,
      resource: resource,
    );

    return _db.withoutForeignKeys(() async {
      final projectId = TypeId('prj');
      final project =
          (await _db.projectsDrift.createProject(
            id: projectId.encoded,
            parentType: 'Celest::Organization',
            parentId: organization.id,
            projectId: request.projectId,
            state: LifecycleState.ACTIVE.name,
            displayName: request.project.displayName,
            annotations:
                request.project.annotations.isEmpty
                    ? null
                    : jsonEncode(request.project.annotations),
            regions: jsonEncode(
              request.project.regions.map((r) => r.name).toList(),
            ),
          )).first;

      // Add the user as the owner of the project
      await _db.userMembershipsDrift.createUserMembership(
        membershipId: typeId('mbr'),
        userId: principal.uid.id,
        parentType: 'Celest::Project',
        parentId: project.id,
        role: 'owner',
      );

      final operationId = TypeId('op');
      final operationResponse = project.toProto().packIntoAny();
      final operation =
          (await _db.operationsDrift.createOperation(
            id: operationId.encoded,
            ownerType: principal.uid.type,
            ownerId: principal.uid.id,
            resourceType: 'Celest::Project',
            resourceId: project.id,
            response: jsonEncode(
              operationResponse.toProto3Json(typeRegistry: typeRegistry),
            ),
          )).first;

      return operation.toProto();
    });
  }

  @override
  Future<Project> getProject(
    ServiceCall call,
    GetProjectRequest request,
  ) async {
    final projectId = switch (request.name.split('/')) {
      ['organizations', _, 'projects', final projectId] => projectId,
      _ => throw GrpcError.invalidArgument('Invalid name'),
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
      action: CelestAction.get,
      resource: EntityUid.of('Celest::Project', project.id),
    );

    return project.toProto();
  }

  @override
  Future<ListProjectsResponse> listProjects(
    ServiceCall call,
    ListProjectsRequest request,
  ) async {
    final principal = call.expectPrincipal();
    var ListProjectsRequest(
      :parent,
      :pageSize,
      :pageToken,
      :orderBy,
      :filter,
      :showDeleted,
    ) = request;

    final organizationId = switch (parent.split('/')) {
      ['organizations', final organizationId] => organizationId,
      _ => throw GrpcError.invalidArgument('Invalid parent'),
    };

    final organization =
        await _db.organizationsDrift
            .getOrganization(id: organizationId)
            .getSingleOrNull();
    if (organization == null) {
      throw GrpcError.notFound('No organization found with ID $organizationId');
    }

    final membership =
        await _db.userMembershipsDrift
            .findUserMembership(
              userId: principal.uid.id,
              parentType: 'Celest::Organization',
              parentId: organization.id,
            )
            .getSingleOrNull();

    await authorize(
      principal: switch (membership?.membershipId) {
        final membershipId? => EntityUid.of(
          'Celest::Organization::Member',
          membershipId,
        ),
        _ => principal,
      },
      action: CelestAction.list,
      resource: EntityUid.of('Celest::Organization', organization.id),
    );

    if (filter.isNotEmpty) {
      throw GrpcError.invalidArgument('Filter is not supported');
    }

    PageToken? pageData;
    try {
      pageData = pageToken.isNotEmpty ? PageToken.parse(pageToken) : null;
    } on FormatException {
      throw GrpcError.invalidArgument('Invalid page token');
    }

    final pageOffset = pageData?.offset ?? 0;
    const defaultPageSize = 10;
    if (pageSize == 0) {
      pageSize = defaultPageSize;
    }

    final startTime =
        pageData?.startTime ??
        DateTime.timestamp().add(const Duration(seconds: 1));

    OrderByClause? orderByClause;
    if (orderBy.isNotEmpty) {
      orderByClause = OrderByClause.parse(orderBy);
    }

    final rows =
        await _db.projectsDrift
            .listProjects(
              userId: principal.uid.id,
              parentId: organization.id,
              showDeleted: showDeleted,
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

    final projects = rows.map((it) => it.projects.toProto());
    final nextPageToken =
        rows.isEmpty || rows.length < pageSize
            ? null
            : PageToken(
              startTime: startTime,
              offset: rows.last.rowNum,
            ).encode();

    return ListProjectsResponse(
      nextPageToken: nextPageToken,
      projects: projects,
    );
  }

  @override
  Future<Operation> updateProject(
    ServiceCall call,
    UpdateProjectRequest request,
  ) async {
    final projectId = switch (request.project.name.split('/')) {
      ['organizations', _, 'projects', final projectId] => projectId,
      _ => throw GrpcError.invalidArgument('Invalid name'),
    };

    var project =
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
      action: CelestAction.update,
      resource: EntityUid.of('Celest::Project', project.id),
    );

    final updateMask = request.updateMask.paths;
    T? mask<T extends Object?>(String field, T value) {
      final include = updateMask.isEmpty || updateMask.contains(field);
      if (!include) {
        return null;
      }
      return value;
    }

    project =
        (await _db.projectsDrift.updateProject(
          id: project.id,
          displayName: mask<String?>(
            'display_name',
            request.project.hasDisplayName()
                ? request.project.displayName
                : null,
          ),
          annotations: mask<String?>(
            'annotations',
            request.project.annotations.isEmpty
                ? null
                : jsonEncode(request.project.annotations),
          ),
        )).first;

    final operationId = TypeId('op');
    final operationResponse = project.toProto().packIntoAny();
    final operation =
        (await _db.operationsDrift.createOperation(
          id: operationId.encoded,
          ownerType: principal.uid.type,
          ownerId: principal.uid.id,
          resourceType: 'Celest::Project',
          resourceId: project.id,
          response: jsonEncode(
            operationResponse.toProto3Json(typeRegistry: typeRegistry),
          ),
        )).first;

    return operation.toProto();
  }

  @override
  Future<Operation> deleteProject(
    ServiceCall call,
    DeleteProjectRequest request,
  ) async {
    final projectId = switch (request.name.split('/')) {
      ['organizations', _, 'projects', final projectId] => projectId,
      _ => throw GrpcError.invalidArgument('Invalid name'),
    };

    final project =
        await _db.projectsDrift.getProject(id: projectId).getSingleOrNull();
    if (project == null) {
      if (request.allowMissing) {
        return Operation();
      }
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
      action: CelestAction.delete,
      resource: EntityUid.of('Celest::Project', project.id),
    );

    if (request.etag.isNotEmpty && request.etag != project.etag) {
      throw GrpcError.failedPrecondition('Etag mismatch');
    }

    final deletedProject =
        (await _db.projectsDrift.deleteProject(
          id: project.id,
          state: 'DELETED',
          deleteTime: DateTime.timestamp(),
          purgeTime: DateTime.timestamp().add(const Duration(days: 30)),
        )).first;

    final operationId = TypeId('op');
    final operationResponse = deletedProject.toProto().packIntoAny();
    final operation =
        (await _db.operationsDrift.createOperation(
          id: operationId.encoded,
          ownerType: principal.uid.type,
          ownerId: principal.uid.id,
          resourceType: 'Celest::Project',
          resourceId: project.id,
          response: jsonEncode(
            operationResponse.toProto3Json(typeRegistry: typeRegistry),
          ),
        )).first;

    return operation.toProto();
  }

  @override
  Future<Operation> undeleteProject(
    ServiceCall call,
    UndeleteProjectRequest request,
  ) async {
    final projectId = switch (request.name.split('/')) {
      ['organizations', _, 'projects', final projectId] => projectId,
      _ => throw GrpcError.invalidArgument('Invalid name'),
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
      action: CelestAction.undelete,
      resource: EntityUid.of('Celest::Project', project.id),
    );

    if (request.etag.isNotEmpty && request.etag != project.etag) {
      throw GrpcError.failedPrecondition('Etag mismatch');
    }

    final undeletedProject =
        (await _db.projectsDrift.undeleteProject(
          id: project.id,
          state: 'ACTIVE',
        )).first;

    final operationId = TypeId('op');
    final operationResponse = undeletedProject.toProto().packIntoAny();
    final operation =
        (await _db.operationsDrift.createOperation(
          id: operationId.encoded,
          ownerType: principal.uid.type,
          ownerId: principal.uid.id,
          resourceType: 'Celest::Project',
          resourceId: project.id,
          response: jsonEncode(
            operationResponse.toProto3Json(typeRegistry: typeRegistry),
          ),
        )).first;

    return operation.toProto();
  }

  @override
  Future<Operation> renameProject(
    ServiceCall call,
    RenameProjectRequest request,
  ) async {
    throw GrpcError.unimplemented('RenameProject is not implemented');
  }
}

final class _GetProjectGatewayHandler extends GatewayHandler {
  _GetProjectGatewayHandler()
    : super(requestType: GetProjectRequest(), responseType: Project());

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = GetProjectRequest();
    if (routeParameters['name'] case final name?) {
      req.name = name;
    }
    return req;
  }
}

final class _ListProjectsGatewayHandler extends GatewayHandler {
  _ListProjectsGatewayHandler()
    : super(
        requestType: ListProjectsRequest(),
        responseType: ListProjectsResponse(),
      );

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = ListProjectsRequest();
    if (request.url.queryParameters['parent'] case final parent?) {
      req.parent = parent;
    }
    if (request.url.queryParameters['pageSize'] case final pageSize?) {
      req.pageSize = int.parse(pageSize);
    }
    if (request.url.queryParameters['pageToken'] case final pageToken?) {
      req.pageToken = pageToken;
    }
    if (request.url.queryParameters['filter'] case final filter?) {
      req.filter = filter;
    }
    if (request.url.queryParameters['orderBy'] case final orderBy?) {
      req.orderBy = orderBy;
    }
    if (request.url.queryParameters['showDeleted'] case final showDeleted?) {
      req.showDeleted = showDeleted.toLowerCase() == 'true';
    }
    return req;
  }
}

final class _UpdateProjectGatewayHandler extends GatewayHandler {
  _UpdateProjectGatewayHandler()
    : super(requestType: UpdateProjectRequest(), responseType: Operation());

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = UpdateProjectRequest();
    if (request.url.queryParameters['allowMissing'] case final allowMissing?) {
      req.allowMissing = allowMissing.toLowerCase() == 'true';
    }
    if (request.url.queryParameters['updateMask'] case final updateMask?) {
      req.updateMask = pb.FieldMask(paths: updateMask.split(','));
    }
    if (request.url.queryParameters['validateOnly'] case final validateOnly?) {
      req.validateOnly = validateOnly.toLowerCase() == 'true';
    }
    final body = await JsonUtf8.decodeStream(request.read());
    req.project.mergeFromProto3Json(body, typeRegistry: typeRegistry);
    if (routeParameters['name'] case final name?) {
      req.project.name = name;
    }
    return req;
  }
}

final class _DeleteProjectGatewayHandler extends GatewayHandler {
  _DeleteProjectGatewayHandler()
    : super(requestType: DeleteProjectRequest(), responseType: Operation());

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = DeleteProjectRequest();
    if (routeParameters['name'] case final name?) {
      req.name = name;
    }
    if (request.url.queryParameters['force'] case final force?) {
      req.force = force.toLowerCase() == 'true';
    }
    if (request.url.queryParameters['etag'] case final etag?) {
      req.etag = etag;
    }
    if (request.url.queryParameters['allowMissing'] case final allowMissing?) {
      req.allowMissing = allowMissing.toLowerCase() == 'true';
    }
    if (request.url.queryParameters['validateOnly'] case final validateOnly?) {
      req.validateOnly = validateOnly.toLowerCase() == 'true';
    }
    return req;
  }
}

final class _UndeleteProjectGatewayHandler extends GatewayHandler {
  _UndeleteProjectGatewayHandler()
    : super(requestType: UndeleteProjectRequest(), responseType: Operation());

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = UndeleteProjectRequest();
    if (routeParameters['name'] case final name?) {
      req.name = name;
    }
    if (request.url.queryParameters['validateOnly'] case final validateOnly?) {
      req.validateOnly = validateOnly.toLowerCase() == 'true';
    }
    if (request.url.queryParameters['etag'] case final etag?) {
      req.etag = etag;
    }
    return req;
  }
}

final class _RenameProjectGatewayHandler extends GatewayHandler {
  _RenameProjectGatewayHandler()
    : super(requestType: RenameProjectRequest(), responseType: Operation());

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = RenameProjectRequest();
    if (routeParameters['name'] case final name?) {
      req.name = name;
    }
    if (request.url.queryParameters['projectId'] case final projectId?) {
      req.projectId = projectId;
    }
    if (request.url.queryParameters['etag'] case final etag?) {
      req.etag = etag;
    }
    if (request.url.queryParameters['validateOnly'] case final validateOnly?) {
      req.validateOnly = validateOnly.toLowerCase() == 'true';
    }
    return req;
  }
}

final class _CreateProjectGatewayHandler extends GatewayHandler {
  _CreateProjectGatewayHandler()
    : super(requestType: CreateProjectRequest(), responseType: Operation());

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = CreateProjectRequest();
    if (request.url.queryParameters['parent'] case final parent?) {
      req.parent = parent;
    }
    if (request.url.queryParameters['projectId'] case final projectId?) {
      req.projectId = projectId;
    }
    if (request.url.queryParameters['validateOnly'] case final validateOnly?) {
      req.validateOnly = validateOnly.toLowerCase() == 'true';
    }
    final body = await JsonUtf8.decodeStream(request.read());
    req.project =
        Project()..mergeFromProto3Json(body, typeRegistry: typeRegistry);
    return req;
  }
}
