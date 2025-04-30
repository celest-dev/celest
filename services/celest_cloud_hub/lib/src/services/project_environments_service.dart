import 'dart:async';
import 'dart:convert';

import 'package:cedar/cedar.dart';
import 'package:celest/http.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud/celest_cloud.dart' as pb;
import 'package:celest_cloud/src/grpc.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_core/celest_cloud_core.dart';
import 'package:celest_cloud_hub/src/auth/auth_interceptor.dart';
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/database/schema/project_environments.drift.dart'
    as dto;
import 'package:celest_cloud_hub/src/deploy/fly/fly_api.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_deployment_engine.dart';
import 'package:celest_cloud_hub/src/gateway/gateway_handler.dart';
import 'package:celest_cloud_hub/src/model/interop.dart';
import 'package:celest_cloud_hub/src/model/protobuf.dart';
import 'package:celest_cloud_hub/src/model/type_registry.dart';
import 'package:celest_cloud_hub/src/services/service_mixin.dart';
import 'package:celest_core/celest_core.dart';
import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';
import 'package:shelf/src/request.dart';

final class ProjectEnvironmentsService extends ProjectEnvironmentsServiceBase
    with ServiceMixin {
  ProjectEnvironmentsService(this.db, this.authorizer);

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
      'GetProjectEnvironment': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'GetProjectEnvironment',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.get,
            path: '/v1alpha1/{name=projects/*/environments/*}',
          ),
        ),
      ),
      'ListProjectEnvironments': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'ListProjectEnvironments',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.get,
            path: '/v1alpha1/{parent=projects/*}/environments',
          ),
        ),
      ),
      'UpdateProjectEnvironment': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'UpdateProjectEnvironment',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.patch,
            path:
                '/v1alpha1/{project_environment.name=projects/*/environments/*}',
          ),
        ),
      ),
      'DeleteProjectEnvironment': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'DeleteProjectEnvironment',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.delete,
            path: '/v1alpha1/{name=projects/*/environments/*}',
          ),
        ),
      ),
      'DeployProjectEnvironment': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'DeployProjectEnvironment',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: HttpMethod.post,
            path: '/v1alpha1/{name=projects/*/environments/*}:deploy',
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

  static final Map<String, GatewayHandler> $handlers = {
    'CreateProjectEnvironment': _CreateProjectEnvironmentGatewayHandler(),
    'GetProjectEnvironment': _GetProjectEnvironmentGatewayHandler(),
    'ListProjectEnvironments': _ListProjectEnvironmentsGatewayHandler(),
    'UpdateProjectEnvironment': _UpdateProjectEnvironmentGatewayHandler(),
    'DeleteProjectEnvironment': _DeleteProjectEnvironmentGatewayHandler(),
    'DeployProjectEnvironment': _DeployProjectEnvironmentGatewayHandler(),
  };

  @override
  final Logger logger = Logger(apiId);

  @override
  final CloudHubDatabase db;
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
        await db.projectsDrift.getProject(id: projectId).getSingleOrNull();
    if (project == null) {
      throw GrpcError.notFound('Project with ID $projectId not found.');
    }

    logger.info('Checking for existing environment');
    final existingEnvironment =
        await db.projectEnvironmentsDrift
            .lookupProjectEnvironment(
              projectId: project.id,
              projectEnvironmentId: request.projectEnvironmentId,
            )
            .getSingleOrNull();
    if (existingEnvironment != null) {
      throw GrpcError.alreadyExists(
        'Project environment with ID ${request.projectEnvironmentId} already exists.',
      );
    }

    final principal = call.expectPrincipal();

    final membership =
        await db.userMembershipsDrift
            .findUserMembership(
              userId: principal.uid.id,
              parentType: 'Celest::Project',
              parentId: project.id,
            )
            .getSingleOrNull();

    final resource = Entity(
      uid: EntityUid.of('Celest::Project::Environment', 'new'),
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
    return db.withoutForeignKeys(() async {
      final environmentId = TypeId('env');
      final environment =
          (await db.projectEnvironmentsDrift.createProjectEnvironment(
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
      await db.userMembershipsDrift.createUserMembership(
        membershipId: typeId('mbr'),
        userId: principal.uid.id,
        parentType: 'Celest::Project::Environment',
        parentId: environment.id,
        role: 'owner',
      );

      // Reserve the project name in Fly.
      //
      // This allows us to know the URL of the deployed app ahead of time so
      // that apps can be concurrently built and deployed to Celest by the end
      // user.
      final flyAppName = FlyDeploymentEngine.generateFlyAppName(
        project.projectId,
      );
      try {
        await context.fly.apps.create(
          request: CreateAppRequest(
            appName: flyAppName,
            orgSlug: context.flyOrgSlug,
          ),
        );
      } on Object catch (e, st) {
        logger.severe('Failed to create Fly app', e, st);
        throw GrpcError.internal('Failed to create project');
      }

      final state =
          (await db.projectEnvironmentsDrift.upsertProjectEnvironmentState(
            projectEnvironmentId: environment.id,
            flyAppName: flyAppName,
            domainName: '$flyAppName.fly.dev',
          )).first;

      final operationResponse = environment.toProto(state: state).packIntoAny();
      final createOperation =
          (await db.operationsDrift.createOperation(
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

    final project =
        await db.projectsDrift.getProject(id: projectId).getSingleOrNull();
    if (project == null) {
      throw GrpcError.notFound('Project with ID $projectId not found.');
    }

    final environment =
        await db.projectEnvironmentsDrift
            .lookupProjectEnvironment(
              projectId: project.id,
              projectEnvironmentId: environmentId,
            )
            .getSingleOrNull();
    if (environment == null) {
      if (request.allowMissing) {
        return Operation(
          done: true,
          response: pb.ProjectEnvironment().packIntoAny(),
        );
      }
      throw GrpcError.notFound('No environment found with ID $environmentId');
    }

    final principal = call.expectPrincipal();
    final membership =
        await db.userMembershipsDrift
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

    final projectEnvironmentState =
        await db.projectEnvironmentsDrift
            .getProjectEnvironmentState(projectEnvironmentId: environment.id)
            .getSingleOrNull();

    final state = pb.LifecycleState.values.firstWhere(
      (state) => state.name == environment.state,
    );
    switch (state) {
      case pb.LifecycleState.LIFECYCLE_STATE_UNSPECIFIED:
        logger.shout('Invalid lifecycle state: $environment');
      case pb.LifecycleState.ACTIVE:
      case pb.LifecycleState.CREATION_FAILED:
      case pb.LifecycleState.DELETION_FAILED:
      case pb.LifecycleState.UPDATE_FAILED:
        break;
      case pb.LifecycleState.CREATING:
      case pb.LifecycleState.UPDATING:
        // TODO(dnys1): Cancel ongoing operation and allow.
        throw GrpcError.failedPrecondition(
          'Environment is still being created or updated',
        );
      case pb.LifecycleState.DELETING:
      case pb.LifecycleState.DELETED:
        // Find the operation that is deleting or did delete the environment.
        //
        // Should be the last operation for this environment since no operations
        // are performed on deleted resources.
        final query = db.operationsDrift.findOperationsByResource(
          resourceType: 'Celest::Project::Environment',
          resourceId: environment.id,
          orderBy: (op) => OrderBy([OrderingTerm.desc(op.createTime)]),
          limit: 1,
        );
        final operation = await query.getSingleOrNull();
        return operation?.toProto() ??
            pb.Operation(
              done: true,
              response:
                  environment
                      .toProto(state: projectEnvironmentState)
                      .packIntoAny(),
            );
    }

    if (request.etag.isNotEmpty && request.etag != environment.etag) {
      throw GrpcError.failedPrecondition('Etag mismatch');
    }

    if (projectEnvironmentState != null) {
      await _tearDownEnvironment(projectEnvironmentState);
    } else {
      logger.warning(
        'No environment state found for environment: ${environment.toJson()}',
      );
    }

    final deletedEnvironment =
        (await db.projectEnvironmentsDrift.deleteProjectEnvironment(
          id: environment.id,
        )).first;

    final operationResponse =
        deletedEnvironment
            .toProto(state: projectEnvironmentState)
            .packIntoAny();
    final operation =
        (await db.operationsDrift.createOperation(
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

  Future<void> _tearDownEnvironment(dto.ProjectEnvironmentState state) async {
    final appName = state.flyAppName;
    if (appName == null) {
      logger.finest(
        'No Fly deployment found for environment ${state.projectEnvironmentId}',
      );
      return;
    }
    try {
      await context.fly.apps.delete(appName: appName);
    } on Object catch (e, st) {
      logger.severe('Failed to delete Fly environment', e, st);
      throw GrpcError.internal('Failed to delete project environment');
    }
  }

  @override
  Future<Operation> deployProjectEnvironment(
    ServiceCall call,
    DeployProjectEnvironmentRequest request,
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

    final project =
        await db.projectsDrift.getProject(id: projectId).getSingleOrNull();
    if (project == null) {
      throw GrpcError.notFound('Project with ID $projectId not found.');
    }

    final environment =
        await db.projectEnvironmentsDrift
            .lookupProjectEnvironment(
              projectId: project.id,
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
        await db.userMembershipsDrift
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
      action: ProjectEnvironmentAction.deploy,
      resource: EntityUid.of('Celest::Project::Environment', environment.id),
    );

    final assets = {for (final asset in request.assets) asset.type: asset};
    final kernelAsset =
        assets[pb.ProjectAsset_Type.DART_KERNEL] ??
        assets[pb.ProjectAsset_Type.DART_EXECUTABLE];
    if (kernelAsset == null) {
      throw GrpcError.invalidArgument('Missing Dart kernel asset');
    }
    final flutterAssetsBundle = assets[pb.ProjectAsset_Type.FLUTTER_ASSETS];

    final operationId = typeId('op');
    final operation =
        (await db.operationsDrift.createOperation(
          id: operationId,
          ownerType: principal.uid.type,
          ownerId: principal.uid.id,
          resourceType: 'Celest::Project::Environment',
          resourceId: environment.id,
        )).first;
    final deployment = FlyDeploymentEngine.deployIsolated(
      operationId: operationId,
      dbConnection: await db.serializableConnection(),
      projectAst: ResolvedProject.fromProto(
        pb.ResolvedProject().unpackAny(request.resolvedProjectAst),
      ),
      kernelAsset: (
        filename: kernelAsset.filename,
        inline: Uint8List.fromList(kernelAsset.inline).asUnmodifiableView(),
        type: kernelAsset.type,
        etag: kernelAsset.hasEtag() ? kernelAsset.etag : null,
      ),
      flutterAssetsBundle: switch (flutterAssetsBundle) {
        final asset? => (
          filename: asset.filename,
          inline: Uint8List.fromList(asset.inline).asUnmodifiableView(),
          type: asset.type,
          etag: asset.hasEtag() ? asset.etag : null,
        ),
        _ => null,
      },
      environment: environment,
    );
    unawaited(
      deployment.onError((error, stackTrace) {
        logger.shout(
          'Unexpected error deploying environment ${environment.id}',
          error,
          stackTrace,
        );
      }),
    );

    return operation.toProto();
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

    final project =
        await db.projectsDrift.getProject(id: projectId).getSingleOrNull();
    if (project == null) {
      throw GrpcError.notFound('No project found with ID $projectId');
    }

    final environment =
        await db.projectEnvironmentsDrift
            .lookupProjectEnvironment(
              projectId: project.id,
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
        await db.userMembershipsDrift
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

    if (environment.state == pb.LifecycleState.DELETED.name) {
      throw GrpcError.notFound(
        'Environment with ID $environmentId has been deleted',
      );
    }

    final environmentState =
        await db.projectEnvironmentsDrift
            .getProjectEnvironmentState(projectEnvironmentId: environment.id)
            .getSingleOrNull();

    return environment.toProto(state: environmentState);
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
        await db.projectsDrift.getProject(id: projectId).getSingleOrNull();
    if (project == null) {
      throw GrpcError.notFound('No project found with ID $projectId');
    }

    final principal = call.expectPrincipal();
    final membership =
        await db.userMembershipsDrift
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
        await db.projectEnvironmentsDrift
            .listProjectEnvironments(
              userId: principal.uid.id,
              parentId: project.id,
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

    final project =
        await db.projectsDrift.getProject(id: projectId).getSingleOrNull();
    if (project == null) {
      throw GrpcError.notFound('Project with ID $projectId not found.');
    }

    var environment =
        await db.projectEnvironmentsDrift
            .lookupProjectEnvironment(
              projectId: project.id,
              projectEnvironmentId: environmentId,
            )
            .getSingleOrNull();
    if (environment == null) {
      throw GrpcError.notFound('No environment found with ID $environmentId');
    }

    final principal = call.expectPrincipal();
    final membership =
        await db.userMembershipsDrift
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
        (await db.projectEnvironmentsDrift.updateProjectEnvironment(
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
        (await db.operationsDrift.createOperation(
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

final class _GetProjectEnvironmentGatewayHandler extends GatewayHandler {
  _GetProjectEnvironmentGatewayHandler()
    : super(
        requestType: GetProjectEnvironmentRequest(),
        responseType: ProjectEnvironment(),
      );

  @override
  Future<GetProjectEnvironmentRequest> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = GetProjectEnvironmentRequest();
    if (routeParameters['name'] case final name?) {
      req.name = name;
    }
    return req;
  }
}

final class _ListProjectEnvironmentsGatewayHandler extends GatewayHandler {
  _ListProjectEnvironmentsGatewayHandler()
    : super(
        requestType: ListProjectEnvironmentsRequest(),
        responseType: ListProjectEnvironmentsResponse(),
      );

  @override
  Future<ListProjectEnvironmentsRequest> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = ListProjectEnvironmentsRequest();
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
    return req;
  }
}

final class _UpdateProjectEnvironmentGatewayHandler extends GatewayHandler {
  _UpdateProjectEnvironmentGatewayHandler()
    : super(
        requestType: UpdateProjectEnvironmentRequest(),
        responseType: Operation(),
      );

  @override
  Future<UpdateProjectEnvironmentRequest> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = UpdateProjectEnvironmentRequest();
    if (request.url.queryParameters['allowMissing'] case final allowMissing?) {
      req.allowMissing = allowMissing.toLowerCase() == 'true';
    }
    if (request.url.queryParameters['updateMask'] case final updateMask?) {
      req.updateMask = pb.FieldMask(paths: updateMask.split(','));
    }
    if (request.url.queryParameters['validateOnly'] case final validateOnly?) {
      req.validateOnly = validateOnly.toLowerCase() == 'true';
    }
    final json = await JsonUtf8.decodeStream(request.read());
    req.projectEnvironment =
        pb.ProjectEnvironment()
          ..mergeFromProto3Json(json, typeRegistry: typeRegistry);
    if (routeParameters['name'] case final name?) {
      req.projectEnvironment.name = name;
    }
    return req;
  }
}

final class _DeleteProjectEnvironmentGatewayHandler extends GatewayHandler {
  _DeleteProjectEnvironmentGatewayHandler()
    : super(
        requestType: DeleteProjectEnvironmentRequest(),
        responseType: Operation(),
      );

  @override
  Future<DeleteProjectEnvironmentRequest> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = DeleteProjectEnvironmentRequest();
    if (routeParameters['name'] case final name?) {
      req.name = name;
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

final class _DeployProjectEnvironmentGatewayHandler extends GatewayHandler {
  _DeployProjectEnvironmentGatewayHandler()
    : super(
        requestType: DeployProjectEnvironmentRequest(),
        responseType: Operation(),
      );

  @override
  Future<DeployProjectEnvironmentRequest> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = DeployProjectEnvironmentRequest();
    final json = await JsonUtf8.decodeStream(request.read());
    req.mergeFromProto3Json(json, typeRegistry: typeRegistry);
    if (routeParameters['name'] case final name?) {
      req.name = name;
    }
    return req;
  }
}

final class _CreateProjectEnvironmentGatewayHandler extends GatewayHandler {
  _CreateProjectEnvironmentGatewayHandler()
    : super(
        requestType: CreateProjectEnvironmentRequest(),
        responseType: Operation(),
      );

  @override
  Future<CreateProjectEnvironmentRequest> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = CreateProjectEnvironmentRequest();
    if (request.url.queryParameters['parent'] case final parent?) {
      req.parent = parent;
    }
    if (request.url.queryParameters['projectEnvironmentId']
        case final projectEnvironmentId?) {
      req.projectEnvironmentId = projectEnvironmentId;
    }
    if (request.url.queryParameters['validateOnly'] case final validateOnly?) {
      req.validateOnly = validateOnly.toLowerCase() == 'true';
    }
    final json = await JsonUtf8.decodeStream(request.read());
    req.projectEnvironment =
        pb.ProjectEnvironment()
          ..mergeFromProto3Json(json, typeRegistry: typeRegistry);
    return req;
  }
}
