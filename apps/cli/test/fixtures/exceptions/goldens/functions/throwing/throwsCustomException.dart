// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/_common.dart' as _i3;
import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions.dart' as _i5;

import '../../../functions/throwing.dart' as _i2;

final class ThrowsCustomExceptionTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'throwsCustomException';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      _i2.throwsCustomException();
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
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.BaseException, Map<String, Object?>>(
      serialize: ($value) => {r'fault': $value.fault},
      deserialize: ($serialized) {
        return _i5.BaseException(($serialized[r'fault'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.CustomException, Map<String, Object?>>(
      serialize: ($value) => {r'fault': $value.fault},
      deserialize: ($serialized) {
        return _i5.CustomException(($serialized[r'fault'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.BaseError, Map<String, Object?>>(
      serialize: ($value) => {r'fault': $value.fault},
      deserialize: ($serialized) {
        return _i5.BaseError(($serialized[r'fault'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.CustomError, Map<String, Object?>>(
      serialize: ($value) => {r'fault': $value.fault},
      deserialize: ($serialized) {
        return _i5.CustomError(($serialized[r'fault'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i3.CommonException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i3.CommonException(($serialized[r'message'] as String));
      },
    ));
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ThrowsCustomExceptionTarget()},
  );
}
