import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_ast/src/proto/celest/ast/v1/features.pb.dart' as pb;
import 'package:celest_ast/src/proto/celest/ast/v1/resolved_ast.pb.dart' as pb;
import 'package:celest_ast/src/proto/celest/ast/v1/sdks.pb.dart' as pb;
import 'package:celest_ast/src/proto/google/protobuf/struct.pb.dart' as pb;
import 'package:pub_semver/pub_semver.dart';

part 'sdk_configuration.g.dart';

class SdkType extends EnumClass {
  static const SdkType dart = _$dart;
  static const SdkType flutter = _$flutter;

  const SdkType._(super.name);

  static BuiltSet<SdkType> get values => _$SdkTypeValues;
  static SdkType valueOf(String name) => _$SdkTypeValueOf(name);

  static Serializer<SdkType> get serializer => _$sdkTypeSerializer;
}

abstract class SdkConfiguration
    implements Built<SdkConfiguration, SdkConfigurationBuilder> {
  factory SdkConfiguration({
    required Version celest,
    required Sdk dart,
    Sdk? flutter,
    SdkType targetSdk = SdkType.dart,
    Iterable<FeatureFlag> featureFlags = const [],
  }) {
    return _$SdkConfiguration._(
      celest: celest,
      dart: dart,
      flutter: flutter,
      targetSdk: targetSdk,
      featureFlags: featureFlags.toBuiltSet(),
    );
  }

  factory SdkConfiguration.build([
    void Function(SdkConfigurationBuilder) updates,
  ]) = _$SdkConfiguration;

  factory SdkConfiguration.fromProto(pb.SdkConfiguration proto) {
    return SdkConfiguration(
      celest: _Version.fromProto(proto.celest),
      dart: Sdk.fromProto(proto.dart),
      flutter: proto.hasFlutter() ? Sdk.fromProto(proto.flutter) : null,
      targetSdk: switch (proto.targetSdk) {
        pb.SdkType.DART => SdkType.dart,
        pb.SdkType.FLUTTER => SdkType.flutter,
        _ => throw ArgumentError('Unknown SDK type: ${proto.targetSdk}'),
      },
      featureFlags: proto.featureFlags.map(FeatureFlag.fromProto),
    );
  }

  SdkConfiguration._();

  Version get celest;
  Sdk get dart;
  Sdk? get flutter;
  SdkType get targetSdk;
  BuiltSet<FeatureFlag> get featureFlags;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SdkConfiguration.serializer, this)
        as Map<String, Object?>;
  }

  static SdkConfiguration fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(SdkConfiguration.serializer, json)!;
  }

  bool featureEnabled(FeatureFlag flag) {
    return featureFlags.contains(flag);
  }

  pb.SdkConfiguration toProto() {
    return pb.SdkConfiguration(
      celest: celest.toProto(),
      dart: dart.toProto(),
      flutter: flutter?.toProto(),
      targetSdk: switch (targetSdk) {
        SdkType.dart => pb.SdkType.DART,
        SdkType.flutter => pb.SdkType.FLUTTER,
        _ => throw ArgumentError('Unknown SDK type: $targetSdk'),
      },
      featureFlags: featureFlags.map((e) => e.toProto()),
    );
  }

  static Serializer<SdkConfiguration> get serializer =>
      _$sdkConfigurationSerializer;
}

abstract class Sdk implements Built<Sdk, SdkBuilder> {
  factory Sdk({
    required SdkType type,
    required Version version,
    Iterable<String> enabledExperiments = const {},
  }) {
    return _$Sdk._(
      type: type,
      version: version,
      enabledExperiments: enabledExperiments.toBuiltSet(),
    );
  }

  factory Sdk.build([void Function(SdkBuilder) updates]) = _$Sdk;

  factory Sdk.fromProto(pb.Sdk proto) {
    return Sdk(
      type: switch (proto.type) {
        pb.SdkType.FLUTTER => SdkType.flutter,
        pb.SdkType.DART => SdkType.dart,
        _ => throw ArgumentError('Unknown SDK type: ${proto.type}'),
      },
      version: _Version.fromProto(proto.version),
      enabledExperiments: proto.enabledExperiments,
    );
  }

  Sdk._();

  SdkType get type;
  Version get version;
  BuiltSet<String> get enabledExperiments;

  Map<String, Object?> toJson() {
    return serializers.serializeWith(Sdk.serializer, this)
        as Map<String, Object?>;
  }

  static Sdk fromJson(Map<String, Object?> json) {
    return serializers.deserializeWith(Sdk.serializer, json)!;
  }

  static Serializer<Sdk> get serializer => _$sdkSerializer;

  pb.Sdk toProto() {
    return pb.Sdk(
      type: switch (type) {
        SdkType.dart => pb.SdkType.DART,
        SdkType.flutter => pb.SdkType.FLUTTER,
        _ => throw ArgumentError('Unknown SDK type: $type'),
      },
      version: version.toProto(),
      enabledExperiments: enabledExperiments,
    );
  }
}

class FeatureFlag extends EnumClass {
  const FeatureFlag._(super.name);

  static const FeatureFlag streaming = _$streaming;

  static BuiltSet<FeatureFlag> get values => _$FeatureFlagValues;
  static FeatureFlag valueOf(String name) => _$FeatureFlagValueOf(name);

  static FeatureFlag fromProto(pb.FeatureFlag flag) {
    return switch (flag) {
      pb.FeatureFlag.STREAMING => streaming,
      _ => throw StateError('Unknown feature flag: $flag'),
    };
  }

  static Serializer<FeatureFlag> get serializer => _$featureFlagSerializer;

  pb.FeatureFlag toProto() => switch (this) {
        streaming => pb.FeatureFlag.STREAMING,
        _ => throw StateError('Unknown feature flag: $this'),
      };
}

extension _Version on Version {
  static Version fromProto(pb.Version version) {
    if (version.hasCanonicalizedVersion()) {
      return Version.parse(version.canonicalizedVersion);
    }
    return Version(
      version.major,
      version.minor,
      version.patch,
      pre: version.preRelease.map(_Object.fromProto).join('.'),
      build: version.build.map(_Object.fromProto).join('.'),
    );
  }

  pb.Version toProto() {
    return pb.Version(
      major: major,
      minor: minor,
      patch: patch,
      preRelease: preRelease.map((e) => e.toProto()).toList(),
      build: build.map((e) => e.toProto()).toList(),
      canonicalizedVersion: canonicalizedVersion,
    );
  }
}

extension _Object on Object {
  static Object fromProto(pb.Value value) {
    return switch (value.whichKind()) {
      pb.Value_Kind.stringValue => value.stringValue,
      pb.Value_Kind.numberValue => value.numberValue.toInt(),
      final unsupported => throw ArgumentError.value(
          value, 'value', 'Unsupported value: $unsupported'),
    };
  }

  pb.Value toProto() {
    return switch (this) {
      final String s => pb.Value(stringValue: s),
      final num i => pb.Value(numberValue: i.toDouble()),
      final unsupported => throw ArgumentError.value(this, 'value',
          'Unsupported value: $unsupported (${unsupported.runtimeType})'),
    };
  }
}
