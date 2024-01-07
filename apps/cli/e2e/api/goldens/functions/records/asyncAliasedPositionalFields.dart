// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/records.dart' as _i2;

final class AsyncAliasedPositionalFieldsTarget
    extends _i1.CelestFunctionTarget {
  AsyncAliasedPositionalFieldsTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = await _i2.asyncAliasedPositionalFields(_i3
                .Serializers.instance
                .deserialize<_i2.PositionalFields>(request[r'value']));
            return (
              statusCode: 200,
              body: _i3.Serializers.instance
                  .serialize<_i2.PositionalFields>(response)
            );
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  _i3.Serializers.instance.put(const PositionalFieldsSerializer());
  await _i5.serve(
    args,
    (_) => AsyncAliasedPositionalFieldsTarget(),
  );
}

final class PositionalFieldsSerializer
    extends _i3.Serializer<_i2.PositionalFields> {
  const PositionalFieldsSerializer();

  @override
  String get dartType => r'project:functions/records.dart#PositionalFields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.PositionalFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return ((serialized[r'$1'] as String), (serialized[r'$2'] as String));
  }

  @override
  Map<String, Object?> serialize(_i2.PositionalFields value) => {
        r'$1': value.$1,
        r'$2': value.$2,
      };
}
