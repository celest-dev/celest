import 'package:celest/celest.dart';
import 'package:celest_backend/src/database/task_database.dart';
import 'package:celest_backend/src/generated/cloud.celest.dart';
import 'package:drift/drift.dart';

TaskDatabase get db => celest.data.tasksDatabase;

@cloud
Future<List<Task>> listAllTasks() async {
  print('Fetching tasks...');
  return db.select(db.tasks).get();
}

@cloud
Future<Task> addTask({
  required String title,
  Priority priority = Priority.high,
}) async {
  if (title.trim().isEmpty) {
    throw ServerException('Title cannot be empty');
  }
  final newTask = TasksCompanion.insert(
    title: title,
    priority: priority,
  );
  print('Creating task: $newTask');
  final task = await db.into(db.tasks).insertReturning(newTask);
  print('Task created: $task');
  return task;
}

@cloud
Future<Task?> deleteTask({required int id}) async {
  print('Removing task: $id');
  final task =
      await db.delete(db.tasks).deleteReturning(TasksCompanion(id: Value(id)));
  if (task == null) {
    print('Task not found');
    return null;
  }
  print('Task removed: $task');
  return task;
}

@cloud
Future<Task> markAsComplete({required int id}) async {
  print('Marking task as complete: $id');
  final updated = await (db.update(db.tasks)..where((t) => t.id.equals(id)))
      .writeReturning(TasksCompanion(completed: Value(true)));
  if (updated.isEmpty) {
    throw const NotFoundException('Task not found');
  }
  print('Task marked as complete');
  return updated.first;
}

@cloud
Future<Task> markAsIncomplete({required int id}) async {
  print('Marking task as incomplete: $id');
  final updated = await (db.update(db.tasks)..where((t) => t.id.equals(id)))
      .writeReturning(TasksCompanion(completed: Value(false)));
  if (updated.isEmpty) {
    throw const NotFoundException('Task not found');
  }
  print('Task marked as incomplete');
  return updated.first;
}

class ServerException implements Exception {
  const ServerException(this.message);

  final String message;
}
