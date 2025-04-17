import 'dart:ffi';

import 'package:collection/collection.dart';
import 'package:distroless/src/sdk/sdk_release_info.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pub_semver/pub_semver.dart';

import 'version_model.dart';

part 'flutter_releases.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FlutterReleasesResponse {
  const FlutterReleasesResponse({
    required this.baseUrl,
    required this.currentRelease,
    required this.releases,
  });

  factory FlutterReleasesResponse.fromJson(Map<String, dynamic> json) =>
      _$FlutterReleasesResponseFromJson(json);

  final String baseUrl;
  final Map<SdkChannel, String> currentRelease;
  final List<FlutterSdkRelease> releases;

  Map<Version, FlutterSdkRelease> get allReleases => Map.fromEntries(
    releases.map((release) => MapEntry(release.version, release)),
  );

  SdkReleases get sdkReleases {
    final stable = <Version>{};
    final beta = <Version>{};
    final dev = <Version>{};
    final currentArch = switch (Abi.current()) {
      Abi.macosArm64 || Abi.windowsArm64 || Abi.linuxArm64 => 'arm64',
      _ => 'x64',
    };
    for (final release in releases) {
      if (release.dartSdkArch != currentArch) {
        continue;
      }
      switch (release.channel) {
        case SdkChannel.stable:
          stable.add(release.version);
        case SdkChannel.beta:
          beta.add(release.version);
        case SdkChannel.dev:
          dev.add(release.version);
      }
    }
    return SdkReleases(
      stable: SdkChannelInfo(
        channel: SdkChannel.stable,
        versions: stable.toList().sorted((a, b) => a.compareTo(b)),
      ),
      beta: SdkChannelInfo(
        channel: SdkChannel.beta,
        versions: beta.toList().sorted((a, b) => a.compareTo(b)),
      ),
      dev: SdkChannelInfo(
        channel: SdkChannel.dev,
        versions: dev.toList().sorted((a, b) => a.compareTo(b)),
      ),
    );
  }

  Map<String, Object?> toJson() => _$FlutterReleasesResponseToJson(this);
}
