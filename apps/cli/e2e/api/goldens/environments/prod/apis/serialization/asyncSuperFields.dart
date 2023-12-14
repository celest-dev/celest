// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../../../apis/serialization.dart' as _i2;

class AsyncSuperFieldsTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final response = await _i2.asyncSuperFields(
          _i3.Serializers.instance.deserializeWithType<_i2.SuperFields>(
        r'project:apis/serialization.dart#SuperFields',
        request[r'value'],
      ));
      return _i3.Serializers.instance.serializeWithType<_i2.SuperFields>(
        r'project:apis/serialization.dart#SuperFields',
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
  _i3.Serializers.instance.put(const SuperFieldsSerializer());
  await _i1.serve(
    args,
    (_) => AsyncSuperFieldsTarget(),
  );
}

final class SuperFieldsSerializer extends _i3.Serializer<_i2.SuperFields> {
  const SuperFieldsSerializer();

  @override
  String get dartType => r'project:apis/serialization.dart#SuperFields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.SuperFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.SuperFields((serialized[r'superField'] as String));
  }

  @override
  Map<String, Object?> serialize(_i2.SuperFields value) =>
      {'superField': value.superField};
}
