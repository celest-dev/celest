import 'package:celest/celest.dart';
import 'package:celest_backend/src/database/task_database.dart';

const project = Project(name: 'data');

const auth = Auth(
  providers: [
    AuthProvider.email(),
  ],
);

const database = Database(
  schema: Schema.drift(TaskDatabase),
);
