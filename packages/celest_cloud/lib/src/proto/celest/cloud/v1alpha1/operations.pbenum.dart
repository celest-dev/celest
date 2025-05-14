//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/operations.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The state of an operation.
class OperationState extends $pb.ProtobufEnum {
  /// The operation state is unspecified.
  static const OperationState OPERATION_STATE_UNSPECIFIED =
      OperationState._(0, _omitEnumNames ? '' : 'OPERATION_STATE_UNSPECIFIED');

  /// The operation is pending.
  static const OperationState PENDING =
      OperationState._(1, _omitEnumNames ? '' : 'PENDING');

  /// The operation is running.
  static const OperationState RUNNING =
      OperationState._(2, _omitEnumNames ? '' : 'RUNNING');

  /// The operation is complete.
  static const OperationState SUCCEEDED =
      OperationState._(3, _omitEnumNames ? '' : 'SUCCEEDED');

  /// The operation failed.
  static const OperationState FAILED =
      OperationState._(4, _omitEnumNames ? '' : 'FAILED');

  /// The operation was cancelled.
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

  const OperationState._(super.v, super.n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
