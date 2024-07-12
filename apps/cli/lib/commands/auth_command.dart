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
  String get description => 'Manage your Celest Cloud account.';

  @override
  String get category => 'Account';

  // TODO(dnys1): Remove this once the auth command is fully implemented.
  @override
  bool get hidden => true;
}
