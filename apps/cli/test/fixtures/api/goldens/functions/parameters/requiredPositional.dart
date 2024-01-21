// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;

import '../../../functions/parameters.dart' as _i2;

final class RequiredPositionalTarget extends _i1.CloudFunctionTarget {
  RequiredPositionalTarget()
      : super((request) async {
          await _i2.requiredPositional(
            (request[r'requiredString'] as String),
            (request[r'requiredInt'] as num).toInt(),
          );
          return (statusCode: 200, body: {'response': null});
        });
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': RequiredPositionalTarget()},
  );
}
