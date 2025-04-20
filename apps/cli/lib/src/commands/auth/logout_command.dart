import 'package:celest_cli/src/commands/auth/authenticate.dart';
import 'package:celest_cli/src/commands/auth/cli_auth.dart';
import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/config/celest_config.dart';
import 'package:celest_cli/src/context.dart';

final class LogoutCommand extends CelestCommand with Authenticate {
  @override
  String get name => 'logout';

  @override
  String get description => 'Logout of Celest Cloud.';

  @override
  Future<int> run() async {
    await super.run();

    final authState = await auth.init();
    logger.finest('Auth state: $authState');
    try {
      await auth.signOut();
    } on Object catch (e, st) {
      performance.captureError(e, stackTrace: st);
    }

    // Remove local cloud cache
    try {
      final config = CelestConfig();
      await config.secureSettings.clear();
    } on Object catch (e, st) {
      performance.captureError(e, stackTrace: st);
    }

    cliLogger.success('You have been logged out.');
    return 0;
  }
}
