//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/common.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/timestamp.pb.dart' as $17;

///  A common message for paginating through large sets of data.
///
///  Page tokens are returned as opaque strings to prevent introspection. AIP
///  allows base64-encoded protobuf messages as acceptable tokens as long as
///  the types are not exposed in the API.
class PageToken extends $pb.GeneratedMessage {
  factory PageToken({
    $fixnum.Int64? offset,
    $17.Timestamp? startTime,
    $core.bool? showDeleted,
  }) {
    final $result = create();
    if (offset != null) {
      $result.offset = offset;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (showDeleted != null) {
      $result.showDeleted = showDeleted;
    }
    return $result;
  }
  PageToken._() : super();
  factory PageToken.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PageToken.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PageToken',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.v1alpha1'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'offset')
    ..aOM<$17.Timestamp>(2, _omitFieldNames ? '' : 'startTime',
        subBuilder: $17.Timestamp.create)
    ..aOB(3, _omitFieldNames ? '' : 'showDeleted')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PageToken clone() => PageToken()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PageToken copyWith(void Function(PageToken) updates) =>
      super.copyWith((message) => updates(message as PageToken)) as PageToken;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PageToken create() => PageToken._();
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
  set offset($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffset() => clearField(1);

  /// The start time of the pagination window.
  @$pb.TagNumber(2)
  $17.Timestamp get startTime => $_getN(1);
  @$pb.TagNumber(2)
  set startTime($17.Timestamp v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => clearField(2);
  @$pb.TagNumber(2)
  $17.Timestamp ensureStartTime() => $_ensure(1);

  /// Whether to show deleted items.
  @$pb.TagNumber(3)
  $core.bool get showDeleted => $_getBF(2);
  @$pb.TagNumber(3)
  set showDeleted($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShowDeleted() => $_has(2);
  @$pb.TagNumber(3)
  void clearShowDeleted() => clearField(3);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
