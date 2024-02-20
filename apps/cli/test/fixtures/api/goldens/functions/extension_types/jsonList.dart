// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_core/src/serialization/json_value.dart' as _i4;

import '../../../functions/extension_types.dart' as _i2;

final class JsonListTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'jsonList';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response =
        _i2.jsonList(_i3.Serializers.instance.deserialize<_i4.JsonList>(
      request[r'value'],
      const _i3.TypeToken<_i4.JsonList>('JsonList'),
    ));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.JsonList>(
          response,
          const _i3.TypeToken<_i4.JsonList>('JsonList'),
        )
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(
      const JsonListSerializer(),
      const _i3.TypeToken<_i4.JsonList>('JsonList'),
    );
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': JsonListTarget()},
  );
}

final class JsonListSerializer extends _i3.Serializer<_i4.JsonList> {
  const JsonListSerializer();

  @override
  _i4.JsonList deserialize(Object? value) {
    final serialized = assertWireType<List<Object?>>(value);
    return _i4.JsonList((serialized as Iterable<Object?>).toList());
  }

  @override
  List<Object?> serialize(_i4.JsonList value) => value.value;
}
