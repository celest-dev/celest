import 'package:celest_cli/src/context.dart';

enum CliRuntime {
  pubGlobal,
  aot,
  local;

  static CliRuntime get current {
    if (fileSystem.path.fromUri(platform.script).endsWith('.snapshot')) {
      return pubGlobal;
    } else if (platform.executable.contains('dart')) {
      return local;
    } else {
      return aot;
    }
  }
}
