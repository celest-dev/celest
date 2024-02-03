import 'dart:developer';

import 'package:celest_backend/client.dart';
import 'package:flutter/material.dart';

void main() {
  celest.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  List<Task> tasks = [];
  bool isFetching = false;
  String error = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchTasks();
      setState(() {});
    });

    super.initState();
  }

  Future<void> fetchTasks() async {
    setState(() {
      isFetching = true;
    });
    log('fetching tasks');
    try {
      tasks = await celest.functions.tasks.alltasks();
    } catch (e) {
      error = 'Unable to connect to server';
    }
    isFetching = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: isFetching == true
          ? const Center(child: CircularProgressIndicator())
          : error.isNotEmpty
              ? Center(child: Text('Error Occured: $error'))
              : tasks.isEmpty
                  ? const Center(
                      child: Text('No avaiable Tasks'),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          children: tasks
                              .map((e) => Dismissible(
                                    confirmDismiss: (dir) async {
                                      if (dir == DismissDirection.endToStart) {
                                        return true;
                                      } else if (dir ==
                                          DismissDirection.startToEnd) {
                                        if (e.isCompleted) {
                                          await celest.functions.tasks
                                              .markAsIncomplete(id: e.id);
                                        } else {
                                          await celest.functions.tasks
                                              .markAsCompleted(id: e.id);
                                        }

                                        tasks = await celest.functions.tasks
                                            .alltasks();
                                        setState(() {});
                                        return false;
                                      }
                                      return false;
                                    },
                                    onDismissed: (dir) async {
                                      if (dir == DismissDirection.endToStart) {
                                        tasks = await celest.functions.tasks
                                            .deleteTask(id: e.id);
                                        setState(() {});
                                      } else if (dir ==
                                          DismissDirection.startToEnd) {}
                                    },
                                    background: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              color: Colors.green,
                                              child: e.isCompleted
                                                  ? const Icon(
                                                      Icons.cancel,
                                                      color: Colors.red,
                                                    )
                                                  : const Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                    )),
                                        ),
                                        Expanded(
                                          child: Container(
                                              alignment: Alignment.centerRight,
                                              color: Colors.red,
                                              child: const Icon(Icons.delete)),
                                        ),
                                      ],
                                    ),
                                    key: UniqueKey(),
                                    child: Card(
                                      color: e.importance.toLowerCase() == 'low'
                                          ? Colors.blue
                                          : e.importance.toLowerCase() ==
                                                  'medium'
                                              ? Colors.yellow
                                              : Colors.orange,
                                      child: ListTile(
                                        title: Text(
                                          e.title,
                                          style: TextStyle(
                                              decoration: e.isCompleted
                                                  ? TextDecoration.lineThrough
                                                  : null),
                                        ),
                                        trailing: CircleAvatar(
                                            radius: 10,
                                            backgroundColor: e.isCompleted
                                                ? Colors.green
                                                : Colors.red),
                                      ),
                                    ),
                                  ))
                              .toList()),
                    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Add logic to add a new task
          await _showAddTodoDialog(context);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _showAddTodoDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    String selectedImportance = 'Low';
    int selectedIndex = 0;
    List<Color> importance = [Colors.blue, Colors.yellow, Colors.red];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, StateSetter setStateS) {
          return AlertDialog(
            title: const Text('Add New Task'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Task Title'),
                ),
                const SizedBox(height: 16),
                const Text('Select Difficulty'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                        3,
                        (index) => InkWell(
                              onTap: () {
                                setStateS(() {
                                  selectedIndex = index;
                                });
                                switch (index) {
                                  case 0:
                                    selectedImportance = 'Low';
                                    break;
                                  case 1:
                                    selectedImportance = 'Medium';
                                    break;
                                  case 2:
                                    selectedImportance = 'High';
                                    break;
                                  default:
                                }
                              },
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: index == selectedIndex
                                    ? const Color.fromARGB(105, 76, 175, 79)
                                    : null,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: importance[index],
                                ),
                              ),
                            ))
                  ],
                )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  if (titleController.text.isNotEmpty) {
                    try {
                      tasks = await celest.functions.tasks.addTask(
                          importance: selectedImportance,
                          title: titleController.text);
                    } on ServerException catch (e) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: ${e.message}')));
                      titleController.clear();
                      return;
                    } catch (e) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Unable to connect to server')));
                      titleController.clear();
                      return;
                    }

                    setState(() {});
                    if (!mounted) return;
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Add'),
              ),
            ],
          );
        });
      },
    );
  }
}
