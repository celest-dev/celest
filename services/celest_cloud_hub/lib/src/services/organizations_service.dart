import 'dart:convert';

import 'package:cedar/cedar.dart' hide Value;
import 'package:celest/http.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud/celest_cloud.dart' show LifecycleState, Operation;
import 'package:celest_cloud/src/proto.dart' as pb;
import 'package:celest_cloud/src/proto/celest/cloud/v1alpha1/organizations.pbgrpc.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_core/celest_cloud_core.dart';
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

final class OrganizationsService extends OrganizationsServiceBase
    with ServiceMixin {
  OrganizationsService(this.db, this.authorizer);

  @override
  final CloudHubDatabase db;

  @override
  final Authorizer authorizer;

  @override
  final Logger logger = Logger(apiId);

  static const String apiId = 'celest.cloud.v1alpha1.Organizations';
  static const EntityUid apiUid = EntityUid.of('Celest::Api', apiId);

  static final ResolvedApi api = ResolvedApi(
    apiId: apiId,
    functions: {
      'CreateOrganization': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'CreateOrganization',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.post,
            path: '/v1alpha1/organizations',
          ),
        ),
      ),
      'GetOrganization': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'GetOrganization',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.get,
            path: '/v1alpha1/{name=organizations/*}',
          ),
        ),
      ),
      'ListOrganizations': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'ListOrganizations',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.get,
            path: '/v1alpha1/organizations',
          ),
        ),
      ),
      'UpdateOrganization': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'UpdateOrganization',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.patch,
            path: '/v1alpha1/{organization.name=organizations/*}',
          ),
        ),
      ),
      'DeleteOrganization': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'DeleteOrganization',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.delete,
            path: '/v1alpha1/{name=organizations/*}',
          ),
        ),
      ),
      'UndeleteOrganization': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'UndeleteOrganization',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.post,
            path: '/v1alpha1/{name=organizations/*}:undelete',
          ),
        ),
      ),
      'RenameOrganization': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'RenameOrganization',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.post,
            path: '/v1alpha1/{name=organizations/*}:rename',
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
    'CreateOrganization': _CreateOrganizationGatewayHandler(),
    'GetOrganization': _GetOrganizationGatewayHandler(),
    'ListOrganizations': _ListOrganizationsGatewayHandler(),
    'UpdateOrganization': _UpdateOrganizationGatewayHandler(),
    'DeleteOrganization': _DeleteOrganizationGatewayHandler(),
    'UndeleteOrganization': _UndeleteOrganizationGatewayHandler(),
    'RenameOrganization': _RenameOrganizationGatewayHandler(),
  };

  @override
  Future<Operation> createOrganization(
    ServiceCall call,
    CreateOrganizationRequest request,
  ) async {
    final principal = call.expectPrincipal();
    final organization =
        await db.organizationsDrift
            .getOrganization(id: request.organizationId)
            .getSingleOrNull();
    if (organization != null) {
      throw GrpcError.alreadyExists(
        'Organization with ID ${request.organizationId} already exists',
      );
    }

    final parent = CloudHubDatabase.rootOrg;
    final resource = Entity(
      uid: EntityUid.of('Celest::Organization', request.organizationId),
      parents: [parent.uid],
    );
    await authorize(
      principal: principal,
      action: CelestAction.create,
      resource: resource,
    );

    return db.withoutForeignKeys(() async {
      final organizationId = TypeId('org');
      final organization =
          (await db.organizationsDrift.createOrganization(
            id: organizationId.encoded,
            organizationId: request.organizationId,
            parentType: parent.uid.type,
            parentId: parent.uid.id,
            state: LifecycleState.ACTIVE.name,
            displayName: request.organization.displayName,
            annotations:
                request.organization.annotations.isEmpty
                    ? null
                    : jsonEncode(request.organization.annotations),
            primaryRegion: request.organization.primaryRegion.name,
          )).first;

      // Add the user as the owner of the organization
      await db.userMembershipsDrift.createUserMembership(
        membershipId: typeId('mbr'),
        userId: principal.uid.id,
        parentType: 'Celest::Organization',
        parentId: organization.id,
        role: 'owner',
      );

      final operationId = TypeId('op');
      final operationResponse = organization.toProto().packIntoAny();
      final operation =
          (await db.operationsDrift.createOperation(
            id: operationId.encoded,
            ownerType: principal.uid.type,
            ownerId: principal.uid.id,
            resourceType: 'Celest::Organization',
            resourceId: organizationId.encoded,
            response: jsonEncode(
              operationResponse.toProto3Json(typeRegistry: typeRegistry),
            ),
          )).first;

      return operation.toProto();
    });
  }

  @override
  Future<Organization> getOrganization(
    ServiceCall call,
    GetOrganizationRequest request,
  ) async {
    final organizationId = switch (request.name.split('/')) {
      ['organizations', final organizationId] => organizationId,
      _ => throw GrpcError.invalidArgument('Invalid name: "${request.name}"'),
    };
    final organization =
        await db.organizationsDrift
            .getOrganization(id: organizationId)
            .getSingleOrNull();
    if (organization == null) {
      throw GrpcError.notFound('No organization found with ID $organizationId');
    }

    // Get membership of user in org
    final principal = call.expectPrincipal();
    final membership =
        await db.userMembershipsDrift
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
      action: CelestAction.get,
      resource: EntityUid.of('Celest::Organization', organization.id),
    );

    return organization.toProto();
  }

  @override
  Future<ListOrganizationsResponse> listOrganizations(
    ServiceCall call,
    ListOrganizationsRequest request,
  ) async {
    final principal = call.expectPrincipal();
    var ListOrganizationsRequest(
      :parent,
      :pageSize,
      :pageToken,
      :orderBy,
      :filter,
      :showDeleted,
    ) = request;

    if (parent.isNotEmpty) {
      throw GrpcError.invalidArgument('Parent is not supported');
    }
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
        await db.organizationsDrift
            .listOrganizations(
              userId: principal.uid.id,
              showDeleted: showDeleted,
              offset: pageOffset,
              limit: pageSize,
              parentId: CloudHubDatabase.rootOrg.uid.id,
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

    final organizations = rows.map((it) => it.organizations.toProto());
    final nextPageToken =
        rows.isEmpty || rows.length < pageSize
            ? null
            : PageToken(
              startTime: startTime,
              offset: rows.last.rowNum,
            ).encode();

    return ListOrganizationsResponse(
      nextPageToken: nextPageToken,
      organizations: organizations,
    );
  }

  @override
  Future<Operation> updateOrganization(
    ServiceCall call,
    UpdateOrganizationRequest request,
  ) async {
    final organizationId = switch (request.organization.name.split('/')) {
      ['organizations', final organizationId] => organizationId,
      _ => throw GrpcError.invalidArgument('Invalid name'),
    };
    var organization =
        await db.organizationsDrift
            .getOrganization(id: organizationId)
            .getSingleOrNull();
    if (organization == null) {
      throw GrpcError.notFound('No organization found with ID $organizationId');
    }

    // Get membership of user in org
    final principal = call.expectPrincipal();
    final membership =
        await db.userMembershipsDrift
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
      action: CelestAction.update,
      resource: EntityUid.of('Celest::Organization', organization.id),
    );

    final updateMask = request.updateMask.paths;
    T? mask<T extends Object?>(String field, T value) {
      final include = updateMask.isEmpty || updateMask.contains(field);
      if (!include) {
        return null;
      }
      return value;
    }

    organization =
        (await db.organizationsDrift.updateOrganization(
          id: organization.id,
          primaryRegion: mask<String?>(
            'primary_region',
            request.organization.hasPrimaryRegion()
                ? request.organization.primaryRegion.name
                : null,
          ),
          displayName: mask<String?>(
            'display_name',
            request.organization.hasDisplayName()
                ? request.organization.displayName
                : null,
          ),
        )).first;

    final operationId = TypeId('op');
    final operationResponse = organization.toProto().packIntoAny();
    final operation =
        (await db.operationsDrift.createOperation(
          id: operationId.encoded,
          ownerType: principal.uid.type,
          ownerId: principal.uid.id,
          resourceType: 'Celest::Organization',
          resourceId: organization.id,
          response: jsonEncode(
            operationResponse.toProto3Json(typeRegistry: typeRegistry),
          ),
        )).first;

    return operation.toProto();
  }

  @override
  Future<Operation> renameOrganization(
    ServiceCall call,
    RenameOrganizationRequest request,
  ) async {
    throw GrpcError.unimplemented('RenameOrganization is not implemented');
  }

  @override
  Future<Operation> deleteOrganization(
    ServiceCall call,
    DeleteOrganizationRequest request,
  ) async {
    throw GrpcError.unimplemented('UndeleteOrganization is not implemented');
  }

  @override
  Future<Operation> undeleteOrganization(
    ServiceCall call,
    UndeleteOrganizationRequest request,
  ) async {
    throw GrpcError.unimplemented('UndeleteOrganization is not implemented');
  }
}

