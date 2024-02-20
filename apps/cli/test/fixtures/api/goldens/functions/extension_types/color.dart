// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/extension_types.dart' as _i4;

import '../../../functions/extension_types.dart' as _i2;

final class ColorTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'color';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.color(
        _i3.Serializers.instance.deserialize<_i4.Color>(request[r'color']));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.Color>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const ColorSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ColorTarget()},
  );
}

final class ColorSerializer extends _i3.Serializer<_i4.Color> {
  const ColorSerializer();

  @override
  _i4.Color deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i4.Color.fromJson(serialized);
  }

  @override
  Object? serialize(_i4.Color value) => value.toJson();
}
