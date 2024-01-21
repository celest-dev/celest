// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/classes.dart' as _i2;

final class AsyncOnlyToJsonTarget extends _i1.CloudFunctionTarget {
  AsyncOnlyToJsonTarget()
      : super(
          (request) async {
            final response = await _i2.asyncOnlyToJson(_i3.Serializers.scoped
                .deserialize<_i2.OnlyToJson>(request[r'value']));
            return (
              statusCode: 200,
              body: {
                'response':
                    _i3.Serializers.scoped.serialize<_i2.OnlyToJson>(response)
              }
            );
          },
          installSerializers: (serializers) {
            serializers.put(const OnlyToJsonSerializer());
          },
        );
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': AsyncOnlyToJsonTarget()},
  );
}

final class OnlyToJsonSerializer extends _i3.Serializer<_i2.OnlyToJson> {
  const OnlyToJsonSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#OnlyToJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.OnlyToJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.OnlyToJson((serialized[r'field'] as String));
  }

  @override
  Map<String, Object?> serialize(_i2.OnlyToJson value) => value.toJson();
}
