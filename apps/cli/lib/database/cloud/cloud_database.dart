import 'package:celest_cli/config/celest_config.dart';
import 'package:celest_cli/src/context.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:file/memory.dart';
import 'package:logging/logging.dart';
import 'package:pool/pool.dart';

part 'cloud_database.g.dart';

@DriftDatabase(include: {'cloud.drift'})
final class CloudDatabase extends _$CloudDatabase {
  CloudDatabase(
    CelestConfig config, {
    required bool verbose,
  }) : super(
          _openConnection(
            config,
            verbose: verbose,
          ),
        );

  @override
  int get schemaVersion => 2;

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
      onUpgrade: (m, from, to) => _lock.withResource(() async {
        await m.createTable(projectEnvironments);
        await m.createTable(projectEnvironmentConfig);
      }),
    );
  }

  Future<Project?> findProject(String projectIdOrAlias) async {
    final result = await getProject(id: projectIdOrAlias).get();
    if (result.isEmpty) {
      return null;
    }
    return result.single;
  }
}

QueryExecutor _openConnection(
  CelestConfig config, {
  required bool verbose,
}) {
  return LazyDatabase(() async {
    if (fileSystem is MemoryFileSystem) {
      return NativeDatabase.memory(
        logStatements: verbose,
        cachePreparedStatements: true,
      );
    }
    final file = config.configDir.childFile('cloud.db');
    await file.create(recursive: true);

    // Ensure the file is only readable by the current user
    if (platform.isLinux || platform.isMacOS) {
      final chmodRes = await processManager.run(<String>[
        'chmod',
        '600',
        file.path,
      ]);
      if (chmodRes.exitCode != 0) {
        Logger('CloudDatabase').fine(
          'Failed to set file permissions for ${file.path}: ${chmodRes.stderr}',
        );
      }
    }

    return NativeDatabase(
      file,
      logStatements: verbose,
      cachePreparedStatements: true,
      enableMigrations: true,
    );
  });
}
