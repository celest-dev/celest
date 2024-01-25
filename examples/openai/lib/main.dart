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
  void initState() {
    super.initState();
  }

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
                  FutureBuilder<List<String>>(
                    future: celest.functions.openAi
                        .availableModels(), // Replace with your future
                    builder: (BuildContext context,
                        AsyncSnapshot<List<String>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Show a progress indicator when waiting for the future to complete
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Handle the error case
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        // Build the dropdown when data is available
                        return DropdownButton<String>(
                          value: snapshot.data!.isNotEmpty
                              ? snapshot.data!.first
                              : null,
                          onChanged: (String? newValue) {
                            setState(() {
                              // Handle the dropdown value change
                            });
                          },
                          items: snapshot.data!
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        );
                      } else {
                        // Handle the case when the future completes with no data
                        return Text('No data available');
                      }
                    },
                  ),
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
                          await celest.functions.openAi.openAiRequest(
                        questionController.text,
                      );
                      List<String> modelist =
                          await celest.functions.openAi.availableModels();
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
