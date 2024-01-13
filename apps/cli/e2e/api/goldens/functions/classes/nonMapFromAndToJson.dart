// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i4;

import '../../../functions/classes.dart' as _i2;

final class NonMapFromAndToJsonTarget extends _i1.CelestFunctionTarget {
  NonMapFromAndToJsonTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = _i2.nonMapFromAndToJson(_i3.Serializers.scoped
                .deserialize<_i2.NonMapFromAndToJson>(request[r'value']));
            return (
              statusCode: 200,
              body: _i3.Serializers.scoped
                  .serialize<_i2.NonMapFromAndToJson>(response)
            );
          },
          installSerializers: (serializers) {
            serializers.put(const NonMapFromAndToJsonSerializer());
          },
          middleware: [],
        );
}

Future<void> main(List<String> args) async {
  await _i4.serve(
    args,
    (_) => NonMapFromAndToJsonTarget(),
  );
}

final class NonMapFromAndToJsonSerializer
    extends _i3.Serializer<_i2.NonMapFromAndToJson> {
  const NonMapFromAndToJsonSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#NonMapFromAndToJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NonMapFromAndToJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i2.NonMapFromAndToJson.fromJson(serialized);
  }

  @override
  String serialize(_i2.NonMapFromAndToJson value) => value.toJson();
}
