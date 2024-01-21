// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/src/models/sealed_classes.dart' as _i4;
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/sealed_classes.dart' as _i2;

final class RectangleTarget extends _i1.CloudFunctionTarget {
  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.rectangle(_i3.Serializers.instance
        .deserialize<_i4.Rectangle>(request[r'rectangle']));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.Rectangle>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const RectangleSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': RectangleTarget()},
  );
}

final class RectangleSerializer extends _i3.Serializer<_i4.Rectangle> {
  const RectangleSerializer();

  @override
  _i4.Rectangle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.Rectangle(
      (serialized[r'width'] as num).toDouble(),
      (serialized[r'height'] as num).toDouble(),
    );
  }

  @override
  Map<String, Object?> serialize(_i4.Rectangle value) => {
        r'width': value.width,
        r'height': value.height,
      };
}
