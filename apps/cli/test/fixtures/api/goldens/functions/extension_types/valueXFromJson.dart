// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/extension_types.dart' as _i4;

import '../../../functions/extension_types.dart' as _i2;

final class ValueXFromJsonTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'valueXFromJson';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.valueXFromJson(
        _i3.Serializers.instance.deserialize<_i4.ValueXFromJson>(
      request[r'v'],
      const _i3.TypeToken<_i4.ValueXFromJson>('ValueXFromJson'),
    ));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.ValueXFromJson>(
          response,
          const _i3.TypeToken<_i4.ValueXFromJson>('ValueXFromJson'),
        )
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(
      const ValueXFromJsonSerializer(),
      const _i3.TypeToken<_i4.ValueXFromJson>('ValueXFromJson'),
    );
    _i3.Serializers.instance.put(const ValueSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ValueXFromJsonTarget()},
  );
}

final class ValueSerializer extends _i3.Serializer<_i4.Value> {
  const ValueSerializer();

  @override
  _i4.Value deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.Value((serialized[r'value'] as String));
  }

  @override
  Object? serialize(_i4.Value value) => {r'value': value.value};
}

final class ValueXFromJsonSerializer
    extends _i3.Serializer<_i4.ValueXFromJson> {
  const ValueXFromJsonSerializer();

  @override
  _i4.ValueXFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.ValueXFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_i4.ValueXFromJson value) =>
      _i3.Serializers.instance.serialize<_i4.Value>(value.v);
}
