// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'file:///Users/dillonnys/celest/cloud/apps/cli/e2e/api/apis/middleware.dart'
    as _i6;

import 'package:celest/celest.dart' as _i2;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../apis/middleware.dart' as _i3;

class SayHelloTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final celestContext = _i2.FunctionContext();
      final response = await _i3.sayHello(
        celestContext,
        (request[r'name'] as String),
      );
      return response;
    },
    (json) => json as Map<String, dynamic>,
  );

  @override
  _i4.FutureOr<_i5.Response> handler(_i5.Request request) {
    final handler = _i5.Pipeline()
        .addMiddleware(const _i6.fourth().handle)
        .addMiddleware(const _i6.third().handle)
        .addMiddleware(const _i6.second().handle)
        .addMiddleware(const _i6.first().handle)
        .addHandler(_inner.handler);
    return handler(request);
  }
}

_i4.Future<void> main(List<String> args) async {
  await _i1.serve(
    args,
    (_) => SayHelloTarget(),
  );
}
