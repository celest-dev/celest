// Import the generated Celest client
import 'dart:async';

import 'package:celest_backend/client.dart';
import 'package:celest_backend/models.dart';
import 'package:flutter/material.dart';

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
  var tasks = <String, Task>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task App'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _loadTasks(),
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
                  if (task.isCompleted) {
                    // sneds request to the Celest backend to mark the Task as incomplete
                    await celest.functions.tasks.markAsIncomplete(id: task.id);
                  } else {
                    // sneds request to the Celest backend to mark the Ttask as completed
                    await celest.functions.tasks.markAsCompleted(id: task.id);
                  }
                  setState(() {});
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
                      alignment: Alignment.centerLeft,
                      color: Colors.green,
                      child: task.isCompleted
                          ? const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      color: Colors.red,
                      child: const Icon(Icons.delete),
                    ),
                  ),
                ],
              ),
              child: Card(
                color: task.importance.color,
                child: ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration:
                          task.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: CircleAvatar(
                    radius: 10,
                    backgroundColor:
                        task.isCompleted ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _loadTasks() async {
    tasks = await celest.functions.tasks.listAllTasks();
  }

  Future<void> _createTask({
    required String title,
    required Importance importance,
  }) async {
    try {
      await celest.functions.tasks.addTask(
        title: title,
        importance: importance,
      );
      setState(() {});
    } on Exception catch (e) {
      debugPrint(e.toString());
      if (mounted) {
        _showError(context, 'Failed to add task: $e');
      }
    }
  }

  Future<void> _deleteTask(Task task) async {
    try {
      await celest.functions.tasks.deleteTask(id: task.id);
      setState(() {});
    } on Exception catch (e) {
      debugPrint(e.toString());
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
      await _createTask(title: title, importance: importance);
    }
  }
}

typedef AddTaskData = (String title, Importance importance);

final class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

final class _AddTaskDialogState extends State<AddTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  var _selectedImportance = Importance.low;

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
                for (final importance in Importance.values)
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedImportance = importance;
                      });
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: importance == _selectedImportance
                          ? const Color.fromARGB(105, 76, 175, 79)
                          : null,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: importance.color,
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

extension on Importance {
  Color get color => switch (this) {
        Importance.low => Colors.blue,
        Importance.medium => Colors.yellow,
        Importance.high => Colors.red,
      };
}
