// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_core/src/serialization/json_value.dart' as _i4;

import '../../../functions/extension_types.dart' as _i2;

final class JsonNumTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'jsonNum';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response =
        _i2.jsonNum(_i3.Serializers.instance.deserialize<_i4.JsonNum>(
      request[r'value'],
      const _i3.TypeToken<_i4.JsonNum>('JsonNum'),
    ));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.JsonNum>(
          response,
          const _i3.TypeToken<_i4.JsonNum>('JsonNum'),
        )
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(
      const JsonNumSerializer(),
      const _i3.TypeToken<_i4.JsonNum>('JsonNum'),
    );
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': JsonNumTarget()},
  );
}

final class JsonNumSerializer extends _i3.Serializer<_i4.JsonNum> {
  const JsonNumSerializer();

  @override
  _i4.JsonNum deserialize(Object? value) {
    final serialized = assertWireType<num>(value);
    return _i4.JsonNum((serialized as num));
  }

  @override
  num serialize(_i4.JsonNum value) => value;
}
