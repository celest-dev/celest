import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:meta/meta.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

abstract base class ProjectCommand extends CelestCommand {
  @override
  String get category => 'Project';

  // TODO: Move to ProjectPaths. Rename to CelestProject.
  late final Pubspec pubspec;
  late final bool isExistingProject;

  @override
  @mustCallSuper
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
    pubspec = Pubspec.parse(pubspecYaml);

    final (celestDir, isExistingProject) =
        switch (pubspec.dependencies.containsKey('celest')) {
      true => (currentDir, true),
      false => () {
          final dir = Directory(p.join(currentDir.path, 'celest'));
          return (dir, dir.existsSync());
        }(),
    };
    this.isExistingProject = isExistingProject;

    final projectRoot = celestDir.path;
    init(projectRoot: projectRoot);

    return 0;
  }
}
