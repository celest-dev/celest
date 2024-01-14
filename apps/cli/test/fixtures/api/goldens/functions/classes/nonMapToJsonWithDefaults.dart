// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i4;

import '../../../functions/classes.dart' as _i2;

final class NonMapToJsonWithDefaultsTarget extends _i1.CelestFunctionTarget {
  NonMapToJsonWithDefaultsTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = _i2.nonMapToJsonWithDefaults(_i3.Serializers.scoped
                .deserialize<_i2.NonMapToJsonWithDefaults>(request[r'value']));
            return (
              statusCode: 200,
              body: _i3.Serializers.scoped
                  .serialize<_i2.NonMapToJsonWithDefaults>(response)
            );
          },
          installSerializers: (serializers) {
            serializers.put(const NonMapToJsonWithDefaultsSerializer());
          },
          middleware: [],
        );
}

Future<void> main(List<String> args) async {
  await _i4.serve(
    args,
    (_) => NonMapToJsonWithDefaultsTarget(),
  );
}

final class NonMapToJsonWithDefaultsSerializer
    extends _i3.Serializer<_i2.NonMapToJsonWithDefaults> {
  const NonMapToJsonWithDefaultsSerializer();

  @override
  String get dartType =>
      r'project:functions/classes.dart#NonMapToJsonWithDefaults';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NonMapToJsonWithDefaults deserialize(Object? value) {
    final serialized = assertWireType<String?>(value);
    return _i2.NonMapToJsonWithDefaults(((serialized as String?)) ?? 'default');
  }

  @override
  String serialize(_i2.NonMapToJsonWithDefaults value) => value.toJson();
}
