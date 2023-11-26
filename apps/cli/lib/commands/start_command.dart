import 'dart:io';

import 'package:celest_cli/init/project_generator.dart';
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
    final pubspecFile = File('${currentDir.path}/pubspec.yaml');
    if (!pubspecFile.existsSync()) {
      print('Error: No pubspec.yaml file found in the current directory.');
      return 1;
    }
    final pubspecYaml = pubspecFile.readAsStringSync();
    final pubspec = Pubspec.parse(pubspecYaml);

    if (!pubspec.dependencies.containsKey('flutter')) {
      print('Error: Only Flutter projects are supported at this time.');
      return 1;
    }

    final appName = pubspec.name;
    final projectName = logger.prompt(
      'Enter a name for your project',
      defaultValue: appName,
    );

    final celestDir = Directory('${currentDir.path}/celest');
    if (!celestDir.existsSync()) {
      await ProjectGenerator(
        projectName: projectName,
        appRoot: currentDir.path,
        projectRoot: celestDir.path,
      ).generate();
    }

    return 0;
  }
}
