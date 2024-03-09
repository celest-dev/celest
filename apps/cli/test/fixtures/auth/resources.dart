// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

library;

import 'package:celest/celest.dart';

@Deprecated('Use `Apis` instead.')
typedef apis = Apis;

abstract final class Apis {
  static const authenticatedLib = CloudApi(name: r'authenticated_lib');

  static const lib = CloudApi(name: r'lib');

  static const publicLib = CloudApi(name: r'public_lib');
}

@Deprecated('Use `Functions` instead.')
typedef functions = Functions;

abstract final class Functions {
  static const authenticatedLibSayHello = CloudFunction(
    api: r'authenticated_lib',
    functionName: r'sayHello',
  );

  static const libSayHello = CloudFunction(
    api: r'lib',
    functionName: r'sayHello',
  );

  static const libSayHelloAuthenticated = CloudFunction(
    api: r'lib',
    functionName: r'sayHelloAuthenticated',
  );

  static const libSayHelloPublic = CloudFunction(
    api: r'lib',
    functionName: r'sayHelloPublic',
  );

  static const publicLibSayHello = CloudFunction(
    api: r'public_lib',
    functionName: r'sayHello',
  );
}
