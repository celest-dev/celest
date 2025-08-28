// This is a generated file - do not edit.
//
// Generated from celest/cloud/v1alpha1/operations.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/any.pb.dart' as $0;
import '../../../google/protobuf/timestamp.pb.dart' as $1;
import 'operations.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'operations.pbenum.dart';

/// Metadata for long-running operations in Celest Cloud.
class OperationMetadata extends $pb.GeneratedMessage {
  factory OperationMetadata({
    $core.String? parent,
    $0.Any? resource,
    OperationState? state,
    $core.String? requestId,
    $1.Timestamp? createTime,
    $1.Timestamp? startTime,
    $1.Timestamp? endTime,
    $core.int? progress,
  }) {
    final result = create();
    if (parent != null) result.parent = parent;
    if (resource != null) result.resource = resource;
    if (state != null) result.state = state;
    if (requestId != null) result.requestId = requestId;
    if (createTime != null) result.createTime = createTime;
    if (startTime != null) result.startTime = startTime;
    if (endTime != null) result.endTime = endTime;
    if (progress != null) result.progress = progress;
    return result;
  }

  OperationMetadata._();

  factory OperationMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OperationMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OperationMetadata',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..aOM<$0.Any>(2, _omitFieldNames ? '' : 'resource',
        subBuilder: $0.Any.create)
    ..e<OperationState>(3, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE,
        defaultOrMaker: OperationState.OPERATION_STATE_UNSPECIFIED,
        valueOf: OperationState.valueOf,
        enumValues: OperationState.values)
    ..aOS(4, _omitFieldNames ? '' : 'requestId')
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'createTime',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'startTime',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'endTime',
        subBuilder: $1.Timestamp.create)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'progress', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationMetadata clone() => OperationMetadata()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationMetadata copyWith(void Function(OperationMetadata) updates) =>
      super.copyWith((message) => updates(message as OperationMetadata))
          as OperationMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperationMetadata create() => OperationMetadata._();
  @$core.override
  OperationMetadata createEmptyInstance() => create();
  static $pb.PbList<OperationMetadata> createRepeated() =>
      $pb.PbList<OperationMetadata>();
  @$core.pragma('dart2js:noInline')
  static OperationMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OperationMetadata>(create);
  static OperationMetadata? _defaultInstance;

  /// The resource name of the parent resource to the operation.
  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => $_clearField(1);

  /// The resource being operated on.
  ///
  /// (-- api-linter: core::0146::any=disabled --)
  @$pb.TagNumber(2)
  $0.Any get resource => $_getN(1);
  @$pb.TagNumber(2)
  set resource($0.Any value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasResource() => $_has(1);
  @$pb.TagNumber(2)
  void clearResource() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Any ensureResource() => $_ensure(1);

  /// The state of the operation.
  @$pb.TagNumber(3)
  OperationState get state => $_getN(2);
  @$pb.TagNumber(3)
  set state(OperationState value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => $_clearField(3);

  /// The request ID used for the triggering request.
  @$pb.TagNumber(4)
  $core.String get requestId => $_getSZ(3);
  @$pb.TagNumber(4)
  set requestId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRequestId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRequestId() => $_clearField(4);

  /// The time the operation was created.
  @$pb.TagNumber(5)
  $1.Timestamp get createTime => $_getN(4);
  @$pb.TagNumber(5)
  set createTime($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCreateTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateTime() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureCreateTime() => $_ensure(4);

  /// The time the operation was started.
  @$pb.TagNumber(6)
  $1.Timestamp get startTime => $_getN(5);
  @$pb.TagNumber(6)
  set startTime($1.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasStartTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartTime() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureStartTime() => $_ensure(5);

  /// The time the operation was completed.
  @$pb.TagNumber(7)
  $1.Timestamp get endTime => $_getN(6);
  @$pb.TagNumber(7)
  set endTime($1.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasEndTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndTime() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureEndTime() => $_ensure(6);

  /// If available, the progress of the operation.
  ///
  /// Range: [0, 100]
  @$pb.TagNumber(8)
  $core.int get progress => $_getIZ(7);
  @$pb.TagNumber(8)
  set progress($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasProgress() => $_has(7);
  @$pb.TagNumber(8)
  void clearProgress() => $_clearField(8);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
