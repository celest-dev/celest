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

import '../../../google/protobuf/any.pb.dart' as $13;
import '../../../google/protobuf/timestamp.pb.dart' as $20;
import 'operations.pbenum.dart';

export 'operations.pbenum.dart';

/// Metadata for long-running operations in Celest Cloud.
class OperationMetadata extends $pb.GeneratedMessage {
  factory OperationMetadata({
    $core.String? parent,
    $13.Any? resource,
    OperationState? state,
    $core.String? requestId,
    $20.Timestamp? createTime,
    $20.Timestamp? startTime,
    $20.Timestamp? endTime,
    $core.int? progress,
  }) {
    final $result = create();
    if (parent != null) {
      $result.parent = parent;
    }
    if (resource != null) {
      $result.resource = resource;
    }
    if (state != null) {
      $result.state = state;
    }
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (createTime != null) {
      $result.createTime = createTime;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (progress != null) {
      $result.progress = progress;
    }
    return $result;
  }
  OperationMetadata._() : super();
  factory OperationMetadata.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OperationMetadata.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OperationMetadata',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..aOM<$13.Any>(2, _omitFieldNames ? '' : 'resource',
        subBuilder: $13.Any.create)
    ..e<OperationState>(3, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE,
        defaultOrMaker: OperationState.OPERATION_STATE_UNSPECIFIED,
        valueOf: OperationState.valueOf,
        enumValues: OperationState.values)
    ..aOS(4, _omitFieldNames ? '' : 'requestId')
    ..aOM<$20.Timestamp>(5, _omitFieldNames ? '' : 'createTime',
        subBuilder: $20.Timestamp.create)
    ..aOM<$20.Timestamp>(6, _omitFieldNames ? '' : 'startTime',
        subBuilder: $20.Timestamp.create)
    ..aOM<$20.Timestamp>(7, _omitFieldNames ? '' : 'endTime',
        subBuilder: $20.Timestamp.create)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'progress', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OperationMetadata clone() => OperationMetadata()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OperationMetadata copyWith(void Function(OperationMetadata) updates) =>
      super.copyWith((message) => updates(message as OperationMetadata))
          as OperationMetadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperationMetadata create() => OperationMetadata._();
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
  set parent($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => clearField(1);

  ///  The resource being operated on.
  ///
  ///  (-- api-linter: core::0146::any=disabled --)
  @$pb.TagNumber(2)
  $13.Any get resource => $_getN(1);
  @$pb.TagNumber(2)
  set resource($13.Any v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasResource() => $_has(1);
  @$pb.TagNumber(2)
  void clearResource() => clearField(2);
  @$pb.TagNumber(2)
  $13.Any ensureResource() => $_ensure(1);

  /// The state of the operation.
  @$pb.TagNumber(3)
  OperationState get state => $_getN(2);
  @$pb.TagNumber(3)
  set state(OperationState v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);

  /// The request ID used for the triggering request.
  @$pb.TagNumber(4)
  $core.String get requestId => $_getSZ(3);
  @$pb.TagNumber(4)
  set requestId($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRequestId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRequestId() => clearField(4);

  /// The time the operation was created.
  @$pb.TagNumber(5)
  $20.Timestamp get createTime => $_getN(4);
  @$pb.TagNumber(5)
  set createTime($20.Timestamp v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCreateTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateTime() => clearField(5);
  @$pb.TagNumber(5)
  $20.Timestamp ensureCreateTime() => $_ensure(4);

  /// The time the operation was started.
  @$pb.TagNumber(6)
  $20.Timestamp get startTime => $_getN(5);
  @$pb.TagNumber(6)
  set startTime($20.Timestamp v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasStartTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartTime() => clearField(6);
  @$pb.TagNumber(6)
  $20.Timestamp ensureStartTime() => $_ensure(5);

  /// The time the operation was completed.
  @$pb.TagNumber(7)
  $20.Timestamp get endTime => $_getN(6);
  @$pb.TagNumber(7)
  set endTime($20.Timestamp v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasEndTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndTime() => clearField(7);
  @$pb.TagNumber(7)
  $20.Timestamp ensureEndTime() => $_ensure(6);

  ///  If available, the progress of the operation.
  ///
  ///  Range: [0, 100]
  @$pb.TagNumber(8)
  $core.int get progress => $_getIZ(7);
  @$pb.TagNumber(8)
  set progress($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasProgress() => $_has(7);
  @$pb.TagNumber(8)
  void clearProgress() => clearField(8);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
