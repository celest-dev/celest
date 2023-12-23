import 'dart:io';

import 'package:celest_cli/frontend/celest_frontend.dart';
import 'package:celest_cli/init/project_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

final class StartCommand extends CelestCommand {
  StartCommand();

  @override
  String get description => 'Starts the Celest development process.';

  @override
  String get name => 'start';

  @override
  Future<int> run() async {
    await super.run();

    final currentDir = Directory.current;
    final pubspecFile = fileSystem.file(
      p.join(currentDir.path, 'pubspec.yaml'),
    );
    if (!pubspecFile.existsSync()) {
      logger.shout('No pubspec.yaml file found in the current directory.');
      return 1;
    }
    final pubspecYaml = pubspecFile.readAsStringSync();
    final pubspec = Pubspec.parse(pubspecYaml);

    final (celestDir, isExistingProject) =
        switch (pubspec.dependencies.containsKey('celest')) {
      true => (currentDir, true),
      false => () {
          final dir = Directory(p.join(currentDir.path, 'celest'));
          return (dir, dir.existsSync());
        }(),
    };

    final projectRoot = celestDir.path;
    init(projectRoot: projectRoot);

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
        appRoot: currentDir.path,
        projectRoot: projectRoot,
      ).generate();
    }

    // Ensure all `Process.start` commands are performed from the Celest dir.
    // TODO: Hacky, find a better way to do this.
    Directory.current = celestDir;

    try {
      // Start the Celest Frontend Loop
      return await CelestFrontend().run();
    } on Exception catch (e) {
      logger.shout('An error occurred while running Celest: $e');
      return 1;
    }
  }
}
