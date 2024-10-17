import 'package:celest_cli/commands/authenticate.dart';
import 'package:celest_cli/commands/project_init.dart';
import 'package:celest_cli/commands/project_migrate.dart';
import 'package:celest_cli/frontend/celest_frontend.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:mason_logger/src/mason_logger.dart';

final class DeployCommand extends CelestCommand
    with Configure, Migrate, Authenticate {
  @override
  String get name => 'deploy';

  @override
  String get description => 'Deploys your Celest project to the cloud.';

  @override
  String get category => 'Project';

  @override
  Progress? currentProgress;

  @override
  Future<int> run() async {
    await super.run();

    final needsMigration = await configure();

    if (await authenticate() case final code when code != 0) {
      return code;
    }

    return CelestFrontend().deploy(migrateProject: needsMigration);
  }
}
