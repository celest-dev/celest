// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/extension_types.dart' as _i4;

import '../../../functions/extension_types.dart' as _i2;

final class AsyncStringTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'asyncString';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response =
        await _i2.asyncString(_i3.Serializers.instance.deserialize<_i4.StringX>(
      request[r's'],
      const _i3.TypeToken<_i4.StringX>('StringX'),
    ));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.StringX>(
          response,
          const _i3.TypeToken<_i4.StringX>('StringX'),
        )
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(
      const StringXSerializer(),
      const _i3.TypeToken<_i4.StringX>('StringX'),
    );
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': AsyncStringTarget()},
  );
}

final class StringXSerializer extends _i3.Serializer<_i4.StringX> {
  const StringXSerializer();

  @override
  _i4.StringX deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i4.StringX((serialized as String));
  }

  @override
  String serialize(_i4.StringX value) => value.s;
}
