// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest_runtime_cloud/celest_runtime_cloud.dart' as _i1;

import 'apis/injected/sayHello.dart' as _i2;
import 'apis/injected/sayHelloPerson.dart' as _i3;

void main() {
  _i1.serve(targets: {
    '/injected/sayHello': _i2.SayHelloTarget(),
    '/injected/sayHelloPerson': _i3.SayHelloPersonTarget(),
  });
}
