// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:functions_framework/serve.dart' as _i3;

import '../../../functions/return_types.dart' as _i2;

final class AsyncOrDoubleReturnTarget extends _i1.CelestFunctionTarget {
  AsyncOrDoubleReturnTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = await _i2.asyncOrDoubleReturn();
            return (statusCode: 200, body: response);
          },
          middleware: [],
        );
}

Future<void> main(List<String> args) async {
  await _i3.serve(
    args,
    (_) => AsyncOrDoubleReturnTarget(),
  );
}
