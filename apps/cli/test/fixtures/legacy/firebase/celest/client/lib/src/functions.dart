// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async';
import 'dart:convert';

import 'package:celest/celest.dart' as _$celest;
import 'package:celest_backend/src/functions/greeting.dart';
import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/exception/cloud_exception.dart' as _$celest;
import 'package:celest_core/src/exception/serialization_exception.dart'
    as _$celest;
import 'package:firebase_test_client/firebase_test_client.dart';

class CelestFunctions {
  final greeting = CelestFunctionsGreeting();
}

class CelestFunctionsGreeting {
  Never _throwError({
    int? code,
    required Map<String, Object?> body,
  }) {
    final status = body['@status'] as Map<String, Object?>?;
    final message = status?['message'] as String?;
    final details = status?['details'] as _$celest.JsonList?;
    final (errorType, errorValue, stackTrace) = switch (details) {
      null || [] => const (null, null, StackTrace.empty),
      [
        final errorDetails as Map<String, Object?>,
        {
          '@type': 'dart.core.StackTrace',
          'value': final stackTraceValue as String
        },
        ...
      ] =>
        (
          errorDetails['@type'],
          errorDetails['value'],
          StackTrace.fromString(stackTraceValue),
        ),
      [final errorDetails as Map<String, Object?>, ...] => (
          errorDetails['@type'],
          errorDetails['value'],
          StackTrace.empty,
        ),
    };

    switch (errorType) {
      case 'firebase_test.v1.BadNameException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<BadNameException>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.CloudException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.CloudException>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.CancelledException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.CancelledException>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.UnknownError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.UnknownError>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.BadRequestException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.BadRequestException>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.UnauthorizedException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.UnauthorizedException>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.NotFoundException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.NotFoundException>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.AlreadyExistsException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.AlreadyExistsException>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.PermissionDeniedException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.PermissionDeniedException>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.ResourceExhaustedException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.ResourceExhaustedException>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.FailedPreconditionException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.FailedPreconditionException>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.AbortedException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.AbortedException>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.OutOfRangeException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.OutOfRangeException>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.UnimplementedError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.UnimplementedError>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.InternalServerError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.InternalServerError>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.UnavailableError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.UnavailableError>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.DataLossError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.DataLossError>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.DeadlineExceededError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.DeadlineExceededError>(errorValue),
          stackTrace,
        );
      case 'celest.core.v1.SerializationException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$celest.SerializationException>(errorValue),
          stackTrace,
        );
      case 'dart.core.Error':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance.deserialize<Error>(errorValue),
          stackTrace,
        );
      case 'dart.core.AssertionError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance.deserialize<AssertionError>(errorValue),
          stackTrace,
        );
      case 'dart.core.TypeError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance.deserialize<TypeError>(errorValue),
          stackTrace,
        );
      case 'dart.core.ArgumentError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance.deserialize<ArgumentError>(errorValue),
          stackTrace,
        );
      case 'dart.core.RangeError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance.deserialize<RangeError>(errorValue),
          stackTrace,
        );
      case 'dart.core.IndexError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance.deserialize<IndexError>(errorValue),
          stackTrace,
        );
      case 'dart.core.UnsupportedError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<UnsupportedError>(errorValue),
          stackTrace,
        );
      case 'dart.core.UnimplementedError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<UnimplementedError>(errorValue),
          stackTrace,
        );
      case 'dart.core.StateError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance.deserialize<StateError>(errorValue),
          stackTrace,
        );
      case 'dart.core.ConcurrentModificationError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<ConcurrentModificationError>(errorValue),
          stackTrace,
        );
      case 'dart.core.OutOfMemoryError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<OutOfMemoryError>(errorValue),
          stackTrace,
        );
      case 'dart.core.StackOverflowError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<StackOverflowError>(errorValue),
          stackTrace,
        );
      case 'dart.core.Exception':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance.deserialize<Exception>(errorValue),
          stackTrace,
        );
      case 'dart.core.FormatException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<FormatException>(errorValue),
          stackTrace,
        );
      case 'dart.core.IntegerDivisionByZeroException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<IntegerDivisionByZeroException>(errorValue),
          stackTrace,
        );
      case 'dart.async.AsyncError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance.deserialize<AsyncError>(errorValue),
          stackTrace,
        );
      case 'dart.async.TimeoutException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<TimeoutException>(errorValue),
          stackTrace,
        );
      case 'dart.convert.JsonUnsupportedObjectError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<JsonUnsupportedObjectError>(errorValue),
          stackTrace,
        );
      default:
        Error.throwWithStackTrace(
          _$celest.CloudException.http(
            code: code,
            message: message,
            details: ((details ?? body) as _$celest.JsonValue),
          ),
          StackTrace.empty,
        );
    }
  }

  /// Says hello to a [person].
  @_$celest.CloudFunction(
    api: 'greeting',
    function: 'sayHello',
  )
  Future<String> sayHello({required Person person}) async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/greeting/say-hello'),
      headers: const {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: _$celest.JsonUtf8.encode(
          {r'person': _$celest.Serializers.instance.serialize<Person>(person)}),
    );
    final $body = _$celest.JsonUtf8.decode($response.bodyBytes);
    if ($response.statusCode != 200) {
      _throwError(
        code: $response.statusCode,
        body: ($body as Map<String, Object?>),
      );
    }
    return ($body as String);
  }
}
