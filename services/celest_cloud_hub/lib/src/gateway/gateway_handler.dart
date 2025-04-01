import 'dart:convert';

import 'package:celest_cloud_hub/src/model/type_registry.dart';
import 'package:protobuf/protobuf.dart';
import 'package:shelf/shelf.dart';

abstract base class GatewayHandler {
  GatewayHandler({required this.requestType, required this.responseType});

  final GeneratedMessage requestType;
  final GeneratedMessage responseType;

  Future<GeneratedMessage> deserializeRequest(Request request);

  GeneratedMessage deserializeResponse(List<int> response) {
    return responseType.createEmptyInstance()..mergeFromBuffer(response);
  }
}

final class JsonGatewayHandler extends GatewayHandler {
  JsonGatewayHandler({required super.requestType, required super.responseType});

  @override
  Future<GeneratedMessage> deserializeRequest(Request request) async {
    final body = await request.readAsString();
    return requestType.createEmptyInstance()
      ..mergeFromProto3Json(jsonDecode(body), typeRegistry: typeRegistry);
  }
}
