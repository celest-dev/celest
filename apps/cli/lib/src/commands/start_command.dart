import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/frontend/celest_frontend.dart';
import 'package:celest_cli/src/frontend/child_process.dart';
import 'package:celest_cli/src/init/project_init.dart';
import 'package:celest_cli/src/init/project_migrate.dart';
import 'package:mason_logger/mason_logger.dart';

final class StartCommand extends CelestCommand
    with Configure, Migrate, ProjectCreator {
  StartCommand() {
    argParser.addOption(
      'template',
      abbr: 't',
      help: 'The project template to use.',
      allowed: ['hello', 'data'],
      allowedHelp: {
        'hello': 'A simple greeting API.',
        'data': 'A project with a database and cloud functions.',
      },
      defaultsTo: 'hello',
      hide: true,
    );
  }

  @override
  String get description => 'Starts a local Celest environment.';

  @override
  String get name => 'start';

  @override
  String get category => 'Project';

  @override
  Progress? currentProgress;

  @override
  late final String template = argResults!.option('template')!;

  @override
  Future<int> run() async {
    await super.run();

    await checkForLatestVersion();
    final needsMigration = await configure();

    currentProgress ??= cliLogger.progress('Starting local environment');

    ChildProcess? childProcess;
    if (argResults!.rest case final command when command.isNotEmpty) {
      childProcess = ChildProcess(command);
    }

    // Start the Celest Frontend Loop
    return CelestFrontend().run(
      migrateProject: needsMigration,
      currentProgress: currentProgress,
      childProcess: childProcess,
    );
  }
}
