// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i4;

import '../../../../../apis/serialization.dart' as _i2;

class AsyncDefaultValuesTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      // ignore: unused_local_variable
      final response = await _i2.asyncDefaultValues(_i2.DefaultValues(
        field: (request[r'value'][r'field'] == null
                ? null
                : (request[r'value'][r'field'] as String)) ??
            'default',
        nullableField: request[r'value'][r'nullableField'] == null
            ? null
            : (request[r'value'][r'nullableField'] as String),
        nullableFieldWithDefault: (request[r'value']
                        [r'nullableFieldWithDefault'] ==
                    null
                ? null
                : (request[r'value'][r'nullableFieldWithDefault'] as String)) ??
            'default',
      ));
      return {
        'field': response.field,
        'nullableField': response.nullableField,
        'nullableFieldWithDefault': response.nullableFieldWithDefault,
        'fieldWithoutInitializer': response.fieldWithoutInitializer,
      };
    },
    (json) => json as Map<String, dynamic>,
  );

  @override
  _i3.FutureOr<_i4.Response> handler(_i4.Request request) {
    final handler = _i4.Pipeline().addHandler(_inner.handler);
    return handler(request);
  }
}

_i3.Future<void> main(List<String> args) async {
  await _i1.serve(
    args,
    (_) => AsyncDefaultValuesTarget(),
  );
}
