// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i4;

import '../../../functions/classes.dart' as _i2;

final class AsyncFromAndToJsonTarget extends _i1.CelestFunctionTarget {
  AsyncFromAndToJsonTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = await _i2.asyncFromAndToJson(_i3.Serializers.scoped
                .deserialize<_i2.FromJsonAndToJson>(request[r'value']));
            return (
              statusCode: 200,
              body: _i3.Serializers.scoped
                  .serialize<_i2.FromJsonAndToJson>(response)
            );
          },
          installSerializers: (serializers) {
            serializers.put(const FromJsonAndToJsonSerializer());
          },
          middleware: [],
        );
}

Future<void> main(List<String> args) async {
  await _i4.serve(
    args,
    (_) => AsyncFromAndToJsonTarget(),
  );
}

final class FromJsonAndToJsonSerializer
    extends _i3.Serializer<_i2.FromJsonAndToJson> {
  const FromJsonAndToJsonSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#FromJsonAndToJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.FromJsonAndToJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.FromJsonAndToJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i2.FromJsonAndToJson value) => value.toJson();
}
