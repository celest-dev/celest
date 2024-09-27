import 'dart:async';

import 'package:analyzer/src/dart/analysis/byte_store.dart';
import 'package:celest_cli/database/database_versions.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:file/memory.dart';
import 'package:hub/typeid/typeid.dart';
import 'package:logging/logging.dart';
import 'package:pool/pool.dart';
import 'package:sqlite3/sqlite3.dart';

part 'database.g.dart';

@DriftDatabase(include: {'database.drift'})
final class CelestDatabase extends _$CelestDatabase {
  CelestDatabase._(
    String projectRoot, {
    required Completer<Database> rawDatabase,
    required bool verbose,
  }) : super(
          _openConnection(
            projectRoot,
            verbose: verbose,
            rawDatabase: rawDatabase,
          ),
        );

  static Future<CelestDatabase> start(
    String projectRoot, {
    required bool verbose,
  }) async {
    final rawCompleter = Completer<Database>();
    final database = CelestDatabase._(
      projectRoot,
      verbose: verbose,
      rawDatabase: rawCompleter,
    );
    await database.customSelect('SELECT 1').get();
    final rawDb = await rawCompleter.future;
    database.byteStore = DatabaseByteStore(rawDb);
    return database;
  }

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
      onUpgrade: (m, from, to) => _lock.withResource(() async {
        return stepByStep()(m, from, to);
      }),
    );
  }

  late final DatabaseByteStore byteStore;
}

final class DatabaseByteStore implements ByteStore {
  DatabaseByteStore(this._database);

  final Database _database;
  static final _logger = Logger('DatabaseByteStore');

  late final _selectStmt = _database.prepare(
    'SELECT content FROM dart_analyzer_cache WHERE entry_key = ?',
  );
  late final _insertStmt = _database.prepare(
    'INSERT INTO dart_analyzer_cache(entry_key, content) '
    'VALUES(:entry_key, :content) '
    'ON CONFLICT(entry_key) DO UPDATE SET content = :content '
    'RETURNING content',
  );

  @override
  Uint8List? get(String key) {
    final result = _selectStmt.select([key]);
    return switch (result.rows) {
      [] => null,
      [[final Uint8List content]] => content,
      _ => () {
          _logger.finest('Unexpected result: $result');
          return null;
        }(),
    };
  }

  @override
  Uint8List putGet(String key, Uint8List bytes) {
    final result = _insertStmt.selectWith(
      StatementParameters.named({
        ':entry_key': key,
        ':content': bytes,
      }),
    );
    return switch (result.rows) {
      [[final Uint8List content]] => content,
      _ => unreachable('Unexpected result: $result'),
    };
  }

  @override
  void release(Iterable<String> keys) {}
}

void Function(Database) _setup(Completer<Database> rawDatabase) {
  return (Database db) {
    rawDatabase.complete(db);
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

QueryExecutor _openConnection(
  String projectRoot, {
  required Completer<Database> rawDatabase,
  required bool verbose,
}) {
  return LazyDatabase(() async {
    if (fileSystem is MemoryFileSystem) {
      return NativeDatabase.memory(
        logStatements: verbose,
        cachePreparedStatements: true,
        setup: _setup(rawDatabase),
      );
    }
    final file = fileSystem.file(
      p.join(projectRoot, '.dart_tool', 'celest', 'cache.db'),
    );
    await file.parent.create(recursive: true);
    return NativeDatabase(
      file,
      logStatements: verbose,
      cachePreparedStatements: true,
      enableMigrations: true,
      setup: _setup(rawDatabase),
    );
  });
}
