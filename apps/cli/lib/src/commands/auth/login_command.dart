import 'package:cedar/cedar.dart';
import 'package:celest_auth/celest_auth.dart';
import 'package:celest_cli/src/commands/auth/authenticate.dart';
import 'package:celest_cli/src/commands/auth/cli_auth.dart';
import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/exceptions.dart';
import 'package:corks_cedar/corks_cedar.dart';

final class LoginCommand extends CelestCommand with Authenticate {
  LoginCommand() {
    argParser.addOption(
      'token',
      help: 'Use a token to authenticate instead of the interactive CLI flow.',
    );
  }

  @override
  String get name => 'login';

  @override
  String get description => 'Login to Celest Cloud.';

  String? get token => argResults?['token'] as String?;

  Future<int> _loginWithToken(String token) async {
    final cork = CedarCork.parse(token);
    final userId = switch (cork.claims) {
      Entity(parents: [EntityUid(type: 'Celest::User', :final id)]) => id,
      _ => throw CliException('Invalid token passed with --token flag.'),
    };
    auth.localStorage.write('userId', userId);
    await auth.secureStorage.write('cork', token);

    final authState = await auth.init();
    logger.finest('Auth state: $authState');
    if (authState case Authenticated(:final user)) {
      cliLogger.success(
        'You have been logged in as: ${user.primaryEmail?.email}',
      );
      return 0;
    }

    // Failed to authenticate with the token.
    auth.localStorage.delete('userId');
    await auth.secureStorage.delete('cork');
    throw CliException('Failed to authenticate with token.');
  }

  @override
  Future<int> run() async {
    await super.run();

    if (token case final token?) {
      return _loginWithToken(token);
    }

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
