import 'package:celest/celest.dart' show env;
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

void initTesting() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print(
      '[${record.loggerName.split('.').last}] ${record.level}: ${record.message}',
    );
    if (record.error != null) {
      print(record.error);
    }
    if (record.stackTrace != null) {
      print(record.stackTrace);
    }
  });

  // Sets the root context for the tests.
  //
  // Even when calling `Context.current` in `main` - it does not represent
  // the root context. This makes it difficult to set values on the root context
  // since it is disconnected from the Zones/contexts created by the tests.
  Context.root = context;

  tearDownAll(context.httpClient.close);
}

CloudHubDatabase inMemoryDatabase() {
  context.put(const env('CELEST_ORGANIZATION_ID'), kRootOrgId);
  final db = CloudHubDatabase.memory();
  addTearDown(db.close);
  return db;
}

const kRootOrgId = 'test-org';
