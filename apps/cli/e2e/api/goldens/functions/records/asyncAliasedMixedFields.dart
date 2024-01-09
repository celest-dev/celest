// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/records.dart' as _i2;

final class AsyncAliasedMixedFieldsTarget extends _i1.CelestFunctionTarget {
  AsyncAliasedMixedFieldsTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = await _i2.asyncAliasedMixedFields(_i3
                .Serializers.scoped
                .deserialize<_i2.MixedFields>(request[r'value']));
            return (
              statusCode: 200,
              body: _i3.Serializers.scoped.serialize<_i2.MixedFields>(response)
            );
          },
          installSerializers: (serializers) {
            serializers.put(const MixedFieldsSerializer());
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  await _i5.serve(
    args,
    (_) => AsyncAliasedMixedFieldsTarget(),
  );
}

final class MixedFieldsSerializer extends _i3.Serializer<_i2.MixedFields> {
  const MixedFieldsSerializer();

  @override
  String get dartType => r'project:functions/records.dart#MixedFields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.MixedFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      (serialized[r'$1'] as String),
      anotherField: (serialized[r'anotherField'] as String)
    );
  }

  @override
  Map<String, Object?> serialize(_i2.MixedFields value) => {
        r'$1': value.$1,
        r'anotherField': value.anotherField,
      };
}
