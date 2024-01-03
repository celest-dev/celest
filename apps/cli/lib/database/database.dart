import 'dart:io';

import 'package:celest_cli/config/celest_config.dart';
import 'package:celest_cli/src/context.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
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

  @override
  int get schemaVersion => 1;

  /// Creates a [project] in the database.
  Future<void> createProject(ProjectsCompanion project) {
    project = project.copyWith(
      path: Value(p.canonicalize(p.normalize(project.path.value))),
    );
    return into(projects).insert(project);
  }

  /// Lists all projects in the database.
  Future<List<Project>> listProjects() {
    return select(projects).get();
  }

  /// Finds a project by its [path].
  Future<Project?> findProjectByPath(String path) {
    path = p.canonicalize(p.normalize(path));
    return (select(projects)..where((project) => project.path.equals(path)))
        .getSingleOrNull();
  }
}

LazyDatabase _openConnection(CelestConfig config) {
  return LazyDatabase(() async {
    final file = File(p.join(config.configDir.path, 'celest.db'));
    return NativeDatabase.createInBackground(file);
  });
}
