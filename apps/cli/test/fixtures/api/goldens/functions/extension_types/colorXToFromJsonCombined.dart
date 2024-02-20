// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/extension_types.dart' as _i4;

import '../../../functions/extension_types.dart' as _i2;

final class ColorXToFromJsonCombinedTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'colorXToFromJsonCombined';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.colorXToFromJsonCombined(
        _i3.Serializers.instance.deserialize<_i4.ColorXToFromJsonCombined>(
      request[r'color'],
      const _i3.TypeToken<_i4.ColorXToFromJsonCombined>(
          'ColorXToFromJsonCombined'),
    ));
    return (
      statusCode: 200,
      body: {
        'response':
            _i3.Serializers.instance.serialize<_i4.ColorXToFromJsonCombined>(
          response,
          const _i3.TypeToken<_i4.ColorXToFromJsonCombined>(
              'ColorXToFromJsonCombined'),
        )
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(
      const ColorXToFromJsonCombinedSerializer(),
      const _i3.TypeToken<_i4.ColorXToFromJsonCombined>(
          'ColorXToFromJsonCombined'),
    );
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ColorXToFromJsonCombinedTarget()},
  );
}

final class ColorXToFromJsonCombinedSerializer
    extends _i3.Serializer<_i4.ColorXToFromJsonCombined> {
  const ColorXToFromJsonCombinedSerializer();

  @override
  _i4.ColorXToFromJsonCombined deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return (_i4.ColorXFromJson.fromJson(serialized)
        as _i4.ColorXToFromJsonCombined);
  }

  @override
  Object? serialize(_i4.ColorXToFromJsonCombined value) => value.toJson();
}
