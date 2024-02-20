// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/extension_types.dart' as _i4;

import '../../../functions/extension_types.dart' as _i2;

final class ValuexTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'valueX';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response =
        _i2.valueX(_i3.Serializers.instance.deserialize<_i4.ValueX>(
      request[r'v'],
      const _i3.TypeToken<_i4.ValueX>('ValueX'),
    ));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.ValueX>(
          response,
          const _i3.TypeToken<_i4.ValueX>('ValueX'),
        )
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(
      const ValueXSerializer(),
      const _i3.TypeToken<_i4.ValueX>('ValueX'),
    );
    _i3.Serializers.instance.put(const ValueSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ValuexTarget()},
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

final class ValueXSerializer extends _i3.Serializer<_i4.ValueX> {
  const ValueXSerializer();

  @override
  _i4.ValueX deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.ValueX(
        _i3.Serializers.instance.deserialize<_i4.Value>(serialized));
  }

  @override
  Object? serialize(_i4.ValueX value) =>
      _i3.Serializers.instance.serialize<_i4.Value>(value.v);
}
