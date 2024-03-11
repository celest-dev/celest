import 'dart:io';

import 'package:celest_backend/client.dart';
import 'package:celest_backend/models/person.dart';
import 'package:cupertino_http/cupertino_http.dart';
import 'package:example_app/http_client.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  celest.httpClient = CelestHttpClient(
    projectName: 'example_app',
    baseClient: Platform.isIOS
        ? CupertinoClient.defaultSessionConfiguration()
        : http.Client(),
  );
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
            future: celest.functions.greeting.sayHello(
              person: const Person(name: 'Celest'),
            ),
            builder: (_, snapshot) => switch (snapshot) {
              AsyncSnapshot(:final data?) => Text(data),
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
