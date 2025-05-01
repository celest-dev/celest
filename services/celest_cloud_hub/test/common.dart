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
}

CloudHubDatabase inMemoryDatabase() {
  context.put(const env('CELEST_ORGANIZATION_ID'), kRootOrgId);
  final db = CloudHubDatabase.memory();
  addTearDown(db.close);
  return db;
}

const kRootOrgId = 'test-org';
