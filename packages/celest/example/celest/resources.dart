// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

library;

import 'package:celest/celest.dart';

abstract final class Apis {
  static const greeting = CloudApi(name: r'greeting');
}

abstract final class Functions {
  static const greetingSayHello = CloudFunction(
    api: r'greeting',
    functionName: r'sayHello',
  );
}
