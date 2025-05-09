import 'dart:convert';
import 'dart:typed_data';

import 'package:celest_cloud/src/cloud/authentication/authentication_protocol.dart';
import 'package:celest_cloud/src/cloud/base/base_protocol.dart';
import 'package:celest_cloud/src/cloud/cloud.dart';
import 'package:celest_cloud/src/proto/celest/cloud/auth/v1alpha1/authentication.pb.dart';
import 'package:celest_core/_internal.dart';
import 'package:http/http.dart' as http;

final class AuthenticationProtocolHttp
    with BaseProtocol
    implements AuthenticationProtocol {
  AuthenticationProtocolHttp({required Uri uri, http.Client? httpClient})
    : _client = httpClient ?? http.Client(),
      _baseUri = uri;

  final http.Client _client;
  final Uri _baseUri;

  @override
  Future<Session> startSession(StartSessionRequest request) async {
    final String path = switch (request.parent) {
      '' => '/v1alpha1/auth/sessions:startSession',
      final String parent => '/v1alpha1/$parent/auth/sessions:startSession',
    };
    final Uri uri = _baseUri.replace(path: path);
    final req =
        http.Request('POST', uri)
          ..body = jsonEncode(
            request.toProto3Json(typeRegistry: CelestCloud.typeRegistry),
          )
          ..headers['content-type'] = 'application/json'
          ..headers['accept'] = 'application/json';
    final http.StreamedResponse res = await _client.send(req);
    final Uint8List body = await res.stream.toBytes();
    if (res.statusCode != 200) {
      throwError(statusCode: res.statusCode, bodyBytes: body);
    }
    return Session()..mergeFromProto3Json(
      JsonUtf8.decode(body),
      typeRegistry: CelestCloud.typeRegistry,
    );
  }

  @override
  Future<Session> continueSession(ContinueSessionRequest request) async {
    const path = '/v1alpha1/auth/sessions:continueSession';
    final Uri uri = _baseUri.replace(path: path);
    final req =
        http.Request('POST', uri)
          ..body = jsonEncode(
            request.toProto3Json(typeRegistry: CelestCloud.typeRegistry),
          )
          ..headers['content-type'] = 'application/json'
          ..headers['accept'] = 'application/json';
    final http.StreamedResponse res = await _client.send(req);
    final Uint8List body = await res.stream.toBytes();
    if (res.statusCode != 200) {
      throwError(statusCode: res.statusCode, bodyBytes: body);
    }
    return Session()..mergeFromProto3Json(
      JsonUtf8.decode(body),
      typeRegistry: CelestCloud.typeRegistry,
    );
  }

  @override
  Future<EndSessionResponse> endSession(EndSessionRequest request) async {
    const path = '/v1alpha1/auth/sessions:endSession';
    final Uri uri = _baseUri.replace(path: path);
    final req =
        http.Request('POST', uri)
          ..body = jsonEncode(
            request.toProto3Json(typeRegistry: CelestCloud.typeRegistry),
          )
          ..headers['content-type'] = 'application/json'
          ..headers['accept'] = 'application/json';
    final http.StreamedResponse res = await _client.send(req);
    final Uint8List body = await res.stream.toBytes();
    if (res.statusCode != 200) {
      throwError(statusCode: res.statusCode, bodyBytes: body);
    }
    return EndSessionResponse()..mergeFromProto3Json(
      JsonUtf8.decode(body),
      typeRegistry: CelestCloud.typeRegistry,
    );
  }
}
