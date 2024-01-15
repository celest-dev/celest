import 'package:json_annotation/json_annotation.dart';

part 'celest_release_info.g.dart';

enum CelestReleaseSchemaVersion { v1 }

const _serializable = JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
);

@_serializable
final class CelestReleasesInfo {
  const CelestReleasesInfo({
    this.schemaVersion = CelestReleaseSchemaVersion.v1,
    required this.latest,
    required this.releases,
  });

  factory CelestReleasesInfo.fromJson(Map<String, Object?> json) =>
      _$CelestReleasesInfoFromJson(json);

  final CelestReleaseSchemaVersion schemaVersion;
  final CelestReleaseInfo latest;
  final Map<String, CelestReleaseInfo> releases;

  Map<String, Object?> toJson() => _$CelestReleasesInfoToJson(this);
}

@_serializable
final class CelestReleaseInfo {
  const CelestReleaseInfo({
    required this.version,
    this.installer,
    this.zip,
  }) : assert(installer != null || zip != null);

  factory CelestReleaseInfo.fromJson(Map<String, Object?> json) =>
      _$CelestReleaseInfoFromJson(json);

  final String version;
  final String? zip;
  final String? installer;

  Map<String, Object?> toJson() => _$CelestReleaseInfoToJson(this);
}
