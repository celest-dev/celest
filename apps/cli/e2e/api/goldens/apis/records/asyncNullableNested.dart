// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../apis/records.dart' as _i2;

class AsyncNullableNestedTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final response = await _i2.asyncNullableNested(
          _i3.Serializers.instance.deserializeWithType<_i2.NullableNested?>(
        r'project:apis/records.dart#NullableNested',
        request[r'value'],
      ));
      return _i3.Serializers.instance.serializeWithType<_i2.NullableNested?>(
        r'project:apis/records.dart#NullableNested',
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
  _i3.Serializers.instance.put(const NullableNestedSerializer());
  _i3.Serializers.instance.put(const PositionalFieldsSerializer());
  _i3.Serializers.instance.put(const NamedFieldsSerializer());
  await _i1.serve(
    args,
    (_) => AsyncNullableNestedTarget(),
  );
}

final class NullableNestedSerializer
    extends _i3.Serializer<_i2.NullableNested> {
  const NullableNestedSerializer();

  @override
  String get dartType => r'project:apis/records.dart#NullableNested';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NullableNested deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      _i3.Serializers.instance.deserializeWithType<_i2.PositionalFields?>(
        r'project:apis/records.dart#PositionalFields',
        serialized[r'$1'],
      ),
      namedFields:
          _i3.Serializers.instance.deserializeWithType<_i2.NamedFields?>(
        r'project:apis/records.dart#NamedFields',
        serialized[r'namedFields'],
      )
    );
  }

  @override
  Map<String, Object?> serialize(_i2.NullableNested value) => {
        r'$1':
            _i3.Serializers.instance.serializeWithType<_i2.PositionalFields?>(
          r'project:apis/records.dart#PositionalFields',
          value.$1,
        ),
        r'namedFields':
            _i3.Serializers.instance.serializeWithType<_i2.NamedFields?>(
          r'project:apis/records.dart#NamedFields',
          value.namedFields,
        ),
      };
}

final class PositionalFieldsSerializer
    extends _i3.Serializer<_i2.PositionalFields> {
  const PositionalFieldsSerializer();

  @override
  String get dartType => r'project:apis/records.dart#PositionalFields';

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
  String get dartType => r'project:apis/records.dart#NamedFields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NamedFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return (
      anotherField: (serialized?[r'anotherField'] as String),
      field: (serialized?[r'field'] as String)
    );
  }

  @override
  Map<String, Object?> serialize(_i2.NamedFields value) => {
        r'anotherField': value.anotherField,
        r'field': value.field,
      };
}
