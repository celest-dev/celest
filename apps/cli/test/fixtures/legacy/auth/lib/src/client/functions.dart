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
    final $message = ($error['message'] as String?);
    final $details = ($error['details'] as JsonMap?);
    switch ($code) {
      case r'celest.core.CloudException':
        throw Serializers.instance.deserialize<CloudException>($details);
      case r'celest.core.CancelledException':
        throw Serializers.instance.deserialize<CancelledException>($details);
      case r'celest.core.UnknownError':
        throw Serializers.instance.deserialize<UnknownError>($details);
      case r'celest.core.BadRequestException':
        throw Serializers.instance.deserialize<BadRequestException>($details);
      case r'celest.core.UnauthorizedException':
        throw Serializers.instance.deserialize<UnauthorizedException>($details);
      case r'celest.core.NotFoundException':
        throw Serializers.instance.deserialize<NotFoundException>($details);
      case r'celest.core.AlreadyExistsException':
        throw Serializers.instance
            .deserialize<AlreadyExistsException>($details);
      case r'celest.core.PermissionDeniedException':
        throw Serializers.instance
            .deserialize<PermissionDeniedException>($details);
      case r'celest.core.ResourceExhaustedException':
        throw Serializers.instance
            .deserialize<ResourceExhaustedException>($details);
      case r'celest.core.FailedPreconditionException':
        throw Serializers.instance
            .deserialize<FailedPreconditionException>($details);
      case r'celest.core.AbortedException':
        throw Serializers.instance.deserialize<AbortedException>($details);
      case r'celest.core.OutOfRangeException':
        throw Serializers.instance.deserialize<OutOfRangeException>($details);
      case r'celest.core.UnimplementedError':
        throw Serializers.instance.deserialize<UnimplementedError>($details);
      case r'celest.core.InternalServerError':
        throw Serializers.instance.deserialize<InternalServerError>($details);
      case r'celest.core.UnavailableError':
        throw Serializers.instance.deserialize<UnavailableError>($details);
      case r'celest.core.DataLossError':
        throw Serializers.instance.deserialize<DataLossError>($details);
      case r'celest.core.DeadlineExceededError':
        throw Serializers.instance.deserialize<DeadlineExceededError>($details);
      case r'celest.core.SerializationException':
        throw Serializers.instance
            .deserialize<SerializationException>($details);
      default:
        throw CloudException.http(
          statusCode: $statusCode,
          code: $code,
          message: $message,
          details: $details,
        );
    }
  }

  Future<String> sayHello() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/authenticated-lib/say-hello'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
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

  Stream<String> streamHello() {
    final $channel = celest.eventClient
        .connect(celest.baseUri.resolve('/authenticated-lib/stream-hello'));
    return $channel.stream.map(($event) {
      if ($event.containsKey('error')) {
        _throwError($statusCode: -1, $body: $event);
      }
      return ($event['response'] as String);
    });
  }
}

class CelestFunctionsLib {
  Never _throwError({
    required int $statusCode,
    required Map<String, Object?> $body,
  }) {
    final $error = ($body['error'] as Map<String, Object?>);
    final $code = ($error['code'] as String);
    final $message = ($error['message'] as String?);
    final $details = ($error['details'] as JsonMap?);
    switch ($code) {
      case r'celest.core.CloudException':
        throw Serializers.instance.deserialize<CloudException>($details);
      case r'celest.core.CancelledException':
        throw Serializers.instance.deserialize<CancelledException>($details);
      case r'celest.core.UnknownError':
        throw Serializers.instance.deserialize<UnknownError>($details);
      case r'celest.core.BadRequestException':
        throw Serializers.instance.deserialize<BadRequestException>($details);
      case r'celest.core.UnauthorizedException':
        throw Serializers.instance.deserialize<UnauthorizedException>($details);
      case r'celest.core.NotFoundException':
        throw Serializers.instance.deserialize<NotFoundException>($details);
      case r'celest.core.AlreadyExistsException':
        throw Serializers.instance
            .deserialize<AlreadyExistsException>($details);
      case r'celest.core.PermissionDeniedException':
        throw Serializers.instance
            .deserialize<PermissionDeniedException>($details);
      case r'celest.core.ResourceExhaustedException':
        throw Serializers.instance
            .deserialize<ResourceExhaustedException>($details);
      case r'celest.core.FailedPreconditionException':
        throw Serializers.instance
            .deserialize<FailedPreconditionException>($details);
      case r'celest.core.AbortedException':
        throw Serializers.instance.deserialize<AbortedException>($details);
      case r'celest.core.OutOfRangeException':
        throw Serializers.instance.deserialize<OutOfRangeException>($details);
      case r'celest.core.UnimplementedError':
        throw Serializers.instance.deserialize<UnimplementedError>($details);
      case r'celest.core.InternalServerError':
        throw Serializers.instance.deserialize<InternalServerError>($details);
      case r'celest.core.UnavailableError':
        throw Serializers.instance.deserialize<UnavailableError>($details);
      case r'celest.core.DataLossError':
        throw Serializers.instance.deserialize<DataLossError>($details);
      case r'celest.core.DeadlineExceededError':
        throw Serializers.instance.deserialize<DeadlineExceededError>($details);
      case r'celest.core.SerializationException':
        throw Serializers.instance
            .deserialize<SerializationException>($details);
      default:
        throw CloudException.http(
          statusCode: $statusCode,
          code: $code,
          message: $message,
          details: $details,
        );
    }
  }

