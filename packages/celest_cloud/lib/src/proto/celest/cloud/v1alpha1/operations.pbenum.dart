//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/operations.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The state of an operation.
class OperationState extends $pb.ProtobufEnum {
  static const OperationState OPERATION_STATE_UNSPECIFIED =
      OperationState._(0, _omitEnumNames ? '' : 'OPERATION_STATE_UNSPECIFIED');
  static const OperationState PENDING =
      OperationState._(1, _omitEnumNames ? '' : 'PENDING');
  static const OperationState RUNNING =
      OperationState._(2, _omitEnumNames ? '' : 'RUNNING');
  static const OperationState SUCCEEDED =
      OperationState._(3, _omitEnumNames ? '' : 'SUCCEEDED');
  static const OperationState FAILED =
      OperationState._(4, _omitEnumNames ? '' : 'FAILED');
  static const OperationState CANCELLED =
      OperationState._(5, _omitEnumNames ? '' : 'CANCELLED');

  static const $core.List<OperationState> values = <OperationState>[
    OPERATION_STATE_UNSPECIFIED,
    PENDING,
    RUNNING,
    SUCCEEDED,
    FAILED,
    CANCELLED,
  ];

  static final $core.Map<$core.int, OperationState> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static OperationState? valueOf($core.int value) => _byValue[value];

  const OperationState._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
