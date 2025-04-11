import 'package:celest_auth/celest_auth.dart';
import 'package:celest_cli/src/commands/auth/cli_auth.dart';
import 'package:celest_cli/src/commands/authenticate.dart';
import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/context.dart';

final class LoginCommand extends CelestCommand with Authenticate {
  @override
  String get name => 'login';

  @override
  String get description => 'Login to Celest Cloud.';

  @override
  Future<int> run() async {
    await super.run();

    final authState = await auth.init();
    logger.finest('Auth state: $authState');
    switch (authState) {
      case Authenticated(:final user):
        cliLogger.success(
          'You are already logged in as: ${user.primaryEmail?.email}',
        );
      default:
        logger.finest('Unauthenticated user. Signing up...');
        final res = await signUp();
        if (res != 0) {
          return res;
        }
        cliLogger.success('You have been logged in!');
    }

    return 0;
  }
}
