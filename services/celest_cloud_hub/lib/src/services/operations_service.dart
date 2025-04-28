import 'dart:async';

import 'package:async/async.dart';
import 'package:cedar/cedar.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud/src/proto.dart' as pb;
import 'package:celest_cloud/src/proto/google/longrunning/operations.pbgrpc.dart';
import 'package:celest_cloud/src/proto/google/protobuf/empty.pb.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_core/celest_cloud_core.dart';
import 'package:celest_cloud_hub/src/auth/auth_interceptor.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/database/schema/operations.drift.dart'
    as dto;
import 'package:celest_cloud_hub/src/gateway/gateway_handler.dart';
import 'package:celest_cloud_hub/src/model/interop.dart';
import 'package:celest_core/celest_core.dart';
import 'package:drift/isolate.dart';
import 'package:grpc/grpc.dart';
import 'package:protobuf/protobuf.dart' as pb;
import 'package:shelf/src/request.dart';

final class OperationsService extends OperationsServiceBase {
  OperationsService(this._db, this._authorizer);

  final CloudHubDatabase _db;
  final Authorizer _authorizer;

  static const String apiId = 'google.longrunning.Operations';
  static const EntityUid apiUid = EntityUid.of('Celest::Api', apiId);

  static final ResolvedApi api = ResolvedApi(
    apiId: OperationsService.apiId,
    functions: {
      'GetOperation': ResolvedCloudFunction(
        apiId: OperationsService.apiId,
        functionId: 'GetOperation',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: 'GET',
            path: '/v1alpha1/{name=operations/**}',
          ),
        ),
      ),
      'ListOperations': ResolvedCloudFunction(
        apiId: OperationsService.apiId,
        functionId: 'ListOperations',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: 'GET',
            path: '/v1alpha1/{name=operations}',
          ),
        ),
      ),
      'WaitOperation': ResolvedCloudFunction(
        apiId: OperationsService.apiId,
        functionId: 'WaitOperation',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: 'POST',
            path: '/v1alpha1/{name=operations/**}:wait',
          ),
        ),
      ),
    },
    policySet: PolicySet(
      policies: {
        'google.longrunning.Operations/GetOperation': Policy.parse('''
permit (
  principal,
  action == Celest::Action::"get",
  resource is Celest::Operation
) when {
  resource in principal
};
'''),
      },
      templateLinks: [
        TemplateLink(
          templateId: 'cloud.functions.authenticated',
          newId: OperationsService.apiId,
          values: {SlotId.resource: OperationsService.apiUid},
        ),
      ],
    ),
  );

  static final Map<String, GatewayHandler> $handlers = {
    'GetOperation': _GetOperationGatewayHandler(),
    'ListOperations': _ListOperationsGatewayHandler(),
    'WaitOperation': JsonGatewayHandler(
      requestType: WaitOperationRequest(),
      responseType: pb.Operation(),
    ),
  };

  @override
  Future<Operation> getOperation(
    ServiceCall call,
    GetOperationRequest request,
  ) async {
    final id = switch (request.name.split('/')) {
      ['operations', final id] => id,
      _ => throw GrpcError.invalidArgument('Invalid operation name'),
    };
    final operation =
        await _db.operationsDrift.getOperation(id: id).getSingleOrNull();
    if (operation == null) {
      throw GrpcError.notFound();
    }
    final resource = Entity(
      uid: EntityUid.of('Celest::Operation', id),
      parents: [
        if ((operation.resourceType, operation.resourceId) case (
          final resourceType?,
          final resourceId?,
        ))
          EntityUid.of(resourceType, resourceId),
        if ((operation.ownerType, operation.ownerId) case (
          final ownerType?,
          final ownerId?,
        ))
          EntityUid.of(ownerType, ownerId),
      ],
    );
    try {
      await _authorizer.expectAuthorized(
        principal: call.principal,
        resource: resource,
        action: EntityUid.of('Celest::Action', 'get'),
      );
    } on CloudException catch (e, st) {
      Error.throwWithStackTrace(e.toGrpcError(), st);
    }
    return operation.toProto();
  }

  @override
  Future<ListOperationsResponse> listOperations(
    ServiceCall call,
    ListOperationsRequest request,
  ) async {
    final principal = call.expectPrincipal();

    var ListOperationsRequest(:name, :pageSize, :pageToken, :filter) = request;

    // TODO(dnys1): Support listing operations by resource.
    if (name.isNotEmpty && name != 'operations') {
      throw GrpcError.invalidArgument('Invalid name');
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

    final rows =
        await _db.operationsDrift
            .listOperations(
              ownerType: principal.uid.type,
              ownerId: principal.uid.id,
              startTime: startTime,
              offset: pageOffset,
              limit: pageSize,
            )
            .get();
    final operations = rows.map((op) => op.operations.toProto()).toList();
    final nextPageToken =
        rows.isEmpty || rows.length < pageSize
            ? null
            : PageToken(
              startTime: startTime,
              offset: rows.last.rowNum,
            ).encode();

    return ListOperationsResponse(
      operations: operations,
      nextPageToken: nextPageToken,
    );
  }

  @override
  Future<Operation> waitOperation(
    ServiceCall call,
    WaitOperationRequest request,
  ) async {
    final id = switch (request.name.split('/')) {
      ['operations', final id] => id,
      _ => throw GrpcError.invalidArgument('Invalid operation name'),
    };
    final timeout = Duration(
      seconds: request.timeout.seconds.toInt(),
      milliseconds: request.timeout.nanos ~/ 1_000_000,
    );
    final timer = Stopwatch()..start();

    while (timer.elapsed < timeout) {
      if (call.isCanceled) {
        throw GrpcError.cancelled('Operation cancelled');
      }
      final result = _db.computeWithDatabase<Result<dto.Operation>>(
        computation: (db) async {
          final operation =
              await db.operationsDrift.getOperation(id: id).getSingleOrNull();
          if (operation == null) {
            return Result.error(GrpcError.notFound('Operation not found'));
          }
          return Result.value(operation);
        },
        connect: CloudHubDatabase.new,
      );
      final operation = await Result.release(result);
      if (operation.done) {
        return operation.toProto();
      }
    }

    throw GrpcError.deadlineExceeded('Operation timed out after $timeout');
  }

  @override
  Future<Empty> cancelOperation(
    ServiceCall call,
    CancelOperationRequest request,
  ) async {
    throw GrpcError.unimplemented('Cancel operation is not supported');
  }

  @override
  Future<Empty> deleteOperation(
    ServiceCall call,
    DeleteOperationRequest request,
  ) async {
    throw GrpcError.unimplemented('Delete operation is not supported');
  }
}

final class _GetOperationGatewayHandler extends GatewayHandler {
  _GetOperationGatewayHandler()
    : super(requestType: GetOperationRequest(), responseType: pb.Operation());

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = GetOperationRequest();
    if (routeParameters['name'] case final name?) {
      req.name = name;
    }
    return req;
  }
}

final class _ListOperationsGatewayHandler extends GatewayHandler {
  _ListOperationsGatewayHandler()
    : super(
        requestType: ListOperationsRequest(),
        responseType: ListOperationsResponse(),
      );

  @override
  Future<pb.GeneratedMessage> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = ListOperationsRequest();
    if (routeParameters['name'] case final name?) {
      req.name = name;
    }
    if (request.url.queryParameters['filter'] case final filter?) {
      req.filter = filter;
    }
    if (request.url.queryParameters['pageSize'] case final pageSize?) {
      req.pageSize = int.parse(pageSize);
    }
    if (request.url.queryParameters['pageToken'] case final pageToken?) {
      req.pageToken = pageToken;
    }
    return req;
  }
}
