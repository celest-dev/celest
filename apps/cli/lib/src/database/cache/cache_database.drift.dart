// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cli/src/database/cache/cache.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;
import 'package:sqlite3/common.dart' as i3;

abstract class $CacheDatabase extends i0.GeneratedDatabase {
  $CacheDatabase(i0.QueryExecutor e) : super(e);
  $CacheDatabaseManager get managers => $CacheDatabaseManager(this);
  late final i1.AnalyzerByteStore analyzerByteStore =
      i1.AnalyzerByteStore(this);
  late final i1.VersionInfo versionInfo = i1.VersionInfo(this);
  i1.CacheDrift get cacheDrift =>
      i2.ReadDatabaseContainer(this).accessor<i1.CacheDrift>(i1.CacheDrift.new);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities =>
      [analyzerByteStore, versionInfo];
}

class $CacheDatabaseManager {
  final $CacheDatabase _db;
  $CacheDatabaseManager(this._db);
  i1.$AnalyzerByteStoreTableManager get analyzerByteStore =>
      i1.$AnalyzerByteStoreTableManager(_db, _db.analyzerByteStore);
  i1.$VersionInfoTableManager get versionInfo =>
      i1.$VersionInfoTableManager(_db, _db.versionInfo);
}

extension DefineFunctions on i3.CommonDatabase {
  void defineFunctions({
    required String Function(String) typeid,
  }) {
    createFunction(
      functionName: 'typeid',
      argumentCount: const i3.AllowedArgumentCount(1),
      function: (args) {
        final arg0 = args[0] as String;
        return typeid(arg0);
      },
    );
  }
}
