@Timeout.none
library;

import 'dart:io';

import 'package:celest/celest.dart' show env;
import 'package:celest_cloud/celest_cloud.dart';
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/database/schema/project_environments.drift.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_api.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_deployment_engine.dart';
import 'package:drift/drift.dart';
import 'package:test/test.dart';

import '../common.dart';
import 'deploy_test_app.dart';

void main() {
  initTesting();

  final flyAccessToken = Platform.environment['TEST_FLY_API_TOKEN'];
  final tursoApiToken = Platform.environment['TEST_TURSO_API_TOKEN'];
  final hasAccessTokens = flyAccessToken != null && tursoApiToken != null;

  if (hasAccessTokens) {
    context.put(const env('FLY_API_TOKEN'), flyAccessToken);
    context.put(const env('TURSO_API_TOKEN'), tursoApiToken);
  }

  group('DeploymentEngine', skip: !hasAccessTokens, () {
    for (final (name, withTurso, region) in [
      ('without turso', false, Region.NORTH_AMERICA),
      ('with turso (NORTH_AMERICA)', true, Region.NORTH_AMERICA),
      ('with turso (EUROPE)', true, Region.EUROPE),
      ('with turso (ASIA_PACIFIC)', true, Region.ASIA_PACIFIC),
    ]) {
      test(name, () async {
        final db = inMemoryDatabase();

        final state = await deployTestApp(
          db: db,
          withTurso: withTurso,
          region: region,
        );
        addTearDown(() async {
          if (withTurso) {
            await context.turso
                .deleteDatabase(databaseName: state.tursoDatabaseName!)
                .catchError((_) {});
          }
          await context.fly
              .deleteApp(appName: state.flyAppName!)
              .catchError((_) {});
        });

        await expectLater(
          context.fly.getApp(appName: state.flyAppName!),
          completion(isA<App>()),
        );

        final uri = Uri.parse('https://${state.domainName}');
        final response = await context.httpClient.get(uri);
        if (response.statusCode != 200) {
          fail('Bad response: ${response.statusCode} ${response.body}');
        }

        if (withTurso) {
          await context.turso.deleteDatabase(
            databaseName: state.tursoDatabaseName!,
          );
        }
        await context.fly.deleteApp(appName: state.flyAppName!);

        print('Waiting for app to be deleted');
        await Future<void>.delayed(const Duration(seconds: 10));
        await expectLater(
          context.fly.getApp(appName: state.flyAppName!),
          throwsA(isA<Exception>()),
        );
        if (withTurso) {
          await expectLater(
            context.turso.getDatabase(databaseName: state.tursoDatabaseName!),
            throwsA(isA<Exception>()),
          );
        }
      });
    }

    test('deletes volume during migration to Turso', () async {
      final db = inMemoryDatabase();

      final appName = FlyDeploymentEngine.generateFlyAppName(kCelestTest);
      await context.fly.createApp(appName: appName);
      addTearDown(() async {
        await context.fly.deleteApp(appName: appName).catchError((_) {});
      });

      final volumeName = 'test_${DateTime.now().millisecondsSinceEpoch}';
      await context.fly.createVolume(
        appName: appName,
        volumeName: volumeName,
        region: 'lax',
        sizeGb: 1,
      );

      final state = await deployTestApp(
        db: db,
        withInitialState:
            (id) => ProjectEnvironmentStatesCompanion.insert(
              projectEnvironmentId: id,
              flyAppName: Value(appName),
              flyVolumeName: Value(volumeName),
            ),
        withTurso: true,
      );
      addTearDown(() async {
        await context.turso
            .deleteDatabase(databaseName: state.tursoDatabaseName!)
            .catchError((_) {});
      });

      expect(
        state.flyVolumeName,
        null,
        reason: 'Volume should be deleted during migration to Turso',
      );
    });
  });
}
