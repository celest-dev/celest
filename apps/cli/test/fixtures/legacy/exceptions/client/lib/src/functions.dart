// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _$async;
import 'dart:convert' as _$convert;

import 'package:_common/_common.dart' as _$_common;
import 'package:celest/celest.dart' as _$celest;
import 'package:celest_backend/exceptions/exceptions.dart';
import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/exception/cloud_exception.dart' as _$celest;
import 'package:celest_core/src/exception/serialization_exception.dart'
    as _$celest;
import 'package:exceptions_client/exceptions_client.dart';

class CelestFunctions {
  /// Tests that types thrown from external packages can be detected via
  /// recursive imports and serialized correctly.
  final external = CelestFunctionsExternal();

  /// A library with methods that do not through but call methods that do throw.
  final nonthrowing = CelestFunctionsNonthrowing();

  final throwing = CelestFunctionsThrowing();
}

/// Tests that types thrown from external packages can be detected via
/// recursive imports and serialized correctly.
class CelestFunctionsExternal {
  Never _throwError({
    required int $statusCode,
    required Map<String, Object?> $body,
  }) {
    final $error = ($body['error'] as Map<String, Object?>);
    final $code = ($error['code'] as String);
    final $message = ($error['message'] as String?);
    final $details = ($error['details'] as _$celest.JsonMap?);
    switch ($code) {
      case r'_common.CustomException':
        throw _$celest.Serializers.instance
            .deserialize<_$_common.CustomException>($details);
      case r'_common.CommonException':
        throw _$celest.Serializers.instance
            .deserialize<_$_common.CommonException>($details);
      case r'_common.OverriddenException':
        throw _$celest.Serializers.instance
            .deserialize<_$_common.OverriddenException>($details);
      case r'dart.core.Error':
        throw _$celest.Serializers.instance.deserialize<Error>($details);
      case r'dart.core.AssertionError':
        throw _$celest.Serializers.instance
            .deserialize<AssertionError>($details);
      case r'dart.core.TypeError':
        throw _$celest.Serializers.instance.deserialize<TypeError>($details);
      case r'dart.core.ArgumentError':
        throw _$celest.Serializers.instance
            .deserialize<ArgumentError>($details);
      case r'dart.core.RangeError':
        throw _$celest.Serializers.instance.deserialize<RangeError>($details);
      case r'dart.core.IndexError':
        throw _$celest.Serializers.instance.deserialize<IndexError>($details);
      case r'dart.core.UnsupportedError':
        throw _$celest.Serializers.instance
            .deserialize<UnsupportedError>($details);
      case r'dart.core.UnimplementedError':
        throw _$celest.Serializers.instance
            .deserialize<UnimplementedError>($details);
      case r'dart.core.StateError':
        throw _$celest.Serializers.instance.deserialize<StateError>($details);
      case r'dart.core.ConcurrentModificationError':
        throw _$celest.Serializers.instance
            .deserialize<ConcurrentModificationError>($details);
      case r'dart.core.OutOfMemoryError':
        throw _$celest.Serializers.instance
            .deserialize<OutOfMemoryError>($details);
      case r'dart.core.StackOverflowError':
        throw _$celest.Serializers.instance
            .deserialize<StackOverflowError>($details);
      case r'dart.core.FormatException':
        throw _$celest.Serializers.instance
            .deserialize<FormatException>($details);
      case r'dart.core.IntegerDivisionByZeroException':
        throw _$celest.Serializers.instance
            .deserialize<IntegerDivisionByZeroException>($details);
      case r'dart.async.AsyncError':
        throw _$celest.Serializers.instance
            .deserialize<_$async.AsyncError>($details);
      case r'dart.async.TimeoutException':
        throw _$celest.Serializers.instance
            .deserialize<_$async.TimeoutException>($details);
      case r'dart.convert.JsonUnsupportedObjectError':
        throw _$celest.Serializers.instance
            .deserialize<_$convert.JsonUnsupportedObjectError>($details);
      case r'celest.core.v1.CloudException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CloudException>($details);
      case r'celest.core.v1.CancelledException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CancelledException>($details);
      case r'celest.core.v1.UnknownError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnknownError>($details);
      case r'celest.core.v1.BadRequestException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.BadRequestException>($details);
      case r'celest.core.v1.UnauthorizedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnauthorizedException>($details);
      case r'celest.core.v1.NotFoundException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.NotFoundException>($details);
      case r'celest.core.v1.AlreadyExistsException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AlreadyExistsException>($details);
      case r'celest.core.v1.PermissionDeniedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.PermissionDeniedException>($details);
      case r'celest.core.v1.ResourceExhaustedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.ResourceExhaustedException>($details);
      case r'celest.core.v1.FailedPreconditionException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.FailedPreconditionException>($details);
      case r'celest.core.v1.AbortedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AbortedException>($details);
      case r'celest.core.v1.OutOfRangeException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.OutOfRangeException>($details);
      case r'celest.core.v1.UnimplementedError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnimplementedError>($details);
      case r'celest.core.v1.InternalServerError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.InternalServerError>($details);
      case r'celest.core.v1.UnavailableError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnavailableError>($details);
      case r'celest.core.v1.DataLossError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DataLossError>($details);
      case r'celest.core.v1.DeadlineExceededError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DeadlineExceededError>($details);
      case r'celest.core.v1.SerializationException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.SerializationException>($details);
      default:
        throw _$celest.CloudException.http(
          status: $statusCode,
          code: $code,
          message: $message,
          details: $details,
        );
    }
  }

