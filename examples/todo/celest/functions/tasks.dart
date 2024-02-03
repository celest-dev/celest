import 'package:celest_backend/client.dart';
import 'package:celest_backend/models.dart';
import 'package:uuid/uuid.dart';

List<Task> tasks = [];

List<Task> alltasks() {
  print('fetching tasks');
  return tasks;
}

Future<List<Task>> addTask(
    {required String title, required String importance}) async {
  print('creating new task');
  if(title.trim().isEmpty){
    throw ServerException('Title cannot be empty');
  }
  var uuid = Uuid();
  final newTask = Task(
      id: uuid.v1(),
      title: title,
      importance: importance,
      );
  tasks.add(newTask);
  return alltasks();
}

Future<List<Task>> deleteTask({required String id}) async {
  print('removing task $id');
  tasks.removeWhere((element) => element.id == id);
  return alltasks();
}

Future<void> markAsCompleted({required String id}) async {
  print('marking as completed');
  Task task = tasks.where((element) => element.id == id).first;
  int index = tasks.indexOf(task);
  print('index of completed task: $index');
  tasks.removeAt(index);
  tasks.insert(index, task.copyWith(id: DateTime.now().microsecondsSinceEpoch.toString(), isCompleted: true));
}

Future<void> markAsIncomplete({required String id}) async {
  print('marking as incomplete');
  Task task = tasks.where((element) => element.id == id).first;
  int index = tasks.indexOf(task);
  print('index of completed task: $index');
  tasks.removeAt(index);
  tasks.insert(index, task.copyWith(id: DateTime.now().microsecondsSinceEpoch.toString(),isCompleted: false));
}
