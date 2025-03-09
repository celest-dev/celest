import 'package:celest/celest.dart';
import 'package:celest_backend/src/database/task_database.dart';
import 'package:celest_backend/src/generated/cloud.celest.dart';

/// Creates a new [Task].
@cloud
Future<Task> create({
  required String title,
  Priority priority = Priority.high,
}) async {
  final db = celest.data.database;
  final task = await db.transaction(() async {
    return db.into(db.tasks).insertReturning(
          TasksCompanion.insert(title: title, priority: priority),
        );
  });
  print('Created task: $task');
  return task;
}
