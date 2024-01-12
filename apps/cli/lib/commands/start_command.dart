import 'dart:io';

import 'package:celest_cli/commands/project_command.dart';
import 'package:celest_cli/database/database.dart';
import 'package:celest_cli/frontend/celest_frontend.dart';
import 'package:celest_cli/init/project_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

final class StartCommand extends ProjectCommand {
  StartCommand();

  @override
  String get description => 'Starts the Celest development process.';

  @override
  String get name => 'start';

  Future<void> _createProject() async {
    if (!pubspec.dependencies.containsKey('flutter')) {
      throw const CelestException(
        'Only Flutter projects are supported at this time.',
      );
    }

    final appName = pubspec.name;
    final projectName = cliLogger.prompt(
      'Enter a name for your project',
      defaultValue: appName,
    );
    logger.finest(
      'Generating project for "$projectName" at '
      '"${projectPaths.projectRoot}"...',
    );
    await ProjectGenerator(
      projectName: projectName,
      appRoot: Directory.current.path,
      projectRoot: projectPaths.projectRoot,
    ).generate();
    logger.finest('Inserting project into DB...');
    await database.createProject(
      ProjectsCompanion.insert(
        name: projectName,
        path: projectPaths.projectRoot,
      ),
    );
    cliLogger.success('Project generated successfully.');
  }

  @override
  Future<int> run() async {
    await super.run();

    if (!isExistingProject) {
      await _createProject();
    }

    try {
      // Start the Celest Frontend Loop
      return await CelestFrontend().run();
    } on Exception catch (e, st) {
      logger.shout('An error occurred while running Celest', e, st);
      await performance.captureError(e, stackTrace: st);
      return 1;
    }
  }
}
