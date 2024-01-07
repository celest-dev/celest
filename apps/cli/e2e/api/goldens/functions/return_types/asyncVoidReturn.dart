// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/celest.dart' as _i2;
import 'package:celest/src/runtime.dart' as _i1;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/return_types.dart' as _i3;

final class AsyncVoidReturnTarget extends _i1.CelestFunctionTarget {
  AsyncVoidReturnTarget()
      : super(
          (
            request,
            context,
          ) async {
            final celestContext = _i2.FunctionContext();
            _i3.asyncVoidReturn(celestContext);
            return (statusCode: 200, body: null);
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  await _i5.serve(
    args,
    (_) => AsyncVoidReturnTarget(),
  );
}
