// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_releases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlutterReleasesResponse _$FlutterReleasesResponseFromJson(
        Map<String, dynamic> json) =>
    FlutterReleasesResponse(
      baseUrl: json['base_url'] as String,
      currentRelease: (json['current_release'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$SdkChannelEnumMap, k), e as String),
      ),
      releases: (json['releases'] as List<dynamic>)
          .map((e) => FlutterSdkRelease.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FlutterReleasesResponseToJson(
        FlutterReleasesResponse instance) =>
    <String, dynamic>{
      'base_url': instance.baseUrl,
      'current_release': instance.currentRelease
          .map((k, e) => MapEntry(_$SdkChannelEnumMap[k]!, e)),
      'releases': instance.releases.map((e) => e.toJson()).toList(),
    };

const _$SdkChannelEnumMap = {
  SdkChannel.stable: 'stable',
  SdkChannel.beta: 'beta',
  SdkChannel.dev: 'dev',
};
