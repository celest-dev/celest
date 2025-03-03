import 'package:celest_cli/src/releases/version_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pub_semver/pub_semver.dart';

part 'celest_release_info.g.dart';

enum CelestReleaseSchemaVersion { v1 }

const _serializable = JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
  converters: [VersionConverter()],
);

@_serializable
final class CelestReleasesInfo {
  const CelestReleasesInfo({
    this.schemaVersion = CelestReleaseSchemaVersion.v1,
    required this.latest,
    this.latestDev,
    required this.releases,
  });

  factory CelestReleasesInfo.fromJson(Map<String, Object?> json) =>
      _$CelestReleasesInfoFromJson(json);

  static final baseUri = Uri.parse(
    'https://storage.googleapis.com/celest-release-artifacts/',
  );

  final CelestReleaseSchemaVersion schemaVersion;
  final CelestReleaseInfo latest;
  final CelestReleaseInfo? latestDev;
  final Map<String, CelestReleaseInfo> releases;

  Map<String, Object?> toJson() => _$CelestReleasesInfoToJson(this);
}

@_serializable
final class CelestReleaseInfo {
  const CelestReleaseInfo({required this.version, this.installer, this.zip})
    : assert(
        installer != null || zip != null,
        'Either installer or zip must be provided.',
      );

  factory CelestReleaseInfo.fromJson(Map<String, Object?> json) =>
      _$CelestReleaseInfoFromJson(json);

  final Version version;
  final String? zip;
  final String? installer;

  Map<String, Object?> toJson() => _$CelestReleaseInfoToJson(this);
}
