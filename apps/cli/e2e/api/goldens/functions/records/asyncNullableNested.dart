// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

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
            serializers.put(const PositionalFieldsSerializer());
            serializers.put(const NamedFieldsSerializer());
            serializers.put(const NullableNestedSerializer());
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  await _i5.serve(
    args,
    (_) => AsyncNullableNestedTarget(),
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
      _i3.Serializers.scoped
          .deserialize<_i2.PositionalFields?>(serialized[r'$1']),
      namedFields: _i3.Serializers.scoped
          .deserialize<_i2.NamedFields?>(serialized[r'namedFields'])
    );
  }

  @override
  Map<String, Object?> serialize(_i2.NullableNested value) => {
        r'$1':
            _i3.Serializers.scoped.serialize<_i2.PositionalFields?>(value.$1),
        r'namedFields': _i3.Serializers.scoped
            .serialize<_i2.NamedFields?>(value.namedFields),
      };
}
