//
//  Generated code. Do not modify.
//  source: cedar/v3/policy.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PolicyEffect extends $pb.ProtobufEnum {
  static const PolicyEffect POLICY_EFFECT_UNSPECIFIED = PolicyEffect._(0, _omitEnumNames ? '' : 'POLICY_EFFECT_UNSPECIFIED');
  static const PolicyEffect POLICY_EFFECT_PERMIT = PolicyEffect._(1, _omitEnumNames ? '' : 'POLICY_EFFECT_PERMIT');
  static const PolicyEffect POLICY_EFFECT_FORBID = PolicyEffect._(2, _omitEnumNames ? '' : 'POLICY_EFFECT_FORBID');

  static const $core.List<PolicyEffect> values = <PolicyEffect> [
    POLICY_EFFECT_UNSPECIFIED,
    POLICY_EFFECT_PERMIT,
    POLICY_EFFECT_FORBID,
  ];

  static final $core.Map<$core.int, PolicyEffect> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PolicyEffect? valueOf($core.int value) => _byValue[value];

  const PolicyEffect._($core.int v, $core.String n) : super(v, n);
}

class PolicyOp extends $pb.ProtobufEnum {
  static const PolicyOp POLICY_OP_UNSPECIFIED = PolicyOp._(0, _omitEnumNames ? '' : 'POLICY_OP_UNSPECIFIED');
  static const PolicyOp POLICY_OP_ALL = PolicyOp._(1, _omitEnumNames ? '' : 'POLICY_OP_ALL');
  static const PolicyOp POLICY_OP_EQUALS = PolicyOp._(2, _omitEnumNames ? '' : 'POLICY_OP_EQUALS');
  static const PolicyOp POLICY_OP_IN = PolicyOp._(3, _omitEnumNames ? '' : 'POLICY_OP_IN');
  static const PolicyOp POLICY_OP_IS = PolicyOp._(4, _omitEnumNames ? '' : 'POLICY_OP_IS');

  static const $core.List<PolicyOp> values = <PolicyOp> [
    POLICY_OP_UNSPECIFIED,
    POLICY_OP_ALL,
    POLICY_OP_EQUALS,
    POLICY_OP_IN,
    POLICY_OP_IS,
  ];

  static final $core.Map<$core.int, PolicyOp> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PolicyOp? valueOf($core.int value) => _byValue[value];

  const PolicyOp._($core.int v, $core.String n) : super(v, n);
}

class PolicyConditionKind extends $pb.ProtobufEnum {
  static const PolicyConditionKind POLICY_CONDITION_KIND_UNSPECIFIED = PolicyConditionKind._(0, _omitEnumNames ? '' : 'POLICY_CONDITION_KIND_UNSPECIFIED');
  static const PolicyConditionKind POLICY_CONDITION_KIND_WHEN = PolicyConditionKind._(1, _omitEnumNames ? '' : 'POLICY_CONDITION_KIND_WHEN');
  static const PolicyConditionKind POLICY_CONDITION_KIND_UNLESS = PolicyConditionKind._(2, _omitEnumNames ? '' : 'POLICY_CONDITION_KIND_UNLESS');

  static const $core.List<PolicyConditionKind> values = <PolicyConditionKind> [
    POLICY_CONDITION_KIND_UNSPECIFIED,
    POLICY_CONDITION_KIND_WHEN,
    POLICY_CONDITION_KIND_UNLESS,
  ];

  static final $core.Map<$core.int, PolicyConditionKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PolicyConditionKind? valueOf($core.int value) => _byValue[value];

  const PolicyConditionKind._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
