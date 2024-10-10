// Import the generated Celest client
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasks_client/tasks_client.dart';

void main() {
  // Initializes Celest in your Flutter app
  celest.init();
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskList(),
    );
  }
}

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  var tasks = <int, Task>{};
  late final _loadTasks = Future(() async {
    tasks = {
      for (final task in await celest.functions.tasks.listAllTasks())
        task.id: task,
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Celest Tasks'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _loadTasks,
          builder: (context, snapshot) => switch (snapshot) {
            AsyncSnapshot(connectionState: ConnectionState.done) => _tasksView,
            AsyncSnapshot(:final error?) =>
              Text('Failed to fetch tasks: $error'),
            _ => const CircularProgressIndicator(),
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Add logic to add a new task
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget get _tasksView {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          for (final task in tasks.values)
            Dismissible(
              key: ValueKey(task),
              confirmDismiss: (dir) async {
                if (dir == DismissDirection.endToStart) {
                  return true;
                } else if (dir == DismissDirection.startToEnd) {
                  final updatedTask = await switch (task.completed) {
                    true =>
                      celest.functions.tasks.markAsIncomplete(id: task.id),
                    false => celest.functions.tasks.markAsComplete(id: task.id),
                  };
                  if (mounted) {
                    setState(() {
                      tasks[updatedTask.id] = updatedTask;
                    });
                  }
                  return false;
                }
                return false;
              },
              onDismissed: (dir) {
                if (dir == DismissDirection.endToStart) {
                  unawaited(_deleteTask(task));
                  tasks.remove(task.id);
                }
              },
              background: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 12),
                      alignment: Alignment.centerLeft,
                      color: task.completed ? Colors.red : Colors.green,
                      child: task.completed
                          ? const Icon(Icons.cancel, color: Colors.white)
                          : const Icon(Icons.check, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 12),
                      alignment: Alignment.centerRight,
                      color: Colors.red,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  task.title,
                  style: TextStyle(
                    decoration:
                        task.completed ? TextDecoration.lineThrough : null,
                  ),
                ),
                leading: Text(
                  task.priority.icon,
                  style: const TextStyle(fontSize: 24),
                ),
                trailing: task.completed
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _createTask({
    required String title,
    required Priority priority,
  }) async {
    try {
      final task = await celest.functions.tasks.addTask(
        title: title,
        priority: priority,
      );
      if (mounted) {
        setState(() {
          tasks[task.id] = task;
        });
      }
    } on Exception catch (e) {
      log('Failed to create task', error: e);
      if (mounted) {
        _showError(context, 'Failed to add task: $e');
      }
    }
  }

  Future<void> _deleteTask(Task task) async {
    try {
      await celest.functions.tasks.deleteTask(id: task.id);
    } on Exception catch (e) {
      log('Failed to delete task', error: e);
      if (mounted) {
        _showError(context, 'Failed to delete task: $e');
      }
    }
  }

  // Dialog to add a new Task
  Future<void> _showAddTaskDialog() async {
    final data = await showDialog<AddTaskData>(
      context: context,
      builder: (context) => const AddTaskDialog(),
    );
    if (data case (final title, final importance)) {
      await _createTask(title: title, priority: importance);
    }
  }
}

typedef AddTaskData = (String title, Priority importance);

final class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

final class _AddTaskDialogState extends State<AddTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  var _selectedImportance = Priority.low;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Task'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Task Title'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const Text('Select Difficulty'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (final priority in Priority.values)
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedImportance = priority;
                      });
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: priority == _selectedImportance
                          ? const Color.fromARGB(105, 76, 175, 79)
                          : null,
                      child: CircleAvatar(
                        radius: 15,
                        child: Text(priority.icon),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.of(context).pop(
                (_titleController.text, _selectedImportance),
              );
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}

void _showError(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
}

extension on Priority {
  String get icon => switch (this) {
        Priority.low => '☁️',
        Priority.medium => '💪',
        Priority.high => '🔥',
      };
}
