import 'package:drift/drift.dart';

part 'task_database.g.dart';

enum Priority { low, medium, high }

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  TextColumn get priority => textEnum<Priority>()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [Tasks])
class TaskDatabase extends _$TaskDatabase {
  TaskDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
