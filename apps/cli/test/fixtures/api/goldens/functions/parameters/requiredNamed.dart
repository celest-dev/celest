// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:functions_framework/serve.dart' as _i3;

import '../../../functions/parameters.dart' as _i2;

final class RequiredNamedTarget extends _i1.CelestFunctionTarget {
  RequiredNamedTarget()
      : super(
          (
            request,
            context,
          ) async {
            _i2.requiredNamed(
              requiredString: (request[r'requiredString'] as String),
              requiredInt: (request[r'requiredInt'] as num).toInt(),
            );
            return (statusCode: 200, body: null);
          },
          middleware: [],
        );
}

Future<void> main(List<String> args) async {
  await _i3.serve(
    args,
    (_) => RequiredNamedTarget(),
  );
}
