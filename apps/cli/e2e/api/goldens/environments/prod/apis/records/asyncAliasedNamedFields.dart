// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../../../apis/records.dart' as _i2;

class AsyncAliasedNamedFieldsTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final response = await _i2.asyncAliasedNamedFields(
          value: _i3.Serializers.instance
              .deserializeWithType<({String anotherField, String field})>(
        r'#Record$rmm4wt',
        request[r'value'],
      ));
      return _i3.Serializers.instance
          .serializeWithType<({String anotherField, String field})>(
        r'#Record$rmm4wt',
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
  _i3.Serializers.instance.put(const Record$rmm4wtSerializer());
  await _i1.serve(
    args,
    (_) => AsyncAliasedNamedFieldsTarget(),
  );
}

typedef Record$rmm4wt = ({String anotherField, String field});

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
