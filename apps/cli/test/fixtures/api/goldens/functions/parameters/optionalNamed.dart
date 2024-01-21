// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import '../../../functions/parameters.dart' as _i2;

final class OptionalNamedTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'optionalNamed';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    await _i2.optionalNamed(
      namedString: ((request[r'namedString'] as String?)) ?? null,
      namedInt: ((request[r'namedInt'] as num?)?.toInt()) ?? null,
    );
    return (statusCode: 200, body: {'response': null});
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': OptionalNamedTarget()},
  );
}
