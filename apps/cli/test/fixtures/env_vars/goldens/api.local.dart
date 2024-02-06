// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;

import 'functions/injected/sayHello.dart' as _i2;
import 'functions/injected/sayHelloPerson.dart' as _i3;

void main() {
  _i1.serve(targets: {
    '/injected/say-hello': _i2.SayHelloTarget(),
    '/injected/say-hello-person': _i3.SayHelloPersonTarget(),
  });
}
