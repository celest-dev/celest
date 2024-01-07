// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/celest.dart' as _i2;
import 'package:celest/src/runtime.dart' as _i1;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/return_types.dart' as _i3;

final class AsyncOrListReturnNullableTarget extends _i1.CelestFunctionTarget {
  AsyncOrListReturnNullableTarget()
      : super(
          (
            request,
            context,
          ) async {
            final celestContext = _i2.FunctionContext();
            final response = await _i3.asyncOrListReturnNullable(celestContext);
            return (statusCode: 200, body: response);
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  await _i5.serve(
    args,
    (_) => AsyncOrListReturnNullableTarget(),
  );
}
