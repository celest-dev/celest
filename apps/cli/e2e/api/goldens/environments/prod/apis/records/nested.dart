// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../../../apis/records.dart' as _i2;

class NestedTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final response =
          _i2.nested(_i3.Serializers.instance.deserializeWithType<_i2.Nested>(
        r'project:apis/records.dart#Nested',
        request[r'value'],
      ));
      return _i3.Serializers.instance.serializeWithType<_i2.Nested>(
        r'project:apis/records.dart#Nested',
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
  _i3.Serializers.instance.put(const NestedSerializer());
  _i3.Serializers.instance.put(const Record$rh3gkzSerializer());
  _i3.Serializers.instance.put(const Record$rmm4wtSerializer());
  await _i1.serve(
    args,
    (_) => NestedTarget(),
  );
}

typedef Record$rh3gkz = (String, String);
typedef Record$rmm4wt = ({String anotherField, String field});

final class NestedSerializer extends _i3.Serializer<_i2.Nested> {
  const NestedSerializer();

  @override
  String get dartType => r'project:apis/records.dart#Nested';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.Nested deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      _i3.Serializers.instance.deserializeWithType<Record$rh3gkz>(
        r'#Record$rh3gkz',
        serialized[r'$1'],
      ),
      namedFields: _i3.Serializers.instance.deserializeWithType<Record$rmm4wt>(
        r'#Record$rmm4wt',
        serialized[r'namedFields'],
      )
    );
  }

  @override
  Map<String, Object?> serialize(_i2.Nested value) => {
        r'$1': _i3.Serializers.instance.serializeWithType<(String, String)>(
          r'#Record$rh3gkz',
          value.$1,
        ),
        r'namedFields': _i3.Serializers.instance
            .serializeWithType<({String anotherField, String field})>(
          r'#Record$rmm4wt',
          value.namedFields,
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

final class Record$rmm4wtSerializer extends _i3.Serializer<Record$rmm4wt> {
  const Record$rmm4wtSerializer();

  @override
  String get dartType => r'#Record$rmm4wt';

  @override
  String get wireType => r'dart:core#Map';

  @override
  Record$rmm4wt deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return (
      anotherField: (serialized?[r'anotherField'] as String),
      field: (serialized?[r'field'] as String)
    );
  }

  @override
  Map<String, Object?> serialize(Record$rmm4wt value) => {
        r'anotherField': value.anotherField,
        r'field': value.field,
      };
}
