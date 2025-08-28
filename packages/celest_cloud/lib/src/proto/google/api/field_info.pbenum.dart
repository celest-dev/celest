// This is a generated file - do not edit.
//
// Generated from google/api/field_info.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The standard format of a field value. The supported formats are all backed
/// by either an RFC defined by the IETF or a Google-defined AIP.
class FieldInfo_Format extends $pb.ProtobufEnum {
  /// Default, unspecified value.
  static const FieldInfo_Format FORMAT_UNSPECIFIED =
      FieldInfo_Format._(0, _omitEnumNames ? '' : 'FORMAT_UNSPECIFIED');

  /// Universally Unique Identifier, version 4, value as defined by
  /// https://datatracker.ietf.org/doc/html/rfc4122. The value may be
  /// normalized to entirely lowercase letters. For example, the value
  /// `F47AC10B-58CC-0372-8567-0E02B2C3D479` would be normalized to
  /// `f47ac10b-58cc-0372-8567-0e02b2c3d479`.
  static const FieldInfo_Format UUID4 =
      FieldInfo_Format._(1, _omitEnumNames ? '' : 'UUID4');

  /// Internet Protocol v4 value as defined by [RFC
  /// 791](https://datatracker.ietf.org/doc/html/rfc791). The value may be
  /// condensed, with leading zeros in each octet stripped. For example,
  /// `001.022.233.040` would be condensed to `1.22.233.40`.
  static const FieldInfo_Format IPV4 =
      FieldInfo_Format._(2, _omitEnumNames ? '' : 'IPV4');

  /// Internet Protocol v6 value as defined by [RFC
  /// 2460](https://datatracker.ietf.org/doc/html/rfc2460). The value may be
  /// normalized to entirely lowercase letters with zeros compressed, following
  /// [RFC 5952](https://datatracker.ietf.org/doc/html/rfc5952). For example,
  /// the value `2001:0DB8:0::0` would be normalized to `2001:db8::`.
  static const FieldInfo_Format IPV6 =
      FieldInfo_Format._(3, _omitEnumNames ? '' : 'IPV6');

  /// An IP address in either v4 or v6 format as described by the individual
  /// values defined herein. See the comments on the IPV4 and IPV6 types for
  /// allowed normalizations of each.
  static const FieldInfo_Format IPV4_OR_IPV6 =
      FieldInfo_Format._(4, _omitEnumNames ? '' : 'IPV4_OR_IPV6');

  static const $core.List<FieldInfo_Format> values = <FieldInfo_Format>[
    FORMAT_UNSPECIFIED,
    UUID4,
    IPV4,
    IPV6,
    IPV4_OR_IPV6,
  ];

  static final $core.List<FieldInfo_Format?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static FieldInfo_Format? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FieldInfo_Format._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
