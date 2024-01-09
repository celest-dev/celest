// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:functions_framework/serve.dart' as _i4;

import '../../../functions/return_types.dart' as _i2;

final class AsyncOrVoidReturnNullableTarget extends _i1.CelestFunctionTarget {
  AsyncOrVoidReturnNullableTarget()
      : super(
          (
            request,
            context,
          ) async {
            _i2.asyncOrVoidReturnNullable();
            return (statusCode: 200, body: null);
          },
          middleware: [],
        );
}

_i3.Future<void> main(List<String> args) async {
  await _i4.serve(
    args,
    (_) => AsyncOrVoidReturnNullableTarget(),
  );
}
