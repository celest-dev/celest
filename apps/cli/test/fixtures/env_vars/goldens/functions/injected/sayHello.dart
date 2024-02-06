// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i3;

import 'package:celest/src/runtime/serve.dart' as _i1;

import '../../../functions/injected.dart' as _i2;

final class SayHelloTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'sayHello';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.sayHello(
      name: _i3.Platform.environment[r'MY_NAME']!,
      age: int.parse(_i3.Platform.environment[r'MY_AGE']!),
    );
    return (statusCode: 200, body: {'response': response});
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': SayHelloTarget()},
  );
}
