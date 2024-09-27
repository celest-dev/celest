import 'package:celest_cli/init/project_migration.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:file/file.dart';
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
  V1FolderStructure(this.projectName);

  final String projectName;

  static final _logger = Logger('V1FolderStructure');

  final _operations = <Future<void>>[];

  @override
  Future<bool> create(String projectRoot) async {
    final rootDir = fileSystem.directory(projectRoot);
    // Start by removing all pre-V1 generated client code.
    final generatedClientEntities = [
      rootDir.childDirectory('lib').childFile('client.dart'),
      fileSystem.directory(projectPaths.legacyClientOutputsDir),
    ];
    for (final entity in generatedClientEntities) {
      if (entity.existsSync()) {
        _logger.finest('Removing ${entity.path}...');
        _operations.add(entity.delete(recursive: true));
      }
    }

    // Create the new client folder layout.
    _operations.add(ProjectFile.client(projectName).create(projectRoot));

    // Move `functions` to `lib/src` and create symlinks.
    final symlinkdDirs = [
      (
        rootDir.childDirectory('functions'),
        rootDir
            .childDirectory('lib')
            .childDirectory('src')
            .childDirectory('functions'),
      ),
      (
        rootDir.childDirectory('generated'),
        rootDir
            .childDirectory('lib')
            .childDirectory('src')
            .childDirectory('generated'),
      ),
    ];
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
      _operations.add(_move(from, to));
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

    await Future.wait(_operations);
    return _operations.isNotEmpty;
  }

  /// Moves one directory to another.
  Future<void> _move(Directory from, Directory to) async {
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
    await fileSystem.link(from.path).create(to.path);
  }
}
