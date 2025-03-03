import 'dart:convert';
import 'dart:ffi';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/exceptions.dart';
import 'package:celest_cli/src/releases/celest_release_info.dart';
import 'package:collection/collection.dart';
import 'package:pub_semver/pub_semver.dart';

final _releasesEndpoint = CelestReleasesInfo.baseUri.resolve(
  '${Abi.current()}/releases.json',
);

Future<CelestReleasesInfo> retrieveCliReleases() async {
  final releasesResp = await httpClient.get(_releasesEndpoint);
  if (releasesResp.statusCode != 200) {
    throw CliException(
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

Future<CelestReleaseInfo> retrieveLatestRelease(
  String packageVersion, {
  bool includeDev = false,
}) async {
  final releasesInfo = await retrieveCliReleases();
  final currentVersion = Version.parse(packageVersion);
  if (currentVersion.isPreRelease || includeDev) {
    return maxBy<CelestReleaseInfo, Version>([
      if (releasesInfo.latestDev case final latestDev?) latestDev,
      ...releasesInfo.releases.values,
    ], (release) => release.version)!;
  }
  return releasesInfo.latest;
}
