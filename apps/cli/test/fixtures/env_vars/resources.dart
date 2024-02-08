// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

library;

import 'package:celest/celest.dart';

abstract final class Apis {
  static const injected = CloudApi(name: r'injected');
}

abstract final class Functions {
  static const injectedSayHello = CloudFunction(
    api: r'injected',
    functionName: r'sayHello',
  );

  static const injectedSayHelloPerson = CloudFunction(
    api: r'injected',
    functionName: r'sayHelloPerson',
  );
}

abstract final class Env {
  static const myName = EnvironmentVariable(name: r'MY_NAME');

  static const myAge = EnvironmentVariable(name: r'MY_AGE');

  static const myHeight = EnvironmentVariable(name: r'MY_HEIGHT');

  static const myWeight = EnvironmentVariable(name: r'MY_WEIGHT');

  static const imCool = EnvironmentVariable(name: r'IM_COOL');

  static const myWebsite = EnvironmentVariable(name: r'MY_WEBSITE');
}
