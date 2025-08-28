// This is a generated file - do not edit.
//
// Generated from celest/cloud/v1alpha1/common.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/timestamp.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'common.pbenum.dart';

/// A common message for paginating through large sets of data.
///
/// Page tokens are returned as opaque strings to prevent introspection. AIP
/// allows base64-encoded protobuf messages as acceptable tokens as long as
/// the types are not exposed in the API.
class PageToken extends $pb.GeneratedMessage {
  factory PageToken({
    $fixnum.Int64? offset,
    $0.Timestamp? startTime,
    $core.bool? showDeleted,
  }) {
    final result = create();
    if (offset != null) result.offset = offset;
    if (startTime != null) result.startTime = startTime;
    if (showDeleted != null) result.showDeleted = showDeleted;
    return result;
  }

  PageToken._();

  factory PageToken.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PageToken.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PageToken',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'offset')
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'startTime',
        subBuilder: $0.Timestamp.create)
    ..aOB(3, _omitFieldNames ? '' : 'showDeleted')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PageToken clone() => PageToken()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PageToken copyWith(void Function(PageToken) updates) =>
      super.copyWith((message) => updates(message as PageToken)) as PageToken;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PageToken create() => PageToken._();
  @$core.override
  PageToken createEmptyInstance() => create();
  static $pb.PbList<PageToken> createRepeated() => $pb.PbList<PageToken>();
  @$core.pragma('dart2js:noInline')
  static PageToken getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PageToken>(create);
  static PageToken? _defaultInstance;

  /// The offset of the next page of data.
  @$pb.TagNumber(1)
  $fixnum.Int64 get offset => $_getI64(0);
  @$pb.TagNumber(1)
  set offset($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffset() => $_clearField(1);

  /// The start time of the pagination window.
  @$pb.TagNumber(2)
  $0.Timestamp get startTime => $_getN(1);
  @$pb.TagNumber(2)
  set startTime($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureStartTime() => $_ensure(1);

  /// Whether to show deleted items.
  @$pb.TagNumber(3)
  $core.bool get showDeleted => $_getBF(2);
  @$pb.TagNumber(3)
  set showDeleted($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasShowDeleted() => $_has(2);
  @$pb.TagNumber(3)
  void clearShowDeleted() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
