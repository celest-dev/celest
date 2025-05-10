import 'package:example_client/example_client.dart';
import 'package:flutter/material.dart';

void main() {
  celest.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Hello Celest')),
        body: Center(
          child: FutureBuilder(
            future: celest.functions.greeting.sayHello(
              person: const Person(name: 'Celest'),
            ),
            builder: (_, snapshot) => switch (snapshot) {
              AsyncSnapshot(:final data?) => Text(data),
              AsyncSnapshot(:final error?) => Text(
                  '${error.runtimeType}: $error',
                ),
              _ => const CircularProgressIndicator(),
            },
          ),
        ),
      ),
    );
  }
}
