@TestOn('vm')
@Tags(['e2e'])
library;

import 'dart:async';
import 'dart:io' as io;
import 'dart:io';

import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/core/environment.dart';
import 'package:celest/src/runtime/data/celest_database.dart';
import 'package:drift/native.dart';
import 'package:drift_hrana/drift_hrana.dart';
import 'package:path/path.dart' as p;
import 'package:platform/platform.dart';
import 'package:test/test.dart';

import 'test_database.dart';
import 'turso_utils.dart';

void main() {
  Future<void> withDatabaseContext({
    required Environment environment,
    required Platform platform,
    required Future<void> Function(Context root) body,
  }) async {
    await Context.withCurrentZoneAsRoot<void>(
      overrides: {
        ContextKey.platform: platform,
        ContextKey.environment: environment,
        env.environment: environment,
      },
      body: (root) async {
        await body(root);
      },
    );
  }

  group(
    'LibsqlDatabase',
    skip: !hasTursoCli ? 'Turso CLI not installed' : null,
    timeout: const Timeout.factor(4),
    () {
      test('connects to local sqld URIs', () async {
        final Uri host = await startSqld();
        final platform = FakePlatform(
          environment: {'CELEST_DATABASE_HOST': host.toString()},
        );
        await withDatabaseContext(
          environment: Environment.production,
          platform: platform,
          body: (root) async {
            final CelestDatabase<TestDatabase> celestDb =
                await CelestDatabase.create(
                  root,
                  name: 'test',
                  factory: expectAsync1((executor) {
                    expect(executor, isA<HranaDatabase>());
                    return TestDatabase(executor);
                  }),
                  hostnameVariable: const env('CELEST_DATABASE_HOST'),
                  tokenSecret: const secret('CELEST_DATABASE_TOKEN'),
                );
            final TestDatabase database = await celestDb.connect();
            await database.close();
          },
        );
      });

      test(
        'connects to Turso URIs',
        skip:
            !io.Platform.environment.containsKey('TURSO_API_TOKEN')
                ? 'Missing TURSO_API_TOKEN'
                : null,
        () async {
          final (Uri host, String token) = await createTursoDatabase();
          final platform = FakePlatform(
            environment: {
              'CELEST_DATABASE_HOST': host.toString(),
              'CELEST_DATABASE_TOKEN': token,
            },
          );
          await withDatabaseContext(
            environment: Environment.production,
            platform: platform,
            body: (root) async {
              final CelestDatabase<TestDatabase> celestDb =
                  await CelestDatabase.create(
                    root,
                    name: 'test',
                    factory: expectAsync1((executor) {
                      expect(executor, isA<HranaDatabase>());
                      return TestDatabase(executor);
                    }),
                    hostnameVariable: const env('CELEST_DATABASE_HOST'),
                    tokenSecret: const secret('CELEST_DATABASE_TOKEN'),
                  );
              final TestDatabase database = await celestDb.connect();
              await database.close();
            },
          );
        },
      );
    },
  );

  group('FileDatabase', () {
    test('uses package config when path=null', () async {
      final platform = FakePlatform(environment: {});
      await withDatabaseContext(
        environment: Environment.local,
        platform: platform,
        body: (root) async {
          final Uri uri = await CelestDatabase.resolveDatabaseUri('test');
          final file = File.fromUri(uri);
          final CelestDatabase<TestDatabase> celestDb =
              await CelestDatabase.create(
                root,
                name: 'test',
                factory: expectAsync1((executor) {
                  expect(executor, isA<NativeDatabase>());
                  return TestDatabase(executor);
                }),
                hostnameVariable: const env('CELEST_DATABASE_HOST'),
                tokenSecret: const secret('CELEST_DATABASE_TOKEN'),
              );
          if (uri.path == '/:memory:') {
            expect(celestDb, isA<InMemoryDatabase<TestDatabase>>());
            final TestDatabase database = await celestDb.connect();
            await database.close();
            return;
          }
          if (file.existsSync()) {
            file.deleteSync();
          }
          addTearDown(() {
            if (file.existsSync()) {
              file.deleteSync();
            }
          });
          expect(celestDb, isA<FileDatabase<TestDatabase>>());
          final TestDatabase database = await celestDb.connect();
          await database.close();
          expect(file.existsSync(), isTrue);
        },
      );
    });

    test('path != null', () async {
      final io.Directory tmpDir = await Directory.systemTemp.createTemp(
        'celest_test',
      );
      addTearDown(() => tmpDir.delete(recursive: true));

      final platform = FakePlatform(environment: {});
      await withDatabaseContext(
        environment: Environment.local,
        platform: platform,
        body: (root) async {
          final CelestDatabase<TestDatabase> celestDb =
              await CelestDatabase.create(
                root,
                name: 'test',
                factory: expectAsync1((executor) {
                  expect(executor, isA<NativeDatabase>());
                  return TestDatabase(executor);
                }),
                hostnameVariable: const env('CELEST_DATABASE_HOST'),
                tokenSecret: const secret('CELEST_DATABASE_TOKEN'),
                path: p.join(tmpDir.path, 'test.db'),
              );
          final TestDatabase database = await celestDb.connect();
          await database.close();
          final file = File.fromUri(tmpDir.uri.resolve('./test.db'));
          expect(file.existsSync(), isTrue);
        },
      );
    });
  });
}
