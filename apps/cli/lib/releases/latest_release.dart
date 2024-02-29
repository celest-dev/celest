import 'dart:convert';
import 'dart:ffi';

import 'package:celest_cli/releases/celest_release_info.dart';
import 'package:celest_cli/src/version.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:collection/collection.dart';
import 'package:pub_semver/pub_semver.dart';

final _releasesEndpoint =
    CelestReleasesInfo.baseUri.resolve('${Abi.current()}/releases.json');

Future<CelestReleasesInfo> _retrieveCliReleases() async {
  final releasesResp = await httpClient.get(_releasesEndpoint);
  if (releasesResp.statusCode != 200) {
    throw CelestException(
      'Failed to fetch the latest releases. Please check your internet '
      'connection and try again.',
      additionalContext: {
        'statusCode': releasesResp.statusCode.toString(),
        'body': releasesResp.body,
      },
    );
  }

  final releasesJson = jsonDecode(releasesResp.body) as Map<String, dynamic>;
  return CelestReleasesInfo.fromJson(releasesJson);
}

Future<CelestReleaseInfo> retrieveLatestRelease() async {
  final releasesInfo = await _retrieveCliReleases();
  return switch (Version.parse(packageVersion)) {
    Version(isPreRelease: true) => maxBy<CelestReleaseInfo, Version>(
        [
          if (releasesInfo.latestDev case final latestDev?) latestDev,
          ...releasesInfo.releases.values,
        ],
        (release) => release.version,
      )!,
    _ => releasesInfo.latest,
  };
}
