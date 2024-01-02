import 'dart:io';

import 'package:celest_cli/commands/project_command.dart';
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

  @override
  Future<int> run() async {
    await super.run();

    if (!isExistingProject) {
      if (!pubspec.dependencies.containsKey('flutter')) {
        logger.shout('Only Flutter projects are supported at this time.');
        return 1;
      }

      final appName = pubspec.name;
      final projectName = cliLogger.prompt(
        'Enter a name for your project',
        defaultValue: appName,
      );
      await ProjectGenerator(
        projectName: projectName,
        appRoot: Directory.current.path,
        projectRoot: projectPaths.projectRoot,
      ).generate();
      cliLogger.success('Project generated successfully.');
    }

    // Ensure all `Process.start` commands are performed from the Celest dir.
    // TODO: Hacky, find a better way to do this.
    Directory.current = projectPaths.projectRoot;

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
