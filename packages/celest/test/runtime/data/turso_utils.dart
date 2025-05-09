import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:process/process.dart';
import 'package:test/test.dart';

const processManager = LocalProcessManager();

Future<int> _findOpenPort() async {
  final ServerSocket server = await ServerSocket.bind(
    InternetAddress.loopbackIPv4,
    0,
  );
  final int port = server.port;
  await server.close();
  return port;
}

Future<Uri> startSqld() async {
  final int port = await _findOpenPort();
  final Process process = await processManager.start([
    'turso',
    'dev',
    '--port',
    '$port',
  ]);
  addTearDown(process.kill);
  final running = Completer<void>();
  process.stdout.transform(utf8.decoder).transform(const LineSplitter()).listen(
    (event) {
      if (event.contains('sqld listening on')) {
        running.complete();
      }
    },
  );
  await running.future.timeout(
    const Duration(seconds: 5),
    onTimeout: () {
      throw StateError('Failed to start sqld');
    },
  );
  return Uri.parse('http://localhost:$port');
}

Future<(Uri, String)> createTursoDatabase() async {
  final databaseName = 'celest-test-${DateTime.now().millisecondsSinceEpoch}';
  await _runProcess('turso', ['db', 'create', databaseName, '--group=default']);
  final String databaseUrl = await _runProcess('turso', [
    'db',
    'show',
    databaseName,
    '--url',
  ]);
  final String authToken = await _runProcess('turso', [
    'db',
    'tokens',
    'create',
    databaseName,
  ]);

  addTearDown(() async {
    await _runProcess('turso', ['db', 'destroy', '--yes', databaseName]);
  });

  return (Uri.parse(databaseUrl), authToken);
}

bool get hasTursoCli {
  try {
    Process.runSync('turso', ['--version']);
    return true;
  } on Object {
    return false;
  }
}

Future<String> _runProcess(String command, List<String> args) async {
  final ProcessResult process = await Process.run(
    command,
    args,
    stdoutEncoding: utf8,
    stderrEncoding: utf8,
    includeParentEnvironment: true,
  );
  if (process.exitCode != 0) {
    throw Exception(
      'Failed to run $command ${args.join(' ')}: ${process.stderr}',
    );
  }
  return (process.stdout as String).trim();
}
