// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:celest_cli/src/database/project/project.drift.dart' as i1;
import 'package:drift/internal/modular.dart' as i2;
import 'package:sqlite3/common.dart' as i3;

abstract class $ProjectDatabase extends i0.GeneratedDatabase {
  $ProjectDatabase(i0.QueryExecutor e) : super(e);
  $ProjectDatabaseManager get managers => $ProjectDatabaseManager(this);
  late final i1.Environments environments = i1.Environments(this);
  late final i1.EnvironmentVariables environmentVariables =
      i1.EnvironmentVariables(this);
  late final i1.Secrets secrets = i1.Secrets(this);
  i1.ProjectDrift get projectDrift => i2.ReadDatabaseContainer(this)
      .accessor<i1.ProjectDrift>(i1.ProjectDrift.new);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities =>
      [environments, environmentVariables, secrets];
  @override
  i0.StreamQueryUpdateRules get streamUpdateRules =>
      const i0.StreamQueryUpdateRules(
        [
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('environments',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('environment_variables',
                  kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('environments',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('environment_variables',
                  kind: i0.UpdateKind.update),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('environments',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('secrets', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('environments',
                limitUpdateKind: i0.UpdateKind.update),
            result: [
              i0.TableUpdate('secrets', kind: i0.UpdateKind.update),
            ],
          ),
        ],
      );
}

class $ProjectDatabaseManager {
  final $ProjectDatabase _db;
  $ProjectDatabaseManager(this._db);
  i1.$EnvironmentsTableManager get environments =>
      i1.$EnvironmentsTableManager(_db, _db.environments);
  i1.$EnvironmentVariablesTableManager get environmentVariables =>
      i1.$EnvironmentVariablesTableManager(_db, _db.environmentVariables);
  i1.$SecretsTableManager get secrets =>
      i1.$SecretsTableManager(_db, _db.secrets);
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
