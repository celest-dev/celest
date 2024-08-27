// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/src/models/errors_and_exceptions.dart' as _i7;
import 'package:celest/celest.dart' as _i6;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/overrides.dart' as _i5;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i4;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i3;
import 'package:celest_core/src/serialization/json_value.dart' as _i8;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsValidateErrorTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'throwsValidateError';

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
      _i2.throwsValidateError();
      return (statusCode: 200, body: {'response': null});
    } on _i3.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnimplementedError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.FailedPreconditionException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.PermissionDeniedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.AlreadyExistsException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.NotFoundException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.BadRequestException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.CancelledException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i4.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.CloudException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.UserException_ShowInConsole catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'marcelo.UserException_ShowInConsole',
        'details': _i6.Serializers.instance
            .serialize<_i5.UserException_ShowInConsole>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.ValidateError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': '_common.ValidateError',
        'details': _i6.Serializers.instance.serialize<_i7.ValidateError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.NotYetImplementedError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'marcelo.NotYetImplementedError',
        'details':
            _i6.Serializers.instance.serialize<_i5.NotYetImplementedError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.AppException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'marcelo.AppException',
        'details': _i6.Serializers.instance.serialize<_i5.AppException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.AppError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'marcelo.AppError',
        'details': _i6.Serializers.instance.serialize<_i5.AppError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.UserException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': '_common.UserException',
        'details': _i6.Serializers.instance.serialize<_i7.UserException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    }
  }

  @override
  void init() {
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i7.UserException, Map<String, dynamic>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i7.UserException.fromJson($serialized);
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i7.ValidateError, Map<String, Object?>>(
      serialize: ($value) => {r'msg': $value.msg},
      deserialize: ($serialized) {
        return _i7.ValidateError(($serialized[r'msg'] as String));
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i5.AppError, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i5.AppError.fromJson($serialized);
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i5.AppException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'error': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.error,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
        r'msg': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.msg,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return (_i7.AppException(
          $serialized?[r'msg'],
          $serialized?[r'error'],
        ) as _i5.AppException);
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i5.NotYetImplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'message': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.message,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.NotYetImplementedError(
            _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
          $serialized?[r'message'],
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ));
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i5.UserException_ShowInConsole, Map<String, Object?>>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'code': $value.code,
        r'cause': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.cause,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UserException_ShowInConsole(
          msg: ($serialized[r'msg'] as String),
          cause: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'cause'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i4.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i4.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i4.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i4.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i4.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.CloudException.fromJson($serialized);
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i4.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i4.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i4.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i4.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i4.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i4.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i4.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(_i6.Serializer.define<
        _i4.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i4.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i4.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i4.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i6.Serializers.instance
        .put(_i6.Serializer.define<_i4.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i6.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.details,
          const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i4.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i6.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'details'],
            const _i6.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i6.Serializers.instance.put(
        _i6.Serializer.define<_i3.SerializationException, Map<String, Object?>>(
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
        return _i3.SerializationException(($serialized[r'message'] as String));
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
  await _i1.serve(targets: {'/': ThrowsValidateErrorTarget()});
}
