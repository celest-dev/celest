import 'package:celest_cloud_hub/src/database/db_functions.dart';
import 'package:celest_cloud_hub/src/model/lifecycle_state.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'cloud_hub_database.g.dart';

@DriftDatabase(
  include: {'schema/operations.drift', 'schema/project_environments.drift'},
)
final class CloudHubDatabase extends _$CloudHubDatabase {
  CloudHubDatabase(super.e);

  CloudHubDatabase.memory()
    : this(NativeDatabase.memory(setup: (db) => db.addHelperFunctions()));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
  );

  Future<void> ping() async {
    await customSelect('SELECT 1').get();
  }
}
