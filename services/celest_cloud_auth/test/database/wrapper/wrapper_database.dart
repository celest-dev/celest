import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:drift/drift.dart';

import '../../tester.dart';
import 'wrapper_database.drift.dart';
import 'wrapper_database.steps.dart';

/// A test database to ensure proper functionality when wrapping over
/// Cloud Auth tables.
@DriftDatabase(
  include: {
    'wrapper.drift',
    ...CloudAuthDatabaseMixin.includes,
  },
)
final class WrapperDatabase extends $WrapperDatabase
    with CloudAuthDatabaseMixin {
  WrapperDatabase(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => createMigration(
        onUpgrade: stepByStep(
          from1To2: (m, schema) async {
            await m.alterTable(
              TableMigration(
                schema.test,
                newColumns: [schema.test.sessionId],
              ),
            );
          },
        ),
        beforeOpen: (details) async {
          // Ensure we can reference cloud auth tables here and that the cloud
          // auth migrations have been run.
          final schemaVersion =
              await cloudAuth.cloudAuthMetaDrift.getSchemaVersion().getSingle();
          if (schemaVersion != CloudAuthDatabaseAccessors.schemaVersion) {
            throw StateError(
              'Cloud Auth database schema version mismatch: '
              'expected ${CloudAuthDatabaseAccessors.schemaVersion}, '
              'got $schemaVersion',
            );
          }
        },
        project: defaultProject,
      );
}
