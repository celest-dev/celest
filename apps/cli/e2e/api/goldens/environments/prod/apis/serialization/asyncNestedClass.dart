// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../../../apis/serialization.dart' as _i2;

class AsyncNestedClassTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      // ignore: unused_local_variable
      final response = await _i2.asyncNestedClass(
          _i3.Serializers.instance.deserializeWithType<_i2.NestedClass>(
        r'project:apis/serialization.dart#NestedClass',
        request[r'value'],
      ));
      return _i3.Serializers.instance.serializeWithType<_i2.NestedClass>(
        r'project:apis/serialization.dart#NestedClass',
        response,
      );
    },
    (json) => json as Map<String, dynamic>,
  );

  @override
  _i4.FutureOr<_i5.Response> handler(_i5.Request request) {
    final handler = _i5.Pipeline().addHandler(_inner.handler);
    return handler(request);
  }
}

_i4.Future<void> main(List<String> args) async {
  _i3.Serializers.instance.put(const NestedClassSerializer());
  _i3.Serializers.instance.put(const FieldsSerializer());
  await _i1.serve(
    args,
    (_) => AsyncNestedClassTarget(),
  );
}

final class NestedClassSerializer extends _i3.Serializer<_i2.NestedClass> {
  const NestedClassSerializer();

  @override
  String get dartType => r'project:apis/serialization.dart#NestedClass';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NestedClass deserialize(Object? value) {
    // ignore: unused_local_variable
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.NestedClass(
      _i3.Serializers.instance.deserializeWithType<_i2.Fields>(
        r'project:apis/serialization.dart#Fields',
        serialized[r'fields'],
      ),
      _i3.Serializers.instance.deserializeWithType<_i2.Fields?>(
        r'project:apis/serialization.dart#Fields',
        serialized[r'nullableFields'],
      ),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.NestedClass value) => {
        'fields': _i3.Serializers.instance.serializeWithType<_i2.Fields>(
          r'project:apis/serialization.dart#Fields',
          value.fields,
        ),
        'nullableFields':
            _i3.Serializers.instance.serializeWithType<_i2.Fields?>(
          r'project:apis/serialization.dart#Fields',
          value.nullableFields,
        ),
      };
}

final class FieldsSerializer extends _i3.Serializer<_i2.Fields> {
  const FieldsSerializer();

  @override
  String get dartType => r'project:apis/serialization.dart#Fields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.Fields deserialize(Object? value) {
    // ignore: unused_local_variable
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.Fields(
      (serialized[r'superField'] as String),
      (serialized[r'field'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.Fields value) => {
        'superField': value.superField,
        'field': value.field,
      };
}
