import 'dart:convert';
import 'dart:ffi';

import 'package:celest_cli/releases/celest_release_info.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

final _releasesEndpoint =
    CelestReleasesInfo.baseUri.resolve('${Abi.current()}/releases.json');

Future<CelestReleaseInfo> retrieveLatestRelease() async {
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
  final releasesInfo = CelestReleasesInfo.fromJson(releasesJson);
  return releasesInfo.latest;
}
