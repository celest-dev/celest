import 'dart:async';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_runner_test/database.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  await testFlutter();
  await testDatabase();
  await startServer();
}

Future<void> testDatabase() async {
  final database = TestDatabase(NativeDatabase.memory());
  await database.customSelect('SELECT 1').get();
  print('Database initialized');
  await database.close();
}

Future<void> startServer() async {
  final server = await HttpServer.bind(InternetAddress.anyIPv4, 9000).timeout(
    const Duration(seconds: 1),
    onTimeout: () {
      print('Failed to bind to a port');
      exit(1);
    },
  );
  print('Listening on http://localhost:${server.port}');
  await for (final request in server) {
    request.response
      ..write('Hello, world!')
      ..close();
    break;
  }
  server.close();
}

Future<void> testFlutter() async {
  print('Running Flutter test');
  final completion = Completer<void>();
  testWidgets('test', (widgetTester) async {
    await widgetTester.pumpWidget(const MyApp());
    await widgetTester.pumpAndSettle();
    expect(find.text('Hello, World!'), findsOneWidget);
    completion.complete();
  });
  await completion.future;
  print('Flutter test completed');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Text('Hello, World!'));
  }
}
