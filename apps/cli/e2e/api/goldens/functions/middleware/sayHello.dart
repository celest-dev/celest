// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/celest.dart' as _i2;
import 'package:celest/src/runtime.dart' as _i1;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/middleware.dart' as _i3;

final class SayHelloTarget extends _i1.CelestFunctionTarget {
  SayHelloTarget()
      : super(
          (
            request,
            context,
          ) async {
            final celestContext = _i2.FunctionContext();
            final response = await _i3.sayHello(
              celestContext,
              (request[r'name'] as String),
            );
            return (statusCode: 200, body: response);
          },
          middleware: [
            const _i3.fourth().handle,
            const _i3.third().handle,
            const _i3.second().handle,
            const _i3.first().handle,
          ],
        );
}

_i4.Future<void> main(List<String> args) async {
  await _i5.serve(
    args,
    (_) => SayHelloTarget(),
  );
}
