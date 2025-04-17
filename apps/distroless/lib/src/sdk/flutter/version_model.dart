import 'package:distroless/src/sdk/sdk_release_info.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pub_semver/pub_semver.dart';

part 'version_model.g.dart';

final class VersionConverter implements JsonConverter<Version, String> {
  const VersionConverter();

  @override
  Version fromJson(String json) {
    if (json.startsWith('v')) {
      json = json.substring(1);
    }
    return Version.parse(json);
  }

  @override
  String toJson(Version object) => object.toString();
}

/// Release Model
@JsonSerializable(
  fieldRename: FieldRename.snake,
  converters: [VersionConverter()],
)
class FlutterSdkRelease {
  const FlutterSdkRelease({
    required this.hash,
    required this.channel,
    required this.version,
    required this.releaseDate,
    required this.archive,
    required this.sha256,
    required this.dartSdkArch,
    required this.dartSdkVersion,
    this.activeChannel = false,
  });

  factory FlutterSdkRelease.fromJson(Map<String, dynamic> json) =>
      _$FlutterSdkReleaseFromJson(json);

  /// Release hash
  final String hash;

  /// Release channel
  final SdkChannel channel;

  /// Release version
  final Version version;

  /// Release date
  final DateTime releaseDate;

  /// Release archive name
  final String archive;

  /// Release sha256 hash
  final String sha256;

  /// Is release active in a channel
  final bool? activeChannel;

  /// Version of the Dart SDK
  final String? dartSdkVersion;

  /// Dart SDK architecture
  final String? dartSdkArch;

  Map<String, dynamic> toJson() => _$FlutterSdkReleaseToJson(this);
}

/// Release channels model
@JsonSerializable()
class Channels {
  /// Channel model contructor
  const Channels({
    required this.beta,
    required this.dev,
    required this.stable,
  });

  factory Channels.fromJson(Map<String, dynamic> json) =>
      _$ChannelsFromJson(json);

  /// Beta channel release
  final FlutterSdkRelease beta;

  /// Dev channel release
  final FlutterSdkRelease dev;

  /// Stable channel release
  final FlutterSdkRelease stable;

  /// Returns a list of all releases
  List<FlutterSdkRelease> get toList => [dev, beta, stable];

  /// Returns channel by name
  FlutterSdkRelease operator [](SdkChannel channel) => switch (channel) {
        SdkChannel.beta => beta,
        SdkChannel.dev => dev,
        SdkChannel.stable => stable,
      };

  Map<String, dynamic> toJson() => _$ChannelsToJson(this);
}
