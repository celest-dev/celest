// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;

import '../../../functions/return_types.dart' as _i2;

final class StringReturnTarget extends _i1.CloudFunctionTarget {
  StringReturnTarget()
      : super((request) async {
          final response = _i2.stringReturn();
          return (statusCode: 200, body: {'response': response});
        });
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': StringReturnTarget()},
  );
}
