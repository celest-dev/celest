// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i9;

import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/core/context.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/functions/lib.dart' as _i5;
import 'package:celest_core/celest_core.dart' as _i7;
import 'package:celest_core/src/auth/user.dart' as _i11;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i10;
import 'package:celest_core/src/serialization/json_value.dart' as _i12;
import 'package:shelf/shelf.dart' as _i2;

final class StreamHelloPublicTarget extends _i1.CloudEventSourceTarget {
  @override
  String get name => 'streamHelloPublic';

  @override
  List<_i2.Middleware> get middlewares => [
        _i1.AuthMiddleware.oneOf(
          [
            _i1.FirebaseAuthMiddleware(
              projectId:
                  _i3.context.expect(const _i4.env('FIREBASE_PROJECT_ID')),
              required: false,
            ),
            _i1.SupabaseAuthMiddleware(
              url: _i3.context.expect(const _i4.env('SUPABASE_URL')),
              required: false,
            ),
          ],
          required: false,
        )
      ];

  @override
  bool get hasBody => false;

  @override
  Stream<Map<String, Object?>> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async* {
    try {
      await for (final response in _i5.streamHelloPublic(
          user: _i3.context.get(_i3.ContextKey.principal))) {
        yield {'response': response};
      }
    } on _i6.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AbortedException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i6.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AlreadyExistsException',
        'details': e.details,
      };
      yield {'error': error};
    } on AssertionError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.AssertionError',
        'details': _i7.Serializers.instance.serialize<AssertionError>(e),
      };
      yield {'error': error};
    } on _i8.AsyncError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.async.AsyncError',
        'details': _i7.Serializers.instance.serialize<_i8.AsyncError>(e),
      };
      yield {'error': error};
    } on _i6.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CancelledException',
        'details': e.details,
      };
      yield {'error': error};
    } on ConcurrentModificationError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.ConcurrentModificationError',
        'details':
            _i7.Serializers.instance.serialize<ConcurrentModificationError>(e),
      };
      yield {'error': error};
    } on _i6.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DataLossError',
        'details': e.details,
      };
      yield {'error': error};
    } on _i6.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DeadlineExceededError',
        'details': e.details,
      };
      yield {'error': error};
    } on _i6.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.FailedPreconditionException',
        'details': e.details,
      };
      yield {'error': error};
    } on IndexError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.IndexError',
        'details': _i7.Serializers.instance.serialize<IndexError>(e),
      };
      yield {'error': error};
    } on IntegerDivisionByZeroException catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.IntegerDivisionByZeroException',
        'details': _i7.Serializers.instance
            .serialize<IntegerDivisionByZeroException>(e),
      };
      yield {'error': error};
    } on _i6.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.InternalServerError',
        'details': e.details,
      };
      yield {'error': error};
    } on _i9.JsonUnsupportedObjectError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.convert.JsonUnsupportedObjectError',
        'details': _i7.Serializers.instance
            .serialize<_i9.JsonUnsupportedObjectError>(e),
      };
      yield {'error': error};
    } on _i6.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.NotFoundException',
        'details': e.details,
      };
      yield {'error': error};
    } on OutOfMemoryError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.OutOfMemoryError',
        'details': _i7.Serializers.instance.serialize<OutOfMemoryError>(e),
      };
      yield {'error': error};
    } on _i6.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.OutOfRangeException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i6.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.PermissionDeniedException',
        'details': e.details,
      };
      yield {'error': error};
    } on RangeError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.RangeError',
        'details': _i7.Serializers.instance.serialize<RangeError>(e),
      };
      yield {'error': error};
    } on ArgumentError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.ArgumentError',
        'details': _i7.Serializers.instance.serialize<ArgumentError>(e),
      };
      yield {'error': error};
    } on _i6.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.ResourceExhaustedException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i10.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.SerializationException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i6.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.BadRequestException',
        'details': e.details,
      };
      yield {'error': error};
    } on FormatException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.FormatException',
        'details': _i7.Serializers.instance.serialize<FormatException>(e),
      };
      yield {'error': error};
    } on StackOverflowError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.StackOverflowError',
        'details': _i7.Serializers.instance.serialize<StackOverflowError>(e),
      };
      yield {'error': error};
    } on StateError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.StateError',
        'details': _i7.Serializers.instance.serialize<StateError>(e),
      };
      yield {'error': error};
    } on _i8.TimeoutException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.async.TimeoutException',
        'details': _i7.Serializers.instance.serialize<_i8.TimeoutException>(e),
      };
      yield {'error': error};
    } on TypeError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.TypeError',
        'details': _i7.Serializers.instance.serialize<TypeError>(e),
      };
      yield {'error': error};
    } on _i6.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnauthorizedException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i6.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnavailableError',
        'details': e.details,
      };
      yield {'error': error};
    } on _i6.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnimplementedError',
        'details': e.details,
      };
      yield {'error': error};
    } on UnimplementedError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.UnimplementedError',
        'details': _i7.Serializers.instance.serialize<UnimplementedError>(e),
      };
      yield {'error': error};
    } on _i6.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnknownError',
        'details': e.details,
      };
      yield {'error': error};
    } on _i6.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CloudException',
        'details': e.details,
      };
      yield {'error': error};
    } on UnsupportedError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.UnsupportedError',
        'details': _i7.Serializers.instance.serialize<UnsupportedError>(e),
      };
      yield {'error': error};
    } on Error catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.Error',
        'details': _i7.Serializers.instance.serialize<Error>(e),
      };
      yield {'error': error};
    }
  }

  @override
  void init() {
    _i7.Serializers.instance
        .put(_i7.Serializer.define<_i8.AsyncError, Map<String, Object?>>(
      serialize: ($value) => {
        r'error': $value.error,
        r'stackTrace':
            _i7.Serializers.instance.serialize<StackTrace>($value.stackTrace),
      },
      deserialize: ($serialized) {
        return _i8.AsyncError(
          $serialized[r'error']!,
          _i7.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'stackTrace']),
        );
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<_i8.TimeoutException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'duration':
            _i7.Serializers.instance.serialize<Duration?>($value.duration),
      },
      deserialize: ($serialized) {
        return _i8.TimeoutException(
          ($serialized[r'message'] as String?),
          _i7.Serializers.instance
              .deserialize<Duration?>($serialized[r'duration']),
        );
      },
    ));
    _i7.Serializers.instance.put(_i7.Serializer.define<
        _i9.JsonUnsupportedObjectError, Map<String, Object?>>(
      serialize: ($value) => {
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
    _i7.Serializers.instance
        .put(_i7.Serializer.define<ArgumentError, Map<String, Object?>?>(
      serialize: ($value) => {
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
    _i7.Serializers.instance
        .put(_i7.Serializer.define<AssertionError, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return AssertionError($serialized?[r'message']);
      },
    ));
    _i7.Serializers.instance.put(_i7.Serializer.define<
        ConcurrentModificationError, Map<String, Object?>?>(
      serialize: ($value) => {r'modifiedObject': $value.modifiedObject},
      deserialize: ($serialized) {
        return ConcurrentModificationError($serialized?[r'modifiedObject']);
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<Error, Map<String, Object?>?>(
      serialize: ($value) => {
        r'stackTrace':
            _i7.Serializers.instance.serialize<StackTrace?>($value.stackTrace)
      },
      deserialize: ($serialized) {
        return Error();
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<FormatException, Map<String, Object?>?>(
      serialize: ($value) => {
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
    _i7.Serializers.instance
        .put(_i7.Serializer.define<IndexError, Map<String, Object?>>(
      serialize: ($value) => {
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
    _i7.Serializers.instance.put(_i7.Serializer.define<
        IntegerDivisionByZeroException, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return IntegerDivisionByZeroException();
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return OutOfMemoryError();
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<RangeError, Map<String, Object?>>(
      serialize: ($value) => {
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
    _i7.Serializers.instance
        .put(_i7.Serializer.define<StackOverflowError, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return StackOverflowError();
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<StateError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return StateError(($serialized[r'message'] as String));
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<TypeError, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return TypeError();
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<UnsupportedError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return UnsupportedError(($serialized[r'message'] as String));
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<_i11.User, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i11.User.fromJson($serialized);
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<_i6.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i7.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i7.Serializers.instance.put(
        _i7.Serializer.define<_i6.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i7.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i7.Serializers.instance.put(
        _i7.Serializer.define<_i6.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i7.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i7.Serializers.instance.put(
        _i7.Serializer.define<_i6.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i7.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<_i6.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.CloudException.fromJson($serialized);
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<_i6.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i7.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i7.Serializers.instance.put(
        _i7.Serializer.define<_i6.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i7.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i7.Serializers.instance.put(_i7.Serializer.define<
        _i6.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i7.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i7.Serializers.instance.put(
        _i7.Serializer.define<_i6.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i7.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<_i6.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i7.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i7.Serializers.instance.put(
        _i7.Serializer.define<_i6.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i7.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i7.Serializers.instance.put(_i7.Serializer.define<
        _i6.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i7.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i7.Serializers.instance.put(_i7.Serializer.define<
        _i6.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i7.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i7.Serializers.instance.put(
        _i7.Serializer.define<_i6.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i7.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<_i6.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i7.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i7.Serializers.instance.put(
        _i7.Serializer.define<_i6.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i7.Serializers.instance
        .put(_i7.Serializer.define<_i6.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i7.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i7.Serializers.instance.put(_i7.Serializer.define<
        _i10.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
        r'details': _i7.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i10.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i7.Serializers.instance.put(
      _i7.Serializer.define<_i12.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i12.JsonValue($serialized);
        },
      ),
      const _i7.TypeToken<_i12.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': StreamHelloPublicTarget()});
}
