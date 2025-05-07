import 'dart:io';

import 'package:celest_db_studio/celest_db_studio.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

Future<void> main(List<String> args) async {
  final databaseUrl = Platform.environment['DATABASE_URL'];
  if (databaseUrl == null) {
    print('DATABASE_URL environment variable is not set.');
    exit(1);
  }
  final authToken = Platform.environment['DATABASE_AUTH_TOKEN'];

  final dbStudio = await CelestDbStudio.create(
    databaseUri: Uri.parse(databaseUrl),
    authToken: authToken,
  );
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(dbStudio.call);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, InternetAddress.loopbackIPv4, port);
  print('Server listening on http://localhost:${server.port}');

  await ProcessSignal.sigint.watch().first;

  print('Stopping server...');
  await server.close(force: true);
}
