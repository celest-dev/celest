// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i9;

import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/core/context.dart' as _i2;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/functions/lib.dart' as _i5;
import 'package:celest_core/celest_core.dart' as _i6;
import 'package:celest_core/src/auth/user.dart' as _i11;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i7;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i10;
import 'package:celest_core/src/serialization/json_value.dart' as _i12;
import 'package:shelf/shelf.dart' as _i4;

final class SayHelloPublicTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'sayHelloPublic';

  @override
  List<_i1.Middleware> get middlewares => [
        _i1.AuthMiddleware.oneOf(
          [
            _i1.FirebaseAuthMiddleware(
              projectId:
                  _i2.context.expect(const _i3.env('FIREBASE_PROJECT_ID')),
              required: false,
            ),
            _i1.SupabaseAuthMiddleware(
              url: _i2.context.expect(const _i3.env('SUPABASE_URL')),
              required: false,
            ),
          ],
          required: false,
        )
      ];

  @override
  String get method => 'POST';

  @override
  Future<_i4.Response> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = await _i5.sayHelloPublic(
          user: _i2.context.get(_i2.ContextKey.principal));
      return _i4.Response(
        200,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode(response),
      );
    } on _i7.AbortedException catch (e, st) {
      const statusCode = 409;
      _i2.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.AbortedException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<_i7.AbortedException>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.AlreadyExistsException catch (e, st) {
      const statusCode = 409;
      _i2.context.logger.severe(
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
          _i6.Serializers.instance.serialize<_i7.AlreadyExistsException>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on AssertionError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.AssertionError',
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<AssertionError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.AsyncError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.async.AsyncError',
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<_i8.AsyncError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.CancelledException catch (e, st) {
      const statusCode = 499;
      _i2.context.logger.severe(
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
          _i6.Serializers.instance.serialize<_i7.CancelledException>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on ConcurrentModificationError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.ConcurrentModificationError',
        'status': statusCode,
      };
      final error =
          _i6.Serializers.instance.serialize<ConcurrentModificationError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.DataLossError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.DataLossError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<_i7.DataLossError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.DeadlineExceededError catch (e, st) {
      const statusCode = 504;
      _i2.context.logger.severe(
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
          _i6.Serializers.instance.serialize<_i7.DeadlineExceededError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.FailedPreconditionException catch (e, st) {
      const statusCode = 412;
      _i2.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.FailedPreconditionException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i6.Serializers.instance
          .serialize<_i7.FailedPreconditionException>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on IndexError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.IndexError',
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<IndexError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on IntegerDivisionByZeroException catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
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
          _i6.Serializers.instance.serialize<IntegerDivisionByZeroException>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.InternalServerError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
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
          _i6.Serializers.instance.serialize<_i7.InternalServerError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.JsonUnsupportedObjectError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.convert.JsonUnsupportedObjectError',
        'status': statusCode,
      };
      final error =
          _i6.Serializers.instance.serialize<_i9.JsonUnsupportedObjectError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.NotFoundException catch (e, st) {
      const statusCode = 404;
      _i2.context.logger.severe(
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
          _i6.Serializers.instance.serialize<_i7.NotFoundException>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on OutOfMemoryError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.OutOfMemoryError',
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<OutOfMemoryError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.OutOfRangeException catch (e, st) {
      const statusCode = 416;
      _i2.context.logger.severe(
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
          _i6.Serializers.instance.serialize<_i7.OutOfRangeException>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.PermissionDeniedException catch (e, st) {
      const statusCode = 403;
      _i2.context.logger.severe(
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
          _i6.Serializers.instance.serialize<_i7.PermissionDeniedException>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on RangeError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.RangeError',
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<RangeError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on ArgumentError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.ArgumentError',
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<ArgumentError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.ResourceExhaustedException catch (e, st) {
      const statusCode = 429;
      _i2.context.logger.severe(
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
          _i6.Serializers.instance.serialize<_i7.ResourceExhaustedException>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i10.SerializationException catch (e, st) {
      const statusCode = 400;
      _i2.context.logger.severe(
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
          _i6.Serializers.instance.serialize<_i10.SerializationException>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.BadRequestException catch (e, st) {
      const statusCode = 400;
      _i2.context.logger.severe(
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
          _i6.Serializers.instance.serialize<_i7.BadRequestException>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on FormatException catch (e, st) {
      const statusCode = 400;
      _i2.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.FormatException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<FormatException>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on StackOverflowError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.StackOverflowError',
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<StackOverflowError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on StateError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.StateError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<StateError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i8.TimeoutException catch (e, st) {
      const statusCode = 400;
      _i2.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.async.TimeoutException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<_i8.TimeoutException>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on TypeError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.TypeError',
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<TypeError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.UnauthorizedException catch (e, st) {
      const statusCode = 401;
      _i2.context.logger.severe(
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
          _i6.Serializers.instance.serialize<_i7.UnauthorizedException>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.UnavailableError catch (e, st) {
      const statusCode = 503;
      _i2.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.UnavailableError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<_i7.UnavailableError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.UnimplementedError catch (e, st) {
      const statusCode = 501;
      _i2.context.logger.severe(
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
          _i6.Serializers.instance.serialize<_i7.UnimplementedError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on UnimplementedError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.UnimplementedError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<UnimplementedError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.UnknownError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.UnknownError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<_i7.UnknownError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i7.CloudException catch (e, st) {
      const statusCode = 400;
      _i2.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.CloudException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<_i7.CloudException>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on UnsupportedError catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.UnsupportedError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<UnsupportedError>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on Error catch (e, st) {
      const statusCode = 500;
      _i2.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.Error',
        'status': statusCode,
      };
      final error = _i6.Serializers.instance.serialize<Error>(e);
      return _i4.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i6.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    }
  }

  @override
  void init() {
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i8.AsyncError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'error': $value.error,
        r'stackTrace':
            _i6.Serializers.instance.serialize<StackTrace>($value.stackTrace),
      },
      deserialize: ($serialized) {
        return _i8.AsyncError(
          $serialized[r'error']!,
          _i6.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'stackTrace']),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i8.TimeoutException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'duration':
            _i6.Serializers.instance.serialize<Duration?>($value.duration),
      },
      deserialize: ($serialized) {
        return _i8.TimeoutException(
          ($serialized[r'message'] as String?),
          _i6.Serializers.instance
              .deserialize<Duration?>($serialized[r'duration']),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i9.JsonUnsupportedObjectError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'unsupportedObject': $value.unsupportedObject,
        r'cause': $value.cause,
        r'partialResult': $value.partialResult,
      },
      deserialize: ($serialized) {
        return _i9.JsonUnsupportedObjectError(
          $serialized[r'unsupportedObject'],
          cause: $serialized[r'cause'],
          partialResult: ($serialized[r'partialResult'] as String?),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<ArgumentError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'invalidValue': $value.invalidValue,
        r'name': $value.name,
        r'message': $value.message,
      },
      deserialize: ($serialized) {
        return ArgumentError(
          $serialized?[r'message'],
          ($serialized?[r'name'] as String?),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<AssertionError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return AssertionError($serialized?[r'message']);
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        ConcurrentModificationError, Map<String, Object?>?>(
      serialize: ($value) =>
          <String, Object?>{r'modifiedObject': $value.modifiedObject},
      deserialize: ($serialized) {
        return ConcurrentModificationError($serialized?[r'modifiedObject']);
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<Error, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'stackTrace':
            _i6.Serializers.instance.serialize<StackTrace?>($value.stackTrace)
      },
      deserialize: ($serialized) {
        return Error();
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<FormatException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'source': $value.source,
        r'offset': $value.offset,
      },
      deserialize: ($serialized) {
        return FormatException(
          (($serialized?[r'message'] as String?)) ?? '',
          $serialized?[r'source'],
          ($serialized?[r'offset'] as num?)?.toInt(),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<IndexError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'name': $value.name,
        r'message': $value.message,
        r'indexable': $value.indexable,
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
    _i6.Serializers.instance.put(_i6.Serializer.define<
        IntegerDivisionByZeroException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return IntegerDivisionByZeroException();
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return OutOfMemoryError();
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<RangeError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'name': $value.name,
        r'message': $value.message,
        r'start': $value.start,
        r'end': $value.end,
        r'invalidValue': $value.invalidValue,
      },
      deserialize: ($serialized) {
        return RangeError($serialized[r'message']);
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<StackOverflowError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return StackOverflowError();
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<StateError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return StateError(($serialized[r'message'] as String));
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<TypeError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return TypeError();
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<UnsupportedError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return UnsupportedError(($serialized[r'message'] as String));
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i11.User, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i11.User.fromJson($serialized);
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i7.AbortedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i7.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i7.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i7.CancelledException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i7.CloudException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.CloudException.fromJson($serialized);
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i7.DataLossError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i7.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i7.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i7.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i7.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i7.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i7.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i7.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i7.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i7.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i7.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i7.UnknownError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i10.SerializationException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i10.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i6.Serializers.instance.put(
      _i6.Serializer.define<_i12.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i12.JsonValue($serialized);
        },
      ),
      const _i6.TypeToken<_i12.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': SayHelloPublicTarget()});
}
