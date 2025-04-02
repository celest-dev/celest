import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:drift/drift.dart';

import 'task_database.drift.dart';

export 'task_database.drift.dart';

enum Priority { low, medium, high }

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  TextColumn get priority => textEnum<Priority>()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [Tasks], include: CloudAuthDatabaseMixin.includes)
class TaskDatabase extends $TaskDatabase with CloudAuthDatabaseMixin {
  TaskDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
