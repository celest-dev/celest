// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/classes.dart' as _i2;

final class AsyncOnlyFromJsonTarget extends _i1.CloudFunctionTarget {
  AsyncOnlyFromJsonTarget()
      : super(
          (request) async {
            final response = await _i2.asyncOnlyFromJson(_i3.Serializers.scoped
                .deserialize<_i2.OnlyFromJson>(request[r'value']));
            return (
              statusCode: 200,
              body: {
                'response':
                    _i3.Serializers.scoped.serialize<_i2.OnlyFromJson>(response)
              }
            );
          },
          installSerializers: (serializers) {
            serializers.put(const OnlyFromJsonSerializer());
          },
        );
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': AsyncOnlyFromJsonTarget()},
  );
}

final class OnlyFromJsonSerializer extends _i3.Serializer<_i2.OnlyFromJson> {
  const OnlyFromJsonSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#OnlyFromJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.OnlyFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.OnlyFromJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i2.OnlyFromJson value) =>
      {r'field': value.field};
}
