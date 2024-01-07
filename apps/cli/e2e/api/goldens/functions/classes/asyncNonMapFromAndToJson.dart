// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/classes.dart' as _i2;

final class AsyncNonMapFromAndToJsonTarget extends _i1.CelestFunctionTarget {
  AsyncNonMapFromAndToJsonTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = await _i2.asyncNonMapFromAndToJson(_i3
                .Serializers.instance
                .deserialize<_i2.NonMapFromAndToJson>(request[r'value']));
            return (
              statusCode: 200,
              body: _i3.Serializers.instance
                  .serialize<_i2.NonMapFromAndToJson>(response)
            );
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  _i3.Serializers.instance.put(const NonMapFromAndToJsonSerializer());
  await _i5.serve(
    args,
    (_) => AsyncNonMapFromAndToJsonTarget(),
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
