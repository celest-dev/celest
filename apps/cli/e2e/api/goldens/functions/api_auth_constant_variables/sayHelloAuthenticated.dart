// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:functions_framework/serve.dart' as _i4;

import '../../../functions/api_auth_constant_variables.dart' as _i2;

final class SayHelloAuthenticatedTarget extends _i1.CelestFunctionTarget {
  SayHelloAuthenticatedTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = _i2.sayHelloAuthenticated();
            return (statusCode: 200, body: response);
          },
          middleware: [],
        );
}

_i3.Future<void> main(List<String> args) async {
  await _i4.serve(
    args,
    (_) => SayHelloAuthenticatedTarget(),
  );
}
