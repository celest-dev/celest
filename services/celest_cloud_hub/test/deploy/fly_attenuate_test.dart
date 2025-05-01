@Timeout(Duration(minutes: 5))
library;

import 'dart:io';

import 'package:celest/celest.dart' show env;
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_api.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_caveat.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_ctl.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_deployment_engine.dart';
import 'package:checks/checks.dart';
import 'package:test/test.dart';

import '../common.dart';
import 'deploy_test_app.dart';

void main() {
  initTesting();

  final accessToken = Platform.environment['TEST_FLY_API_TOKEN'];
  final hasAccessToken = accessToken != null;

  group('Fly token attenuation', skip: !hasAccessToken, () {
    setUp(() {
      context.put(const env('FLY_API_TOKEN'), accessToken!);
    });

    test('can attenuate by app', () async {
      final appName1 = FlyDeploymentEngine.generateFlyAppName(kCelestTest);
      final appName2 = FlyDeploymentEngine.generateFlyAppName(kCelestTest);
      await context.fly.createApp(appName: appName1);
      final app1 = await context.fly.getApp(appName: appName1);
      final appId1 = await context.flyGql.getInternalAppId(appName: appName1);

      final db = CloudHubDatabase.memory();
      addTearDown(db.close);

      await deployTestApp(db: db, app: app1);

      await context.fly.createApp(appName: appName2);
      final app2 = await context.fly.getApp(appName: appName2);
      await deployTestApp(db: db, app: app2);
      addTearDown(() async {
        await context.fly.deleteApp(appName: appName1);
        await context.fly.deleteApp(appName: appName2);
      });

      final attenuated = await context.flyCtl.attenuateToken(
        caveats: FlyCaveat.readApp(appId1),
      );

      final attenuatedApi = FlyMachinesApiClient(
        authToken: attenuated.token,
        client: context.httpClient,
      );
      await check(attenuatedApi.apps.show(appName: appName1)).completes();
      await check(
        attenuatedApi.apps.show(appName: appName2),
        because: 'Should not be able to read other apps',
      ).throws();

      await check(attenuatedApi.volumes.list(appName: appName1)).completes();
      await check(
        attenuatedApi.volumes.list(appName: appName2),
        because: 'Should not be able to read other apps',
      ).throws();
      await check(attenuatedApi.machines.list(appName: appName1)).completes();
      await check(
        attenuatedApi.machines.list(appName: appName2),
        because: 'Should not be able to read other apps',
      ).throws();
      await check(attenuatedApi.secrets.list(appName: appName1)).completes();
      await check(
        attenuatedApi.secrets.list(appName: appName2),
        because: 'Should not be able to read other apps',
      ).throws();

      final attenuatedCtl = FlyCtl(flyAuthToken: attenuated.token);
      await check(
        attenuatedCtl.run(['apps', 'list']),
        because: 'Should not have list permission on the org',
      ).throws();
      await check(
        attenuatedCtl.run(['logs', '--app', appName1, '--no-tail']),
        because: 'Should be able to stream logs',
      ).completes();
      await check(
        attenuatedCtl.run(['logs', '--app', appName2, '--no-tail']),
        because: 'Should not be able to stream logs for other apps',
      ).throws();
    });
  });
}
