import 'dart:convert';

import 'package:http/http.dart' as http;

class TursoClient {
  TursoClient({
    required this.apiToken,
    this.baseUrl = 'https://api.turso.tech',
    http.Client? client,
  }) : _client = client ?? http.Client();

  final String baseUrl;
  final String apiToken;
  final http.Client _client;

  Future<Map<String, dynamic>> _request(
    String method,
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? queryParams,
  }) async {
    final uri = Uri.parse(
      '$baseUrl$path',
    ).replace(queryParameters: queryParams);

    final headers = {
      'Authorization': 'Bearer $apiToken',
      'Content-Type': 'application/json',
    };

    final response = await _client.send(
      http.Request(method, uri)
        ..headers.addAll(headers)
        ..body = body != null ? jsonEncode(body) : '',
    );

    final responseBody = await response.stream.bytesToString();

    if (response.statusCode >= 400) {
      throw TursoApiException(
        statusCode: response.statusCode,
        message: responseBody,
      );
    }

    return responseBody.isNotEmpty
        ? jsonDecode(responseBody) as Map<String, Object?>
        : {};
  }

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? queryParams,
  }) async {
    return _request('GET', path, queryParams: queryParams);
  }

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? queryParams,
  }) async {
    return _request('POST', path, body: body, queryParams: queryParams);
  }

  Future<Map<String, dynamic>> patch(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? queryParams,
  }) async {
    return _request('PATCH', path, body: body, queryParams: queryParams);
  }

  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, String>? queryParams,
  }) async {
    return _request('DELETE', path, queryParams: queryParams);
  }

  void dispose() {
    _client.close();
  }
}

class TursoApiException implements Exception {
  TursoApiException({required this.statusCode, required this.message});

  final int statusCode;
  final String message;

  @override
  String toString() => 'TursoApiException: $statusCode - $message';
}
