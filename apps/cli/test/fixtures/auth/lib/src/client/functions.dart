// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:convert' as _$convert;

import 'package:celest/celest.dart';
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/exception/serialization_exception.dart';

import '../../client.dart';

class CelestFunctions {
  final authenticatedLib = CelestFunctionsAuthenticatedLib();

  final lib = CelestFunctionsLib();

  final publicLib = CelestFunctionsPublicLib();
}

class CelestFunctionsAuthenticatedLib {
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

  Future<void> sayHello() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/authenticated-lib/say-hello'),
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
    return;
  }
}

class CelestFunctionsLib {
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

  Future<void> sayHelloAuthenticated() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/lib/say-hello-authenticated'),
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
    return;
  }

  Future<void> sayHelloPublic() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/lib/say-hello-public'),
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
    return;
  }

  Future<void> sayHello() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/lib/say-hello'),
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
    return;
  }
}

class CelestFunctionsPublicLib {
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

  Future<void> sayHello() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/public-lib/say-hello'),
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
    return;
  }
}
