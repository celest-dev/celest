// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/src/models/parameter_types.dart' as _i4;
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/return_types.dart' as _i2;

final class ComplexClassReturnNullableTarget extends _i1.CloudFunctionTarget {
  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.complexClassReturnNullable();
    return (
      statusCode: 200,
      body: {
        'response':
            _i3.Serializers.instance.serialize<_i4.ComplexClass?>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const ComplexClassSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ComplexClassReturnNullableTarget()},
  );
}

final class ComplexClassSerializer extends _i3.Serializer<_i4.ComplexClass> {
  const ComplexClassSerializer();

  @override
  _i4.ComplexClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, dynamic>>(value);
    return _i4.ComplexClass.fromJson(serialized);
  }

  @override
  Map<String, dynamic> serialize(_i4.ComplexClass value) => value.toJson();
}
