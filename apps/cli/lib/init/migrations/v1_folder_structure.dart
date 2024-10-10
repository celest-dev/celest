import 'package:celest_cli/init/project_migration.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:file/file.dart';
import 'package:git/git.dart';
import 'package:logging/logging.dart';

/// Migrates the project folder structure to V1's layout.
///
/// Pre-V1, the structure of a Celest project was:
///
/// celest/
///   pubspec.yaml
///   project.dart
///   functions/
///     hello_world.dart
///   lib/
///     client.dart
///     models/
///     exceptions/
///
/// where client code was generated into the `lib` directory. This created
/// confusion because it meant that generated code like `client.dart` was
/// mixed with hand-written code like `models`.
///
/// In V1, there is a clean and explicit separation between generated client
/// code and backend code. We introduce a new `client` folder which holds
/// the generated client. The structure of a V1 Celest project is:
///
/// celest/
///   pubspec.yaml
///   project.dart
///   client/
///     pubspec.yaml
///     lib/
///       client.dart
///   functions/
///     hello_world.dart
///   models/
///
/// To workaround Dart limitations, customers see the following folder
/// structure (no `lib/` folder), but all of the top-level folders (functions,
/// models, etc.) are actually symlinks into the `lib/src` folder. This
/// allows us complete control over that folder (since we need to generate
/// some backend code too) while providing a clean separation between the
/// different parts.
final class V1FolderStructure extends ProjectMigration {
  V1FolderStructure(
    super.projectRoot,
    this.projectName,
    this.parentProject,
  );

  final String projectName;
  final ParentProject? parentProject;

  @override
  String get name => 'core.layout.v1';

  static final _logger = Logger('V1FolderStructure');

  final _operations = <Future<void>>[];

  late final generatedClientEntities = [
    projectDir.childDirectory('lib').childFile('client.dart'),
    fileSystem.directory(projectPaths.legacyClientOutputsDir),
  ];

  late final symlinkdDirs = [
    (
      projectDir.childDirectory('functions'),
      projectDir
          .childDirectory('lib')
          .childDirectory('src')
          .childDirectory('functions'),
    ),
    (
      projectDir.childDirectory('generated'),
      projectDir
          .childDirectory('lib')
          .childDirectory('src')
          .childDirectory('generated'),
    ),
  ];

  late final symlinkdFiles = [
    (
      projectDir.childFile('project.dart'),
      projectDir
          .childDirectory('lib')
          .childDirectory('src')
          .childFile('project.dart'),
    ),
  ];

  late final symlinkdEntities = [
    ...symlinkdDirs,
    ...symlinkdFiles,
  ];

  @override
  bool get needsMigration {
    for (final entity in generatedClientEntities) {
      if (entity.existsSync()) {
        return true;
      }
    }
    for (final entity in symlinkdEntities) {
      if (!entity.$2.existsSync()) {
        return true;
      }
    }
    if (!projectDir.childDirectory('client').existsSync()) {
      return true;
    }
    return false;
  }

