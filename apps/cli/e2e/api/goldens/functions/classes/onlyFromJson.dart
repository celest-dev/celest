// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/classes.dart' as _i2;

final class OnlyFromJsonTarget extends _i1.CelestFunctionTarget {
  OnlyFromJsonTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = _i2.onlyFromJson(_i3.Serializers.scoped
                .deserialize<_i2.OnlyFromJson>(request[r'value']));
            return (
              statusCode: 200,
              body: _i3.Serializers.scoped.serialize<_i2.OnlyFromJson>(response)
            );
          },
          installSerializers: (serializers) {
            serializers.put(const OnlyFromJsonSerializer());
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  await _i5.serve(
    args,
    (_) => OnlyFromJsonTarget(),
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
