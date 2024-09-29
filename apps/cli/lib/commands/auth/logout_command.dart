import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/authenticate.dart';
import 'package:celest_cli/config/celest_config.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

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
      final config = await CelestConfig.load();
      final cloudDb = config.configDir.childFile('cloud.db');
      if (cloudDb.existsSync()) {
        await cloudDb.delete();
      }
    } on Object catch (e, st) {
      performance.captureError(e, stackTrace: st);
    }

    cliLogger.success('You have been logged out.');
    return 0;
  }
}
