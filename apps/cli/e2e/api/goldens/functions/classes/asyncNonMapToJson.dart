// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/classes.dart' as _i2;

final class AsyncNonMapToJsonTarget extends _i1.CelestFunctionTarget {
  AsyncNonMapToJsonTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = await _i2.asyncNonMapToJson(_i3.Serializers.scoped
                .deserialize<_i2.NonMapToJson>(request[r'value']));
            return (
              statusCode: 200,
              body: _i3.Serializers.scoped.serialize<_i2.NonMapToJson>(response)
            );
          },
          installSerializers: (serializers) {
            serializers.put(const NonMapToJsonSerializer());
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  await _i5.serve(
    args,
    (_) => AsyncNonMapToJsonTarget(),
  );
}

final class NonMapToJsonSerializer extends _i3.Serializer<_i2.NonMapToJson> {
  const NonMapToJsonSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#NonMapToJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NonMapToJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i2.NonMapToJson((serialized as String));
  }

  @override
  String serialize(_i2.NonMapToJson value) => value.toJson();
}
