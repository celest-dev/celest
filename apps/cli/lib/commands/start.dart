import 'dart:io';

import 'package:async/async.dart';
import 'package:celest_cli/analyzer/analyzer.dart';
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli/init/project_generator.dart';
import 'package:celest_cli/project/builder.dart';
import 'package:celest_cli/project/paths.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:path/path.dart' as p;
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:watcher/watcher.dart';

final class StartCommand extends CelestCommand {
  StartCommand();

  @override
  String get description => 'Starts the Celest development process.';

  @override
  String get name => 'start';

  int _exitWithErrors(List<AnalysisException> errors) {
    logger.err('Project has errors:');
    for (final error in errors) {
      logger.err(error.toString());
    }
    return 1;
  }

  @override
  Future<int> run() async {
    await super.run();

    final currentDir = Directory.current;
    final pubspecFile = File(p.join(currentDir.path, 'pubspec.yaml'));
    if (!pubspecFile.existsSync()) {
      logger.err('No pubspec.yaml file found in the current directory.');
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

    if (!isExistingProject) {
      if (!pubspec.dependencies.containsKey('flutter')) {
        logger.err('Only Flutter projects are supported at this time.');
        return 1;
      }

      final appName = pubspec.name;
      final projectName = logger.prompt(
        'Enter a name for your project',
        defaultValue: appName,
      );
      await ProjectGenerator(
        projectName: projectName,
        appRoot: currentDir.path,
        projectRoot: celestDir.path,
      ).generate();
    }

    final projectPaths = ProjectPaths(celestDir.path);

    final analyzer = CelestAnalyzer(
      projectPaths: projectPaths,
    );
    final (:project, :errors) = await analyzer.analyzeProject();
    if (project == null) {
      return _exitWithErrors(errors);
    }

    final environment =
        argResults!.rest.singleOrNull ?? project.environmentNames.singleOrNull;
    if (environment == null) {
      logger.err('No environment specified.');
      return 1;
    }

    final codeGenerator = CodeGenerator(projectPaths: projectPaths);
    project.accept(codeGenerator);
    for (final MapEntry(key: path, value: contents)
        in codeGenerator.fileOutputs.entries) {
      assert(p.isAbsolute(path));
      final file = File(path);
      await file.create(recursive: true);
      await file.writeAsString(contents);
    }

    final projectBuilder = ProjectBuilder(
      project: project,
      projectPaths: projectPaths,
      environmentName: 'dev', // TODO
    );
    final _ = await projectBuilder.build();

    final events = StreamGroup.merge([
      ProcessSignal.sigint.watch(),
      ProcessSignal.sigterm.watch(),
      DirectoryWatcher(celestDir.path).events,
    ]);
    await for (final event in events) {
      if (event is ProcessSignal) {
        print('Stopping Celest...');
        break;
      }
      event as WatchEvent;
      print('Files changed');
    }

    return 0;
  }
}
