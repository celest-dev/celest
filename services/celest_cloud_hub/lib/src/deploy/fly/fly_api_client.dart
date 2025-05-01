import 'dart:math';

import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/deploy/fly/fly_api.dart';
import 'package:logging/logging.dart';

/// A wrapper over the Fly API client which allows handling
/// cases where we don't have an auth token (like in testing).
final class FlyApiClient {
  FlyApiClient({String? authToken, required this.orgSlug})
    : _client = switch (authToken) {
        final token? => FlyMachinesApiClient(
          authToken: token,
          client: context.httpClient,
        ),
        _ => null,
      };

  static final Logger _logger = Logger('FlyApiClient');

  final FlyMachinesApiClient? _client;
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
}
