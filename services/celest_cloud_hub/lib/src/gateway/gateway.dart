import 'dart:io';

import 'package:celest/http.dart';
// ignore: invalid_use_of_internal_member
import 'package:celest/src/runtime/http/cloud_middleware.dart';
import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:celest_cloud_auth/src/model/route_map.dart';
import 'package:celest_cloud_hub/src/gateway/gateway_handler.dart';
import 'package:celest_cloud_hub/src/model/type_registry.dart';
import 'package:celest_cloud_hub/src/project.dart';
import 'package:celest_cloud_hub/src/services/health_service.dart';
import 'package:celest_cloud_hub/src/services/operations_service.dart';
import 'package:celest_cloud_hub/src/services/organizations_service.dart';
import 'package:celest_cloud_hub/src/services/project_environments_service.dart';
import 'package:celest_cloud_hub/src/services/projects_service.dart';
import 'package:celest_core/celest_core.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:grpc/src/shared/status.dart' show grpcErrorDetailsFromTrailers;
import 'package:protobuf/protobuf.dart';
import 'package:sentry/sentry.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf;
import 'package:shelf_router/shelf_router.dart';

final class Gateway {
  Gateway._(this._handler, this._clientChannel, this.port);

  static Future<Gateway> create({
    required InternetAddress grpcAddress,
    required CloudAuthDatabaseMixin db,
    int port = 8080,
  }) async {
    final clientChannel = grpc.ClientChannel(
      grpcAddress,
      options: grpc.ChannelOptions(
        credentials: grpc.ChannelCredentials.insecure(),
        keepAlive: grpc.ClientKeepAliveOptions(
          pingInterval: const Duration(seconds: 5),
          permitWithoutCalls: true,
        ),
      ),
      channelShutdownHandler: () {
        if (Sentry.isEnabled) {
          Sentry.captureException('Channel shutdown');
        }
      },
    );
    final router = Router();

    final cloudAuth = await CelestCloudAuth.create(database: db);
    router.mount('/v1alpha1/auth/', cloudAuth.handler);

    final routeMap = RouteMap.of(project);
    final grpcHandler = _GrpcHandler(
      clientChannel: clientChannel,
      routeMap: routeMap,
    );
    router.mount('/', grpcHandler.handle);

    return Gateway._(
      const shelf.Pipeline()
          .addMiddleware(const RootMiddleware().call)
          .addMiddleware(
            CloudExceptionMiddleware(
              onException:
                  (e, st) => Sentry.captureException(e, stackTrace: st),
            ).call,
          )
          .addMiddleware(cloudAuth.middleware.call)
          .addHandler(router.call),
      clientChannel,
      port,
    );
  }

  final shelf.Handler _handler;
  final grpc.ClientChannel _clientChannel;
  final int port;
  late final HttpServer _http;

  Future<void> start() async {
    _http = await shelf.serve(
      _handler,
      InternetAddress.anyIPv4,
      port,
      poweredByHeader: null,
    );
  }

  Future<void> close() async {
    await _clientChannel.shutdown();
    await _http.close();
  }
}

final class _GrpcHandler {
  _GrpcHandler({required this.routeMap, required this.clientChannel}) {
    addTypes(OperationsService.apiId, OperationsService.$handlers);
    addTypes(OrganizationsService.apiId, OrganizationsService.$handlers);
    addTypes(ProjectsService.apiId, ProjectsService.$handlers);
    addTypes(
      ProjectEnvironmentsService.apiId,
      ProjectEnvironmentsService.$handlers,
    );
    addTypes(HealthService.apiId, HealthService.$handlers);
  }

  final grpc.ClientChannel clientChannel;
  final RouteMap routeMap;
  final Map<EntityUid, GatewayHandler> _handlers = {};

  void addTypes(String serviceName, Map<String, GatewayHandler> handlers) {
    handlers.forEach((methodName, requestType) {
      final uid = EntityUid.of('Celest::Function', '$serviceName/$methodName');
      _handlers[uid] = requestType;
    });
  }

  Future<shelf.Response> handle(shelf.Request request) async {
    final path = request.requestedUri.path;
    final result = routeMap.lookupRoute(request.method as HttpMethod, path);
    if (result == null) {
      return shelf.Response.notFound('Not found');
    }
    final (route, routeParameters) = result;

    final [serviceName, methodName] = route.id.split('/');
    final handler = _handlers[route]!;
    final grpcRequest = await handler.deserializeRequest(
      request,
      routeParameters,
    );

    final clientMethod = grpc.ClientMethod<GeneratedMessage, GeneratedMessage>(
      '/$serviceName/$methodName',
      (msg) => msg.writeToBuffer(),
      handler.deserializeResponse,
    );

    final grpcCall = clientChannel.createCall(
      clientMethod,
      Stream.value(grpcRequest),
      grpc.CallOptions(metadata: request.headers),
    );
    try {
      final grpcResponse = await grpc.ResponseFuture(grpcCall);
      final response = grpcResponse.toProto3Json(typeRegistry: typeRegistry);
      final responseBody = JsonUtf8.encode(response);

      final grpcHeaders = {
        ...await grpcCall.headers,
        ...await grpcCall.trailers,
      };
      final grpcError = grpcErrorDetailsFromTrailers(grpcHeaders);
      if (grpcError != null) {
        throw grpcError;
      }
      final headers = {...grpcHeaders, 'Content-Type': 'application/json'};
      // Remove HTTP2 headers
      headers.remove(':status');
      return shelf.Response.ok(responseBody, headers: headers);
    } on grpc.GrpcError catch (error) {
      final exception = CloudException.fromGrpcError(error);
      final serialized = JsonUtf8.encode(
        Serializers.instance.serialize(exception),
      );

      final grpcHeaders = {
        ...await grpcCall.headers,
        ...await grpcCall.trailers,
      };
      // Remove HTTP2 headers
      grpcHeaders.remove(':status');
      return shelf.Response(
        exception.httpStatus,
        body: serialized,
        headers: {...grpcHeaders, 'Content-Type': 'application/json'},
      );
    }
  }
}
