// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/src/models/errors_and_exceptions.dart' as _i7;
import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/overrides.dart' as _i6;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i5;
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
      final error =
          _i4.Serializers.instance.serialize<_i3.SerializationException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'SerializationException',
            'details': error,
          }
        }
      );
    } on _i5.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i5.InternalServerError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'InternalServerError',
            'details': error,
          }
        }
      );
    } on _i5.UnauthorizedException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i5.UnauthorizedException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'UnauthorizedException',
            'details': error,
          }
        }
      );
    } on _i5.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i5.BadRequestException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'BadRequestException',
            'details': error,
          }
        }
      );
    } on _i6.UserException_ShowInConsole catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i4.Serializers.instance
          .serialize<_i6.UserException_ShowInConsole>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'UserException_ShowInConsole',
            'details': error,
          }
        }
      );
    } on _i7.ValidateError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i7.ValidateError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'ValidateError',
            'details': error,
          }
        }
      );
    } on _i6.NotYetImplementedError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i6.NotYetImplementedError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'NotYetImplementedError',
            'details': error,
          }
        }
      );
    } on _i6.AppException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i6.AppException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'AppException',
            'details': error,
          }
        }
      );
    } on _i6.AppError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i6.AppError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'AppError',
            'details': error,
          }
        }
      );
    } on _i6.UserException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i6.UserException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'UserException',
            'details': error,
          }
        }
      );
    }
  }

  @override
  void init() {
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i7.ValidateError, Map<String, Object?>>(
      serialize: ($value) => {r'msg': $value.msg},
      deserialize: ($serialized) {
        return _i7.ValidateError(($serialized[r'msg'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.AppError, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i6.AppError.fromJson($serialized);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.AppException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'error': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.error,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
        r'msg': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.msg,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return (_i7.AppException(
          $serialized?[r'msg'],
          $serialized?[r'error'],
        ) as _i6.AppException);
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i6.NotYetImplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'message': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.message,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.NotYetImplementedError(
            _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
          $serialized?[r'message'],
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.UserException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'code': $value.code,
        r'cause': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.cause,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UserException(
          msg: ($serialized?[r'msg'] as String?),
          cause: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized?[r'cause'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i6.UserException_ShowInConsole, Map<String, Object?>>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'code': $value.code,
        r'cause': _i4.Serializers.instance.serialize<_i8.JsonValue?>(
          $value.cause,
          const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UserException_ShowInConsole(
          msg: ($serialized[r'msg'] as String),
          cause: _i4.Serializers.instance.deserialize<_i8.JsonValue?>(
            $serialized[r'cause'],
            const _i4.TypeToken<_i8.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i5.BadRequestException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i5.InternalServerError(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.UnauthorizedException, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i5.UnauthorizedException(
            (($serialized?[r'message'] as String?)) ?? 'Unauthorized');
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i3.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
      },
      deserialize: ($serialized) {
        return _i3.SerializationException(($serialized[r'message'] as String));
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
  await _i1.serve(targets: {'/': ThrowsValidateErrorTarget()});
}
