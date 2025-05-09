import 'dart:io';

import 'package:celest_db_studio/celest_db_studio.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

Future<void> main(List<String> args) async {
  final String? databaseUrl = Platform.environment['DATABASE_URL'];
  if (databaseUrl == null) {
    stderr.writeln('DATABASE_URL environment variable is not set.');
    exit(1);
  }
  final String? authToken = Platform.environment['DATABASE_AUTH_TOKEN'];

  final CelestDbStudio dbStudio = await CelestDbStudio.create(
    databaseUri: Uri.parse(databaseUrl),
    authToken: authToken,
  );
  final Handler handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(dbStudio.call);

  final int port = int.parse(Platform.environment['PORT'] ?? '8080');
  final HttpServer server = await serve(
    handler,
    InternetAddress.loopbackIPv4,
    port,
  );
  stdout.writeln('Server listening on http://localhost:${server.port}');

  await ProcessSignal.sigint.watch().first;

  stdout.writeln('Stopping server...');
  await server.close(force: true);
}
