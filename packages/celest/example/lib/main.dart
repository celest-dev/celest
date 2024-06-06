import 'dart:developer';

import 'package:celest_backend/client.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log(
      record.message,
      time: record.time,
      sequenceNumber: record.sequenceNumber,
      level: record.level.value,
      name: record.loggerName,
      zone: record.zone,
      error: record.error,
      stackTrace: record.stackTrace,
    );
  });
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
        appBar: AppBar(
          title: const Text('Hello Celest'),
        ),
        body: Center(
          child: FutureBuilder(
            future: celest.functions.greeting.sayHelloMany(
              people: const ['Alice', 'Bob', 'Charlie'],
            ).toList(),
            builder: (_, snapshot) => switch (snapshot) {
              AsyncSnapshot(:final data?) => Text(data.join('\n')),
              AsyncSnapshot(:final error?) =>
                Text('${error.runtimeType}: $error'),
              _ => const CircularProgressIndicator(),
            },
          ),
        ),
      ),
    );
  }
}
