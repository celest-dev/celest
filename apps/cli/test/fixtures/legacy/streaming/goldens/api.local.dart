// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import 'functions/server_side/hello.dart' as _i2;

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/server-side/hello': _i2.HelloTarget()});
}
