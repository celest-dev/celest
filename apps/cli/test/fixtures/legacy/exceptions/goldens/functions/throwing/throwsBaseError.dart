// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/exceptions.dart' as _i3;

import '../../../functions/throwing.dart' as _i2;

final class ThrowsBaseErrorTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'throwsBaseError';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      _i2.throwsBaseError();
      return (statusCode: 200, body: {'response': null});
    } on _i3.CustomError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i3.CustomError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomError',
            'details': error,
          }
        }
      );
    } on _i3.BaseError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i3.BaseError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'BaseError',
            'details': error,
          }
        }
      );
    } on _i3.CustomException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i3.CustomException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomException',
            'details': error,
          }
        }
      );
    } on _i3.BaseException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i4.Serializers.instance.serialize<_i3.BaseException>(e);
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
        .put(_i4.Serializer.define<_i3.BaseError, Map<String, Object?>>(
      serialize: ($value) => {r'fault': $value.fault},
      deserialize: ($serialized) {
        return _i3.BaseError(($serialized[r'fault'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i3.BaseException, Map<String, Object?>>(
      serialize: ($value) => {r'fault': $value.fault},
      deserialize: ($serialized) {
        return _i3.BaseException(($serialized[r'fault'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i3.CustomError, Map<String, Object?>>(
      serialize: ($value) => {r'fault': $value.fault},
      deserialize: ($serialized) {
        return _i3.CustomError(($serialized[r'fault'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i3.CustomException, Map<String, Object?>>(
      serialize: ($value) => {r'fault': $value.fault},
      deserialize: ($serialized) {
        return _i3.CustomException(($serialized[r'fault'] as String));
      },
    ));
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ThrowsBaseErrorTarget()},
  );
}
