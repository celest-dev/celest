// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i6;
import 'package:celest/src/core/context.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/functions/lib.dart' as _i2;
import 'package:celest_core/src/auth/user.dart' as _i7;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i5;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i4;
import 'package:celest_core/src/serialization/json_value.dart' as _i8;

final class StreamHelloAuthenticatedTarget extends _i1.CloudEventSourceTarget {
  @override
  String get name => 'streamHelloAuthenticated';

  @override
  bool get hasBody => false;

  @override
  Stream<Map<String, Object?>> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async* {
    try {
      await for (final response in _i2.streamHelloAuthenticated(
          user: _i3.context.expect(_i3.ContextKey.principal))) {
        yield {'response': response};
      }
    } on _i4.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.SerializationException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.DeadlineExceededError',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.DataLossError',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnavailableError',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.InternalServerError',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnimplementedError',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.OutOfRangeException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.AbortedException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.FailedPreconditionException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.ResourceExhaustedException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.PermissionDeniedException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.AlreadyExistsException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.NotFoundException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnauthorizedException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.BadRequestException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnknownError',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.CancelledException',
        'details': e.details,
      };
      yield {'error': error};
    } on _i5.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.CloudException',
        'details': e.details,
      };
      yield {'error': error};
    }
  }

  @override
  void init() {
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i7.User, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i7.User.fromJson($serialized);
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i5.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i5.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.CloudException.fromJson($serialized);
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i5.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i5.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i5.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i5.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i5.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i5.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i5.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i5.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i4.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i6.Serializers.instance.put(
      _i6.Serializer.define<_i8.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i8.JsonValue($serialized);
        },
      ),
      const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': StreamHelloAuthenticatedTarget()});
}
