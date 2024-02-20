// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/extension_types.dart' as _i4;

import '../../../functions/extension_types.dart' as _i2;

final class ColorXImplTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'colorXImpl';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response =
        _i2.colorXImpl(_i3.Serializers.instance.deserialize<_i4.ColorXImpl>(
      request[r'color'],
      const _i3.TypeToken<_i4.ColorXImpl>('ColorXImpl'),
    ));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.ColorXImpl>(
          response,
          const _i3.TypeToken<_i4.ColorXImpl>('ColorXImpl'),
        )
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(
      const ColorXImplSerializer(),
      const _i3.TypeToken<_i4.ColorXImpl>('ColorXImpl'),
    );
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ColorXImplTarget()},
  );
}

final class ColorXImplSerializer extends _i3.Serializer<_i4.ColorXImpl> {
  const ColorXImplSerializer();

  @override
  _i4.ColorXImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return (_i4.Color.fromJson(serialized) as _i4.ColorXImpl);
  }

  @override
  Object? serialize(_i4.ColorXImpl value) => value.toJson();
}
