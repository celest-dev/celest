// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i4;

import '../../../functions/classes.dart' as _i2;

final class AsyncNestedClassTarget extends _i1.CelestFunctionTarget {
  AsyncNestedClassTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = await _i2.asyncNestedClass(_i3.Serializers.scoped
                .deserialize<_i2.NestedClass>(request[r'value']));
            return (
              statusCode: 200,
              body: _i3.Serializers.scoped.serialize<_i2.NestedClass>(response)
            );
          },
          installSerializers: (serializers) {
            serializers.put(const FieldsSerializer());
            serializers.put(const NestedClassSerializer());
          },
          middleware: [],
        );
}

Future<void> main(List<String> args) async {
  await _i4.serve(
    args,
    (_) => AsyncNestedClassTarget(),
  );
}

final class FieldsSerializer extends _i3.Serializer<_i2.Fields> {
  const FieldsSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#Fields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.Fields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.Fields(
      (serialized[r'superField'] as String),
      (serialized[r'field'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.Fields value) => {
        r'superField': value.superField,
        r'field': value.field,
      };
}

final class NestedClassSerializer extends _i3.Serializer<_i2.NestedClass> {
  const NestedClassSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#NestedClass';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NestedClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.NestedClass(
      _i3.Serializers.scoped.deserialize<_i2.Fields>(serialized[r'fields']),
      _i3.Serializers.scoped
          .deserialize<_i2.Fields?>(serialized[r'nullableFields']),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.NestedClass value) => {
        r'fields': _i3.Serializers.scoped.serialize<_i2.Fields>(value.fields),
        r'nullableFields':
            _i3.Serializers.scoped.serialize<_i2.Fields?>(value.nullableFields),
      };
}
