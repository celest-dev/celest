// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/src/models/parameter_types.dart' as _i4;
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/return_types.dart' as _i2;

final class AsyncStructReturnNullableTarget extends _i1.CloudFunctionTarget {
  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = await _i2.asyncStructReturnNullable();
    return (
      statusCode: 200,
      body: {
        'response':
            _i3.Serializers.instance.serialize<_i4.SimpleStruct?>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const SimpleStructSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': AsyncStructReturnNullableTarget()},
  );
}

final class SimpleStructSerializer extends _i3.Serializer<_i4.SimpleStruct> {
  const SimpleStructSerializer();

  @override
  _i4.SimpleStruct deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return ();
  }

  @override
  Map<String, Object?> serialize(_i4.SimpleStruct value) => {};
}
