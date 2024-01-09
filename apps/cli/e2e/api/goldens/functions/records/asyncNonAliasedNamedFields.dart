// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/records.dart' as _i2;

final class AsyncNonAliasedNamedFieldsTarget extends _i1.CelestFunctionTarget {
  AsyncNonAliasedNamedFieldsTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = await _i2.asyncNonAliasedNamedFields(
                value: _i3.Serializers.scoped
                    .deserialize<({String anotherField, String field})>(
                        request[r'value']));
            return (
              statusCode: 200,
              body: _i3.Serializers.scoped
                  .serialize<({String anotherField, String field})>(response)
            );
          },
          installSerializers: (serializers) {
            serializers.put(const Record$rmm4wtSerializer());
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  await _i5.serve(
    args,
    (_) => AsyncNonAliasedNamedFieldsTarget(),
  );
}

typedef Record$rmm4wt = ({String anotherField, String field});

final class Record$rmm4wtSerializer extends _i3.Serializer<Record$rmm4wt> {
  const Record$rmm4wtSerializer();

  @override
  String get dartType => r'#Record$rmm4wt';

  @override
  String get wireType => r'dart:core#Map';

  @override
  Record$rmm4wt deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      anotherField: (serialized[r'anotherField'] as String),
      field: (serialized[r'field'] as String)
    );
  }

  @override
  Map<String, Object?> serialize(Record$rmm4wt value) => {
        r'anotherField': value.anotherField,
        r'field': value.field,
      };
}
