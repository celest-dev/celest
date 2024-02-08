import 'dart:async';
import 'dart:convert';

import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_flow.g.dart';

const _serializable = JsonSerializable(fieldRename: FieldRename.snake);
final _baseUri = Uri.parse('https://github.com');
const _clientId = 'Iv1.6682bfee173396ad';

/// Implements the GitHub Device Flow contract as outlined here:
/// https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps#device-flow
abstract final class DeviceFlowClient {
  static Future<DeviceFlow> start() async {
    final url = _baseUri.resolve('/login/device/code');
    final response = await httpClient.post(
      url,
      body: jsonEncode(
        const DeviceFlowStart(
          clientId: _clientId,
          scope: 'user:email',
        ).toJson(),
      ),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200 ||
        response.headers['content-type'] != 'application/json') {
      throw ClientException(
        'Failed to start device flow (${response.statusCode})\n'
        '${response.body}',
      );
    }
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    return DeviceFlow.fromJson(body);
  }
}

@_serializable
final class DeviceFlowStart {
  const DeviceFlowStart({
    required this.clientId,
    this.scope,
  });

  factory DeviceFlowStart.fromJson(Map<String, dynamic> json) =>
      _$DeviceFlowStartFromJson(json);

  final String clientId;
  final String? scope;

  Map<String, dynamic> toJson() => _$DeviceFlowStartToJson(this);
}

@_serializable
final class DeviceFlow {
  const DeviceFlow({
    required this.deviceCode,
    required this.userCode,
    required this.verificationUri,
    required this.expiresIn,
    required this.interval,
  });

  factory DeviceFlow.fromJson(Map<String, dynamic> json) =>
      _$DeviceFlowFromJson(json);

  final String deviceCode;
  final String userCode;
  final Uri verificationUri;
  final int expiresIn;
  final int interval;

  Future<GitHubCredentials> wait() async {
    final timeout = Duration(seconds: expiresIn - 5);
    final stopwatch = Stopwatch()..start();
    final url = _baseUri.resolve('/login/oauth/access_token');
    while (stopwatch.elapsed < timeout) {
      await Future<void>.delayed(Duration(seconds: interval));
      final pollResult = await httpClient.post(
        url,
        body: jsonEncode(
          DeviceFlowPoll(
            clientId: _clientId,
            deviceCode: deviceCode,
          ).toJson(),
        ),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      final body = jsonDecode(pollResult.body) as Map<String, dynamic>;
      switch (pollResult.statusCode) {
        case 200:
          return GitHubCredentials.fromJson(body);
        case 400:
          if (body case {'error': final String error}) {
            switch (error) {
              case 'authorization_pending':
                continue;
              case 'slow_down':
                // Wait one extra duration
                await Future<void>.delayed(Duration(seconds: interval));
                continue;
              default:
                break;
            }
          }
      }
      throw ClientException(
        'Failed to poll device flow (${pollResult.statusCode})\n'
        '${pollResult.body}',
      );
    }
    throw TimeoutException(
      'Timed out after waiting for device code entry',
      timeout,
    );
  }

  Map<String, dynamic> toJson() => _$DeviceFlowToJson(this);
}

@_serializable
final class DeviceFlowPoll {
  const DeviceFlowPoll({
    required this.clientId,
    required this.deviceCode,
  });

  factory DeviceFlowPoll.fromJson(Map<String, dynamic> json) =>
      _$DeviceFlowPollFromJson(json);

  final String clientId;
  final String deviceCode;

  @JsonKey(includeToJson: true)
  String get grantType => 'urn:ietf:params:oauth:grant-type:device_code';

  Map<String, dynamic> toJson() => _$DeviceFlowPollToJson(this);
}

@_serializable
final class GitHubCredentials {
  const GitHubCredentials({
    required this.accessToken,
    required this.tokenType,
    required this.scope,
  });

  factory GitHubCredentials.fromJson(Map<String, dynamic> json) =>
      _$GitHubCredentialsFromJson(json);

  final String accessToken;
  final String tokenType;
  final String scope;

  Map<String, dynamic> toJson() => _$GitHubCredentialsToJson(this);
}
