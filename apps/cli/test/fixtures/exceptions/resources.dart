// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

library;

import 'package:celest/celest.dart';

abstract final class Apis {
  static const nonthrowing = CloudApi(name: r'nonthrowing');

  static const throwing = CloudApi(name: r'throwing');
}

abstract final class Functions {
  static const nonthrowingCallsThrowsBaseError = CloudFunction(
    api: r'nonthrowing',
    functionName: r'callsThrowsBaseError',
  );

  static const nonthrowingCallsThrowsBaseException = CloudFunction(
    api: r'nonthrowing',
    functionName: r'callsThrowsBaseException',
  );

  static const nonthrowingCallsThrowsCustomError = CloudFunction(
    api: r'nonthrowing',
    functionName: r'callsThrowsCustomError',
  );

  static const nonthrowingCallsThrowsCustomException = CloudFunction(
    api: r'nonthrowing',
    functionName: r'callsThrowsCustomException',
  );

  static const throwingThrowsBaseError = CloudFunction(
    api: r'throwing',
    functionName: r'throwsBaseError',
  );

  static const throwingThrowsBaseException = CloudFunction(
    api: r'throwing',
    functionName: r'throwsBaseException',
  );

  static const throwingThrowsCustomError = CloudFunction(
    api: r'throwing',
    functionName: r'throwsCustomError',
  );

  static const throwingThrowsCustomException = CloudFunction(
    api: r'throwing',
    functionName: r'throwsCustomException',
  );
}
