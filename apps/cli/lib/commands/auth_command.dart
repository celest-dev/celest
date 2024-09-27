import 'package:celest_cli/commands/auth/login_command.dart';
import 'package:celest_cli/commands/auth/logout_command.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

final class AuthCommand extends CelestCommand {
  AuthCommand() {
    addSubcommand(LoginCommand());
    addSubcommand(LogoutCommand());
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
