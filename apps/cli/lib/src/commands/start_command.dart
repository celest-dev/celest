import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/commands/project_init.dart';
import 'package:celest_cli/src/commands/project_migrate.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/frontend/celest_frontend.dart';
import 'package:mason_logger/mason_logger.dart';

final class StartCommand extends CelestCommand
    with Configure, Migrate, ProjectCreator {
  StartCommand();

  @override
  String get description => 'Starts a local Celest environment.';

  @override
  String get name => 'start';

  @override
  String get category => 'Project';

  @override
  Progress? currentProgress;

  @override
  Future<int> run() async {
    await super.run();

    await checkForLatestVersion();
    final needsMigration = await configure();

    currentProgress ??= cliLogger.progress('Starting local environment');

    // Start the Celest Frontend Loop
    return CelestFrontend().run(
      migrateProject: needsMigration,
      currentProgress: currentProgress,
    );
  }
}
