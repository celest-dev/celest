import 'dart:io';

import 'package:cedar/cedar.dart';
import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:celest_cloud_auth/src/model/route_map.dart';
import 'package:celest_cloud_hub/src/gateway/gateway_handler.dart';
import 'package:celest_cloud_hub/src/model/type_registry.dart';
import 'package:celest_cloud_hub/src/project.dart';
import 'package:celest_cloud_hub/src/services/operations_service.dart';
import 'package:celest_core/celest_core.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:protobuf/protobuf.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf;
import 'package:shelf_router/shelf_router.dart';

final class Gateway {
  Gateway._(this._handler, this._clientChannel, this.port);

  static Future<Gateway> create({
    required InternetAddress grpcAddress,
    required AuthDatabase authDb,
    int port = 8080,
  }) async {
    final clientChannel = grpc.ClientChannel(
      grpcAddress,
      options: grpc.ChannelOptions(
        credentials: grpc.ChannelCredentials.insecure(),
      ),
    );
    final router = Router();

    final cloudAuth = await CelestCloudAuth.create(database: authDb);
    router.mount('/v1alpha1/auth/', cloudAuth.handler);

    final routeMap = RouteMap.of(project);
    final grpcHandler = _GrpcHandler(
      clientChannel: clientChannel,
      routeMap: routeMap,
    );
    router.mount('/v1alpha1/', grpcHandler.handle);

    return Gateway._(
      const shelf.Pipeline()
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
    final route = routeMap.lookupRoute(path);
    if (route == null) {
      return shelf.Response.notFound('Not found');
    }

    final [serviceName, methodName] = route.id.split('/');
    final handler = _handlers[route]!;
    final grpcRequest = await handler.deserializeRequest(request);

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
      final grpcStatus = grpcHeaders.remove(':status') ?? '200';
      final headers = {
        ...grpcHeaders,
        'Content-Type': 'application/json',
        'Content-Length': responseBody.length.toString(),
      };
      return shelf.Response(
        int.parse(grpcStatus),
        body: responseBody,
        headers: headers,
      );
    } on grpc.GrpcError catch (error) {
      final exception = CloudException.fromGrpcError(error);
      final serialized = JsonUtf8.encode(
        Serializers.instance.serialize(exception),
      );

      final grpcHeaders = {
        ...await grpcCall.headers,
        ...await grpcCall.trailers,
      };
      final grpcStatus = switch (grpcHeaders.remove(':status')) {
        final status? => int.parse(status),
        _ => exception.code,
      };
      return shelf.Response(
        grpcStatus,
        body: serialized,
        headers: {
          ...grpcHeaders,
          'Content-Type': 'application/json',
          'Content-Length': serialized.length.toString(),
        },
      );
    }
  }
}
