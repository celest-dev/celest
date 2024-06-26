// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:convert' as _$convert;

import 'package:celest/celest.dart';
import 'package:celest_backend/models.dart' as _$models;
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/exception/serialization_exception.dart';

import '../../client.dart';

class CelestFunctions {
  final openAi = CelestFunctionsOpenAi();
}

class CelestFunctionsOpenAi {
  Never _throwError({
    required int $statusCode,
    required Map<String, Object?> $body,
  }) {
    final $error = ($body['error'] as Map<String, Object?>);
    final $code = ($error['code'] as String);
    final $details = ($error['details'] as Map<String, Object?>?);
    switch ($code) {
      case r'BadRequestException':
        throw Serializers.instance.deserialize<BadRequestException>($details);
      case r'UnauthorizedException':
        throw Serializers.instance.deserialize<UnauthorizedException>($details);
      case r'InternalServerError':
        throw Serializers.instance.deserialize<InternalServerError>($details);
      case r'SerializationException':
        throw Serializers.instance
            .deserialize<SerializationException>($details);
      case _:
        switch ($statusCode) {
          case 400:
            throw BadRequestException($code);
          case _:
            throw InternalServerError($code);
        }
    }
  }

  /// Returns a list of available models.
  Future<List<String>> availableModels() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/open-ai/available-models'),
      headers: const {'Content-Type': 'application/json; charset=utf-8'},
    );
    final $body =
        (_$convert.jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode != 200) {
      _throwError(
        $statusCode: $response.statusCode,
        $body: $body,
      );
    }
    return ($body['response'] as Iterable<Object?>)
        .map((el) => (el as String))
        .toList();
  }

  /// Prompts the GPT [model] with the given [prompt] and [parameters].
  ///
  /// Returns the generated text.
  Future<String> openAiRequest({
    required String model,
    required String prompt,
    _$models.ModelParameters parameters = const _$models.ModelParameters(),
  }) async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/open-ai/open-ai-request'),
      headers: const {'Content-Type': 'application/json; charset=utf-8'},
      body: _$convert.jsonEncode({
        r'model': model,
        r'prompt': prompt,
        r'parameters': Serializers.instance
            .serialize<_$models.ModelParameters>(parameters),
      }),
    );
    final $body =
        (_$convert.jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode != 200) {
      _throwError(
        $statusCode: $response.statusCode,
        $body: $body,
      );
    }
    return ($body['response'] as String);
  }
}
