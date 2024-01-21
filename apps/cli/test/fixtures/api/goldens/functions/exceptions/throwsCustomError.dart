// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/exceptions.dart' as _i3;
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i4;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsCustomErrorTarget extends _i1.CloudFunctionTarget {
  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      _i2.throwsCustomError();
      return (statusCode: 200, body: {'response': null});
    } on _i3.CustomError catch (e, st) {
      print('$e\n$st');
      final error = _i4.Serializers.instance.serialize<_i3.CustomError>(e);
      return (
        statusCode: 500,
        body: {
          'error': {
            'code': r'CustomError',
            'message': e.toString(),
            'details': error,
          }
        }
      );
    }
  }

  @override
  void init() {
    _i4.Serializers.instance.put(const CustomErrorSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ThrowsCustomErrorTarget()},
  );
}

final class CustomErrorSerializer extends _i4.Serializer<_i3.CustomError> {
  const CustomErrorSerializer();

  @override
  _i3.CustomError deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i3.CustomError();
  }

  @override
  Map<String, Object?> serialize(_i3.CustomError value) => {
        r'message': value.message,
        r'additionalInfo': value.additionalInfo,
      };
}
