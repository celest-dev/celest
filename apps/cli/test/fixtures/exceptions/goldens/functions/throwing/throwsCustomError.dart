// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/_common.dart' as _i3;
import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions.dart' as _i5;

import '../../../functions/throwing.dart' as _i2;

final class ThrowsCustomErrorTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'throwsCustomError';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      _i2.throwsCustomError();
      return (statusCode: 200, body: {'response': null});
    } on _i3.CommonException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i3.CommonException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CommonException',
            'details': error,
          }
        }
      );
    } on _i5.CustomError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i5.CustomError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomError',
            'details': error,
          }
        }
      );
    } on _i5.BaseError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i5.BaseError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'BaseError',
            'details': error,
          }
        }
      );
    } on _i5.CustomException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i5.CustomException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomException',
            'details': error,
          }
        }
      );
    } on _i5.BaseException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i5.BaseException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'BaseException',
            'details': error,
          }
        }
      );
    }
  }

  @override
  void init() {
    _i4.Serializers.instance.put(const BaseExceptionSerializer());
    _i4.Serializers.instance.put(const CustomExceptionSerializer());
    _i4.Serializers.instance.put(const BaseErrorSerializer());
    _i4.Serializers.instance.put(const CustomErrorSerializer());
    _i4.Serializers.instance.put(const CommonExceptionSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ThrowsCustomErrorTarget()},
  );
}

final class BaseErrorSerializer extends _i4.Serializer<_i5.BaseError> {
  const BaseErrorSerializer();

  @override
  _i5.BaseError deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.BaseError((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i5.BaseError value) => {r'message': value.message};
}

final class BaseExceptionSerializer extends _i4.Serializer<_i5.BaseException> {
  const BaseExceptionSerializer();

  @override
  _i5.BaseException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.BaseException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i5.BaseException value) => {r'message': value.message};
}

final class CommonExceptionSerializer
    extends _i4.Serializer<_i3.CommonException> {
  const CommonExceptionSerializer();

  @override
  _i3.CommonException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i3.CommonException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i3.CommonException value) => {r'message': value.message};
}

final class CustomErrorSerializer extends _i4.Serializer<_i5.CustomError> {
  const CustomErrorSerializer();

  @override
  _i5.CustomError deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.CustomError((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i5.CustomError value) => {r'message': value.message};
}

final class CustomExceptionSerializer
    extends _i4.Serializer<_i5.CustomException> {
  const CustomExceptionSerializer();

  @override
  _i5.CustomException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.CustomException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i5.CustomException value) => {r'message': value.message};
}
