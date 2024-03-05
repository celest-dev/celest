import 'dart:convert';

import 'package:http/http.dart' as http;

mixin BaseProtocol {
  http.Client get httpClient;
  Uri get baseUri;

  Future<Map<String, Object?>> postJson(
    String path,
    Map<String, Object?> json,
  ) async {
    final uri = baseUri.resolve(path);
    final resp = await httpClient.post(
      uri,
      body: jsonEncode(json),
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
      },
    );
    if (resp.statusCode != 200) {
      throw http.ClientException(
        '${resp.statusCode}: ${resp.body}',
        uri,
      );
    }
    return jsonDecode(resp.body) as Map<String, Object?>;
  }
}
