import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/config/celest_config.dart';
import 'package:celest_cli/src/context.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

@TableIndex(name: 'name', columns: {#name}, unique: false)
@TableIndex(name: 'path', columns: {#path}, unique: true)
class Projects extends Table {
  /// A unique identifier of the project.
  ///
  /// By default, this is a UUID v7.
  TextColumn get id => text().clientDefault(() => const Uuid().v7())();

  /// The name of the project.
  TextColumn get name => text()();

  /// The absolute, canonical path to the project in the user's FS.
  TextColumn get path => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Projects])
final class CelestDatabase extends _$CelestDatabase {
  CelestDatabase(CelestConfig config) : super(_openConnection(config));

  /// Ensures that on Windows, the SQLite library is available to the running
  /// process.
  static Future<void> ensureSqliteLibrary() async {
    if (platform.isWindows && zReleaseMode) {
      // On Windows, the execution alias, e.g. `celest.exe` which is invoked
      // from the terminal, is a symlink to the actual executable. Although
      // this resolves correctly via `Platform.resolvedExecutable`, it causes
      // native assets to be unloadable, since their paths are hardcoded as
      // living directly next to the executable.
      //
      // To work around this, we need to symlink the native asset DLLs to be
      // directly next to the executable. Since they already live directly
      // next to the _resolved_ executable, this is straightforward.
      final exeDir = p.dirname(platform.executable);
      final resolvedExeDir = p.dirname(platform.resolvedExecutable);
      final dllLink = fileSystem.link(p.join(exeDir, 'dart_sqlite3.dll'));
      if (p.equals(exeDir, resolvedExeDir)) {
        return;
      }
      if (await dllLink.exists()) {
        final target = await dllLink.target();
        if (p.equals(p.dirname(target), resolvedExeDir)) {
          return;
        }
        await dllLink.delete();
      }
      await dllLink.create(p.join(resolvedExeDir, 'dart_sqlite3.dll'));
    }
  }

  /// Removes any symlinks created to work around Windows issues.
  static Future<void> removeSqliteLibrary() async {
    if (platform.isWindows && (zReleaseMode || kCelestTest)) {
      final exeDir = p.dirname(platform.executable);
      final resolvedExeDir = p.dirname(platform.resolvedExecutable);
      final dllLink = fileSystem.link(p.join(exeDir, 'dart_sqlite3.dll'));
      if (!p.equals(exeDir, resolvedExeDir) && await dllLink.exists()) {
        await dllLink.delete();
      }
    }
  }

  @override
  int get schemaVersion => 1;

  static final Logger _logger = Logger('CelestDatabase');

  /// Creates a [project] in the database.
  Future<void> createProject(ProjectsCompanion project) async {
    try {
      project = project.copyWith(
        path: Value(p.canonicalize(p.normalize(project.path.value))),
      );
      await into(projects).insert(project);
    } on Object catch (e, st) {
      _logger.finest('Failed to create project', e, st);
      performance.captureError(e, stackTrace: st);
    }
  }

  /// Updates a [project] in the database.
  Future<void> updateProjectName({
    required String projectPath,
    required String projectName,
  }) async {
    try {
      projectPath = p.canonicalize(p.normalize(projectPath));
      await (update(projects)
            ..where((projects) => projects.path.equals(projectPath)))
          .write(ProjectsCompanion(name: Value(projectName)));
    } on Object catch (e, st) {
      _logger.finest('Failed to update project', e, st);
      performance.captureError(e, stackTrace: st);
    }
  }

  /// Lists all projects in the database.
  Future<List<Project>> listProjects() async {
    try {
      return await select(projects).get();
    } on Object catch (e, st) {
      _logger.finest('Failed to list projects', e, st);
      performance.captureError(e, stackTrace: st);
      return const [];
    }
  }

  /// Finds a project by its [path].
  Future<Project?> findProjectByPath(String path) async {
    try {
      path = p.canonicalize(p.normalize(path));
      return await (select(projects)
            ..where((project) => project.path.equals(path)))
          .getSingleOrNull();
    } on Object catch (e, st) {
      _logger.finest('Failed to find project by path', e, st);
      performance.captureError(e, stackTrace: st);
      return null;
    }
  }
}

LazyDatabase _openConnection(CelestConfig config) {
  return LazyDatabase(() async {
    await CelestDatabase.ensureSqliteLibrary();
    final file = fileSystem.file(p.join(config.configDir.path, 'celest.db'));
    return NativeDatabase.createInBackground(file);
  });
}
