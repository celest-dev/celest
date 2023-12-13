// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i4;

import '../../../../../apis/serialization.dart' as _i2;

class NamedFieldsTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      // ignore: unused_local_variable
      final response = _i2.namedFields(_i2.NamedFields(
        superField: (request[r'value'][r'superField'] as String),
        field: (request[r'value'][r'field'] as String),
      ));
      return {
        'superField': response.superField,
        'field': response.field,
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
    (_) => NamedFieldsTarget(),
  );
}
