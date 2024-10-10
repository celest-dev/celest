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

class Effect extends $pb.ProtobufEnum {
  static const Effect EFFECT_UNSPECIFIED =
      Effect._(0, _omitEnumNames ? '' : 'EFFECT_UNSPECIFIED');
  static const Effect EFFECT_PERMIT =
      Effect._(1, _omitEnumNames ? '' : 'EFFECT_PERMIT');
  static const Effect EFFECT_FORBID =
      Effect._(2, _omitEnumNames ? '' : 'EFFECT_FORBID');

  static const $core.List<Effect> values = <Effect>[
    EFFECT_UNSPECIFIED,
    EFFECT_PERMIT,
    EFFECT_FORBID,
  ];

  static final $core.Map<$core.int, Effect> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Effect? valueOf($core.int value) => _byValue[value];

  const Effect._($core.int v, $core.String n) : super(v, n);
}

class ConditionKind extends $pb.ProtobufEnum {
  static const ConditionKind CONDITION_KIND_UNSPECIFIED =
      ConditionKind._(0, _omitEnumNames ? '' : 'CONDITION_KIND_UNSPECIFIED');
  static const ConditionKind CONDITION_KIND_WHEN =
      ConditionKind._(1, _omitEnumNames ? '' : 'CONDITION_KIND_WHEN');
  static const ConditionKind CONDITION_KIND_UNLESS =
      ConditionKind._(2, _omitEnumNames ? '' : 'CONDITION_KIND_UNLESS');

  static const $core.List<ConditionKind> values = <ConditionKind>[
    CONDITION_KIND_UNSPECIFIED,
    CONDITION_KIND_WHEN,
    CONDITION_KIND_UNLESS,
  ];

  static final $core.Map<$core.int, ConditionKind> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ConditionKind? valueOf($core.int value) => _byValue[value];

  const ConditionKind._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
