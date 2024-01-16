import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

base mixin Configure on CelestCommand {
  // TODO(dnys1): Move to ProjectPaths. Rename to CelestProject.
  late final Pubspec pubspec;
  late final bool isExistingProject;

  Future<void> configure() async {
    final currentDir = Directory.current;
    final pubspecFile = fileSystem.file(
      p.join(currentDir.path, 'pubspec.yaml'),
    );
    if (!pubspecFile.existsSync()) {
      throw const CelestException(
        'No pubspec.yaml file found in the current directory.',
      );
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
    await init(
      projectRoot: projectRoot,
      clientOutputsDir: p.join(
        celestDir.parent.path,
        'lib',
        'src',
        'celest',
      ),
    );
  }
}
