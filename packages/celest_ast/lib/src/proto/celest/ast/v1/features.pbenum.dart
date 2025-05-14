//
//  Generated code. Do not modify.
//  source: celest/ast/v1/features.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Feature flags available to Celest projects.
class FeatureFlag extends $pb.ProtobufEnum {
  /// Unspecified feature flag.
  static const FeatureFlag FEATURE_FLAG_UNSPECIFIED =
      FeatureFlag._(0, _omitEnumNames ? '' : 'FEATURE_FLAG_UNSPECIFIED');

  /// Enables the use of `Stream` types in functions.
  static const FeatureFlag STREAMING =
      FeatureFlag._(1, _omitEnumNames ? '' : 'STREAMING');

  static const $core.List<FeatureFlag> values = <FeatureFlag>[
    FEATURE_FLAG_UNSPECIFIED,
    STREAMING,
  ];

  static final $core.Map<$core.int, FeatureFlag> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static FeatureFlag? valueOf($core.int value) => _byValue[value];

  const FeatureFlag._(super.v, super.n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
