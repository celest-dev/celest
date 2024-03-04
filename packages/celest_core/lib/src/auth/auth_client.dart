import 'dart:convert';

import 'package:celest_core/celest_core.dart';
import 'package:http/http.dart' as http;

final class AuthClient implements AuthProtocol {
  AuthClient({
    required this.baseUri,
    http.Client? httpClient,
  }) : _client = httpClient ?? http.Client();

  final http.Client _client;
  final Uri baseUri;

  @override
  late final PasskeyClient passkeys = PasskeyClient(
    baseUri: baseUri,
    httpClient: _client,
  );
}

final class PasskeyClient implements PasskeyProtocol {
  PasskeyClient({
    required this.baseUri,
    http.Client? httpClient,
  }) : _client = httpClient ?? http.Client();

  final http.Client _client;
  final Uri baseUri;

  String? token;

  Future<Map<String, Object?>> _send(
    String path,
    Map<String, Object?> json,
  ) async {
    final uri = baseUri.resolve(path);
    final resp = await _client.post(
      uri,
      body: jsonEncode(json),
      headers: {
        'content-type': 'application/json',
        if (token case final token?) 'authorization': 'Bearer $token',
      },
    );
    if (resp.statusCode != 200) {
      throw http.ClientException(
        '${resp.statusCode}: ${resp.body}',
        uri,
      );
    }
    final body = jsonDecode(resp.body) as Map<String, Object?>;
    if (body['cork'] case final String cork) {
      token = cork;
    }
    return body;
  }

  @override
  Future<PasskeyRegistrationOptions> requestRegistration({
    required PasskeyRegistrationRequest request,
  }) async {
    final response = await _send('/_auth/passkeys/register', request.toJson());
    return PasskeyRegistrationOptions.fromJson(response);
  }

  @override
  Future<void> verifyRegistration({
    required PasskeyRegistrationResponse registration,
  }) async {
    await _send(
      '/_auth/passkeys/register/verify',
      registration.toJson(),
    );
  }

  @override
  Future<PasskeyAuthenticationOptions> requestAuthentication({
    required PasskeyAuthenticationRequest request,
  }) async {
    final response = await _send(
      '/_auth/passkeys/authenticate',
      request.toJson(),
    );
    return PasskeyAuthenticationOptions.fromJson(response);
  }

  @override
  Future<void> verifyAuthentication({
    required PasskeyAuthenticationResponse authentication,
  }) async {
    await _send(
      '/_auth/passkeys/authenticate/verify',
      authentication.toJson(),
    );
  }
}
