// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

library;

import 'package:celest/celest.dart';

abstract final class apis {
  static const greeting = CloudApi(name: r'greeting');

  static const tasks = CloudApi(name: r'tasks');
}

abstract final class functions {
  static const greetingSayHello = CloudFunction(
    api: r'greeting',
    functionName: r'sayHello',
  );

  static const tasksAddTask = CloudFunction(
    api: r'tasks',
    functionName: r'addTask',
  );

  static const tasksAlltasks = CloudFunction(
    api: r'tasks',
    functionName: r'alltasks',
  );

  static const tasksDeleteTask = CloudFunction(
    api: r'tasks',
    functionName: r'deleteTask',
  );

  static const tasksMarkAsCompleted = CloudFunction(
    api: r'tasks',
    functionName: r'markAsCompleted',
  );

  static const tasksMarkAsIncomplete = CloudFunction(
    api: r'tasks',
    functionName: r'markAsIncomplete',
  );
}
