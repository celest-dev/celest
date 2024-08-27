import 'dart:convert';

import 'package:celest_cloud/src/cloud/authentication/authentication_protocol.dart';
import 'package:celest_cloud/src/proto/celest/cloud/auth/v1alpha1/authentication.pb.dart';
import 'package:celest_core/celest_core.dart' show CloudException;
import 'package:http/http.dart' as http;

final class AuthenticationProtocolHttp implements AuthenticationProtocol {
  AuthenticationProtocolHttp({
    required Uri uri,
    http.Client? httpClient,
  })  : _client = httpClient ?? http.Client(),
        _baseUri = uri;

  final http.Client _client;
  final Uri _baseUri;

  @override
  Future<Session> startSession(StartSessionRequest request) async {
    final path = switch (request.parent) {
      '' => '/v1alpha1/auth/sessions:startSession',
      final parent => '/v1alpha1/$parent/auth/sessions:startSession',
    };
    final uri = _baseUri.replace(path: path);
    final req = http.Request('POST', uri)
      ..body = jsonEncode(request.toProto3Json())
      ..headers['content-type'] = 'application/json'
      ..headers['accept'] = 'application/json';
    final res = await _client.send(req);
    final body = await res.stream.bytesToString();
    if (res.statusCode != 200) {
      throw CloudException.http(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return Session()..mergeFromProto3Json(jsonDecode(body));
  }

  @override
  Future<Session> continueSession(ContinueSessionRequest request) async {
    final path = '/v1alpha1/auth/sessions/${request.sessionId}:continueSession';
    final uri = _baseUri.replace(path: path);
    final req = http.Request('POST', uri)
      ..body = jsonEncode(request.toProto3Json())
      ..headers['content-type'] = 'application/json'
      ..headers['accept'] = 'application/json';
    final res = await _client.send(req);
    final body = await res.stream.bytesToString();
    if (res.statusCode != 200) {
      throw CloudException.http(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return Session()..mergeFromProto3Json(jsonDecode(body));
  }

  @override
  Future<EndSessionResponse> endSession(EndSessionRequest request) async {
    const path = '/v1alpha1/auth:endSession';
    final uri = _baseUri.replace(path: path);
    final req = http.Request('POST', uri)
      ..body = jsonEncode(request.toProto3Json())
      ..headers['content-type'] = 'application/json'
      ..headers['accept'] = 'application/json';
    final res = await _client.send(req);
    final body = await res.stream.bytesToString();
    if (res.statusCode != 200) {
      throw CloudException.http(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return EndSessionResponse()..mergeFromProto3Json(jsonDecode(body));
  }
}
