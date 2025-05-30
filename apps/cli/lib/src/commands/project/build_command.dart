import 'package:celest_cli/src/commands/auth/authenticate.dart';
import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/frontend/celest_frontend.dart';
import 'package:celest_cli/src/init/project_init.dart';
import 'package:celest_cli/src/init/project_migrate.dart';
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

    final needsMigration = await configure();

    return CelestFrontend(stopSignal: stopSignal).build(
      migrateProject: needsMigration,
      currentProgress: cliLogger.progress('Building project'),
      environmentId: 'production', // TODO(dnys1): Allow setting environment
    );
  }
}
