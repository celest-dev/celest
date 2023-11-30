import 'dart:io';

import 'package:async/async.dart';
import 'package:celest_cli/analyzer/analyzer.dart';
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli/init/project_generator.dart';
import 'package:celest_cli/project/builder.dart';
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

    final (celestDir, isExistingProject) =
        switch (pubspec.dependencies.containsKey('celest')) {
      true => (Directory.current, true),
      false => (Directory('${currentDir.path}/celest'), false),
    };

    if (!isExistingProject) {
      if (!pubspec.dependencies.containsKey('flutter')) {
        print('Error: Only Flutter projects are supported at this time.');
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

    final analyzer = CelestAnalyzer.start(
      projectRoot: celestDir.path,
    );
    final (project, errors) = await analyzer.analyzeProject();
    if (errors.isNotEmpty) {
      stderr
        ..writeln('Project has errors:')
        ..writeln(errors.join('\n'));
      return 1;
    }

    final codeGenerator = CodeGenerator(celestDir.path);
    project.accept(codeGenerator);
    for (final MapEntry(key: path, value: contents)
        in codeGenerator.outputs.entries) {
      print('Writing $path');
      print(contents);
    }

    final projectBuilder = ProjectBuilder(
      projectName: project.name,
      entrypoint: p.toUri(
        p.join(codeGenerator.outputDir, 'project.build.dart'),
      ),
      rootDir: celestDir.path,
      outputDir: codeGenerator.outputDir,
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
