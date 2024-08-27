// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/_common.dart' as _i5;
import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/overrides.dart' as _i3;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i7;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i6;
import 'package:celest_core/src/serialization/json_value.dart' as _i8;

import '../../../functions/overrides.dart' as _i2;

final class CallsThrowsCommonOverriddenExceptionTarget
    extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'callsThrowsCommonOverriddenException';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, String> context,
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      _i2.callsThrowsCommonOverriddenException();
      return (statusCode: 200, body: {'response': null});
    } on _i3.OverriddenException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'api.OverriddenException',
        'details':
            _i4.Serializers.instance.serialize<_i3.OverriddenException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.CommonException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': '_common.CommonException',
        'details': _i4.Serializers.instance.serialize<_i5.CommonException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.CustomException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': '_common.CustomException',
        'details': _i4.Serializers.instance.serialize<_i5.CustomException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnimplementedError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.FailedPreconditionException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.PermissionDeniedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.AlreadyExistsException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.NotFoundException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.BadRequestException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.CancelledException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.CloudException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    }
  }

  @override
  void init() {
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.CommonException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i5.CommonException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.CustomException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i5.CustomException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i3.OverriddenException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return (_i5.OverriddenException(($serialized[r'message'] as String))
            as _i3.OverriddenException);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i7.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i7.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i7.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i7.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i7.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.CloudException.fromJson($serialized);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i7.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i7.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i7.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i7.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i7.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i7.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i7.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i7.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i7.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i7.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i7.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i7.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
        r'details': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i8.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i8.JsonValue($serialized);
        },
      ),
      const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': CallsThrowsCommonOverriddenExceptionTarget()});
}
