// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../functions/records.dart' as _i2;

class AsyncNonAliasedMixedFieldsTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final response = await _i2.asyncNonAliasedMixedFields(_i3
          .Serializers.instance
          .deserialize<_i2.MixedFields>(request[r'value']));
      return _i3.Serializers.instance
          .serialize<(String, {String anotherField})>(response);
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
  _i3.Serializers.instance.put(const Record$4z6fldSerializer());
  await _i1.serve(
    args,
    (_) => AsyncNonAliasedMixedFieldsTarget(),
  );
}

typedef Record$4z6fld = (String, {String anotherField});

final class Record$4z6fldSerializer extends _i3.Serializer<Record$4z6fld> {
  const Record$4z6fldSerializer();

  @override
  String get dartType => r'#Record$4z6fld';

  @override
  String get wireType => r'dart:core#Map';

  @override
  Record$4z6fld deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      (serialized[r'$1'] as String),
      anotherField: (serialized[r'anotherField'] as String)
    );
  }

  @override
  Map<String, Object?> serialize(Record$4z6fld value) => {
        r'$1': value.$1,
        r'anotherField': value.anotherField,
      };
}
