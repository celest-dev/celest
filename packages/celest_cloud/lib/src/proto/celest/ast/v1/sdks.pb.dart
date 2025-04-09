//
//  Generated code. Do not modify.
//  source: celest/ast/v1/sdks.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/struct.pb.dart' as $0;
import 'sdks.pbenum.dart';

export 'sdks.pbenum.dart';

/// Information about an SDK used to deploy the project.
class Sdk extends $pb.GeneratedMessage {
  factory Sdk({
    SdkType? type,
    Version? version,
    $core.Iterable<$core.String>? enabledExperiments,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (version != null) {
      $result.version = version;
    }
    if (enabledExperiments != null) {
      $result.enabledExperiments.addAll(enabledExperiments);
    }
    return $result;
  }
  Sdk._() : super();
  factory Sdk.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Sdk.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Sdk',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..e<SdkType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: SdkType.SDK_TYPE_UNSPECIFIED,
        valueOf: SdkType.valueOf,
        enumValues: SdkType.values)
    ..aOM<Version>(2, _omitFieldNames ? '' : 'version',
        subBuilder: Version.create)
    ..pPS(3, _omitFieldNames ? '' : 'enabledExperiments')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Sdk clone() => Sdk()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Sdk copyWith(void Function(Sdk) updates) =>
      super.copyWith((message) => updates(message as Sdk)) as Sdk;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Sdk create() => Sdk._();
  Sdk createEmptyInstance() => create();
  static $pb.PbList<Sdk> createRepeated() => $pb.PbList<Sdk>();
  @$core.pragma('dart2js:noInline')
  static Sdk getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Sdk>(create);
  static Sdk? _defaultInstance;

  /// The type of the SDK.
  @$pb.TagNumber(1)
  SdkType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(SdkType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  /// The version of the SDK.
  @$pb.TagNumber(2)
  Version get version => $_getN(1);
  @$pb.TagNumber(2)
  set version(Version v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);
  @$pb.TagNumber(2)
  Version ensureVersion() => $_ensure(1);

  /// The SDK experiments enabled for the project.
  @$pb.TagNumber(3)
  $core.List<$core.String> get enabledExperiments => $_getList(2);
}

/// A semantic version, broken down by its components.
class Version extends $pb.GeneratedMessage {
  factory Version({
    $core.int? major,
    $core.int? minor,
    $core.int? patch,
    $core.Iterable<$0.Value>? preRelease,
    $core.Iterable<$0.Value>? build,
    $core.String? canonicalizedVersion,
  }) {
    final $result = create();
    if (major != null) {
      $result.major = major;
    }
    if (minor != null) {
      $result.minor = minor;
    }
    if (patch != null) {
      $result.patch = patch;
    }
    if (preRelease != null) {
      $result.preRelease.addAll(preRelease);
    }
    if (build != null) {
      $result.build.addAll(build);
    }
    if (canonicalizedVersion != null) {
      $result.canonicalizedVersion = canonicalizedVersion;
    }
    return $result;
  }
  Version._() : super();
  factory Version.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Version.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Version',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'celest.ast.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'major', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'minor', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'patch', $pb.PbFieldType.O3)
    ..pc<$0.Value>(4, _omitFieldNames ? '' : 'preRelease', $pb.PbFieldType.PM,
        subBuilder: $0.Value.create)
    ..pc<$0.Value>(5, _omitFieldNames ? '' : 'build', $pb.PbFieldType.PM,
        subBuilder: $0.Value.create)
    ..aOS(6, _omitFieldNames ? '' : 'canonicalizedVersion')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Version clone() => Version()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Version copyWith(void Function(Version) updates) =>
      super.copyWith((message) => updates(message as Version)) as Version;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Version create() => Version._();
  Version createEmptyInstance() => create();
  static $pb.PbList<Version> createRepeated() => $pb.PbList<Version>();
  @$core.pragma('dart2js:noInline')
  static Version getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Version>(create);
  static Version? _defaultInstance;

  /// The major version number: "1" in "1.2.3".
  @$pb.TagNumber(1)
  $core.int get major => $_getIZ(0);
  @$pb.TagNumber(1)
  set major($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMajor() => $_has(0);
  @$pb.TagNumber(1)
  void clearMajor() => clearField(1);

  /// The minor version number: "2" in "1.2.3".
  @$pb.TagNumber(2)
  $core.int get minor => $_getIZ(1);
  @$pb.TagNumber(2)
  set minor($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMinor() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinor() => clearField(2);

  /// The patch version number: "3" in "1.2.3".
  @$pb.TagNumber(3)
  $core.int get patch => $_getIZ(2);
  @$pb.TagNumber(3)
  set patch($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPatch() => $_has(2);
  @$pb.TagNumber(3)
  void clearPatch() => clearField(3);

  ///  The pre-release identifier: "foo" in "1.2.3-foo".
  ///
  ///  This is split into a list of components, each of which may be either a
  ///  string or a non-negative integer. It may also be empty, indicating that
  ///  this version has no pre-release identifier.
  @$pb.TagNumber(4)
  $core.List<$0.Value> get preRelease => $_getList(3);

  ///  The build identifier: "foo" in "1.2.3+foo".
  ///
  ///  This is split into a list of components, each of which may be either a
  ///  string or a non-negative integer. It may also be empty, indicating that
  ///  this version has no build identifier.
  @$pb.TagNumber(5)
  $core.List<$0.Value> get build => $_getList(4);

  /// The canonicalized version string.
  @$pb.TagNumber(6)
  $core.String get canonicalizedVersion => $_getSZ(5);
  @$pb.TagNumber(6)
  set canonicalizedVersion($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCanonicalizedVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearCanonicalizedVersion() => clearField(6);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
