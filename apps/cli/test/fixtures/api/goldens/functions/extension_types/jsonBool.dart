// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_core/src/serialization/json_value.dart' as _i4;

import '../../../functions/extension_types.dart' as _i2;

final class JsonBoolTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'jsonBool';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response =
        _i2.jsonBool(_i3.Serializers.instance.deserialize<_i4.JsonBool>(
      request[r'value'],
      const _i3.TypeToken<_i4.JsonBool>('JsonBool'),
    ));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.JsonBool>(
          response,
          const _i3.TypeToken<_i4.JsonBool>('JsonBool'),
        )
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(
      const JsonBoolSerializer(),
      const _i3.TypeToken<_i4.JsonBool>('JsonBool'),
    );
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': JsonBoolTarget()},
  );
}

final class JsonBoolSerializer extends _i3.Serializer<_i4.JsonBool> {
  const JsonBoolSerializer();

  @override
  _i4.JsonBool deserialize(Object? value) {
    final serialized = assertWireType<bool>(value);
    return _i4.JsonBool((serialized as bool));
  }

  @override
  Object? serialize(_i4.JsonBool value) => value;
}
