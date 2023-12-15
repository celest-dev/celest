// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../apis/records.dart' as _i2;

class MixedFieldsTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final response = _i2.mixedFields(
        _i3.Serializers.instance.deserializeWithType<_i2.MixedFields>(
          r'project:apis/records.dart#MixedFields',
          request[r'nonAliased'],
        ),
        aliased: _i3.Serializers.instance.deserializeWithType<_i2.MixedFields>(
          r'project:apis/records.dart#MixedFields',
          request[r'aliased'],
        ),
      );
      return _i3.Serializers.instance
          .serializeWithType<(_i2.MixedFields, {_i2.MixedFields aliased})>(
        r'#Record$w235bh',
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
  _i3.Serializers.instance.put(const Record$w235bhSerializer());
  _i3.Serializers.instance.put(const MixedFieldsSerializer());
  await _i1.serve(
    args,
    (_) => MixedFieldsTarget(),
  );
}

typedef Record$w235bh = (_i2.MixedFields, {_i2.MixedFields aliased});

final class Record$w235bhSerializer extends _i3.Serializer<Record$w235bh> {
  const Record$w235bhSerializer();

  @override
  String get dartType => r'#Record$w235bh';

  @override
  String get wireType => r'dart:core#Map';

  @override
  Record$w235bh deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      _i3.Serializers.instance.deserializeWithType<_i2.MixedFields>(
        r'project:apis/records.dart#MixedFields',
        serialized[r'$1'],
      ),
      aliased: _i3.Serializers.instance.deserializeWithType<_i2.MixedFields>(
        r'project:apis/records.dart#MixedFields',
        serialized[r'aliased'],
      )
    );
  }

  @override
  Map<String, Object?> serialize(Record$w235bh value) => {
        r'$1': _i3.Serializers.instance.serializeWithType<_i2.MixedFields>(
          r'project:apis/records.dart#MixedFields',
          value.$1,
        ),
        r'aliased': _i3.Serializers.instance.serializeWithType<_i2.MixedFields>(
          r'project:apis/records.dart#MixedFields',
          value.aliased,
        ),
      };
}

final class MixedFieldsSerializer extends _i3.Serializer<_i2.MixedFields> {
  const MixedFieldsSerializer();

  @override
  String get dartType => r'project:apis/records.dart#MixedFields';

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
