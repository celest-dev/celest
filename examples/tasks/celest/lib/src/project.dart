import 'package:celest/celest.dart';
import 'package:celest_backend/src/database/task_database.dart';

const project = Project(name: 'tasks');

const tasksDatabase = Database(
  schema: Schema.drift(TaskDatabase),
);
