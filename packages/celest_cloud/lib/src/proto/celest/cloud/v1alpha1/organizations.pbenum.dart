//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/organizations.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Project lifecycle states.
class Organization_State extends $pb.ProtobufEnum {
  static const Organization_State STATE_UNSPECIFIED =
      Organization_State._(0, _omitEnumNames ? '' : 'STATE_UNSPECIFIED');
  static const Organization_State CREATING =
      Organization_State._(1, _omitEnumNames ? '' : 'CREATING');
  static const Organization_State CREATION_FAILED =
      Organization_State._(2, _omitEnumNames ? '' : 'CREATION_FAILED');
  static const Organization_State ACTIVE =
      Organization_State._(3, _omitEnumNames ? '' : 'ACTIVE');
  static const Organization_State DELETED =
      Organization_State._(4, _omitEnumNames ? '' : 'DELETED');

  static const $core.List<Organization_State> values = <Organization_State>[
    STATE_UNSPECIFIED,
    CREATING,
    CREATION_FAILED,
    ACTIVE,
    DELETED,
  ];

  static final $core.Map<$core.int, Organization_State> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Organization_State? valueOf($core.int value) => _byValue[value];

  const Organization_State._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
