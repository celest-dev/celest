// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/extension_types.dart' as _i4;

import '../../../functions/extension_types.dart' as _i2;

final class ColorXImplIndirectTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'colorXImplIndirect';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.colorXImplIndirect(
        _i3.Serializers.instance.deserialize<_i4.ColorXImplIndirect>(
      request[r'color'],
      const _i3.TypeToken<_i4.ColorXImplIndirect>('ColorXImplIndirect'),
    ));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.ColorXImplIndirect>(
          response,
          const _i3.TypeToken<_i4.ColorXImplIndirect>('ColorXImplIndirect'),
        )
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(
      const ColorXImplIndirectSerializer(),
      const _i3.TypeToken<_i4.ColorXImplIndirect>('ColorXImplIndirect'),
    );
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ColorXImplIndirectTarget()},
  );
}

final class ColorXImplIndirectSerializer
    extends _i3.Serializer<_i4.ColorXImplIndirect> {
  const ColorXImplIndirectSerializer();

  @override
  _i4.ColorXImplIndirect deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return (_i4.Color.fromJson(serialized) as _i4.ColorXImplIndirect);
  }

  @override
  Object? serialize(_i4.ColorXImplIndirect value) => value.toJson();
}
