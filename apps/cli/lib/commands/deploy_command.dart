import 'package:celest_cli/commands/project_init.dart';
import 'package:celest_cli/frontend/celest_frontend.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

final class DeployCommand extends CelestCommand with Configure {
  @override
  String get name => 'deploy';

  @override
  String get description => 'Deploys your Celest project to the cloud.';

  @override
  String get category => 'Project';

  @override
  bool get hidden => true;

  @override
  Future<int> run() async {
    await super.run();
    await configure();

    cliLogger.warn(
      'Celest Cloud is currently invite-only. If you have an invite code, '
      'please enter it below.',
    );
    final email = cliLogger.prompt('Invite code:');
    if (email.isEmpty) {
      return 1;
    }

    return CelestFrontend().build(email: email);
  }
}
