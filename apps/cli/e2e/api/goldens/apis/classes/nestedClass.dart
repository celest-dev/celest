// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../apis/classes.dart' as _i2;

class NestedClassTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final response = _i2.nestedClass(_i3.Serializers.instance
          .deserialize<_i2.NestedClass>(request[r'value']));
      return _i3.Serializers.instance.serialize<_i2.NestedClass>(response);
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
  _i3.Serializers.instance.put(const FieldsSerializer());
  _i3.Serializers.instance.put(const NestedClassSerializer());
  await _i1.serve(
    args,
    (_) => NestedClassTarget(),
  );
}

final class FieldsSerializer extends _i3.Serializer<_i2.Fields> {
  const FieldsSerializer();

  @override
  String get dartType => r'project:apis/classes.dart#Fields';

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
  String get dartType => r'project:apis/classes.dart#NestedClass';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NestedClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.NestedClass(
      _i3.Serializers.instance.deserialize<_i2.Fields>(serialized[r'fields']),
      _i3.Serializers.instance
          .deserialize<_i2.Fields?>(serialized[r'nullableFields']),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.NestedClass value) => {
        r'fields': _i3.Serializers.instance.serialize<_i2.Fields>(value.fields),
        r'nullableFields': _i3.Serializers.instance
            .serialize<_i2.Fields?>(value.nullableFields),
      };
}
