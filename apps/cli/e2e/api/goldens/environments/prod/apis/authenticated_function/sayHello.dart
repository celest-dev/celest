// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i4;

import '../../../../../apis/authenticated_function.dart' as _i2;

class SayHelloTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final response = _i2.sayHello();
      return response;
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
    (_) => SayHelloTarget(),
  );
}
