@TestOn('vm')
@Tags(['e2e'])
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';
import 'dart:isolate';

import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/runtime/data/connect.dart';
import 'package:drift/native.dart';
import 'package:drift_hrana/drift_hrana.dart';
import 'package:path/path.dart' as p;
import 'package:platform/platform.dart';
import 'package:process/process.dart';
import 'package:test/test.dart';

import 'test_database.dart';

const processManager = LocalProcessManager();

Future<int> _findOpenPort() async {
  final server = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
  final port = server.port;
  await server.close();
  return port;
}

Future<Uri> _startSqld() async {
  final port = await _findOpenPort();
  final process = await processManager.start([
    if (io.Platform.environment.containsKey('CI'))
      '/home/runner/.turso/turso'
    else
      'turso',
    'dev',
    '--port',
    '$port',
  ]);
  addTearDown(process.kill);
  final running = Completer<void>();
  process.stdout
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .listen((event) {
    if (event.contains('sqld listening on')) {
      running.complete();
    }
  });
  await running.future.timeout(
    const Duration(seconds: 5),
    onTimeout: () {
      throw StateError('Failed to start sqld');
    },
  );
  return Uri.parse('ws://localhost:$port');
}

void main() {
  group('connect', () {
    test(
      'allows local sqld URIs',
      // TODO(dnys1): Get Turso CLI working in CI
      skip: io.Platform.environment.containsKey('CI'),
      () async {
        final host = await _startSqld();
        final platform = FakePlatform(
          environment: {
            'CELEST_DATABASE_HOST': host.toString(),
          },
        );
        Context.current.put(env.environment, 'production');
        Context.current.put(ContextKey.platform, platform);
        final database = await connect(
          Context.current,
          name: 'test',
          factory: expectAsync1((executor) {
            expect(executor, isA<HranaDatabase>());
            return TestDatabase(executor);
          }),
          hostnameVariable: const env('CELEST_DATABASE_HOST'),
          tokenSecret: const secret('CELEST_DATABASE_TOKEN'),
        );
        await database.close();
      },
    );
  });

  group('localExecutor', () {
    test('uses package config when path=null', () async {
      final packageConfig = await Isolate.packageConfig;
      final file = File.fromUri(packageConfig!.resolve('./celest/test.db'));
      if (file.existsSync()) {
        file.deleteSync();
      }
      addTearDown(() {
        if (file.existsSync()) {
          file.deleteSync();
        }
      });

      final platform = FakePlatform(environment: {});
      Context.current.put(env.environment, 'local');
      Context.current.put(ContextKey.platform, platform);
      final database = await connect(
        Context.current,
        name: 'test',
        factory: expectAsync1((executor) {
          expect(executor, isA<NativeDatabase>());
          return TestDatabase(executor);
        }),
        hostnameVariable: const env('CELEST_DATABASE_HOST'),
        tokenSecret: const secret('CELEST_DATABASE_TOKEN'),
      );
      addTearDown(database.close);

      expect(file.existsSync(), isTrue);
    });

    test('path != null', () async {
      final tmpDir = await Directory.systemTemp.createTemp('celest_test');
      addTearDown(() => tmpDir.delete(recursive: true));

      final platform = FakePlatform(environment: {});
      Context.current.put(env.environment, 'local');
      Context.current.put(ContextKey.platform, platform);
      final database = await connect(
        Context.current,
        name: 'test',
        factory: expectAsync1((executor) {
          expect(executor, isA<NativeDatabase>());
          return TestDatabase(executor);
        }),
        hostnameVariable: const env('CELEST_DATABASE_HOST'),
        tokenSecret: const secret('CELEST_DATABASE_TOKEN'),
        path: p.join(tmpDir.path, 'test.db'),
      );
      addTearDown(database.close);

      final file = File.fromUri(tmpDir.uri.resolve('./test.db'));
      expect(file.existsSync(), isTrue);
    });
  });
}
