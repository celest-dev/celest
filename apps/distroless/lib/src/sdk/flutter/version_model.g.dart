// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlutterSdkRelease _$FlutterSdkReleaseFromJson(Map<String, dynamic> json) =>
    FlutterSdkRelease(
      hash: json['hash'] as String,
      channel: $enumDecode(_$SdkChannelEnumMap, json['channel']),
      version: const VersionConverter().fromJson(json['version'] as String),
      releaseDate: DateTime.parse(json['release_date'] as String),
      archive: json['archive'] as String,
      sha256: json['sha256'] as String,
      dartSdkArch: json['dart_sdk_arch'] as String?,
      dartSdkVersion: json['dart_sdk_version'] as String?,
      activeChannel: json['active_channel'] as bool? ?? false,
    );

Map<String, dynamic> _$FlutterSdkReleaseToJson(FlutterSdkRelease instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'channel': _$SdkChannelEnumMap[instance.channel]!,
      'version': const VersionConverter().toJson(instance.version),
      'release_date': instance.releaseDate.toIso8601String(),
      'archive': instance.archive,
      'sha256': instance.sha256,
      'active_channel': instance.activeChannel,
      'dart_sdk_version': instance.dartSdkVersion,
      'dart_sdk_arch': instance.dartSdkArch,
    };

const _$SdkChannelEnumMap = {
  SdkChannel.stable: 'stable',
  SdkChannel.beta: 'beta',
  SdkChannel.dev: 'dev',
};

Channels _$ChannelsFromJson(Map<String, dynamic> json) => Channels(
      beta: FlutterSdkRelease.fromJson(json['beta'] as Map<String, dynamic>),
      dev: FlutterSdkRelease.fromJson(json['dev'] as Map<String, dynamic>),
      stable:
          FlutterSdkRelease.fromJson(json['stable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChannelsToJson(Channels instance) => <String, dynamic>{
      'beta': instance.beta.toJson(),
      'dev': instance.dev.toJson(),
      'stable': instance.stable.toJson(),
    };
