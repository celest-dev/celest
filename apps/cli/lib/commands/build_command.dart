import 'package:celest_cli/commands/authenticate.dart';
import 'package:celest_cli/commands/project_init.dart';
import 'package:celest_cli/commands/project_migrate.dart';
import 'package:celest_cli/frontend/celest_frontend.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:mason_logger/src/mason_logger.dart';

final class BuildCommand extends CelestCommand
    with Configure, Migrate, Authenticate {
  @override
  String get name => 'build';

  @override
  String get description => 'Builds your Celest project for hosting.';

  @override
  String get category => 'Project';

  @override
  Progress? currentProgress;

  @override
  Future<int> run() async {
    await super.run();

    final user = await assertAuthenticated();
    final needsMigration = await configure();

    return CelestFrontend().build(
      user: user,
      migrateProject: needsMigration,
      currentProgress: cliLogger.progress('Building project'),
      environmentId: 'production', // TODO(dnys1): Allow setting environment
    );
  }
}
