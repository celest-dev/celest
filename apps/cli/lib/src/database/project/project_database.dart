import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/database/project/project.drift.dart';
import 'package:celest_cli/src/utils/typeid.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:file/memory.dart';
import 'package:pool/pool.dart';
import 'package:sqlite3/sqlite3.dart';

import 'project_database.drift.dart';

@DriftDatabase(include: {'project.drift'})
final class ProjectDatabase extends $ProjectDatabase {
  ProjectDatabase({required String projectRoot, required bool verbose})
      : super(_openConnection(projectRoot, verbose: verbose));

  ProjectDatabase.memory() : super(NativeDatabase.memory(setup: _setup));

  @override
  int get schemaVersion => 1;

  static final Pool _lock = Pool(1);

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) => _lock.withResource(() async {
        await customStatement('PRAGMA foreign_keys = ON');
        await customStatement('PRAGMA journal_mode = WAL');
        await customStatement('PRAGMA busy_timeout = 5000');
        await customStatement('PRAGMA synchronous = NORMAL');
        await customStatement('PRAGMA mmap_size = 30000000000');
        await customStatement('PRAGMA cache_size = 1000000000');
        await customStatement('PRAGMA page_size = 32768');
        await customStatement('PRAGMA temp_store = memory');
      }),
      onCreate: (m) => _lock.withResource(() async {
        await m.createAll();
      }),
    );
  }

  Future<String?> getEnvValue(
    String name, {
    required String environmentId,
  }) async {
    final query = select(environmentVariables)
      ..where(
        (env) =>
            env.name.equals(name) & env.environmentId.equals(environmentId),
      )
      ..limit(1);
    final values = await query.get();
    return values.firstOrNull?.value;
  }

  Future<void> setEnvValue(
    String name,
    String value, {
    required String environmentId,
  }) async {
    await into(environmentVariables).insert(
      EnvironmentVariable(
        environmentId: environmentId,
        name: name,
        value: value,
      ),
    );
  }
}

void Function(Database) get _setup {
  return (Database db) {
    db.createFunction(
      functionName: 'typeid',
      argumentCount: const AllowedArgumentCount(1),
      deterministic: false,
      directOnly: false,
      function: (List<Object?> args) {
        final type = args.first as String;
        return typeId(type);
      },
    );
  };
}

QueryExecutor _openConnection(String projectRoot, {required bool verbose}) {
  return LazyDatabase(() async {
    if (fileSystem is MemoryFileSystem) {
      return NativeDatabase.memory(
        logStatements: verbose,
        cachePreparedStatements: true,
        setup: _setup,
      );
    }
    final file = fileSystem.file(
      p.join(projectRoot, '.dart_tool', 'celest', 'project.db'),
    );
    await file.parent.create(recursive: true);

    // Ensure the file is only readable by the current user.
    //
    // On windows, we just leverage the sandboxing to achieve the same.
    if (platform.isLinux || platform.isMacOS) {
      final chmodRes = await processManager.run(<String>[
        'chmod',
        '600',
        file.path,
      ]);
      if (chmodRes.exitCode != 0) {
        performance.captureError(
          'Failed to set file permissions for ${file.path}',
          extra: {
            'stdout': chmodRes.stdout.toString(),
            'stderr': chmodRes.stderr.toString(),
          },
        );
      }
    }

    return NativeDatabase(
      file,
      logStatements: verbose,
      cachePreparedStatements: true,
      enableMigrations: true,
      setup: _setup,
    );
  });
}
