// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _$async;
import 'dart:convert' as _$convert;
import 'dart:io' as _$io;
import 'dart:isolate' as _$isolate;
import 'dart:typed_data' as _$typed_data;
import 'dart:ui' as _$ui;

import 'package:celest/celest.dart' as _$celest;
import 'package:celest_backend/src/functions/flutter.dart';
import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/exception/cloud_exception.dart' as _$celest;
import 'package:celest_core/src/exception/serialization_exception.dart'
    as _$celest;
import 'package:flutter/src/painting/image_provider.dart' as _$image_provider;
import 'package:flutter_client/flutter_client.dart';

class CelestFunctions {
  /// Tests that dart:ui types can be used as inputs/outputs in functions.
  final dartUi = CelestFunctionsDartUi();

  final flutter = CelestFunctionsFlutter();
}

/// Tests that dart:ui types can be used as inputs/outputs in functions.
class CelestFunctionsDartUi {
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
      case 'dart.async.AsyncError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$async.AsyncError>(errorValue),
          stackTrace,
        );
      case 'dart.async.TimeoutException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$async.TimeoutException>(errorValue),
          stackTrace,
        );
      case 'dart.convert.JsonUnsupportedObjectError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$convert.JsonUnsupportedObjectError>(errorValue),
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
      case 'dart.isolate.IsolateSpawnException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$isolate.IsolateSpawnException>(errorValue),
          stackTrace,
        );
      case 'dart.io.OSError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance.deserialize<_$io.OSError>(errorValue),
          stackTrace,
        );
      case 'dart.io.FileSystemException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.FileSystemException>(errorValue),
          stackTrace,
        );
      case 'dart.io.PathAccessException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.PathAccessException>(errorValue),
          stackTrace,
        );
      case 'dart.io.PathExistsException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.PathExistsException>(errorValue),
          stackTrace,
        );
      case 'dart.io.PathNotFoundException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.PathNotFoundException>(errorValue),
          stackTrace,
        );
      case 'dart.io.SignalException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.SignalException>(errorValue),
          stackTrace,
        );
      case 'dart.io.ProcessException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.ProcessException>(errorValue),
          stackTrace,
        );
      case 'dart.io.TlsException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.TlsException>(errorValue),
          stackTrace,
        );
      case 'dart.io.HandshakeException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.HandshakeException>(errorValue),
          stackTrace,
        );
      case 'dart.io.CertificateException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.CertificateException>(errorValue),
          stackTrace,
        );
      case 'dart.io.StdoutException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.StdoutException>(errorValue),
          stackTrace,
        );
      case 'dart.io.StdinException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.StdinException>(errorValue),
          stackTrace,
        );
      case 'dart._http.HttpException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.HttpException>(errorValue),
          stackTrace,
        );
      case 'dart._http.WebSocketException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.WebSocketException>(errorValue),
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

  @_$celest.CloudFunction(
    api: 'dart_ui',
    function: 'lerpColor',
  )
  Future<_$ui.Color> lerpColor(
    _$ui.Color a,
    _$ui.Color b,
    double t,
  ) async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/dart-ui/lerp-color'),
      headers: const {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: _$celest.JsonUtf8.encode({
        r'a': _$celest.Serializers.instance.serialize<_$ui.Color>(a),
        r'b': _$celest.Serializers.instance.serialize<_$ui.Color>(b),
        r't': t,
      }),
    );
    final $body = _$celest.JsonUtf8.decode($response.bodyBytes);
    if ($response.statusCode != 200) {
      _throwError(
        code: $response.statusCode,
        body: ($body as Map<String, Object?>),
      );
    }
    return _$celest.Serializers.instance.deserialize<_$ui.Color>($body);
  }

  @_$celest.CloudFunction(
    api: 'dart_ui',
    function: 'addCountryCode',
  )
  Future<_$ui.Locale> addCountryCode(
    _$ui.Locale locale,
    String countryCode,
  ) async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/dart-ui/add-country-code'),
      headers: const {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: _$celest.JsonUtf8.encode({
        r'locale': _$celest.Serializers.instance.serialize<_$ui.Locale>(locale),
        r'countryCode': countryCode,
      }),
    );
    final $body = _$celest.JsonUtf8.decode($response.bodyBytes);
    if ($response.statusCode != 200) {
      _throwError(
        code: $response.statusCode,
        body: ($body as Map<String, Object?>),
      );
    }
    return _$celest.Serializers.instance.deserialize<_$ui.Locale>($body);
  }
}

