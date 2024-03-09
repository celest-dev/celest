import 'dart:async';
import 'dart:io';

import 'package:celest_cli/init/pub/pub_action.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:yaml_edit/yaml_edit.dart';

base mixin Configure on CelestCommand {
  // TODO(dnys1): Move to ProjectPaths. Rename to CelestProject.
  late final Pubspec pubspec;
  late final bool isExistingProject;

  static Never _throwNoProject() => throw const CelestException(
        'No Celest project found in the current directory.',
      );

  static void _noOp() {}

  Future<void> configure({
    FutureOr<String> Function() createProject = _throwNoProject,
    FutureOr<void> Function() migrateProject = _noOp,
  }) async {
    final currentDir = Directory.current;
    final pubspecFile = fileSystem.file(
      p.join(currentDir.path, 'pubspec.yaml'),
    );
    if (!pubspecFile.existsSync()) {
      throw const CelestException(
        'No pubspec.yaml file found in the current directory. '
        'Make sure to run this command from your Flutter project directory.',
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
    this.isExistingProject = isExistingProject;
    await init(
      projectRoot: projectRoot,
    );

    if (!isExistingProject) {
      await createProject();
    } else {
      await migrateProject();
    }

    await _updateAppPubspec();
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
      try {
        await runPub(
          exe: 'flutter',
          action: PubAction.get,
          workingDirectory: projectPaths.appRoot,
        );
      } on Exception catch (e, st) {
        performance.captureError(e, stackTrace: st);
      }
    }
  }
}
