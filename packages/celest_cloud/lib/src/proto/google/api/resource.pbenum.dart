//
//  Generated code. Do not modify.
//  source: google/api/resource.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// A description of the historical or future-looking state of the
/// resource pattern.
class ResourceDescriptor_History extends $pb.ProtobufEnum {
  /// The "unset" value.
  static const ResourceDescriptor_History HISTORY_UNSPECIFIED =
      ResourceDescriptor_History._(
          0, _omitEnumNames ? '' : 'HISTORY_UNSPECIFIED');

  /// The resource originally had one pattern and launched as such, and
  /// additional patterns were added later.
  static const ResourceDescriptor_History ORIGINALLY_SINGLE_PATTERN =
      ResourceDescriptor_History._(
          1, _omitEnumNames ? '' : 'ORIGINALLY_SINGLE_PATTERN');

  /// The resource has one pattern, but the API owner expects to add more
  /// later. (This is the inverse of ORIGINALLY_SINGLE_PATTERN, and prevents
  /// that from being necessary once there are multiple patterns.)
  static const ResourceDescriptor_History FUTURE_MULTI_PATTERN =
      ResourceDescriptor_History._(
          2, _omitEnumNames ? '' : 'FUTURE_MULTI_PATTERN');

  static const $core.List<ResourceDescriptor_History> values =
      <ResourceDescriptor_History>[
    HISTORY_UNSPECIFIED,
    ORIGINALLY_SINGLE_PATTERN,
    FUTURE_MULTI_PATTERN,
  ];

  static final $core.Map<$core.int, ResourceDescriptor_History> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ResourceDescriptor_History? valueOf($core.int value) =>
      _byValue[value];

  const ResourceDescriptor_History._(super.v, super.n);
}

/// A flag representing a specific style that a resource claims to conform to.
class ResourceDescriptor_Style extends $pb.ProtobufEnum {
  /// The unspecified value. Do not use.
  static const ResourceDescriptor_Style STYLE_UNSPECIFIED =
      ResourceDescriptor_Style._(0, _omitEnumNames ? '' : 'STYLE_UNSPECIFIED');

  ///  This resource is intended to be "declarative-friendly".
  ///
  ///  Declarative-friendly resources must be more strictly consistent, and
  ///  setting this to true communicates to tools that this resource should
  ///  adhere to declarative-friendly expectations.
  ///
  ///  Note: This is used by the API linter (linter.aip.dev) to enable
  ///  additional checks.
  static const ResourceDescriptor_Style DECLARATIVE_FRIENDLY =
      ResourceDescriptor_Style._(
          1, _omitEnumNames ? '' : 'DECLARATIVE_FRIENDLY');

  static const $core.List<ResourceDescriptor_Style> values =
      <ResourceDescriptor_Style>[
    STYLE_UNSPECIFIED,
    DECLARATIVE_FRIENDLY,
  ];

  static final $core.Map<$core.int, ResourceDescriptor_Style> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ResourceDescriptor_Style? valueOf($core.int value) => _byValue[value];

  const ResourceDescriptor_Style._(super.v, super.n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
