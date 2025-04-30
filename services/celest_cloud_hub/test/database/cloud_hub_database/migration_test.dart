// dart format width=80
// ignore_for_file: unused_local_variable, unused_import
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/database/db_functions.dart';
import 'package:celest_cloud_hub/src/project.dart';
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

import 'generated/schema.dart';
import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print(
      '[${record.loggerName.split('.').last}] ${record.level}: ${record.message}',
    );
  });

  setUpAll(() {
    verifier = SchemaVerifier(
      GeneratedHelper(),
      setup: (db) => db.addHelperFunctions(),
    );
  });

  group('simple database migrations', () {
    const versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = CloudHubDatabase(schema.newConnection());
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });
}
