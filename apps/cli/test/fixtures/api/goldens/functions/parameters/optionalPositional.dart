// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import '../../../functions/parameters.dart' as _i2;

final class OptionalPositionalTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'optionalPositional';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    await _i2.optionalPositional(
      (request[r'optionalString'] as String?),
      (request[r'optionalInt'] as num?)?.toInt(),
    );
    return (statusCode: 200, body: {'response': null});
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': OptionalPositionalTarget()},
  );
}
