// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/exceptions.dart' as _i3;
import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsCustomExceptionTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'throwsCustomException';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      _i2.throwsCustomException();
      return (statusCode: 200, body: {'response': null});
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
    }
  }

  @override
  void init() {
    _i4.Serializers.instance.put(const CustomExceptionSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ThrowsCustomExceptionTarget()},
  );
}

final class CustomExceptionSerializer
    extends _i4.Serializer<_i3.CustomException> {
  const CustomExceptionSerializer();

  @override
  _i3.CustomException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i3.CustomException();
  }

  @override
  Map<String, Object?> serialize(_i3.CustomException value) => {
        r'message': value.message,
        r'additionalInfo': value.additionalInfo,
      };
}