  @_$celest.CloudFunction(
    api: 'external',
    function: 'callsThrowsCommonException',
  )
  Future<void> callsThrowsCommonException() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/external/calls-throws-common-exception'),
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
    return;
  }

  @_$celest.CloudFunction(
    api: 'external',
    function: 'callsThrowsCustomException',
  )
  Future<void> callsThrowsCustomException() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/external/calls-throws-custom-exception'),
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
    return;
  }
}

/// A library with methods that do not through but call methods that do throw.
class CelestFunctionsNonthrowing {
  Never _throwError({
    required int $statusCode,
    required Map<String, Object?> $body,
  }) {
    final $error = ($body['error'] as Map<String, Object?>);
    final $code = ($error['code'] as String);
    final $message = ($error['message'] as String?);
    final $details = ($error['details'] as _$celest.JsonMap?);
    switch ($code) {
      case r'celest.core.v1.CloudException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CloudException>($details);
      case r'celest.core.v1.CancelledException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CancelledException>($details);
      case r'celest.core.v1.UnknownError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnknownError>($details);
      case r'celest.core.v1.BadRequestException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.BadRequestException>($details);
      case r'celest.core.v1.UnauthorizedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnauthorizedException>($details);
      case r'celest.core.v1.NotFoundException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.NotFoundException>($details);
      case r'celest.core.v1.AlreadyExistsException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AlreadyExistsException>($details);
      case r'celest.core.v1.PermissionDeniedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.PermissionDeniedException>($details);
      case r'celest.core.v1.ResourceExhaustedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.ResourceExhaustedException>($details);
      case r'celest.core.v1.FailedPreconditionException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.FailedPreconditionException>($details);
      case r'celest.core.v1.AbortedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AbortedException>($details);
      case r'celest.core.v1.OutOfRangeException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.OutOfRangeException>($details);
      case r'celest.core.v1.UnimplementedError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnimplementedError>($details);
      case r'celest.core.v1.InternalServerError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.InternalServerError>($details);
      case r'celest.core.v1.UnavailableError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnavailableError>($details);
      case r'celest.core.v1.DataLossError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DataLossError>($details);
      case r'celest.core.v1.DeadlineExceededError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DeadlineExceededError>($details);
      case r'celest.core.v1.SerializationException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.SerializationException>($details);
      case r'dart.core.Error':
        throw _$celest.Serializers.instance.deserialize<Error>($details);
      case r'dart.core.AssertionError':
        throw _$celest.Serializers.instance
            .deserialize<AssertionError>($details);
      case r'dart.core.TypeError':
        throw _$celest.Serializers.instance.deserialize<TypeError>($details);
      case r'dart.core.ArgumentError':
        throw _$celest.Serializers.instance
            .deserialize<ArgumentError>($details);
      case r'dart.core.RangeError':
        throw _$celest.Serializers.instance.deserialize<RangeError>($details);
      case r'dart.core.IndexError':
        throw _$celest.Serializers.instance.deserialize<IndexError>($details);
      case r'dart.core.UnsupportedError':
        throw _$celest.Serializers.instance
            .deserialize<UnsupportedError>($details);
      case r'dart.core.UnimplementedError':
        throw _$celest.Serializers.instance
            .deserialize<UnimplementedError>($details);
      case r'dart.core.StateError':
        throw _$celest.Serializers.instance.deserialize<StateError>($details);
      case r'dart.core.ConcurrentModificationError':
        throw _$celest.Serializers.instance
            .deserialize<ConcurrentModificationError>($details);
      case r'dart.core.OutOfMemoryError':
        throw _$celest.Serializers.instance
            .deserialize<OutOfMemoryError>($details);
      case r'dart.core.StackOverflowError':
        throw _$celest.Serializers.instance
            .deserialize<StackOverflowError>($details);
      case r'dart.core.FormatException':
        throw _$celest.Serializers.instance
            .deserialize<FormatException>($details);
      case r'dart.core.IntegerDivisionByZeroException':
        throw _$celest.Serializers.instance
            .deserialize<IntegerDivisionByZeroException>($details);
      case r'dart.async.AsyncError':
        throw _$celest.Serializers.instance
            .deserialize<_$async.AsyncError>($details);
      case r'dart.async.TimeoutException':
        throw _$celest.Serializers.instance
            .deserialize<_$async.TimeoutException>($details);
      case r'dart.convert.JsonUnsupportedObjectError':
        throw _$celest.Serializers.instance
            .deserialize<_$convert.JsonUnsupportedObjectError>($details);
      case r'exceptions.v1.BaseException':
        throw _$celest.Serializers.instance
            .deserialize<BaseException>($details);
      case r'exceptions.v1.CustomException':
        throw _$celest.Serializers.instance
            .deserialize<CustomException>($details);
      case r'exceptions.v1.BaseError':
        throw _$celest.Serializers.instance.deserialize<BaseError>($details);
      case r'exceptions.v1.CustomError':
        throw _$celest.Serializers.instance.deserialize<CustomError>($details);
      default:
        throw _$celest.CloudException.http(
          status: $statusCode,
          code: $code,
          message: $message,
          details: $details,
        );
    }
  }

