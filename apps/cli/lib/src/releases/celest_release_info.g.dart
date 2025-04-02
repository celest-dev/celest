// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celest_release_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CelestReleasesInfo _$CelestReleasesInfoFromJson(Map<String, dynamic> json) =>
    CelestReleasesInfo(
      schemaVersion: $enumDecodeNullable(
              _$CelestReleaseSchemaVersionEnumMap, json['schemaVersion']) ??
          CelestReleaseSchemaVersion.v1,
      latest:
          CelestReleaseInfo.fromJson(json['latest'] as Map<String, dynamic>),
      latestDev: json['latestDev'] == null
          ? null
          : CelestReleaseInfo.fromJson(
              json['latestDev'] as Map<String, dynamic>),
      releases: (json['releases'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, CelestReleaseInfo.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$CelestReleasesInfoToJson(CelestReleasesInfo instance) =>
    <String, dynamic>{
      'schemaVersion':
          _$CelestReleaseSchemaVersionEnumMap[instance.schemaVersion]!,
      'latest': instance.latest.toJson(),
      if (instance.latestDev?.toJson() case final value?) 'latestDev': value,
      'releases': instance.releases.map((k, e) => MapEntry(k, e.toJson())),
    };

const _$CelestReleaseSchemaVersionEnumMap = {
  CelestReleaseSchemaVersion.v1: 'v1',
};

CelestReleaseInfo _$CelestReleaseInfoFromJson(Map<String, dynamic> json) =>
    CelestReleaseInfo(
      version: const VersionConverter().fromJson(json['version'] as String),
      installer: json['installer'] as String?,
      zip: json['zip'] as String?,
    );

Map<String, dynamic> _$CelestReleaseInfoToJson(CelestReleaseInfo instance) =>
    <String, dynamic>{
      'version': const VersionConverter().toJson(instance.version),
      if (instance.zip case final value?) 'zip': value,
      if (instance.installer case final value?) 'installer': value,
    };
