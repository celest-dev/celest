import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:celest_cli/database/database.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:process/src/interface/common.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:yaml_edit/yaml_edit.dart';

base mixin Configure on CelestCommand {
  // TODO(dnys1): Move to ProjectPaths. Rename to CelestProject.
  late final Pubspec pubspec;
  late final bool isExistingProject;

  static Never _throwNoProject() => throw const CelestException(
        'No Celest project found in the current directory.',
      );

  Future<void> configure({
    FutureOr<String> Function() createProject = _throwNoProject,
  }) async {
    final currentDir = Directory.current;
    final pubspecFile = fileSystem.file(
      p.join(currentDir.path, 'pubspec.yaml'),
    );
    if (!pubspecFile.existsSync()) {
      throw const CelestException(
        'No pubspec.yaml file found in the current directory.',
      );
    }
    final pubspecYaml = await pubspecFile.readAsString();
    pubspec = Pubspec.parse(pubspecYaml);

    final (celestDir, isExistingProject) =
        switch (pubspec.dependencies.containsKey('celest')) {
      true => (currentDir, true),
      false => () {
          final dir = Directory(p.join(currentDir.path, 'celest'));
          return (dir, dir.existsSync());
        }(),
    };

    final projectRoot = celestDir.path;
    await init(
      projectRoot: projectRoot,
    );

    if (!isExistingProject) {
      await createProject();
    }

    await _addProjectToDb();
    await _updateAppPubspec();

    this.isExistingProject = isExistingProject;
  }

  /// Ensures projects are recorded in the DB
  Future<void> _addProjectToDb() async {
    final celestPubspec = Pubspec.parse(
      await fileSystem
          .file(p.join(projectPaths.projectRoot, 'pubspec.yaml'))
          .readAsString(),
    );
    logger.finest('Checking if project exists in DB...');
    final dbProject = await celestProject.database
        .findProjectByPath(projectPaths.projectRoot);
    logger.finest('Found project in DB: $dbProject');
    if (dbProject == null) {
      logger.finest('Creating project in DB...');
      await celestProject.database.createProject(
        ProjectsCompanion.insert(
          name: celestPubspec.name,
          path: projectPaths.projectRoot,
        ),
      );
      logger.finest('Created project in DB');
    }
  }

  /// Ensures app has dependency on celest project
  Future<void> _updateAppPubspec() async {
    final appPubspecFile = fileSystem.file(
      p.join(projectPaths.appRoot, 'pubspec.yaml'),
    );
    final appPubspecYaml = await appPubspecFile.readAsString();
    if (!Pubspec.parse(appPubspecYaml)
        .dependencies
        .containsKey(celestProject.packageName)) {
      final updatedPubspec = YamlEditor(appPubspecYaml)
        ..update(
          ['dependencies', celestProject.packageName],
          {'path': 'celest/'},
        );
      await appPubspecFile.writeAsString(updatedPubspec.toString());
      await pubGet(
        exe: getExecutablePath(
              'flutter',
              fileSystem.currentDirectory.path,
              platform: platform,
              fs: fileSystem,
              throwOnFailure: false,
            ) ??
            'flutter',
        workingDirectory: projectPaths.appRoot,
      );
    }
  }

  Future<void> pubGet({
    String? exe,
    String? workingDirectory,
  }) async {
    exe ??= Sdk.current.dart;
    final projectRoot = projectPaths.projectRoot;
    logger.fine('Running pub get in "$projectRoot"...');
    final result = await processManager.run(
      [exe, 'pub', 'upgrade'],
      workingDirectory: workingDirectory,
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    if (result.exitCode != 0) {
      throw ProcessException(
        exe,
        ['pub', 'upgrade'],
        '${result.stdout}\n${result.stderr}',
        result.exitCode,
      );
    }
  }
}
