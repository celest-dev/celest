// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions.dart' as _i3;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsCustomErrorToFromJsonTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'throwsCustomErrorToFromJson';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      _i2.throwsCustomErrorToFromJson();
      return (statusCode: 200, body: {'response': null});
    } on _i3.CustomErrorToFromJson catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i3.CustomErrorToFromJson>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomErrorToFromJson',
            'details': error,
          }
        }
      );
    }
  }

  @override
  void init() {
    _i4.Serializers.instance.put(const CustomErrorToFromJsonSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ThrowsCustomErrorToFromJsonTarget()},
  );
}

final class CustomErrorToFromJsonSerializer
    extends _i4.Serializer<_i3.CustomErrorToFromJson> {
  const CustomErrorToFromJsonSerializer();

  @override
  _i3.CustomErrorToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i3.CustomErrorToFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i3.CustomErrorToFromJson value) => value.toJson();
}
