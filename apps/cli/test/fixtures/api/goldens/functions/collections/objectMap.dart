// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import '../../../functions/collections.dart' as _i2;

final class ObjectMapTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'objectMap';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response =
        await _i2.objectMap((request[r'map'] as Map<String, Object?>).map((
      key,
      value,
    ) =>
            MapEntry(
              key,
              value!,
            )));
    return (statusCode: 200, body: {'response': response});
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ObjectMapTarget()},
  );
}
