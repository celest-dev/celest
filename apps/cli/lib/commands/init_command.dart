import 'package:celest_cli/commands/project_init.dart';
import 'package:celest_cli/commands/project_migrate.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:mason_logger/mason_logger.dart';

final class InitCommand extends CelestCommand
    with Configure, Migrate, ProjectCreator {
  InitCommand();

  @override
  String get description => 'Creates a new Celest project.';

  @override
  String get name => 'init';

  @override
  String get category => 'Project';

  @override
  Progress? currentProgress;

  @override
  Future<int> run() async {
    await super.run();

    await checkForLatestVersion();
    await configure();

    currentProgress?.complete('Project generated successfully');
    cliLogger.success(
      'Run `celest start` to start a local development server 🚀',
    );

    return 0;
  }
}
