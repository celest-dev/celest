part of 'project_template.dart';

/// A project template for Celest that includes a simple database.
final class DataProject extends ProjectTemplate {
  DataProject(super.projectRoot, this.projectName, this.projectDisplayName);

  @override
  String get name => 'core.template.data';

  @override
  bool get needsMigration => true;

  final String projectName;
  final String projectDisplayName;

  @override
  List<ProjectDependency> get additionalDependencies => [
        ProjectDependency.drift,
      ];

  @override
  Future<ProjectMigrationResult> create() async {
    final databaseName = '${projectDisplayName.pascalCase}Database';

    await Future.wait([
      createFile(projectPaths.projectDart, '''
import 'package:celest/celest.dart';
import 'package:celest_backend/src/database/database.dart';

const project = Project(
  name: '${projectName.paramCase}',
  displayName: '$projectDisplayName',
);

const database = Database(
  schema: Schema.drift($databaseName),
);
'''),

      // Database files
      createFile(
        p.join(
          projectPaths.projectLib,
          'src',
          'database',
          'database.dart',
        ),
        '''
import 'package:drift/drift.dart';

part 'database.g.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [Tasks])
class $databaseName extends _\$$databaseName {
  $databaseName(super.e);

  @override
  int get schemaVersion => 1;
}
''',
      ),
      createFile(
          p.join(
            projectPaths.projectLib,
            'src',
            'database',
            'database.g.dart',
          ),
          '''
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class \$TasksTable extends Tasks with TableInfo<\$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  \$TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get \$columns => [id, title, completed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => \$name;
  static const String \$name = 'tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Task> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get \$primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '\$tablePrefix.' : '';
    return Task(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['\${effectivePrefix}id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['\${effectivePrefix}title'],
          )!,
      completed:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['\${effectivePrefix}completed'],
          )!,
    );
  }

  @override
  \$TasksTable createAlias(String alias) {
    return \$TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String title;
  final bool completed;
  const Task({required this.id, required this.title, required this.completed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['completed'] = Variable<bool>(completed);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      title: Value(title),
      completed: Value(completed),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  Task copyWith({int? id, String? title, bool? completed}) => Task(
    id: id ?? this.id,
    title: title ?? this.title,
    completed: completed ?? this.completed,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      completed: data.completed.present ? data.completed.value : this.completed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: \$id, ')
          ..write('title: \$title, ')
          ..write('completed: \$completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, completed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.completed == this.completed);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> title;
  final Value<bool> completed;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.completed = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.completed = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<bool>? completed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (completed != null) 'completed': completed,
    });
  }

  TasksCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<bool>? completed,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: \$id, ')
          ..write('title: \$title, ')
          ..write('completed: \$completed')
          ..write(')'))
        .toString();
  }
}

abstract class _\$$databaseName extends GeneratedDatabase {
  _\$$databaseName(QueryExecutor e) : super(e);
  \$${databaseName}Manager get managers => \$${databaseName}Manager(this);
  late final \$TasksTable tasks = \$TasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}

typedef \$\$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      required String title,
      Value<bool> completed,
    });
typedef \$\$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<bool> completed,
    });

class \$\$TasksTableFilterComposer
    extends Composer<_\$$databaseName, \$TasksTable> {
  \$\$TasksTableFilterComposer({
    required super.\$db,
    required super.\$table,
    super.joinBuilder,
    super.\$addJoinBuilderToRootComposer,
    super.\$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => \$composableBuilder(
    column: \$table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => \$composableBuilder(
    column: \$table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => \$composableBuilder(
    column: \$table.completed,
    builder: (column) => ColumnFilters(column),
  );
}

class \$\$TasksTableOrderingComposer
    extends Composer<_\$$databaseName, \$TasksTable> {
  \$\$TasksTableOrderingComposer({
    required super.\$db,
    required super.\$table,
    super.joinBuilder,
    super.\$addJoinBuilderToRootComposer,
    super.\$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => \$composableBuilder(
    column: \$table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => \$composableBuilder(
    column: \$table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => \$composableBuilder(
    column: \$table.completed,
    builder: (column) => ColumnOrderings(column),
  );
}

class \$\$TasksTableAnnotationComposer
    extends Composer<_\$$databaseName, \$TasksTable> {
  \$\$TasksTableAnnotationComposer({
    required super.\$db,
    required super.\$table,
    super.joinBuilder,
    super.\$addJoinBuilderToRootComposer,
    super.\$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      \$composableBuilder(column: \$table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      \$composableBuilder(column: \$table.title, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      \$composableBuilder(column: \$table.completed, builder: (column) => column);
}

class \$\$TasksTableTableManager
    extends
        RootTableManager<
          _\$$databaseName,
          \$TasksTable,
          Task,
          \$\$TasksTableFilterComposer,
          \$\$TasksTableOrderingComposer,
          \$\$TasksTableAnnotationComposer,
          \$\$TasksTableCreateCompanionBuilder,
          \$\$TasksTableUpdateCompanionBuilder,
          (Task, BaseReferences<_\$$databaseName, \$TasksTable, Task>),
          Task,
          PrefetchHooks Function()
        > {
  \$\$TasksTableTableManager(_\$$databaseName db, \$TasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => \$\$TasksTableFilterComposer(\$db: db, \$table: table),
          createOrderingComposer:
              () => \$\$TasksTableOrderingComposer(\$db: db, \$table: table),
          createComputedFieldComposer:
              () => \$\$TasksTableAnnotationComposer(\$db: db, \$table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<bool> completed = const Value.absent(),
              }) => TasksCompanion(id: id, title: title, completed: completed),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<bool> completed = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                title: title,
                completed: completed,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef \$\$TasksTableProcessedTableManager =
    ProcessedTableManager<
      _\$$databaseName,
      \$TasksTable,
      Task,
      \$\$TasksTableFilterComposer,
      \$\$TasksTableOrderingComposer,
      \$\$TasksTableAnnotationComposer,
      \$\$TasksTableCreateCompanionBuilder,
      \$\$TasksTableUpdateCompanionBuilder,
      (Task, BaseReferences<_\$$databaseName, \$TasksTable, Task>),
      Task,
      PrefetchHooks Function()
    >;

class \$${databaseName}Manager {
  final _\$$databaseName _db;
  \$${databaseName}Manager(this._db);
  \$\$TasksTableTableManager get tasks =>
      \$\$TasksTableTableManager(_db, _db.tasks);
}
'''),

      createFile(p.join(projectPaths.apisDir, 'tasks.dart'), '''
import 'package:celest/celest.dart';
import 'package:celest_backend/src/database/database.dart';
import 'package:celest_backend/src/generated/cloud.celest.dart';

$databaseName get db => celest.data.database;

@cloud
Future<List<Task>> listAllTasks() async {
  print('Fetching tasks...');
  return db.select(db.tasks).get();
}

@cloud
Future<Task> addTask({
  required String title,
}) async {
  if (title.trim().isEmpty) {
    throw ServerException('Title cannot be empty');
  }
  final newTask = TasksCompanion.insert(
    title: title,
  );
  print('Creating task: \$newTask');
  final task = await db.into(db.tasks).insertReturning(newTask);
  print('Task created: \$task');
  return task;
}

class ServerException implements Exception {
  const ServerException(this.message);

  final String message;
}
'''),

      // Generated
      createFile(
        p.join(projectPaths.generatedDir, 'README.md'),
        generated_README,
      ),
    ]);
    return const ProjectMigrationSuccess();
  }
}
