// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../../../apis/records.dart' as _i2;

class PositionalFieldsTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final response = _i2.positionalFields(
        _i3.Serializers.instance.deserializeWithType<(String, String)>(
          r'#Record$rh3gkz',
          request[r'nonAliased'],
        ),
        _i3.Serializers.instance.deserializeWithType<(String, String)>(
          r'#Record$rh3gkz',
          request[r'aliased'],
        ),
      );
      return _i3.Serializers.instance
          .serializeWithType<((String, String), (String, String))>(
        r'#Record$8hbt4m',
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
  _i3.Serializers.instance.put(const Record$8hbt4mSerializer());
  _i3.Serializers.instance.put(const Record$rh3gkzSerializer());
  await _i1.serve(
    args,
    (_) => PositionalFieldsTarget(),
  );
}

typedef Record$8hbt4m = ((String, String), (String, String));
typedef Record$rh3gkz = (String, String);

final class Record$8hbt4mSerializer extends _i3.Serializer<Record$8hbt4m> {
  const Record$8hbt4mSerializer();

  @override
  String get dartType => r'#Record$8hbt4m';

  @override
  String get wireType => r'dart:core#Map';

  @override
  Record$8hbt4m deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      _i3.Serializers.instance.deserializeWithType<Record$rh3gkz>(
        r'#Record$rh3gkz',
        serialized[r'$1'],
      ),
      _i3.Serializers.instance.deserializeWithType<Record$rh3gkz>(
        r'#Record$rh3gkz',
        serialized[r'$2'],
      )
    );
  }

  @override
  Map<String, Object?> serialize(Record$8hbt4m value) => {
        r'$1': _i3.Serializers.instance.serializeWithType<(String, String)>(
          r'#Record$rh3gkz',
          value.$1,
        ),
        r'$2': _i3.Serializers.instance.serializeWithType<(String, String)>(
          r'#Record$rh3gkz',
          value.$2,
        ),
      };
}

final class Record$rh3gkzSerializer extends _i3.Serializer<Record$rh3gkz> {
  const Record$rh3gkzSerializer();

  @override
  String get dartType => r'#Record$rh3gkz';

  @override
  String get wireType => r'dart:core#Map';

  @override
  Record$rh3gkz deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return ((serialized[r'$1'] as String), (serialized[r'$2'] as String));
  }

  @override
  Map<String, Object?> serialize(Record$rh3gkz value) => {
        r'$1': value.$1,
        r'$2': value.$2,
      };
}
