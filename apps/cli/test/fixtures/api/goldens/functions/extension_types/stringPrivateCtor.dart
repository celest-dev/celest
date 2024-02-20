// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/extension_types.dart' as _i4;

import '../../../functions/extension_types.dart' as _i2;

final class StringPrivateCtorTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'stringPrivateCtor';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.stringPrivateCtor(
        _i3.Serializers.instance.deserialize<_i4.StringXPrivateCtor>(
      request[r's'],
      const _i3.TypeToken<_i4.StringXPrivateCtor>('StringXPrivateCtor'),
    ));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.StringXPrivateCtor>(
          response,
          const _i3.TypeToken<_i4.StringXPrivateCtor>('StringXPrivateCtor'),
        )
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(
      const StringXPrivateCtorSerializer(),
      const _i3.TypeToken<_i4.StringXPrivateCtor>('StringXPrivateCtor'),
    );
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': StringPrivateCtorTarget()},
  );
}

final class StringXPrivateCtorSerializer
    extends _i3.Serializer<_i4.StringXPrivateCtor> {
  const StringXPrivateCtorSerializer();

  @override
  _i4.StringXPrivateCtor deserialize(Object? value) {
    final serialized = assertWireType<String?>(value);
    return ((serialized as String) as _i4.StringXPrivateCtor);
  }

  @override
  String serialize(_i4.StringXPrivateCtor value) => value.s;
}
