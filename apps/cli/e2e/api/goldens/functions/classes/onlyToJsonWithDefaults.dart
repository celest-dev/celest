// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/classes.dart' as _i2;

final class OnlyToJsonWithDefaultsTarget extends _i1.CelestFunctionTarget {
  OnlyToJsonWithDefaultsTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = _i2.onlyToJsonWithDefaults(_i3.Serializers.scoped
                .deserialize<_i2.OnlyToJsonWithDefaults>(request[r'value']));
            return (
              statusCode: 200,
              body: _i3.Serializers.scoped
                  .serialize<_i2.OnlyToJsonWithDefaults>(response)
            );
          },
          installSerializers: (serializers) {
            serializers.put(const OnlyToJsonWithDefaultsSerializer());
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  await _i5.serve(
    args,
    (_) => OnlyToJsonWithDefaultsTarget(),
  );
}

final class OnlyToJsonWithDefaultsSerializer
    extends _i3.Serializer<_i2.OnlyToJsonWithDefaults> {
  const OnlyToJsonWithDefaultsSerializer();

  @override
  String get dartType =>
      r'project:functions/classes.dart#OnlyToJsonWithDefaults';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.OnlyToJsonWithDefaults deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i2.OnlyToJsonWithDefaults(
        ((serialized?[r'field'] as String?)) ?? 'default');
  }

  @override
  Map<String, Object?> serialize(_i2.OnlyToJsonWithDefaults value) =>
      value.toJson();
}
