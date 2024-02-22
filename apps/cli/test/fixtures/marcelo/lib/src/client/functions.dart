// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:convert' as _$convert;

import 'package:_common/src/models/errors_and_exceptions.dart'
    as _$errors_and_exceptions;
import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions/overrides.dart' as _$overrides;
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/exception/serialization_exception.dart';
import 'package:celest_core/src/serialization/json_value.dart';

import '../../client.dart';

class CelestFunctions {
  final exceptions = CelestFunctionsExceptions();

  final models = CelestFunctionsModels();
}

class CelestFunctionsExceptions {
  Never _throwError({
    required int $statusCode,
    required Map<String, Object?> $body,
  }) {
    final $error = ($body['error'] as Map<String, Object?>);
    final $code = ($error['code'] as String);
    final $details = ($error['details'] as Map<String, Object?>?);
    switch ($code) {
      case r'UserException':
        throw Serializers.instance
            .deserialize<_$overrides.UserException>($details);
      case r'AppError':
        throw Serializers.instance.deserialize<_$overrides.AppError>($details);
      case r'ValidateError':
        throw Serializers.instance
            .deserialize<_$errors_and_exceptions.ValidateError>($details);
      case r'BadRequestException':
        throw Serializers.instance.deserialize<BadRequestException>($details);
      case r'InternalServerException':
        throw Serializers.instance
            .deserialize<InternalServerException>($details);
      case r'SerializationException':
        throw Serializers.instance
            .deserialize<SerializationException>($details);
      case _:
        switch ($statusCode) {
          case 400:
            throw BadRequestException($code);
          case _:
            throw InternalServerException($code);
        }
    }
  }

  Future<void> throwsUserException({JsonValue? cause}) async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/exceptions/throws-user-exception'),
      headers: const {'Content-Type': 'application/json; charset=utf-8'},
      body: _$convert.jsonEncode({
        r'cause': Serializers.instance.serialize<JsonValue?>(
          cause,
          const TypeToken<JsonValue?>('JsonValue'),
        )
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
    return;
  }

  Future<void> throwsAppError({
    String message = 'message',
    JsonValue? error,
  }) async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/exceptions/throws-app-error'),
      headers: const {'Content-Type': 'application/json; charset=utf-8'},
      body: _$convert.jsonEncode({
        r'message': message,
        r'error': Serializers.instance.serialize<JsonValue?>(
          error,
          const TypeToken<JsonValue?>('JsonValue'),
        ),
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
    return;
  }

  Future<void> callsThrowsUserException({JsonValue? cause}) async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/exceptions/calls-throws-user-exception'),
      headers: const {'Content-Type': 'application/json; charset=utf-8'},
      body: _$convert.jsonEncode({
        r'cause': Serializers.instance.serialize<JsonValue?>(
          cause,
          const TypeToken<JsonValue?>('JsonValue'),
        )
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
    return;
  }
}

class CelestFunctionsModels {
  Never _throwError({
    required int $statusCode,
    required Map<String, Object?> $body,
  }) {
    final $error = ($body['error'] as Map<String, Object?>);
    final $code = ($error['code'] as String);
    final $details = ($error['details'] as Map<String, Object?>?);
    switch ($code) {
      case _:
        switch ($statusCode) {
          case 400:
            throw BadRequestException($code);
          case _:
            throw InternalServerException($code);
        }
    }
  }
}
