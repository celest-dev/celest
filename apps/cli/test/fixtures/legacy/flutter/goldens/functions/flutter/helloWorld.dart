// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:convert' as _i10;
import 'dart:io' as _i8;
import 'dart:isolate' as _i9;

import 'package:celest/src/core/context.dart' as _i6;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/functions/flutter.dart' as _i3;
import 'package:celest_core/celest_core.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i5;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i12;
import 'package:celest_core/src/serialization/json_value.dart' as _i14;
import 'package:flutter/src/foundation/key.dart' as _i13;
import 'package:flutter/src/painting/image_provider.dart' as _i11;
import 'package:shelf/shelf.dart' as _i2;

final class HelloWorldTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'helloWorld';

  @override
  String get method => 'GET';

  @override
  Future<_i2.Response> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = await _i3.helloWorld();
      return _i2.Response(
        200,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(
            _i4.Serializers.instance.serialize<_i3.HelloWorld>(response)),
      );
    } on _i5.AbortedException catch (e, st) {
      const statusCode = 409;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.AbortedException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i5.AbortedException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.AlreadyExistsException catch (e, st) {
      const statusCode = 409;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.AlreadyExistsException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i5.AlreadyExistsException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on AssertionError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.AssertionError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<AssertionError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.AsyncError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.async.AsyncError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i7.AsyncError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.CancelledException catch (e, st) {
      const statusCode = 499;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.CancelledException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i5.CancelledException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.CertificateException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.io.CertificateException',
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i8.CertificateException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on ConcurrentModificationError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.ConcurrentModificationError',
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<ConcurrentModificationError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.DataLossError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.DataLossError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i5.DataLossError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.DeadlineExceededError catch (e, st) {
      const statusCode = 504;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.DeadlineExceededError',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i5.DeadlineExceededError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.FailedPreconditionException catch (e, st) {
      const statusCode = 412;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.FailedPreconditionException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance
          .serialize<_i5.FailedPreconditionException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.HandshakeException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.io.HandshakeException',
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i8.HandshakeException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.HttpException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart._http.HttpException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i8.HttpException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on IndexError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.IndexError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<IndexError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on IntegerDivisionByZeroException catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.IntegerDivisionByZeroException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<IntegerDivisionByZeroException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.InternalServerError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.InternalServerError',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i5.InternalServerError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.IsolateSpawnException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.isolate.IsolateSpawnException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i9.IsolateSpawnException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i10.JsonUnsupportedObjectError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.convert.JsonUnsupportedObjectError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance
          .serialize<_i10.JsonUnsupportedObjectError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i11.NetworkImageLoadException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'flutter.NetworkImageLoadException',
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i11.NetworkImageLoadException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.NotFoundException catch (e, st) {
      const statusCode = 404;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.NotFoundException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i5.NotFoundException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.OSError catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.io.OSError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i8.OSError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on OutOfMemoryError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.OutOfMemoryError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<OutOfMemoryError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.OutOfRangeException catch (e, st) {
      const statusCode = 416;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.OutOfRangeException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i5.OutOfRangeException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.PathAccessException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.io.PathAccessException',
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i8.PathAccessException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.PathExistsException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.io.PathExistsException',
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i8.PathExistsException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.PathNotFoundException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.io.PathNotFoundException',
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i8.PathNotFoundException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.FileSystemException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.io.FileSystemException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i8.FileSystemException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.PermissionDeniedException catch (e, st) {
      const statusCode = 403;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.PermissionDeniedException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i5.PermissionDeniedException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.ProcessException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.io.ProcessException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i8.ProcessException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on RangeError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.RangeError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<RangeError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on ArgumentError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.ArgumentError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<ArgumentError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.ResourceExhaustedException catch (e, st) {
      const statusCode = 429;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.ResourceExhaustedException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i5.ResourceExhaustedException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i12.SerializationException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.SerializationException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i12.SerializationException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.BadRequestException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.BadRequestException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i5.BadRequestException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on FormatException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.FormatException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<FormatException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.SignalException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.io.SignalException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i8.SignalException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on StackOverflowError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.StackOverflowError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<StackOverflowError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on StateError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.StateError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<StateError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.StdinException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.io.StdinException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i8.StdinException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.StdoutException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.io.StdoutException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i8.StdoutException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.TimeoutException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.async.TimeoutException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i7.TimeoutException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.TlsException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.io.TlsException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i8.TlsException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on TypeError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.TypeError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<TypeError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.UnauthorizedException catch (e, st) {
      const statusCode = 401;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.UnauthorizedException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i5.UnauthorizedException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.UnavailableError catch (e, st) {
      const statusCode = 503;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.UnavailableError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i5.UnavailableError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.UnimplementedError catch (e, st) {
      const statusCode = 501;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.UnimplementedError',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i5.UnimplementedError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on UnimplementedError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.UnimplementedError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<UnimplementedError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.UnknownError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.UnknownError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i5.UnknownError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i5.CloudException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.CloudException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i5.CloudException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on UnsupportedError catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.UnsupportedError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<UnsupportedError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on Error catch (e, st) {
      const statusCode = 500;
      _i6.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.Error',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<Error>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.WebSocketException catch (e, st) {
      const statusCode = 400;
      _i6.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart._http.WebSocketException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i8.WebSocketException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    }
  }

  @override
  void init() {
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i7.AsyncError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'error': $value.error,
        r'stackTrace':
            _i4.Serializers.instance.serialize<StackTrace>($value.stackTrace),
      },
      deserialize: ($serialized) {
        return _i7.AsyncError(
          $serialized[r'error']!,
          _i4.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'stackTrace']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i7.TimeoutException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message,
        if (_i4.Serializers.instance.serialize<Duration?>($value.duration)
            case final duration?)
          r'duration': duration,
      },
      deserialize: ($serialized) {
        return _i7.TimeoutException(
          ($serialized[r'message'] as String?),
          _i4.Serializers.instance
              .deserialize<Duration?>($serialized[r'duration']),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i10.JsonUnsupportedObjectError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.unsupportedObject case final unsupportedObject?)
          r'unsupportedObject': unsupportedObject,
        if ($value.cause case final cause?) r'cause': cause,
        if ($value.partialResult case final partialResult?)
          r'partialResult': partialResult,
      },
      deserialize: ($serialized) {
        return _i10.JsonUnsupportedObjectError(
          $serialized[r'unsupportedObject'],
          cause: $serialized[r'cause'],
          partialResult: ($serialized[r'partialResult'] as String?),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<ArgumentError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'invalidValue': $value.invalidValue,
        if ($value.name case final name?) r'name': name,
        r'message': $value.message,
      },
      deserialize: ($serialized) {
        return ArgumentError(
          $serialized?[r'message'],
          ($serialized?[r'name'] as String?),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<AssertionError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return AssertionError($serialized?[r'message']);
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        ConcurrentModificationError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.modifiedObject case final modifiedObject?)
          r'modifiedObject': modifiedObject
      },
      deserialize: ($serialized) {
        return ConcurrentModificationError($serialized?[r'modifiedObject']);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<Error, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if (_i4.Serializers.instance.serialize<StackTrace?>($value.stackTrace)
            case final stackTrace?)
          r'stackTrace': stackTrace
      },
      deserialize: ($serialized) {
        return Error();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<FormatException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'source': $value.source,
        if ($value.offset case final offset?) r'offset': offset,
      },
      deserialize: ($serialized) {
        return FormatException(
          (($serialized?[r'message'] as String?)) ?? '',
          $serialized?[r'source'],
          ($serialized?[r'offset'] as num?)?.toInt(),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<IndexError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.name case final name?) r'name': name,
        r'message': $value.message,
        if ($value.indexable case final indexable?) r'indexable': indexable,
        r'length': $value.length,
        r'invalidValue': $value.invalidValue,
        r'start': $value.start,
        r'end': $value.end,
      },
      deserialize: ($serialized) {
        return IndexError(
          ($serialized[r'invalidValue'] as num).toInt(),
          $serialized[r'indexable'],
          ($serialized[r'name'] as String?),
          ($serialized[r'message'] as String?),
          ($serialized[r'length'] as num?)?.toInt(),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        IntegerDivisionByZeroException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return IntegerDivisionByZeroException();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return OutOfMemoryError();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<RangeError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.name case final name?) r'name': name,
        r'message': $value.message,
        if ($value.start case final start?) r'start': start,
        if ($value.end case final end?) r'end': end,
        if ($value.invalidValue case final invalidValue?)
          r'invalidValue': invalidValue,
      },
      deserialize: ($serialized) {
        return RangeError($serialized[r'message']);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<StackOverflowError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return StackOverflowError();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<StateError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return StateError(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<TypeError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return TypeError();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<UnsupportedError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return UnsupportedError(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i8.CertificateException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'type': $value.type,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i8.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i8.CertificateException(
          (($serialized?[r'message'] as String?)) ?? '',
          _i4.Serializers.instance
              .deserialize<_i8.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i8.FileSystemException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.path case final path?) r'path': path,
        if (_i4.Serializers.instance.serialize<_i8.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i8.FileSystemException(
          (($serialized?[r'message'] as String?)) ?? '',
          (($serialized?[r'path'] as String?)) ?? '',
          _i4.Serializers.instance
              .deserialize<_i8.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i8.HandshakeException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'type': $value.type,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i8.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i8.HandshakeException(
          (($serialized?[r'message'] as String?)) ?? '',
          _i4.Serializers.instance
              .deserialize<_i8.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i8.HttpException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<Uri?>($value.uri)
            case final uri?)
          r'uri': uri,
      },
      deserialize: ($serialized) {
        return _i8.HttpException(
          ($serialized[r'message'] as String),
          uri: _i4.Serializers.instance.deserialize<Uri?>($serialized[r'uri']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i8.OSError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'errorCode': $value.errorCode,
      },
      deserialize: ($serialized) {
        return _i8.OSError(
          (($serialized?[r'message'] as String?)) ?? '',
          (($serialized?[r'errorCode'] as num?)?.toInt()) ??
              _i8.OSError.noErrorCode,
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i8.PathAccessException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.path case final path?) r'path': path,
        if (_i4.Serializers.instance.serialize<_i8.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i8.PathAccessException(
          ($serialized[r'path'] as String),
          _i4.Serializers.instance
              .deserialize<_i8.OSError>($serialized[r'osError']),
          (($serialized[r'message'] as String?)) ?? '',
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i8.PathExistsException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.path case final path?) r'path': path,
        if (_i4.Serializers.instance.serialize<_i8.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i8.PathExistsException(
          ($serialized[r'path'] as String),
          _i4.Serializers.instance
              .deserialize<_i8.OSError>($serialized[r'osError']),
          (($serialized[r'message'] as String?)) ?? '',
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i8.PathNotFoundException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if ($value.path case final path?) r'path': path,
        if (_i4.Serializers.instance.serialize<_i8.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i8.PathNotFoundException(
          ($serialized[r'path'] as String),
          _i4.Serializers.instance
              .deserialize<_i8.OSError>($serialized[r'osError']),
          (($serialized[r'message'] as String?)) ?? '',
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i8.ProcessException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'executable': $value.executable,
        r'arguments': $value.arguments,
        r'message': $value.message,
        r'errorCode': $value.errorCode,
      },
      deserialize: ($serialized) {
        return _i8.ProcessException(
          ($serialized[r'executable'] as String),
          ($serialized[r'arguments'] as Iterable<Object?>)
              .map((el) => (el as String))
              .toList(),
          (($serialized[r'message'] as String?)) ?? '',
          (($serialized[r'errorCode'] as num?)?.toInt()) ?? 0,
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i8.SignalException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'osError': $value.osError,
      },
      deserialize: ($serialized) {
        return _i8.SignalException(
          ($serialized[r'message'] as String),
          $serialized[r'osError'],
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i8.StdinException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i8.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i8.StdinException(
          ($serialized[r'message'] as String),
          _i4.Serializers.instance
              .deserialize<_i8.OSError?>($serialized[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i8.StdoutException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i8.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i8.StdoutException(
          ($serialized[r'message'] as String),
          _i4.Serializers.instance
              .deserialize<_i8.OSError?>($serialized[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i8.TlsException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'type': $value.type,
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i8.OSError?>($value.osError)
            case final osError?)
          r'osError': osError,
      },
      deserialize: ($serialized) {
        return _i8.TlsException(
          (($serialized?[r'message'] as String?)) ?? '',
          _i4.Serializers.instance
              .deserialize<_i8.OSError?>($serialized?[r'osError']),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i8.WebSocketException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return _i8.WebSocketException(
            (($serialized?[r'message'] as String?)) ?? '');
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.IsolateSpawnException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return _i9.IsolateSpawnException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i3.HelloWorld, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if (_i4.Serializers.instance.serialize<_i13.Key?>($value.key)
            case final key?)
          r'key': key
      },
      deserialize: ($serialized) {
        return _i3.HelloWorld(
            key: _i4.Serializers.instance
                .deserialize<_i13.Key?>($serialized?[r'key']));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.AbortedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.CancelledException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.CloudException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.CloudException.fromJson($serialized);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.DataLossError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i5.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i5.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i5.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.UnknownError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i5.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i12.SerializationException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i12.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i14.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i14.JsonValue($serialized);
        },
      ),
      const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
    );
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i13.Key, Map<String, Object?>>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return _i13.Key(($serialized[r'value'] as String));
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i11.NetworkImageLoadException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'statusCode': $value.statusCode,
        r'uri': _i4.Serializers.instance.serialize<Uri>($value.uri),
      },
      deserialize: ($serialized) {
        return _i11.NetworkImageLoadException(
          statusCode: ($serialized[r'statusCode'] as num).toInt(),
          uri: _i4.Serializers.instance.deserialize<Uri>($serialized[r'uri']),
        );
      },
    ));
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': HelloWorldTarget()});
}