final class _GetOrganizationGatewayHandler extends GatewayHandler {
  _GetOrganizationGatewayHandler()
    : super(
        requestType: GetOrganizationRequest(),
        responseType: Organization(),
      );

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = GetOrganizationRequest();
    if (routeParameters['name'] case final name?) {
      req.name = name;
    }
    return req;
  }
}

final class _ListOrganizationsGatewayHandler extends GatewayHandler {
  _ListOrganizationsGatewayHandler()
    : super(
        requestType: ListOrganizationsRequest(),
        responseType: ListOrganizationsResponse(),
      );

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = ListOrganizationsRequest();
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

final class _UpdateOrganizationGatewayHandler extends GatewayHandler {
  _UpdateOrganizationGatewayHandler()
    : super(
        requestType: UpdateOrganizationRequest(),
        responseType: Operation(),
      );

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = UpdateOrganizationRequest();
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
    req.organization =
        Organization()..mergeFromProto3Json(body, typeRegistry: typeRegistry);
    if (routeParameters['name'] case final name?) {
      req.organization.name = name;
    }
    return req;
  }
}

final class _DeleteOrganizationGatewayHandler extends GatewayHandler {
  _DeleteOrganizationGatewayHandler()
    : super(
        requestType: DeleteOrganizationRequest(),
        responseType: pb.Operation(),
      );

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = DeleteOrganizationRequest();
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

final class _UndeleteOrganizationGatewayHandler extends GatewayHandler {
  _UndeleteOrganizationGatewayHandler()
    : super(
        requestType: UndeleteOrganizationRequest(),
        responseType: pb.Operation(),
      );

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = UndeleteOrganizationRequest();
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

final class _RenameOrganizationGatewayHandler extends GatewayHandler {
  _RenameOrganizationGatewayHandler()
    : super(
        requestType: RenameOrganizationRequest(),
        responseType: pb.Operation(),
      );

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = RenameOrganizationRequest();
    if (routeParameters['name'] case final name?) {
      req.name = name;
    }
    if (request.url.queryParameters['organizationId']
        case final organizationId?) {
      req.organizationId = organizationId;
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

final class _CreateOrganizationGatewayHandler extends GatewayHandler {
  _CreateOrganizationGatewayHandler()
    : super(
        requestType: CreateOrganizationRequest(),
        responseType: Operation(),
      );

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = CreateOrganizationRequest();
    if (request.url.queryParameters['parent'] case final parent?) {
      req.parent = parent;
    }
    if (request.url.queryParameters['organizationId']
        case final organizationId?) {
      req.organizationId = organizationId;
    }
    if (request.url.queryParameters['validateOnly'] case final validateOnly?) {
      req.validateOnly = validateOnly.toLowerCase() == 'true';
    }
    final body = await JsonUtf8.decodeStream(request.read());
    req.organization =
        Organization()..mergeFromProto3Json(body, typeRegistry: typeRegistry);
    return req;
  }
}