  Future<String> sayHelloAuthenticated() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/lib/say-hello-authenticated'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
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

  Stream<String> streamHelloAuthenticated() {
    final $channel = celest.eventClient
        .connect(celest.baseUri.resolve('/lib/stream-hello-authenticated'));
    return $channel.stream.map(($event) {
      if ($event.containsKey('error')) {
        _throwError($statusCode: -1, $body: $event);
      }
      return ($event['response'] as String);
    });
  }

  Future<String> sayHelloPublic() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/lib/say-hello-public'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
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

  Stream<String> streamHelloPublic() {
    final $channel = celest.eventClient
        .connect(celest.baseUri.resolve('/lib/stream-hello-public'));
    return $channel.stream.map(($event) {
      if ($event.containsKey('error')) {
        _throwError($statusCode: -1, $body: $event);
      }
      return ($event['response'] as String);
    });
  }

  Future<String> sayHello() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/lib/say-hello'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
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

  Stream<String> streamHello() {
    final $channel =
        celest.eventClient.connect(celest.baseUri.resolve('/lib/stream-hello'));
    return $channel.stream.map(($event) {
      if ($event.containsKey('error')) {
        _throwError($statusCode: -1, $body: $event);
      }
      return ($event['response'] as String);
    });
  }
}

class CelestFunctionsPublicLib {
  Never _throwError({
    required int $statusCode,
    required Map<String, Object?> $body,
  }) {
    final $error = ($body['error'] as Map<String, Object?>);
    final $code = ($error['code'] as String);
    final $message = ($error['message'] as String?);
    final $details = ($error['details'] as JsonMap?);
    switch ($code) {
      case r'celest.core.CloudException':
        throw Serializers.instance.deserialize<CloudException>($details);
      case r'celest.core.CancelledException':
        throw Serializers.instance.deserialize<CancelledException>($details);
      case r'celest.core.UnknownError':
        throw Serializers.instance.deserialize<UnknownError>($details);
      case r'celest.core.BadRequestException':
        throw Serializers.instance.deserialize<BadRequestException>($details);
      case r'celest.core.UnauthorizedException':
        throw Serializers.instance.deserialize<UnauthorizedException>($details);
      case r'celest.core.NotFoundException':
        throw Serializers.instance.deserialize<NotFoundException>($details);
      case r'celest.core.AlreadyExistsException':
        throw Serializers.instance
            .deserialize<AlreadyExistsException>($details);
      case r'celest.core.PermissionDeniedException':
        throw Serializers.instance
            .deserialize<PermissionDeniedException>($details);
      case r'celest.core.ResourceExhaustedException':
        throw Serializers.instance
            .deserialize<ResourceExhaustedException>($details);
      case r'celest.core.FailedPreconditionException':
        throw Serializers.instance
            .deserialize<FailedPreconditionException>($details);
      case r'celest.core.AbortedException':
        throw Serializers.instance.deserialize<AbortedException>($details);
      case r'celest.core.OutOfRangeException':
        throw Serializers.instance.deserialize<OutOfRangeException>($details);
      case r'celest.core.UnimplementedError':
        throw Serializers.instance.deserialize<UnimplementedError>($details);
      case r'celest.core.InternalServerError':
        throw Serializers.instance.deserialize<InternalServerError>($details);
      case r'celest.core.UnavailableError':
        throw Serializers.instance.deserialize<UnavailableError>($details);
      case r'celest.core.DataLossError':
        throw Serializers.instance.deserialize<DataLossError>($details);
      case r'celest.core.DeadlineExceededError':
        throw Serializers.instance.deserialize<DeadlineExceededError>($details);
      case r'celest.core.SerializationException':
        throw Serializers.instance
            .deserialize<SerializationException>($details);
      default:
        throw CloudException.http(
          statusCode: $statusCode,
          code: $code,
          message: $message,
          details: $details,
        );
    }
  }

  Future<String> sayHello() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/public-lib/say-hello'),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
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

  Stream<String> streamHello() {
    final $channel = celest.eventClient
        .connect(celest.baseUri.resolve('/public-lib/stream-hello'));
    return $channel.stream.map(($event) {
      if ($event.containsKey('error')) {
        _throwError($statusCode: -1, $body: $event);
      }
      return ($event['response'] as String);
    });
  }
}
