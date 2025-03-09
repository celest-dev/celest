import 'package:pub_semver/pub_semver.dart';

class PubVersionInfo {
  const PubVersionInfo(this.allVersions);

  final List<Version> allVersions;

  Version? get latestVersion =>
      allVersions.where((version) => !version.isPreRelease).lastOrNull;

  Version? get latestPrerelease =>
      allVersions.where((version) => version.isPreRelease).lastOrNull;
}
