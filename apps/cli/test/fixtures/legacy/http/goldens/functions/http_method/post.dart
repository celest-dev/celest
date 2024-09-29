// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/functions/http_method.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i5;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i4;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i3;
import 'package:celest_core/src/serialization/json_value.dart' as _i6;

final class PostTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'post';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      await _i2.post();
      return (statusCode: 200, body: {'response': null});
    } on _i3.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnimplementedError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.FailedPreconditionException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.PermissionDeniedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AlreadyExistsException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.NotFoundException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.BadRequestException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CancelledException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CloudException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    }
  }

  @override
  void init() {
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i4.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i6.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i6.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i6.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i6.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i4.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.CloudException.fromJson($serialized);
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i4.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i6.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i6.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i4.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i6.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i6.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i4.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i6.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i6.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i4.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i6.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(_i5.Serializer.define<
        _i4.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i6.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i6.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i4.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i6.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i4.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i5.Serializers.instance
        .put(_i5.Serializer.define<_i4.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i5.Serializers.instance.deserialize<_i6.JsonValue?>(
            $serialized[r'details'],
            const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i5.Serializers.instance.put(
        _i5.Serializer.define<_i3.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
        r'details': _i5.Serializers.instance.serialize<_i6.JsonValue?>(
          $value.details,
          const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i3.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i5.Serializers.instance.put(
      _i5.Serializer.define<_i6.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i6.JsonValue($serialized);
        },
      ),
      const _i5.TypeToken<_i6.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': PostTarget()});
}
