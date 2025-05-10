import 'package:celest_cli/src/commands/auth/authenticate.dart';
import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/init/project_init.dart';
import 'package:celest_cli/src/utils/recase.dart';
import 'package:mason_logger/mason_logger.dart';

final class StatusCommand extends CelestCommand with Configure, Authenticate {
  StatusCommand();

  @override
  String get description => 'Gets the status of the Celest Cloud project.';

  @override
  String get name => 'status';

  @override
  String get category => 'Project';

  @override
  Progress? currentProgress;

  @override
  Future<int> run() async {
    await super.run();

    await assertAuthenticated();
    await configure();

    final projectName = celestProject.projectName.paramCase;
    final projectEnvironment = await cloud.projects.environments.get(
      'projects/$projectName/environments/production',
    );
    if (projectEnvironment == null) {
      cliLogger.warn(
        'This project has not been deployed yet. '
        'Run `celest deploy` to deploy it.',
      );
      return 1;
    }

    cliLogger
      ..success('🚀 Project is live on Celest Cloud!')
      ..info('Project: $projectName')
      ..info('Environment: production')
      ..info('URL: ${projectEnvironment.uri}');

    return 0;
  }
}
