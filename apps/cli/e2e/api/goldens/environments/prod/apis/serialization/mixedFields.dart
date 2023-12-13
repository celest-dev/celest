// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../../../apis/serialization.dart' as _i2;

class MixedFieldsTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      // ignore: unused_local_variable
      final response = _i2.mixedFields(
          _i3.Serializers.instance.deserializeWithType<_i2.MixedFields>(
        r'project:apis/serialization.dart#MixedFields',
        request[r'value'],
      ));
      return _i3.Serializers.instance.serializeWithType<_i2.MixedFields>(
        r'project:apis/serialization.dart#MixedFields',
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
  _i3.Serializers.instance.put(const MixedFieldsSerializer());
  await _i1.serve(
    args,
    (_) => MixedFieldsTarget(),
  );
}

final class MixedFieldsSerializer extends _i3.Serializer<_i2.MixedFields> {
  const MixedFieldsSerializer();

  @override
  String get dartType => r'project:apis/serialization.dart#MixedFields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.MixedFields deserialize(Object? value) {
    // ignore: unused_local_variable
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.MixedFields(
      (serialized[r'superField'] as String),
      field: (serialized[r'field'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.MixedFields value) => {
        'superField': value.superField,
        'field': value.field,
      };
}
