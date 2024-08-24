//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/deployments.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The state of the deployment.
class Deployment_State extends $pb.ProtobufEnum {
  static const Deployment_State STATE_UNSPECIFIED =
      Deployment_State._(0, _omitEnumNames ? '' : 'STATE_UNSPECIFIED');
  static const Deployment_State PENDING =
      Deployment_State._(1, _omitEnumNames ? '' : 'PENDING');
  static const Deployment_State RUNNING =
      Deployment_State._(2, _omitEnumNames ? '' : 'RUNNING');
  static const Deployment_State SUCCEEDED =
      Deployment_State._(3, _omitEnumNames ? '' : 'SUCCEEDED');
  static const Deployment_State FAILED =
      Deployment_State._(4, _omitEnumNames ? '' : 'FAILED');
  static const Deployment_State CANCELLED =
      Deployment_State._(5, _omitEnumNames ? '' : 'CANCELLED');
  static const Deployment_State DELETED =
      Deployment_State._(6, _omitEnumNames ? '' : 'DELETED');

  static const $core.List<Deployment_State> values = <Deployment_State>[
    STATE_UNSPECIFIED,
    PENDING,
    RUNNING,
    SUCCEEDED,
    FAILED,
    CANCELLED,
    DELETED,
  ];

  static final $core.Map<$core.int, Deployment_State> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Deployment_State? valueOf($core.int value) => _byValue[value];

  const Deployment_State._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
