// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/src/models/errors_and_exceptions.dart' as _i8;
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/overrides.dart' as _i7;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;
import 'package:celest_core/src/serialization/json_value.dart' as _i4;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsAppErrorTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'throwsAppError';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      _i2.throwsAppError(
        message: ((request[r'message'] as String?)) ?? 'message',
        error: _i3.Serializers.instance.deserialize<_i4.JsonValue?>(
          request[r'error'],
          const _i3.TypeToken<_i4.JsonValue?>('JsonValue'),
        ),
      );
      return (statusCode: 200, body: {'response': null});
    } on _i5.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.SerializationException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'SerializationException',
            'details': error,
          }
        }
      );
    } on _i6.InternalServerException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i6.InternalServerException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'InternalServerException',
            'details': error,
          }
        }
      );
    } on _i6.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i6.BadRequestException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'BadRequestException',
            'details': error,
          }
        }
      );
    } on _i7.UserException_ShowInConsole catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance
          .serialize<_i7.UserException_ShowInConsole>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'UserException_ShowInConsole',
            'details': error,
          }
        }
      );
    } on _i8.ValidateError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i8.ValidateError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'ValidateError',
            'details': error,
          }
        }
      );
    } on _i7.NotYetImplementedError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.NotYetImplementedError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'NotYetImplementedError',
            'details': error,
          }
        }
      );
    } on _i7.AppException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i7.AppException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'AppException',
            'details': error,
          }
        }
      );
    } on _i7.AppError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i7.AppError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'AppError',
            'details': error,
          }
        }
      );
    } on _i7.UserException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i7.UserException>(e);
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
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i8.ValidateError, Map<String, Object?>>(
      serialize: ($value) => {r'msg': $value.msg},
      deserialize: ($serialized) {
        return _i8.ValidateError(($serialized[r'msg'] as String));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.AppError, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i7.AppError.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.AppException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'error': _i3.Serializers.instance.serialize<_i4.JsonValue?>(
          $value.error,
          const _i3.TypeToken<_i4.JsonValue?>('JsonValue'),
        ),
        r'msg': _i3.Serializers.instance.serialize<_i4.JsonValue?>(
          $value.msg,
          const _i3.TypeToken<_i4.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return (_i8.AppException(
          $serialized?[r'msg'],
          $serialized?[r'error'],
        ) as _i7.AppException);
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i7.NotYetImplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'message': _i3.Serializers.instance.serialize<_i4.JsonValue?>(
          $value.message,
          const _i3.TypeToken<_i4.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.NotYetImplementedError(
            _i3.Serializers.instance.deserialize<_i4.JsonValue?>(
          $serialized?[r'message'],
          const _i3.TypeToken<_i4.JsonValue?>('JsonValue'),
        ));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.UserException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'code': $value.code,
        r'cause': _i3.Serializers.instance.serialize<_i4.JsonValue?>(
          $value.cause,
          const _i3.TypeToken<_i4.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UserException(
          msg: ($serialized?[r'msg'] as String?),
          cause: _i3.Serializers.instance.deserialize<_i4.JsonValue?>(
            $serialized?[r'cause'],
            const _i3.TypeToken<_i4.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i7.UserException_ShowInConsole, Map<String, Object?>>(
      serialize: ($value) => {
        r'msg': $value.msg,
        r'code': $value.code,
        r'cause': _i3.Serializers.instance.serialize<_i4.JsonValue?>(
          $value.cause,
          const _i3.TypeToken<_i4.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i7.UserException_ShowInConsole(
          msg: ($serialized[r'msg'] as String),
          cause: _i3.Serializers.instance.deserialize<_i4.JsonValue?>(
            $serialized[r'cause'],
            const _i3.TypeToken<_i4.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i6.BadRequestException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.InternalServerException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i6.InternalServerException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
      },
      deserialize: ($serialized) {
        return _i5.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
      _i3.Serializer.define<_i4.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i4.JsonValue($serialized);
        },
      ),
      const _i3.TypeToken<_i4.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ThrowsAppErrorTarget()},
  );
}
