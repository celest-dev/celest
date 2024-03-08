import 'dart:convert';

import 'package:celest_core/celest_core.dart';
import 'package:celest_core/src/base/celest_base.dart';
import 'package:http/http.dart' as http;

mixin BaseProtocol {
  CelestBase get celest;

  Future<Map<String, Object?>> getJson(String path) async {
    final uri = celest.baseUri.resolve(path);
    final resp = await celest.httpClient.get(
      uri,
      headers: {
        'accept': 'application/json',
      },
    );
    if (resp.statusCode == 401) {
      throw UnauthorizedException();
    }
    if (resp.statusCode != 200) {
      throw http.ClientException(
        '${resp.statusCode}: ${resp.body}',
        uri,
      );
    }
    return jsonDecode(resp.body) as Map<String, Object?>;
  }

  Future<Map<String, Object?>> postJson(
    String path,
    Map<String, Object?> json,
  ) async {
    final uri = celest.baseUri.resolve(path);
    final resp = await celest.httpClient.post(
      uri,
      body: jsonEncode(json),
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
      },
    );
    if (resp.statusCode == 401) {
      throw UnauthorizedException();
    }
    if (resp.statusCode != 200) {
      throw http.ClientException(
        '${resp.statusCode}: ${resp.body}',
        uri,
      );
    }
    return jsonDecode(resp.body) as Map<String, Object?>;
  }
}
