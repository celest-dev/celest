// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../../../apis/serialization.dart' as _i2;

class AsyncOnlyToJsonWithDefaultsTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final response = await _i2.asyncOnlyToJsonWithDefaults(_i3
          .Serializers.instance
          .deserializeWithType<_i2.OnlyToJsonWithDefaults>(
        r'project:apis/serialization.dart#OnlyToJsonWithDefaults',
        request[r'value'],
      ));
      return _i3.Serializers.instance
          .serializeWithType<_i2.OnlyToJsonWithDefaults>(
        r'project:apis/serialization.dart#OnlyToJsonWithDefaults',
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
  _i3.Serializers.instance.put(const OnlyToJsonWithDefaultsSerializer());
  await _i1.serve(
    args,
    (_) => AsyncOnlyToJsonWithDefaultsTarget(),
  );
}

final class OnlyToJsonWithDefaultsSerializer
    extends _i3.Serializer<_i2.OnlyToJsonWithDefaults> {
  const OnlyToJsonWithDefaultsSerializer();

  @override
  String get dartType =>
      r'project:apis/serialization.dart#OnlyToJsonWithDefaults';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.OnlyToJsonWithDefaults deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i2.OnlyToJsonWithDefaults(
        ((serialized?[r'field'] as String?)) ?? 'default');
  }

  @override
  Map<String, Object?> serialize(_i2.OnlyToJsonWithDefaults value) =>
      value.toJson();
}
