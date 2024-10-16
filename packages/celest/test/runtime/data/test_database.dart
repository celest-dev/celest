import 'package:drift/drift.dart';

part 'test_database.g.dart';

class Items extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
}

@DriftDatabase(tables: [Items])
class TestDatabase extends _$TestDatabase {
  TestDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