  @_$celest.CloudFunction(
    api: 'nonthrowing',
    function: 'callsThrowsCustomError',
  )
  Future<void> callsThrowsCustomError() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/nonthrowing/calls-throws-custom-error'),
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
    return;
  }

  @_$celest.CloudFunction(
    api: 'nonthrowing',
    function: 'callsThrowsBaseError',
  )
  Future<void> callsThrowsBaseError() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/nonthrowing/calls-throws-base-error'),
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
    return;
  }

  @_$celest.CloudFunction(
    api: 'nonthrowing',
    function: 'callsThrowsCustomException',
  )
  Future<void> callsThrowsCustomException() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/nonthrowing/calls-throws-custom-exception'),
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
    return;
  }

  @_$celest.CloudFunction(
    api: 'nonthrowing',
    function: 'callsThrowsBaseException',
  )
  Future<void> callsThrowsBaseException() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/nonthrowing/calls-throws-base-exception'),
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
    return;
  }
}

class CelestFunctionsThrowing {
  Never _throwError({
    required int $statusCode,
    required Map<String, Object?> $body,
  }) {
    final $error = ($body['error'] as Map<String, Object?>);
    final $code = ($error['code'] as String);
    final $message = ($error['message'] as String?);
    final $details = ($error['details'] as _$celest.JsonMap?);
    switch ($code) {
      case r'celest.core.v1.CloudException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CloudException>($details);
      case r'celest.core.v1.CancelledException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.CancelledException>($details);
      case r'celest.core.v1.UnknownError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnknownError>($details);
      case r'celest.core.v1.BadRequestException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.BadRequestException>($details);
      case r'celest.core.v1.UnauthorizedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnauthorizedException>($details);
      case r'celest.core.v1.NotFoundException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.NotFoundException>($details);
      case r'celest.core.v1.AlreadyExistsException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AlreadyExistsException>($details);
      case r'celest.core.v1.PermissionDeniedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.PermissionDeniedException>($details);
      case r'celest.core.v1.ResourceExhaustedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.ResourceExhaustedException>($details);
      case r'celest.core.v1.FailedPreconditionException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.FailedPreconditionException>($details);
      case r'celest.core.v1.AbortedException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.AbortedException>($details);
      case r'celest.core.v1.OutOfRangeException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.OutOfRangeException>($details);
      case r'celest.core.v1.UnimplementedError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnimplementedError>($details);
      case r'celest.core.v1.InternalServerError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.InternalServerError>($details);
      case r'celest.core.v1.UnavailableError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.UnavailableError>($details);
      case r'celest.core.v1.DataLossError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DataLossError>($details);
      case r'celest.core.v1.DeadlineExceededError':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.DeadlineExceededError>($details);
      case r'celest.core.v1.SerializationException':
        throw _$celest.Serializers.instance
            .deserialize<_$celest.SerializationException>($details);
      case r'dart.core.Error':
        throw _$celest.Serializers.instance.deserialize<Error>($details);
      case r'dart.core.AssertionError':
        throw _$celest.Serializers.instance
            .deserialize<AssertionError>($details);
      case r'dart.core.TypeError':
        throw _$celest.Serializers.instance.deserialize<TypeError>($details);
      case r'dart.core.ArgumentError':
        throw _$celest.Serializers.instance
            .deserialize<ArgumentError>($details);
      case r'dart.core.RangeError':
        throw _$celest.Serializers.instance.deserialize<RangeError>($details);
      case r'dart.core.IndexError':
        throw _$celest.Serializers.instance.deserialize<IndexError>($details);
      case r'dart.core.UnsupportedError':
        throw _$celest.Serializers.instance
            .deserialize<UnsupportedError>($details);
      case r'dart.core.UnimplementedError':
        throw _$celest.Serializers.instance
            .deserialize<UnimplementedError>($details);
      case r'dart.core.StateError':
        throw _$celest.Serializers.instance.deserialize<StateError>($details);
      case r'dart.core.ConcurrentModificationError':
        throw _$celest.Serializers.instance
            .deserialize<ConcurrentModificationError>($details);
      case r'dart.core.OutOfMemoryError':
        throw _$celest.Serializers.instance
            .deserialize<OutOfMemoryError>($details);
      case r'dart.core.StackOverflowError':
        throw _$celest.Serializers.instance
            .deserialize<StackOverflowError>($details);
      case r'dart.core.FormatException':
        throw _$celest.Serializers.instance
            .deserialize<FormatException>($details);
      case r'dart.core.IntegerDivisionByZeroException':
        throw _$celest.Serializers.instance
            .deserialize<IntegerDivisionByZeroException>($details);
      case r'dart.async.AsyncError':
        throw _$celest.Serializers.instance
            .deserialize<_$async.AsyncError>($details);
      case r'dart.async.TimeoutException':
        throw _$celest.Serializers.instance
            .deserialize<_$async.TimeoutException>($details);
      case r'dart.convert.JsonUnsupportedObjectError':
        throw _$celest.Serializers.instance
            .deserialize<_$convert.JsonUnsupportedObjectError>($details);
      case r'exceptions.v1.BaseException':
        throw _$celest.Serializers.instance
            .deserialize<BaseException>($details);
      case r'exceptions.v1.CustomException':
        throw _$celest.Serializers.instance
            .deserialize<CustomException>($details);
      case r'exceptions.v1.BaseError':
        throw _$celest.Serializers.instance.deserialize<BaseError>($details);
      case r'exceptions.v1.CustomError':
        throw _$celest.Serializers.instance.deserialize<CustomError>($details);
      default:
        throw _$celest.CloudException.http(
          status: $statusCode,
          code: $code,
          message: $message,
          details: $details,
        );
    }
  }

  @_$celest.CloudFunction(
    api: 'throwing',
    function: 'throwsCustomError',
  )
  Future<void> throwsCustomError() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/throwing/throws-custom-error'),
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
    return;
  }

  @_$celest.CloudFunction(
    api: 'throwing',
    function: 'throwsBaseError',
  )
  Future<void> throwsBaseError() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/throwing/throws-base-error'),
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
    return;
  }

  @_$celest.CloudFunction(
    api: 'throwing',
    function: 'throwsCustomException',
  )
  Future<void> throwsCustomException() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/throwing/throws-custom-exception'),
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
    return;
  }

  @_$celest.CloudFunction(
    api: 'throwing',
    function: 'throwsBaseException',
  )
  Future<void> throwsBaseException() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/throwing/throws-base-exception'),
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
    return;
  }
}
