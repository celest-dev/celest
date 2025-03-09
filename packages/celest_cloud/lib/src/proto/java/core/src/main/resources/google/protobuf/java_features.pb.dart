//
//  Generated code. Do not modify.
//  source: java/core/src/main/resources/google/protobuf/java_features.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'java_features.pbenum.dart';

export 'java_features.pbenum.dart';

class JavaFeatures extends $pb.GeneratedMessage {
  factory JavaFeatures({
    $core.bool? legacyClosedEnum,
    JavaFeatures_Utf8Validation? utf8Validation,
  }) {
    final $result = create();
    if (legacyClosedEnum != null) {
      $result.legacyClosedEnum = legacyClosedEnum;
    }
    if (utf8Validation != null) {
      $result.utf8Validation = utf8Validation;
    }
    return $result;
  }
  JavaFeatures._() : super();
  factory JavaFeatures.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JavaFeatures.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JavaFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'legacyClosedEnum')
    ..e<JavaFeatures_Utf8Validation>(
        2, _omitFieldNames ? '' : 'utf8Validation', $pb.PbFieldType.OE,
        defaultOrMaker: JavaFeatures_Utf8Validation.UTF8_VALIDATION_UNKNOWN,
        valueOf: JavaFeatures_Utf8Validation.valueOf,
        enumValues: JavaFeatures_Utf8Validation.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JavaFeatures clone() => JavaFeatures()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JavaFeatures copyWith(void Function(JavaFeatures) updates) =>
      super.copyWith((message) => updates(message as JavaFeatures))
          as JavaFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JavaFeatures create() => JavaFeatures._();
  JavaFeatures createEmptyInstance() => create();
  static $pb.PbList<JavaFeatures> createRepeated() =>
      $pb.PbList<JavaFeatures>();
  @$core.pragma('dart2js:noInline')
  static JavaFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JavaFeatures>(create);
  static JavaFeatures? _defaultInstance;

  /// Whether or not to treat an enum field as closed.  This option is only
  /// applicable to enum fields, and will be removed in the future.  It is
  /// consistent with the legacy behavior of using proto3 enum types for proto2
  /// fields.
  @$pb.TagNumber(1)
  $core.bool get legacyClosedEnum => $_getBF(0);
  @$pb.TagNumber(1)
  set legacyClosedEnum($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLegacyClosedEnum() => $_has(0);
  @$pb.TagNumber(1)
  void clearLegacyClosedEnum() => clearField(1);

  @$pb.TagNumber(2)
  JavaFeatures_Utf8Validation get utf8Validation => $_getN(1);
  @$pb.TagNumber(2)
  set utf8Validation(JavaFeatures_Utf8Validation v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUtf8Validation() => $_has(1);
  @$pb.TagNumber(2)
  void clearUtf8Validation() => clearField(2);
}

class Java_features {
  static final java = $pb.Extension<JavaFeatures>(
      _omitMessageNames ? '' : 'google.protobuf.FeatureSet',
      _omitFieldNames ? '' : 'java',
      1001,
      $pb.PbFieldType.OM,
      defaultOrMaker: JavaFeatures.getDefault,
      subBuilder: JavaFeatures.create);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(java);
  }
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
