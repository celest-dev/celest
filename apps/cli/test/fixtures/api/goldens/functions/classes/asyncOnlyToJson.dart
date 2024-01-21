// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/src/models/classes.dart' as _i4;
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/classes.dart' as _i2;

final class AsyncOnlyToJsonTarget extends _i1.CloudFunctionTarget {
  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = await _i2.asyncOnlyToJson(_i3.Serializers.instance
        .deserialize<_i4.OnlyToJson>(request[r'value']));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.OnlyToJson>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const OnlyToJsonSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': AsyncOnlyToJsonTarget()},
  );
}

final class OnlyToJsonSerializer extends _i3.Serializer<_i4.OnlyToJson> {
  const OnlyToJsonSerializer();

  @override
  _i4.OnlyToJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.OnlyToJson((serialized[r'field'] as String));
  }

  @override
  Map<String, Object?> serialize(_i4.OnlyToJson value) => value.toJson();
}