  @override
  Future<ProjectMigrationResult> create() async {
    final rootDir = fileSystem.directory(projectRoot);
    // Start by removing all pre-V1 generated client code.
    for (final entity in generatedClientEntities) {
      if (entity.existsSync()) {
        _logger.finest('Removing ${entity.path}...');
        _operations.add(entity.delete(recursive: true));
      }
    }

    // Create the new client folder layout.
    final clientMigration = ProjectFile.client(projectRoot, projectName);
    if (clientMigration.needsMigration) {
      _operations.add(clientMigration.create());
    }

    // Move `functions` to `lib/src` and create symlinks.
    final moveOperations = <Future<Link?>>[];
    for (final (from, to) in symlinkdDirs) {
      if (!from.existsSync() || fileSystem.isLinkSync(from.path)) {
        continue;
      }
      if (to.existsSync() && to.listSync().isNotEmpty) {
        throw const CelestException(
          'Project in partial migration state. Please follow the migration '
          'guide at https://celest.dev/docs/v1-migration before continuing.',
        );
      }
      moveOperations.add(_move(from, to));
    }
    for (final (from, to) in symlinkdFiles) {
      if (fileSystem.isLinkSync(from.path)) {
        continue;
      }
      moveOperations.add(
        from.copy(to.path).then((_) async {
          await from.delete();
          return fileSystem.link(from.path).create(to.path);
        }),
      );
    }
    if (moveOperations.isNotEmpty) {
      _operations.add(
        Future.wait(moveOperations).then((links) {
          return _stageChangesInGit(rootDir);
        }),
      );
    }

    final fixDataFile = fileSystem.file(
      p.join(projectRoot, 'lib', 'fix_data', 'v1_migration.yaml'),
    );
    if (!fixDataFile.existsSync()) {
      final now = DateTime.now();
      final date = '${now.year}-'
          '${now.month.toString().padLeft(2, '0')}-'
          '${now.day.toString().padLeft(2, '0')}';
      final clientPackageName = '${projectName.snakeCase}_client';
      _operations.add(
        fixDataFile.parent.create(recursive: true).then<void>(
              (_) => fixDataFile.writeAsString('''
# Generated by Celest. Do not modify.
version: 1
transforms:
  - title: "Updates the import of the Celest client"
    date: $date
    element:
      uris: ["client.dart"]
      variable: celest
    changes:
      - kind: replacedBy
        newElement:
          uris: ["package:$clientPackageName/$clientPackageName.dart"]
          variable: celest
'''),
            ),
      );
    }

    // Move legacy Auth file if present.
    final legacyAuthFile = fileSystem.file(projectPaths.legacyAuthDart);
    if (legacyAuthFile.existsSync()) {
      _operations.add(
        legacyAuthFile.rename(projectPaths.authDart).then<void>((_) async {
          await legacyAuthFile.parent.delete();
        }),
      );
    }

    if (_operations.isEmpty) {
      return const ProjectMigrationSkipped();
    }

    await Future.wait(_operations);
    return const ProjectMigrationSuccess(needsAnalyzerMigration: true);
  }

  /// Moves one directory to another.
  ///
  /// Returns the new symlink.
  Future<Link?> _move(Directory from, Directory to) async {
    await for (final file in from.list(recursive: true, followLinks: false)) {
      final relativePath = p.relative(file.path, from: from.path);
      final destination = to.childFile(relativePath);
      switch (file) {
        case File():
          await destination.parent.create(recursive: true);
          await file.rename(destination.path);
        case Link():
          await destination.parent.create(recursive: true);
          await file.rename(destination.path);
        case Directory():
          break;
        default:
          unreachable('Unexpected file type: $file');
      }
    }
    await from.delete(recursive: true);
    if (p.basename(from.path) == 'generated') {
      final resourcesDart = to.childFile('resources.dart');
      if (resourcesDart.existsSync()) {
        await resourcesDart.delete();
      }
      // Don't create a link for the generated folder.
      return null;
    }
    return fileSystem.link(from.path).create(to.path);
  }

  /// The creation of symbolic links really throws git for a loop in VSCode.
  ///
  /// In projects with a `.git` directory, `git add .` seems to work fine so
  /// we just do that for them.
  Future<void> _stageChangesInGit(Directory projectDir) async {
    var gitRoot = projectDir;
    while (gitRoot.parent != gitRoot) {
      if (gitRoot.childDirectory('.git').existsSync()) {
        break;
      }
      gitRoot = gitRoot.parent;
    }
    if (!await GitDir.isGitDir(gitRoot.path)) {
      _logger.fine('No .git directory found. Skipping git operations.');
      return;
    }

    final result = await processManager.run(
      <String>['git', 'add', '.'],
      workingDirectory: projectDir.path,
    );
    if (result.exitCode != 0) {
      _logger.warning(
        'Failed to stage changes in git. status=${result.exitCode}',
        result.stderr,
      );
    }
  }
}

final class RemoveResourcesDartFile extends ProjectMigration {
  RemoveResourcesDartFile(super.projectRoot);

  late final oldResourcesFile = fileSystem.file(
    p.join(projectRoot, 'lib', 'src', 'generated', 'resources.dart'),
  );

  @override
  Future<ProjectMigrationResult> create() async {
    await oldResourcesFile.delete();
    return const ProjectMigrationSuccess(needsAnalyzerMigration: false);
  }

  @override
  String get name => 'core.layout.v1.remove_resources_dart';

  @override
  bool get needsMigration => oldResourcesFile.existsSync();
}
