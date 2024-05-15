import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions.dart';
import 'package:celest_backend/models.dart';
import 'package:uuid/uuid.dart';

Map<String, Task> tasks = {};

@cloud
Future<Map<String, Task>> listAllTasks() async {
  print('fetching tasks');
  return tasks;
}

@cloud
Future<void> addTask({
  required String title,
  required Importance importance,
}) async {
  print('creating new task');
  if (title.trim().isEmpty) {
    throw ServerException('Title cannot be empty');
  }
  var uuid = Uuid();
  final newTask = Task(
    id: uuid.v1(),
    title: title,
    importance: importance,
  );
  tasks[newTask.id] = newTask;
}

@cloud
Future<void> deleteTask({required String id}) async {
  print('removing task $id');
  tasks.remove(id);
}

@cloud
Future<void> markAsCompleted({required String id}) async {
  print('marking as completed');
  final task = tasks[id];
  if (task == null) {
    throw ServerException('Task not found');
  }
  tasks[id] = task.copyWith(isCompleted: true);
}

@cloud
Future<void> markAsIncomplete({required String id}) async {
  print('marking as incomplete');
  final task = tasks[id];
  if (task == null) {
    throw ServerException('Task not found');
  }
  tasks[id] = task.copyWith(isCompleted: false);
}
