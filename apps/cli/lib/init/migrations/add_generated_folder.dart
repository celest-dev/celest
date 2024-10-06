// ignore_for_file: constant_identifier_names

import 'package:celest_cli/init/project_migration.dart';
import 'package:celest_cli/src/context.dart';
import 'package:file/file.dart';

final class GeneratedFolder extends ProjectMigration {
  const GeneratedFolder(super.projectRoot);

  @override
  bool get needsMigration => false;

  @override
  String get name => 'core.layout.generated';

  @override
  Future<ProjectMigrationResult> create() async {
    final generatedDir =
        fileSystem.directory(projectRoot).childDirectory('generated');
    await _createIfNotExists(
      generatedDir.childFile('README.md'),
      generated_README,
    );
    return const ProjectMigrationSuccess();
  }
}

Future<void> _createIfNotExists(File file, String content) async {
  if (!file.existsSync()) {
    await file.create(recursive: true);
    await file.writeAsString(content);
  }
}

const generated_README = '''
# Generated Celest code

This directory contains code generated by the Celest CLI to assist in building
your backend.

This code can be safely checked into version control, but it should not be
modified directly.

It is planned to replace this directory with macros when they become stable.
''';
