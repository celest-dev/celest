// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_flow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceFlowStart _$DeviceFlowStartFromJson(Map<String, dynamic> json) =>
    DeviceFlowStart(
      clientId: json['client_id'] as String,
      scope: json['scope'] as String?,
    );

Map<String, dynamic> _$DeviceFlowStartToJson(DeviceFlowStart instance) =>
    <String, dynamic>{'client_id': instance.clientId, 'scope': instance.scope};

DeviceFlow _$DeviceFlowFromJson(Map<String, dynamic> json) => DeviceFlow(
      deviceCode: json['device_code'] as String,
      userCode: json['user_code'] as String,
      verificationUri: Uri.parse(json['verification_uri'] as String),
      expiresIn: (json['expires_in'] as num).toInt(),
      interval: (json['interval'] as num).toInt(),
    );

Map<String, dynamic> _$DeviceFlowToJson(DeviceFlow instance) =>
    <String, dynamic>{
      'device_code': instance.deviceCode,
      'user_code': instance.userCode,
      'verification_uri': instance.verificationUri.toString(),
      'expires_in': instance.expiresIn,
      'interval': instance.interval,
    };

DeviceFlowPoll _$DeviceFlowPollFromJson(Map<String, dynamic> json) =>
    DeviceFlowPoll(
      clientId: json['client_id'] as String,
      deviceCode: json['device_code'] as String,
    );

Map<String, dynamic> _$DeviceFlowPollToJson(DeviceFlowPoll instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'device_code': instance.deviceCode,
      'grant_type': instance.grantType,
    };

GitHubCredentials _$GitHubCredentialsFromJson(Map<String, dynamic> json) =>
    GitHubCredentials(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      scope: json['scope'] as String,
    );

Map<String, dynamic> _$GitHubCredentialsToJson(GitHubCredentials instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'scope': instance.scope,
    };
