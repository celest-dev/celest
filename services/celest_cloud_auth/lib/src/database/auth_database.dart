import 'package:celest_cloud_auth/src/database/auth_database.drift.dart';
import 'package:celest_cloud_auth/src/database/auth_database_accessors.dart';
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
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        await cloudAuth.onUpgrade(m, from: from, to: to);
      },
      beforeOpen: (details) async {
        if (details.versionNow != schemaVersion) {
          return;
        }
        await cloudAuth.onBeforeOpen(details, project: _project);
      },
    );
  }

  /// Pings the database to ensure a valid connection.
  Future<void> ping() async {
    await customSelect('SELECT 1').get();
  }
}
