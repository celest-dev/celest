// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

library;

import 'package:celest/celest.dart';

@Deprecated('Use `Env` instead.')
typedef env = Env;

abstract final class Env {
  static const openAiToken = EnvironmentVariable(name: r'OPEN_AI_TOKEN');
}
