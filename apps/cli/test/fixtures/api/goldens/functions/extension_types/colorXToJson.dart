// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/extension_types.dart' as _i4;

import '../../../functions/extension_types.dart' as _i2;

final class ColorXToJsonTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'colorXToJson';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response =
        _i2.colorXToJson(_i3.Serializers.instance.deserialize<_i4.ColorXToJson>(
      request[r'color'],
      const _i3.TypeToken<_i4.ColorXToJson>('ColorXToJson'),
    ));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.ColorXToJson>(
          response,
          const _i3.TypeToken<_i4.ColorXToJson>('ColorXToJson'),
        )
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(
      const ColorXToJsonSerializer(),
      const _i3.TypeToken<_i4.ColorXToJson>('ColorXToJson'),
    );
    _i3.Serializers.instance.put(const ColorSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ColorXToJsonTarget()},
  );
}

final class ColorSerializer extends _i3.Serializer<_i4.Color> {
  const ColorSerializer();

  @override
  _i4.Color deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i4.Color.values.byName(serialized);
  }

  @override
  Object? serialize(_i4.Color value) => value.name;
}

final class ColorXToJsonSerializer extends _i3.Serializer<_i4.ColorXToJson> {
  const ColorXToJsonSerializer();

  @override
  _i4.ColorXToJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i4.ColorXToJson(
        _i3.Serializers.instance.deserialize<_i4.Color>(serialized));
  }

  @override
  Object? serialize(_i4.ColorXToJson value) => value.toJson();
}
