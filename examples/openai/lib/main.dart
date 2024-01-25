import 'dart:html';

import 'package:flutter/material.dart';
// Import the generated Celest client
import 'package:celest_backend/client.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

void main() {
  // Initializes Celest in your Flutter app
  celest.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 20),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 100, left: 100),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 100),
                  ),
                  const Text("Enter your question here:"),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  TextField(
                    maxLines: 10,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                    ),
                    controller: questionController,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    onPressed: () async {
                      print("test");
                      String response =
                          await celest.functions.greeting.openAiRequest(
                        questionController.text,
                      );
                      print(response);
                      setState(() {
                        answerController.text = response;
                      });
                    },
                    child: const Text("Ask your question!"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  const Text("Answer: "),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  TextField(
                    readOnly: true,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'your answer will go here',
                    ),
                    controller: answerController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
