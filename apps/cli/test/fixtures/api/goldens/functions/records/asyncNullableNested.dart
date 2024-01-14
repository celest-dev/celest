// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i4;

import '../../../functions/records.dart' as _i2;

final class AsyncNullableNestedTarget extends _i1.CelestFunctionTarget {
  AsyncNullableNestedTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = await _i2.asyncNullableNested(_i3
                .Serializers.scoped
                .deserialize<_i2.NullableNested?>(request[r'value']));
            return (
              statusCode: 200,
              body: _i3.Serializers.scoped
                  .serialize<_i2.NullableNested?>(response)
            );
          },
          installSerializers: (serializers) {
            serializers.put(const NamedFieldsSerializer());
            serializers.put(const NullableNestedSerializer());
          },
          middleware: [],
        );
}

Future<void> main(List<String> args) async {
  await _i4.serve(
    args,
    (_) => AsyncNullableNestedTarget(),
  );
}

final class NamedFieldsSerializer extends _i3.Serializer<_i2.NamedFields> {
  const NamedFieldsSerializer();

  @override
  String get dartType => r'project:functions/records.dart#NamedFields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NamedFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      anotherField: (serialized[r'anotherField'] as String),
      field: (serialized[r'field'] as String)
    );
  }

  @override
  Map<String, Object?> serialize(_i2.NamedFields value) => {
        r'anotherField': value.anotherField,
        r'field': value.field,
      };
}

final class NullableNestedSerializer
    extends _i3.Serializer<_i2.NullableNested> {
  const NullableNestedSerializer();

  @override
  String get dartType => r'project:functions/records.dart#NullableNested';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NullableNested deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      namedFields: _i3.Serializers.scoped
          .deserialize<_i2.NamedFields?>(serialized[r'namedFields'])
    );
  }

  @override
  Map<String, Object?> serialize(_i2.NullableNested value) => {
        r'namedFields': _i3.Serializers.scoped
            .serialize<_i2.NamedFields?>(value.namedFields)
      };
}
