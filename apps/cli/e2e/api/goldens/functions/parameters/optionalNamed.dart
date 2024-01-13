// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:functions_framework/serve.dart' as _i3;

import '../../../functions/parameters.dart' as _i2;

final class OptionalNamedTarget extends _i1.CelestFunctionTarget {
  OptionalNamedTarget()
      : super(
          (
            request,
            context,
          ) async {
            _i2.optionalNamed(
              namedString: ((request[r'namedString'] as String?)) ?? null,
              namedInt: ((request[r'namedInt'] as num?)?.toInt()) ?? null,
            );
            return (statusCode: 200, body: null);
          },
          middleware: [],
        );
}

Future<void> main(List<String> args) async {
  await _i3.serve(
    args,
    (_) => OptionalNamedTarget(),
  );
}
