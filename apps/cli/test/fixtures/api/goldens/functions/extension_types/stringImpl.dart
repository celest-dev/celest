// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/extension_types.dart' as _i4;

import '../../../functions/extension_types.dart' as _i2;

final class StringImplTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'stringImpl';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response =
        _i2.stringImpl(_i3.Serializers.instance.deserialize<_i4.StringXImpl>(
      request[r's'],
      const _i3.TypeToken<_i4.StringXImpl>('StringXImpl'),
    ));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.StringXImpl>(
          response,
          const _i3.TypeToken<_i4.StringXImpl>('StringXImpl'),
        )
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(
      const StringXImplSerializer(),
      const _i3.TypeToken<_i4.StringXImpl>('StringXImpl'),
    );
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': StringImplTarget()},
  );
}

final class StringXImplSerializer extends _i3.Serializer<_i4.StringXImpl> {
  const StringXImplSerializer();

  @override
  _i4.StringXImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i4.StringXImpl((serialized as String));
  }

  @override
  Object? serialize(_i4.StringXImpl value) => value;
}
