// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// Generated by `celest start`. This file should not be modified manually, but
// it can be checked into version control.

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:celest/celest.dart' as _i1;

abstract final class apis {
  static const override = _i1.CloudApi(name: r'override');
}

abstract final class functions {
  static const overrideSayHello = _i1.CloudFunction<void, String>(
    api: r'override',
    functionName: r'sayHello',
  );
}

List<_i1.CloudWidget> all = const [
  apis.override,
  functions.overrideSayHello,
];
