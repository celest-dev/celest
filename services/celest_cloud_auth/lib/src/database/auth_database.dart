import 'package:celest_cloud_auth/src/database/auth_database.drift.dart';
import 'package:celest_cloud_auth/src/database/auth_database_accessors.dart';
import 'package:celest_core/_internal.dart';
import 'package:drift/drift.dart' hide Component;
import 'package:drift/native.dart';
import 'package:file/file.dart';

@Deprecated('Use CloudAuthDatabase instead')
typedef AuthDatabase = CloudAuthDatabase;

@DriftDatabase(include: CloudAuthDatabaseMixin.includes)
class CloudAuthDatabase extends $CloudAuthDatabase with CloudAuthDatabaseMixin {
  CloudAuthDatabase(
    super.e, {
    ResolvedProject? project,
  }) : _project = project;

  factory CloudAuthDatabase.localDir(
    Directory dir, {
    ResolvedProject? project,
    bool verbose = false,
  }) {
    return CloudAuthDatabase(
      _openDirConnection(dir, verbose: verbose),
      project: project,
    );
  }

  factory CloudAuthDatabase.memory({
    bool verbose = false,
    ResolvedProject? project,
  }) {
    final nativeDb = NativeDatabase.memory(
      logStatements: verbose,
      cachePreparedStatements: true,
    );
    return CloudAuthDatabase(nativeDb, project: project);
  }

  static QueryExecutor _openDirConnection(
    Directory dir, {
    required bool verbose,
  }) {
    return LazyDatabase(() async {
      final file = dir.childFile('auth.celest.db');
      if (!file.existsSync()) {
        await file.create(recursive: true);
      }
      return NativeDatabase(
        file,
        logStatements: verbose,
        cachePreparedStatements: true,
        enableMigrations: true,
      );
    });
  }

  final ResolvedProject? _project;

  @override
  int get schemaVersion => CloudAuthDatabaseAccessors.schemaVersion;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
        await cloudAuth.seed();
      },
      onUpgrade: (m, from, to) async {
        await cloudAuth.onUpgrade(m);
      },
      beforeOpen: (details) {
        return _withoutForeignKeys(() async {
          await cloudAuth.upsertProject(project: _project);
        });
      },
    );
  }

  /// Runs [action] in a context without foreign keys enabled.
  Future<R> _withoutForeignKeys<R>(Future<R> Function() action) async {
    await customStatement('pragma foreign_keys = OFF');
    R result;
    try {
      result = await action();
    } finally {
      if (kDebugMode) {
        // Fail if the action broke foreign keys
        final wrongForeignKeys =
            await customSelect('PRAGMA foreign_key_check').get();
        assert(
          wrongForeignKeys.isEmpty,
          '${wrongForeignKeys.map((e) => e.data)}',
        );
      }
      await customStatement('pragma foreign_keys = ON');
    }
    return result;
  }

  /// Pings the database to ensure a valid connection.
  Future<void> ping() async {
    await customSelect('SELECT 1').get();
  }
}
