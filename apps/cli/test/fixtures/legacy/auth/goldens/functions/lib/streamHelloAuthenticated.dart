// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:convert' as _i8;

import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/core/context.dart' as _i2;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/functions/lib.dart' as _i4;
import 'package:celest_core/celest_core.dart' as _i6;
import 'package:celest_core/src/auth/user.dart' as _i10;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i5;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i9;
import 'package:celest_core/src/serialization/json_value.dart' as _i11;

final class StreamHelloAuthenticatedTarget extends _i1.CloudEventSourceTarget {
  @override
  String get name => 'streamHelloAuthenticated';

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
          required: true,
        )
      ];

  @override
  bool get hasBody => false;

  @override
  Stream<Object?> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async* {
    try {
      await for (final response in _i4.streamHelloAuthenticated(
          user: _i2.context.expect(_i2.ContextKey.principal))) {
        yield response;
      }
    } on _i5.AbortedException catch (e, st) {
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
      final error = _i6.Serializers.instance.serialize<_i5.AbortedException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.AlreadyExistsException catch (e, st) {
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
          _i6.Serializers.instance.serialize<_i5.AlreadyExistsException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
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
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i7.AsyncError catch (e, st) {
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
      final error = _i6.Serializers.instance.serialize<_i7.AsyncError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.CancelledException catch (e, st) {
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
          _i6.Serializers.instance.serialize<_i5.CancelledException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
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
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.DataLossError catch (e, st) {
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
      final error = _i6.Serializers.instance.serialize<_i5.DataLossError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.DeadlineExceededError catch (e, st) {
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
          _i6.Serializers.instance.serialize<_i5.DeadlineExceededError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.FailedPreconditionException catch (e, st) {
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
          .serialize<_i5.FailedPreconditionException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
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
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
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
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.InternalServerError catch (e, st) {
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
          _i6.Serializers.instance.serialize<_i5.InternalServerError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i8.JsonUnsupportedObjectError catch (e, st) {
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
          _i6.Serializers.instance.serialize<_i8.JsonUnsupportedObjectError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.NotFoundException catch (e, st) {
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
          _i6.Serializers.instance.serialize<_i5.NotFoundException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
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
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.OutOfRangeException catch (e, st) {
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
          _i6.Serializers.instance.serialize<_i5.OutOfRangeException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.PermissionDeniedException catch (e, st) {
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
          _i6.Serializers.instance.serialize<_i5.PermissionDeniedException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
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
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
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
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.ResourceExhaustedException catch (e, st) {
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
          _i6.Serializers.instance.serialize<_i5.ResourceExhaustedException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i9.SerializationException catch (e, st) {
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
          _i6.Serializers.instance.serialize<_i9.SerializationException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.BadRequestException catch (e, st) {
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
          _i6.Serializers.instance.serialize<_i5.BadRequestException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
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
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
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
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
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
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i7.TimeoutException catch (e, st) {
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
      final error = _i6.Serializers.instance.serialize<_i7.TimeoutException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
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
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.UnauthorizedException catch (e, st) {
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
          _i6.Serializers.instance.serialize<_i5.UnauthorizedException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.UnavailableError catch (e, st) {
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
      final error = _i6.Serializers.instance.serialize<_i5.UnavailableError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.UnimplementedError catch (e, st) {
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
          _i6.Serializers.instance.serialize<_i5.UnimplementedError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
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
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.UnknownError catch (e, st) {
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
      final error = _i6.Serializers.instance.serialize<_i5.UnknownError>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    } on _i5.CloudException catch (e, st) {
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
      final error = _i6.Serializers.instance.serialize<_i5.CloudException>(e);
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
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
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
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
      yield {
        '@error': meta,
        ...error is Map<String, Object?> ? error : {'@': error},
      };
    }
  }

  @override
  void init() {
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i7.AsyncError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'error': $value.error,
        r'stackTrace':
            _i6.Serializers.instance.serialize<StackTrace>($value.stackTrace),
      },
      deserialize: ($serialized) {
        return _i7.AsyncError(
          $serialized[r'error']!,
          _i6.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'stackTrace']),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i7.TimeoutException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'duration':
            _i6.Serializers.instance.serialize<Duration?>($value.duration),
      },
      deserialize: ($serialized) {
        return _i7.TimeoutException(
          ($serialized[r'message'] as String?),
          _i6.Serializers.instance
              .deserialize<Duration?>($serialized[r'duration']),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i8.JsonUnsupportedObjectError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'unsupportedObject': $value.unsupportedObject,
        r'cause': $value.cause,
        r'partialResult': $value.partialResult,
      },
      deserialize: ($serialized) {
        return _i8.JsonUnsupportedObjectError(
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
        .put(_i6.Serializer.define<_i10.User, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i10.User.fromJson($serialized);
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i5.AbortedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.CancelledException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i5.CloudException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.CloudException.fromJson($serialized);
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i5.DataLossError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i5.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i5.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i5.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i5.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i5.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i5.UnknownError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i11.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i9.SerializationException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i11.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i6.Serializers.instance.put(
      _i6.Serializer.define<_i11.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i11.JsonValue($serialized);
        },
      ),
      const _i6.TypeToken<_i11.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': StreamHelloAuthenticatedTarget()});
}
