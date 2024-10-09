// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/env_vars/goldens/functions/injected/sayHello.dart'
    as _i2;
import '/Users/dillonnys/celest/cloud/apps/cli/test/fixtures/legacy/env_vars/goldens/functions/injected/sayHelloPerson.dart'
    as _i3;

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {
    '/injected/say-hello': _i2.SayHelloTarget(),
    '/injected/say-hello-person': _i3.SayHelloPersonTarget(),
  });
}
