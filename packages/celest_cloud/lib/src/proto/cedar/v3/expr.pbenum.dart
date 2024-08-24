//
//  Generated code. Do not modify.
//  source: cedar/v3/expr.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Variable extends $pb.ProtobufEnum {
  static const Variable VARIABLE_UNSPECIFIED =
      Variable._(0, _omitEnumNames ? '' : 'VARIABLE_UNSPECIFIED');
  static const Variable VARIABLE_PRINCIPAL =
      Variable._(1, _omitEnumNames ? '' : 'VARIABLE_PRINCIPAL');
  static const Variable VARIABLE_ACTION =
      Variable._(2, _omitEnumNames ? '' : 'VARIABLE_ACTION');
  static const Variable VARIABLE_RESOURCE =
      Variable._(3, _omitEnumNames ? '' : 'VARIABLE_RESOURCE');
  static const Variable VARIABLE_CONTEXT =
      Variable._(4, _omitEnumNames ? '' : 'VARIABLE_CONTEXT');

  static const $core.List<Variable> values = <Variable>[
    VARIABLE_UNSPECIFIED,
    VARIABLE_PRINCIPAL,
    VARIABLE_ACTION,
    VARIABLE_RESOURCE,
    VARIABLE_CONTEXT,
  ];

  static final $core.Map<$core.int, Variable> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Variable? valueOf($core.int value) => _byValue[value];

  const Variable._($core.int v, $core.String n) : super(v, n);
}

class SlotId extends $pb.ProtobufEnum {
  static const SlotId SLOT_ID_UNSPECIFIED =
      SlotId._(0, _omitEnumNames ? '' : 'SLOT_ID_UNSPECIFIED');
  static const SlotId SLOT_ID_PRINCIPAL =
      SlotId._(1, _omitEnumNames ? '' : 'SLOT_ID_PRINCIPAL');
  static const SlotId SLOT_ID_RESOURCE =
      SlotId._(2, _omitEnumNames ? '' : 'SLOT_ID_RESOURCE');

  static const $core.List<SlotId> values = <SlotId>[
    SLOT_ID_UNSPECIFIED,
    SLOT_ID_PRINCIPAL,
    SLOT_ID_RESOURCE,
  ];

  static final $core.Map<$core.int, SlotId> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SlotId? valueOf($core.int value) => _byValue[value];

  const SlotId._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
