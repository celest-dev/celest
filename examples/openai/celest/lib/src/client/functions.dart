// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

library;

import 'dart:convert';

import 'package:celest/celest.dart';
import 'package:celest_backend/models.dart';
import 'package:celest_core/src/exception/cloud_exception.dart';

import '../../client.dart';

class CelestFunctions {
  final openAi = CelestFunctionsOpenAi();
}

class CelestFunctionsOpenAi {
  /// Returns a list of available models. You can dymanically update this list of models for your Flutter app.
  Future<List<String>> availableModels() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/open-ai/available-models'),
      headers: const {'Content-Type': 'application/json; charset=utf-8'},
    );
    final $body = (jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode == 200) {
      return ($body['response'] as Iterable<Object?>)
          .map((el) => (el as String))
          .toList();
    }
    final $error = ($body['error'] as Map<String, Object?>);
    final $code = ($error['code'] as String);
    final $details = ($error['details'] as Map<String, Object?>?);
    switch ($code) {
      case r'BadRequestException':
        throw Serializers.instance.deserialize<BadRequestException>($details);
      case r'InternalServerException':
        throw Serializers.instance
            .deserialize<InternalServerException>($details);
      case _:
        switch ($response.statusCode) {
          case 400:
            throw BadRequestException($code);
          case _:
            throw InternalServerException($code);
        }
    }
  }

  /// Says hello to a person called [name].
  Future<String> openAiRequest({
    required String prompt,
    String model = 'gpt-3.5-turbo-instruct',
    ModelParameters parameters = const ModelParameters(
      temperature: 1.0,
      maxTokens: 100,
    ),
  }) async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/open-ai/open-ai-request'),
      headers: const {'Content-Type': 'application/json; charset=utf-8'},
      body: jsonEncode({
        r'prompt': prompt,
        r'model': model,
        r'parameters':
            Serializers.instance.serialize<ModelParameters>(parameters),
      }),
    );
    final $body = (jsonDecode($response.body) as Map<String, Object?>);
    if ($response.statusCode == 200) {
      return ($body['response'] as String);
    }
    final $error = ($body['error'] as Map<String, Object?>);
    final $code = ($error['code'] as String);
    final $details = ($error['details'] as Map<String, Object?>?);
    switch ($code) {
      case r'BadRequestException':
        throw Serializers.instance.deserialize<BadRequestException>($details);
      case r'InternalServerException':
        throw Serializers.instance
            .deserialize<InternalServerException>($details);
      case _:
        switch ($response.statusCode) {
          case 400:
            throw BadRequestException($code);
          case _:
            throw InternalServerException($code);
        }
    }
  }
}
