import 'dart:math';

import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_api.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_gql.dart';
import 'package:graphql/client.dart';
import 'package:logging/logging.dart';

/// A wrapper over the Fly API client which allows handling
/// cases where we don't have an auth token (like in testing).
final class FlyApiClient {
  FlyApiClient({String? authToken, required this.orgSlug}) {
    final (client, gqlClient) = switch (authToken) {
      final token? => (
        FlyMachinesApiClient(authToken: token, client: context.httpClient),
        FlyGql(
          GraphQLClient(
            cache: GraphQLCache(store: InMemoryStore()),
            link: AuthLink(
              getToken: () => 'FlyV1 $token',
            ).concat(HttpLink('https://api.fly.io/graphql')),
          ),
        ),
      ),
      _ => (null, null),
    };
    _client = client;
    _gqlClient = gqlClient;
  }

  static final Logger _logger = Logger('FlyApiClient');

  FlyMachinesApiClient? _client;
  FlyGql? _gqlClient;
  final String orgSlug;

  Future<void> createApp({required String appName}) async {
    final client = _client;
    if (client == null) {
      _logger.warning('Skipping app creation');
      return;
    }
    await client.apps.create(
      request: CreateAppRequest(appName: appName, orgSlug: orgSlug),
    );
  }

  Future<App> getApp({required String appName}) async {
    final client = _client;
    if (client == null) {
      _logger.warning('Skipping app retrieval');
      return App(id: 'app_${Random().nextInt(10000)}', name: appName);
    }
    return client.apps.show(appName: appName);
  }

  Future<ListAppsResponse> listApps() async {
    final client = _client;
    if (client == null) {
      _logger.warning('Skipping app listing');
      return ListAppsResponse(apps: []);
    }
    return client.apps.list(orgSlug: orgSlug);
  }

  Future<void> deleteApp({required String appName}) async {
    final client = _client;
    if (client == null) {
      _logger.warning('Skipping app deletion');
      return;
    }
    await client.apps.delete(appName: appName);
  }

  Future<Machine?> getMachine({required String appName}) async {
    final client = _client;
    if (client == null) {
      _logger.warning('Skipping machine retrieval');
      return null;
    }
    final machines = await client.machines.list(appName: appName);
    return machines.firstOrNull;
  }

  Future<void> detachVolume({
    required String appName,
    required String machineId,
    required String volumeId,
  }) async {
    final client = _client;
    if (client == null) {
      _logger.warning('Skipping volume detachment');
      return;
    }

    await client.machines.stop(appName: appName, machineId: machineId);
    await client.machines.delete(appName: appName, machineId: machineId);
    await client.volumes.delete(appName: appName, volumeId: volumeId);
  }

  Future<Volume> createVolume({
    required String appName,
    required String volumeName,
    required String region,
    required int sizeGb,
  }) async {
    final client = _client;
    if (client == null) {
      _logger.warning('Skipping volume creation');
      return Volume(id: 'vol_${Random().nextInt(10000)}', name: volumeName);
    }
    return client.volumes.create(
      appName: appName,
      request: CreateVolumeRequest(
        name: volumeName,
        region: region,
        sizeGb: sizeGb,
      ),
    );
  }

  Future<Volume> getVolumeById({
    required String appName,
    required String volumeId,
  }) async {
    final client = _client;
    if (client == null) {
      _logger.warning('Skipping volume retrieval');
      return Volume(id: volumeId, name: 'vol_${Random().nextInt(10000)}');
    }
    return client.volumes.getById(appName: appName, volumeId: volumeId);
  }

  Future<String> getVolumeId({
    required String appName,
    required String volumeName,
  }) async {
    final client = _gqlClient;
    if (client == null) {
      _logger.warning('Skipping volume retrieval');
      return 'vol_${Random().nextInt(10000)}';
    }
    return client.getVolumeId(appName: appName, volumeName: volumeName);
  }

  Future<void> deleteVolume({
    required String appName,
    required String volumeId,
  }) async {
    final client = _client;
    if (client == null) {
      _logger.warning('Skipping volume deletion');
      return;
    }
    await client.volumes.delete(appName: appName, volumeId: volumeId);
  }

  Future<void> setSecrets({
    required String appName,
    required Map<String, String> secrets,
  }) async {
    final client = _gqlClient;
    if (client == null) {
      _logger.warning('Skipping secret setting');
      return;
    }
    await client.setSecrets(appName: appName, secrets: secrets);
  }

  Future<List<String>> listSecrets({required String appName}) async {
    final client = _gqlClient;
    if (client == null) {
      _logger.warning('Skipping secret listing');
      return [];
    }
    return client.listSecrets(appName: appName);
  }
}
