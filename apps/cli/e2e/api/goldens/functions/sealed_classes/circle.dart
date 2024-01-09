// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/sealed_classes.dart' as _i2;

final class CircleTarget extends _i1.CelestFunctionTarget {
  CircleTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = _i2.circle(_i3.Serializers.scoped
                .deserialize<_i2.Circle>(request[r'circle']));
            return (
              statusCode: 200,
              body: _i3.Serializers.scoped.serialize<_i2.Circle>(response)
            );
          },
          installSerializers: (serializers) {
            serializers.put(const CircleSerializer());
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  await _i5.serve(
    args,
    (_) => CircleTarget(),
  );
}

final class CircleSerializer extends _i3.Serializer<_i2.Circle> {
  const CircleSerializer();

  @override
  String get dartType => r'project:functions/sealed_classes.dart#Circle';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.Circle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.Circle((serialized[r'radius'] as num).toDouble());
  }

  @override
  Map<String, Object?> serialize(_i2.Circle value) => {r'radius': value.radius};
}
