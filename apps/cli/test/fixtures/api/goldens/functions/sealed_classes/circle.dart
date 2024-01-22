// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/sealed_classes.dart' as _i4;

import '../../../functions/sealed_classes.dart' as _i2;

final class CircleTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'circle';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.circle(
        _i3.Serializers.instance.deserialize<_i4.Circle>(request[r'circle']));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.Circle>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const CircleSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': CircleTarget()},
  );
}

final class CircleSerializer extends _i3.Serializer<_i4.Circle> {
  const CircleSerializer();

  @override
  _i4.Circle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.Circle((serialized[r'radius'] as num).toDouble());
  }

  @override
  Map<String, Object?> serialize(_i4.Circle value) => {r'radius': value.radius};
}
