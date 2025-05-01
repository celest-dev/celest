@Timeout.none
library;

import 'dart:io';

import 'package:celest/celest.dart' show env;
import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_api.dart';
import 'package:test/test.dart';

import '../common.dart';
import 'deploy_test_app.dart';

void main() {
  initTesting();

  final accessToken = Platform.environment['TEST_FLY_API_TOKEN'];
  final hasAccessToken = accessToken != null;

  test('FlyDeploymentEngine', skip: !hasAccessToken, () async {
    context.put(const env('FLY_API_TOKEN'), accessToken!);
    addTearDown(context.httpClient.close);

    final db = CloudHubDatabase.memory();
    addTearDown(db.close);

    final state = await deployTestApp(db: db);
    addTearDown(() async {
      try {
        await context.fly.deleteApp(appName: state.flyAppName!);
      } on Object {
        // OK. Already deleted.
      }
    });

    final volumeId = await context.flyGql.getVolumeId(
      appName: state.flyAppName!,
      volumeName: state.flyVolumeName!,
    );

    await expectLater(
      context.fly.getApp(appName: state.flyAppName!),
      completion(isA<App>()),
    );
    await expectLater(
      context.fly.getVolumeById(appName: state.flyAppName!, volumeId: volumeId),
      completion(isA<Volume>()),
    );

    final uri = Uri.parse('https://${state.domainName}');
    final response = await context.httpClient.get(uri);
    if (response.statusCode != 200) {
      fail('Bad response: ${response.statusCode} ${response.body}');
    }

    await context.fly.deleteApp(appName: state.flyAppName!);

    print('Waiting for app to be deleted');
    await Future<void>.delayed(const Duration(seconds: 10));
    await expectLater(
      context.fly.getApp(appName: state.flyAppName!),
      throwsA(isA<Exception>()),
    );
    await expectLater(
      context.fly.getVolumeById(appName: state.flyAppName!, volumeId: volumeId),
      throwsA(isA<Exception>()),
    );
  });
}
