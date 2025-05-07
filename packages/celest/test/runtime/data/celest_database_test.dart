@TestOn('vm')
@Tags(['e2e'])
library;

import 'dart:io' as io;
import 'dart:io';

import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/runtime/data/celest_database.dart';
import 'package:drift/native.dart';
import 'package:drift_hrana/drift_hrana.dart';
import 'package:path/path.dart' as p;
import 'package:platform/platform.dart';
import 'package:test/test.dart';

import 'test_database.dart';
import 'turso_utils.dart';

void main() {
  group(
    'LibsqlDatabase',
    skip: !hasTursoCli ? 'Turso CLI not installed' : null,
    timeout: const Timeout.factor(4),
    () {
      test('connects to local sqld URIs', () async {
        final host = await startSqld();
        final platform = FakePlatform(
          environment: {
            'CELEST_DATABASE_HOST': host.toString(),
          },
        );
        Context.current.put(env.environment, 'production');
        Context.current.put(ContextKey.platform, platform);
        final celestDb = await CelestDatabase.create(
          Context.current,
          name: 'test',
          factory: expectAsync1((executor) {
            expect(executor, isA<HranaDatabase>());
            return TestDatabase(executor);
          }),
          hostnameVariable: const env('CELEST_DATABASE_HOST'),
          tokenSecret: const secret('CELEST_DATABASE_TOKEN'),
        );
        final database = await celestDb.connect();
        await database.close();
      });

      test(
        'connects to Turso URIs',
        skip: !io.Platform.environment.containsKey('TURSO_API_TOKEN')
            ? 'Missing TURSO_API_TOKEN'
            : null,
        () async {
          final (host, token) = await createTursoDatabase();
          final platform = FakePlatform(
            environment: {
              'CELEST_DATABASE_HOST': host.toString(),
              'CELEST_DATABASE_TOKEN': token,
            },
          );
          Context.current.put(env.environment, 'production');
          Context.current.put(ContextKey.platform, platform);
          final celestDb = await CelestDatabase.create(
            Context.current,
            name: 'test',
            factory: expectAsync1((executor) {
              expect(executor, isA<HranaDatabase>());
              return TestDatabase(executor);
            }),
            hostnameVariable: const env('CELEST_DATABASE_HOST'),
            tokenSecret: const secret('CELEST_DATABASE_TOKEN'),
          );
          final database = await celestDb.connect();
          await database.close();
        },
      );
    },
  );

  group('FileDatabase', () {
    test('uses package config when path=null', () async {
      final uri = await CelestDatabase.resolveDatabaseUri('test');
      final file = File.fromUri(uri);
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
      final celestDb = await CelestDatabase.create(
        Context.current,
        name: 'test',
        factory: expectAsync1((executor) {
          expect(executor, isA<NativeDatabase>());
          return TestDatabase(executor);
        }),
        hostnameVariable: const env('CELEST_DATABASE_HOST'),
        tokenSecret: const secret('CELEST_DATABASE_TOKEN'),
      );
      final database = await celestDb.connect();
      addTearDown(database.close);

      expect(file.existsSync(), isTrue);
    });

    test('path != null', () async {
      final tmpDir = await Directory.systemTemp.createTemp('celest_test');
      addTearDown(() => tmpDir.delete(recursive: true));

      final platform = FakePlatform(environment: {});
      Context.current.put(env.environment, 'local');
      Context.current.put(ContextKey.platform, platform);
      final celestDb = await CelestDatabase.create(
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
      final database = await celestDb.connect();
      addTearDown(database.close);

      final file = File.fromUri(tmpDir.uri.resolve('./test.db'));
      expect(file.existsSync(), isTrue);
    });
  });
}