class CelestFunctionsFlutter {
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
      case 'dart.async.AsyncError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$async.AsyncError>(errorValue),
          stackTrace,
        );
      case 'dart.async.TimeoutException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$async.TimeoutException>(errorValue),
          stackTrace,
        );
      case 'dart.convert.JsonUnsupportedObjectError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$convert.JsonUnsupportedObjectError>(errorValue),
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
      case 'dart.isolate.IsolateSpawnException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$isolate.IsolateSpawnException>(errorValue),
          stackTrace,
        );
      case 'dart.io.OSError':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance.deserialize<_$io.OSError>(errorValue),
          stackTrace,
        );
      case 'dart.io.FileSystemException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.FileSystemException>(errorValue),
          stackTrace,
        );
      case 'dart.io.PathAccessException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.PathAccessException>(errorValue),
          stackTrace,
        );
      case 'dart.io.PathExistsException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.PathExistsException>(errorValue),
          stackTrace,
        );
      case 'dart.io.PathNotFoundException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.PathNotFoundException>(errorValue),
          stackTrace,
        );
      case 'dart.io.SignalException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.SignalException>(errorValue),
          stackTrace,
        );
      case 'dart.io.ProcessException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.ProcessException>(errorValue),
          stackTrace,
        );
      case 'dart.io.TlsException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.TlsException>(errorValue),
          stackTrace,
        );
      case 'dart.io.HandshakeException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.HandshakeException>(errorValue),
          stackTrace,
        );
      case 'dart.io.CertificateException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.CertificateException>(errorValue),
          stackTrace,
        );
      case 'dart.io.StdoutException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.StdoutException>(errorValue),
          stackTrace,
        );
      case 'dart.io.StdinException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.StdinException>(errorValue),
          stackTrace,
        );
      case 'dart._http.HttpException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.HttpException>(errorValue),
          stackTrace,
        );
      case 'dart._http.WebSocketException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$io.WebSocketException>(errorValue),
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
      case 'flutter.NetworkImageLoadException':
        Error.throwWithStackTrace(
          _$celest.Serializers.instance
              .deserialize<_$image_provider.NetworkImageLoadException>(
                  errorValue),
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

  @_$celest.CloudFunction(
    api: 'flutter',
    function: 'paintWidget',
  )
  Future<_$typed_data.Uint8List> paintWidget() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/flutter/paint-widget'),
      headers: const {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    final $body = _$celest.JsonUtf8.decode($response.bodyBytes);
    if ($response.statusCode != 200) {
      _throwError(
        code: $response.statusCode,
        body: ($body as Map<String, Object?>),
      );
    }
    return _$celest.Serializers.instance
        .deserialize<_$typed_data.Uint8List>($body);
  }

  @_$celest.CloudFunction(
    api: 'flutter',
    function: 'helloWorld',
  )
  Future<HelloWorld> helloWorld() async {
    final $response = await celest.httpClient.post(
      celest.baseUri.resolve('/flutter/hello-world'),
      headers: const {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    final $body = _$celest.JsonUtf8.decode($response.bodyBytes);
    if ($response.statusCode != 200) {
      _throwError(
        code: $response.statusCode,
        body: ($body as Map<String, Object?>),
      );
    }
    return _$celest.Serializers.instance.deserialize<HelloWorld>($body);
  }
}
