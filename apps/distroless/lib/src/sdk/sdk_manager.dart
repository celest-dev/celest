import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:distroless/src/sdk/flutter/flutter_releases.dart';
import 'package:distroless/src/sdk/sdk_release_info.dart';
import 'package:file/file.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:pub_semver/pub_semver.dart';

typedef SdkManagerFactory = SdkManager Function({http.Client? httpClient});

enum SdkType { dart, flutter }

abstract interface class SdkManager {
  SdkType get sdkType;

  /// Lists all versions of the SDK which are available for installing.
  Future<SdkReleases> listRemote();

  Future<void> close();
}

abstract base class _BaseSdkManager implements SdkManager {
  _BaseSdkManager({http.Client? httpClient})
    : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  late final Logger _logger = Logger('${sdkType}SdkManager');

  Future<SdkChannelInfo> _listRemoteChannel({required SdkChannel channel});

  Future<Version?> sdkVersion(Directory sdkDir) async {
    final versionFile = sdkDir.childFile('version');
    if (!versionFile.existsSync()) {
      return null;
    }
    final versionString = await versionFile.readAsString();
    return Version.parse(versionString.trim());
  }

  @override
  Future<SdkReleases> listRemote() async {
    final [stable, beta, dev] = await Future.wait(eagerError: true, [
      _listRemoteChannel(channel: SdkChannel.stable),
      _listRemoteChannel(channel: SdkChannel.beta),
      _listRemoteChannel(channel: SdkChannel.dev),
    ]);
    return SdkReleases(stable: stable, beta: beta, dev: dev);
  }

  @override
  Future<void> close() async {
    _httpClient.close();
  }
}

final class FlutterSdkManager extends _BaseSdkManager {
  FlutterSdkManager({@visibleForTesting Directory? baseDir, super.httpClient});

  static final _apiUrl = Uri.parse(
    'https://storage.googleapis.com/flutter_infra_release/releases/',
  );

  static final AsyncMemoizer<FlutterReleasesResponse> _cachedReleases =
      AsyncMemoizer();

  @override
  SdkType get sdkType => SdkType.flutter;

  Future<FlutterReleasesResponse> loadReleases() =>
      _cachedReleases.runOnce(() async {
        final releasesUrl = _apiUrl.resolve(
          'releases_${Platform.operatingSystem}.json',
        );

        final response = await _httpClient.get(releasesUrl);
        if (response.statusCode != 200) {
          throw http.ClientException(
            'Failed to fetch Flutter releases: ${response.body}',
            releasesUrl,
          );
        }
        final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
        return FlutterReleasesResponse.fromJson(responseJson);
      });

  @override
  Future<SdkChannelInfo> _listRemoteChannel({
    required SdkChannel channel,
  }) async {
    return (await loadReleases()).sdkReleases[channel];
  }
}

// Most of the logic for this class comes from dvm:
// https://github.com/cbracken/dvm/blob/71bc46f9414f0e17a7387da077c595e7297a8777/scripts/dvm
final class DartSdkManager extends _BaseSdkManager {
  DartSdkManager({@visibleForTesting super.httpClient});

  @override
  SdkType get sdkType => SdkType.dart;

  static final _apiUrl = Uri.parse(
    'https://www.googleapis.com/storage/v1/b/dart-archive/o',
  );

  @override
  Future<SdkChannelInfo> _listRemoteChannel({
    required SdkChannel channel,
  }) async {
    final query = _apiUrl.replace(
      queryParameters: {
        'prefix': 'channels/$channel/release/',
        'delimiter': '/',
      },
    );
    final resp = await _httpClient.get(query);
    if (resp.statusCode != 200) {
      _logger.severe(
        'Failed to list remote SDKs: ${resp.statusCode} ${resp.body}',
      );
      throw Exception('Failed to list remote SDKs: ${resp.body}');
    }
    final json = jsonDecode(resp.body) as Map<String, Object?>;
    return SdkChannelInfo.fromJson(channel, json);
  }
}
