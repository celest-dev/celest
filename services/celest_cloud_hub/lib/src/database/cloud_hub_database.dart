import 'dart:io';

import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:celest_cloud_hub/src/database/db_functions.dart';
import 'package:celest_cloud_hub/src/project.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'cloud_hub_database.drift.dart';

@DriftDatabase(
  include: {
    'schema/operations.drift',
    'schema/project_environments.drift',

    // Cloud Auth
    ...CloudAuthDatabaseMixin.includes,
  },
)
final class CloudHubDatabase extends $CloudHubDatabase
    with CloudAuthDatabaseMixin {
  CloudHubDatabase(super.e);

  CloudHubDatabase.memory()
    : this(NativeDatabase.memory(setup: (db) => db.addHelperFunctions()));

  factory CloudHubDatabase.localFile(String path, {bool verbose = false}) {
    return CloudHubDatabase(
      NativeDatabase(
        File(path),
        logStatements: verbose,
        setup: (db) => db.addHelperFunctions(),
        cachePreparedStatements: true,
        enableMigrations: true,
      ),
    );
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      await cloudAuth.onUpgrade(m);
    },
    beforeOpen: (details) async {
      if (details.wasCreated) {
        await cloudAuth.seed();
      }
      await cloudAuth.upsertProject(project: project);
    },
  );

  Future<void> ping() async {
    await customSelect('SELECT 1').get();
  }
}
