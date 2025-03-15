import 'dart:async';

import 'package:analyzer/src/dart/analysis/byte_store.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/database/cache/cache.migrations.dart';
import 'package:celest_cli/src/sdk/dart_sdk.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:celest_cli/src/utils/typeid.dart';
import 'package:celest_cli/src/version.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:file/memory.dart';
import 'package:logging/logging.dart';
import 'package:pool/pool.dart';
import 'package:pub_semver/pub_semver.dart' as semver;
import 'package:sqlite3/sqlite3.dart';

part 'cache_database.g.dart';

@DriftDatabase(include: {'cache.drift'})
final class CacheDatabase extends _$CacheDatabase {
  CacheDatabase(super.e);

  CacheDatabase._(
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

  static Future<CacheDatabase> memory() async {
    final completer = Completer<Database>();
    final db = CacheDatabase(NativeDatabase.memory(setup: _setup(completer)));
    await db.customSelect('SELECT 1').get();
    final rawDb = await completer.future;
    db.byteStore = CachingByteStore(rawDb);
    return db;
  }

  static Future<CacheDatabase> open(
    String projectRoot, {
    required bool verbose,
  }) async {
    final rawCompleter = Completer<Database>();
    final database = CacheDatabase._(
      projectRoot,
      verbose: verbose,
      rawDatabase: rawCompleter,
    );
    final versionInfo = await database.getVersionInfo().getSingleOrNull();
    if (versionInfo case VersionInfoData(
      :final dart,
      :final flutter,
      :final celest,
    )) {
      final dartCacheVersion = semver.Version.parse(dart);
      final flutterCacheVersion = flutter?.let(semver.Version.parse);
      if (Sdk.current.version != dartCacheVersion ||
          Sdk.current.flutterVersion != flutterCacheVersion) {
        await database.clear();
        await database._setVersionInfo(update: true);
      }
      if (semver.Version.parse(celest) < semver.Version.parse(packageVersion)) {
        database._needsProjectUpgrade = true;
        await database._setVersionInfo(update: true);
      }
    } else if (versionInfo == null) {
      database._needsProjectUpgrade = true;
      await database._setVersionInfo(update: false);
    }
    final rawDb = await rawCompleter.future;
    database.byteStore = CachingByteStore(rawDb);
    return database;
  }

  bool _needsProjectUpgrade = false;
  bool get needsProjectUpgrade => _needsProjectUpgrade;

  Future<void> _setVersionInfo({required bool update}) async {
    if (update) {
      await updateVersionInfo(
        celest: packageVersion,
        dart: Sdk.current.version.toString(),
        flutter: Sdk.current.flutterVersion?.toString(),
      );
    } else {
      await setVersionInfo(
        celest: packageVersion,
        dart: Sdk.current.version.toString(),
        flutter: Sdk.current.flutterVersion?.toString(),
      );
    }
  }

  Future<void> clear() async {
    await delete(analyzerByteStore).go();
    await delete(versionInfo).go();
  }

  @override
  int get schemaVersion => 1;

  static final Pool _lock = Pool(1);

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen:
          (details) => _lock.withResource(() async {
            await customStatement('PRAGMA foreign_keys = ON');
            await customStatement('PRAGMA journal_mode = WAL');
            await customStatement('PRAGMA busy_timeout = 5000');
            await customStatement('PRAGMA synchronous = NORMAL');
            await customStatement('PRAGMA mmap_size = 30000000000');
            await customStatement('PRAGMA cache_size = 1000000000');
            await customStatement('PRAGMA page_size = 32768');
            await customStatement('PRAGMA temp_store = memory');
          }),
      onCreate:
          (m) => _lock.withResource(() async {
            await m.createAll();
          }),
      onUpgrade:
          (m, from, to) => _lock.withResource(() async {
            return stepByStep()(m, from, to);
          }),
    );
  }

  late final CachingByteStore byteStore;
}

final class CachingByteStore implements ByteStore {
  CachingByteStore(this._database);

  final Database _database;
  static final _logger = Logger('DatabaseByteStore');

  late final _selectStmt = _database.prepare(
    'SELECT content FROM analyzer_byte_store WHERE cache_key = ?',
  );
  late final _insertStmt = _database.prepare(
    'INSERT INTO analyzer_byte_store(cache_key, content) '
    'VALUES(:cache_key, :content) '
    'ON CONFLICT(cache_key) DO UPDATE SET content = :content '
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
      StatementParameters.named({':cache_key': key, ':content': bytes}),
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
