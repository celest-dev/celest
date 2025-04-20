import 'package:celest_cli/src/commands/auth/login_command.dart';
import 'package:celest_cli/src/commands/auth/logout_command.dart';
import 'package:celest_cli/src/commands/auth/token_command.dart';
import 'package:celest_cli/src/commands/auth/whoami_command.dart';
import 'package:celest_cli/src/commands/celest_command.dart';

final class AuthCommand extends CelestCommand {
  AuthCommand() {
    addSubcommand(LoginCommand());
    addSubcommand(LogoutCommand());
    addSubcommand(TokenCommand());
    addSubcommand(WhoamiCommand());
  }

  @override
  String get name => 'auth';

  @override
  String get description => 'Manage authentication to Celest Cloud.';

  @override
  String get category => 'Account';

  @override
  bool get hidden => true;
}
