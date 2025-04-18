import 'dart:io';

import 'package:distroless_test/database.dart';
import 'package:drift/native.dart';

Future<void> main() async {
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
