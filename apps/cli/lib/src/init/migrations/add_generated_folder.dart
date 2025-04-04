// ignore_for_file: constant_identifier_names

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/init/project_migration.dart';

final class GeneratedFolder extends ProjectMigration {
  GeneratedFolder(super.projectRoot);

  late final _readmeFile = fileSystem
      .directory(projectRoot)
      .childDirectory('generated')
      .childFile('README.md');

  @override
  bool get needsMigration => !_readmeFile.existsSync();

  @override
  String get name => 'core.layout.generated';

  @override
  Future<ProjectMigrationResult> create() async {
    await _readmeFile.create(recursive: true);
    await _readmeFile.writeAsString(generated_README);
    return const ProjectMigrationSuccess();
  }
}

const generated_README = '''
# Generated Celest code

This directory contains code generated by the Celest CLI to assist in building
your backend.

This code can be safely checked into version control, but it should not be
modified directly.
''';
