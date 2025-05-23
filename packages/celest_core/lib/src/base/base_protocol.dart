import 'dart:convert';

import 'package:celest_core/src/base/celest_base.dart';
import 'package:celest_core/src/events/event_channel.dart';
import 'package:celest_core/src/events/event_client.dart';
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/serialization/json_value.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

mixin BaseProtocol {
  CelestBase get celest;

  Future<Map<String, Object?>> getJson(String path) async {
    final Uri uri = celest.baseUri.resolve(path);
    final http.Response resp = await celest.httpClient.get(
      uri,
      headers: {'accept': 'application/json'},
    );
    if (resp.statusCode == 401) {
      throw const UnauthorizedException(null);
    }
    if (resp.statusCode != 200) {
      throw http.ClientException('${resp.statusCode}: ${resp.body}', uri);
    }
    return jsonDecode(resp.body) as Map<String, Object?>;
  }

  Future<Map<String, Object?>> postJson(
    String path,
    Map<String, Object?> json,
  ) async {
    final Uri uri = celest.baseUri.resolve(path);
    final http.Response resp = await celest.httpClient.post(
      uri,
      body: jsonEncode(json),
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
      },
    );
    return switch (resp.statusCode) {
      200 => jsonDecode(resp.body) as Map<String, Object?>,
      400 => _error(resp, BadRequestException.of),
      401 => _error(resp, UnauthorizedException.of),
      500 => _error(resp, InternalServerError.of),
      _ => throw http.ClientException('${resp.statusCode}: ${resp.body}', uri),
    };
  }

  Stream<Object?> connect(
    String path, {
    required Map<String, Object?> payload,
  }) {
    final EventChannel channel = celest.eventClient.connect(
      celest.baseUri.resolve(path),
    );
    channel.sink.add(payload);
    return channel.stream;
  }

  Never _error<T extends Exception>(
    http.Response response,
    T Function({String? message, JsonValue? details}) createError,
  ) {
    final MediaType mediaType = switch (response.headers['content-type']) {
      final String contentType? => MediaType.parse(contentType),
      _ =>
        throw createError(
          message: 'Missing content type',
          details: JsonString(response.body),
        ),
    };
    if (mediaType.mimeType != 'application/json') {
      throw createError(
        message: 'Unexpected content type: ${mediaType.mimeType}',
        details: JsonString(response.body),
      );
    }
    final json = jsonDecode(response.body) as Map<String, Object?>;
    final error = json['@error'] as Map<String, Object?>?;
    throw createError(
      message: error?['message'] as String? ?? json['message'] as String?,
      details: switch (json['details']) {
        null => null,
        final Object details => JsonValue(details),
      },
    );
  }
}
