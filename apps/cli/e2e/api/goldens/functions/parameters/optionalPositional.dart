// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/celest.dart' as _i2;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../functions/parameters.dart' as _i3;

class OptionalPositionalTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final celestContext = _i2.FunctionContext();
      return _i3.optionalPositional(
        celestContext,
        (request[r'optionalString'] as String?),
        (request[r'optionalInt'] as int?),
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
  await _i1.serve(
    args,
    (_) => OptionalPositionalTarget(),
  );
}
