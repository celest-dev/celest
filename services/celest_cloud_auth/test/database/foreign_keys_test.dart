import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:celest_cloud_auth/src/database/schema/cedar.drift.dart';
import 'package:drift/native.dart';
import 'package:test/test.dart';

import 'wrapper/wrapper_database.dart';

void main() {
  late WrapperDatabase database;

  setUpAll(() {
    database = WrapperDatabase(NativeDatabase.memory());
  });

  tearDownAll(() => database.close());

  test('withoutForeignKeys', () async {
    final accessors = CloudAuthDatabaseAccessors(database);
    final failedInsert = accessors.withoutForeignKeys(() async {
      // Create a bad foreign key
      await database
          .into(database.cedarEntities)
          .insert(
            CedarEntitiesCompanion.insert(
              entityType: 'Test::DoesNotExit',
              entityId: '123',
            ),
          );
    });
    await expectLater(
      failedInsert,
      throwsA(
        isA<AssertionError>().having(
          (e) => e.message,
          'message',
          // Should mention both the parent and child tables
          allOf([contains('cedar_types'), contains('cedar_entities')]),
        ),
      ),
    );
  });
}
