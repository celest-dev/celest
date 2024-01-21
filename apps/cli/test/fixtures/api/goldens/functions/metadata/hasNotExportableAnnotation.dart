// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;

import '../../../functions/metadata.dart' as _i2;

final class HasNotExportableAnnotationTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'hasNotExportableAnnotation';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    _i2.hasNotExportableAnnotation(
      (request[r'value'] as String),
      named: ((request[r'named'] as String?)) ?? 'named',
    );
    return (statusCode: 200, body: {'response': null});
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': HasNotExportableAnnotationTarget()},
  );
}
