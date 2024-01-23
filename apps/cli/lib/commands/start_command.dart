import 'dart:io';

import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/commands/project_init.dart';
import 'package:celest_cli/frontend/celest_frontend.dart';
import 'package:celest_cli/init/project_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

final class StartCommand extends CelestCommand with Configure {
  StartCommand();

  @override
  String get description => 'Starts the Celest development process.';

  @override
  String get name => 'start';

  Future<String> _createProject() async {
    if (!pubspec.dependencies.containsKey('flutter')) {
      throw const CelestException(
        'Only Flutter projects are supported at this time.',
      );
    }

    final appName = pubspec.name.snakeCase;
    if (appName == 'celest') {
      throw const CelestException(
        'Your Flutter project name cannot be "celest". Please change it in '
        'pubspec.yaml and run `celest start` again.',
      );
    }

    final projectName = switch (platform.operatingSystem) {
      // readLineSync is broken on Windows Terminal
      // https://github.com/dart-lang/sdk/issues/54588
      // https://github.com/microsoft/terminal/issues/16223
      'windows' => appName,
      _ => cliLogger
          .prompt(
            'Enter a name for your project',
            defaultValue: appName,
          )
          .snakeCase,
    };

    logger.finest(
      'Generating project for "$projectName" at '
      '"${projectPaths.projectRoot}"...',
    );
    await ProjectGenerator(
      projectName: projectName,
      appRoot: Directory.current.path,
      projectRoot: projectPaths.projectRoot,
    ).generate();
    cliLogger.success('Project generated successfully.');
    return projectName;
  }

  @override
  Future<int> run() async {
    await super.run();

    await configure(createProject: _createProject);

    if (!await fileSystem
        .directory(projectPaths.projectDart)
        .childDirectory('.dart_tool')
        .childFile('package_config.json')
        .exists()) {
      await pubGet(workingDirectory: projectPaths.projectRoot);
    }

    // Start the Celest Frontend Loop
    return CelestFrontend().run();
  }
}
