import 'package:collection/collection.dart';
import 'package:pub_semver/pub_semver.dart';

final versionRegex = RegExp(r'\d+\.\d+\.\d+');

enum SdkChannel {
  stable,
  beta,
  dev;

  @override
  String toString() => name;
}

final class SdkChannelInfo {
  const SdkChannelInfo({required this.channel, required this.versions});

  factory SdkChannelInfo.fromJson(
    SdkChannel channel,
    Map<String, Object?> json,
  ) {
    final prefixes = (json['prefixes'] as List).cast<String>();
    final versions = <Version>[];
    for (final prefix in prefixes) {
      final version = prefix.split('/').lastWhereOrNull(versionRegex.hasMatch);
      if (version == null) {
        continue;
      }
      versions.add(Version.parse(version));
    }
    return SdkChannelInfo(channel: channel, versions: versions);
  }

  final SdkChannel channel;
  final List<Version> versions;
}

final class SdkReleases {
  SdkReleases({required this.stable, required this.beta, required this.dev});

  final SdkChannelInfo stable;
  final SdkChannelInfo beta;
  final SdkChannelInfo dev;

  late final Map<Version, SdkChannel> allReleases = {
    for (final version in dev.versions) version: SdkChannel.dev,
    for (final version in beta.versions) version: SdkChannel.beta,
    for (final version in stable.versions) version: SdkChannel.stable,
  };
  late final List<Version> allVersions =
      allReleases.keys.toList()..sort((a, b) => -a.compareTo(b));

  SdkChannelInfo operator [](SdkChannel channel) => switch (channel) {
    SdkChannel.stable => stable,
    SdkChannel.beta => beta,
    SdkChannel.dev => dev,
  };
}
