// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_core/src/serialization/json_value.dart' as _i4;

import '../../../functions/extension_types.dart' as _i2;

final class JsonDoubleTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'jsonDouble';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response =
        _i2.jsonDouble(_i3.Serializers.instance.deserialize<_i4.JsonDouble>(
      request[r'value'],
      const _i3.TypeToken<_i4.JsonDouble>('JsonDouble'),
    ));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.JsonDouble>(
          response,
          const _i3.TypeToken<_i4.JsonDouble>('JsonDouble'),
        )
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(
      const JsonDoubleSerializer(),
      const _i3.TypeToken<_i4.JsonDouble>('JsonDouble'),
    );
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': JsonDoubleTarget()},
  );
}

final class JsonDoubleSerializer extends _i3.Serializer<_i4.JsonDouble> {
  const JsonDoubleSerializer();

  @override
  _i4.JsonDouble deserialize(Object? value) {
    final serialized = assertWireType<double>(value);
    return _i4.JsonDouble((serialized as num).toDouble());
  }

  @override
  Object? serialize(_i4.JsonDouble value) => value;
}
