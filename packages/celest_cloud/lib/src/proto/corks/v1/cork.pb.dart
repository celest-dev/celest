//
//  Generated code. Do not modify.
//  source: corks/v1/cork.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/any.pb.dart' as $10;

///  Encodes a cork's metadata and its signature.
///
///  A cork can be further restricted by its bearer by appending additional
///  caveats and creating a new signature.
///
///  All existing caveats and other values are not open for extension or
///  modification once signed.
class Cork extends $pb.GeneratedMessage {
  factory Cork({
    $core.List<$core.int>? id,
    $10.Any? issuer,
    $10.Any? bearer,
    $10.Any? audience,
    $10.Any? claims,
    $core.Iterable<$10.Any>? caveats,
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (issuer != null) {
      $result.issuer = issuer;
    }
    if (bearer != null) {
      $result.bearer = bearer;
    }
    if (audience != null) {
      $result.audience = audience;
    }
    if (claims != null) {
      $result.claims = claims;
    }
    if (caveats != null) {
      $result.caveats.addAll(caveats);
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  Cork._() : super();
  factory Cork.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Cork.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Cork',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'corks.v1'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..aOM<$10.Any>(2, _omitFieldNames ? '' : 'issuer',
        subBuilder: $10.Any.create)
    ..aOM<$10.Any>(3, _omitFieldNames ? '' : 'bearer',
        subBuilder: $10.Any.create)
    ..aOM<$10.Any>(4, _omitFieldNames ? '' : 'audience',
        subBuilder: $10.Any.create)
    ..aOM<$10.Any>(5, _omitFieldNames ? '' : 'claims',
        subBuilder: $10.Any.create)
    ..pc<$10.Any>(6, _omitFieldNames ? '' : 'caveats', $pb.PbFieldType.PM,
        subBuilder: $10.Any.create)
    ..a<$core.List<$core.int>>(
        999, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Cork clone() => Cork()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Cork copyWith(void Function(Cork) updates) =>
      super.copyWith((message) => updates(message as Cork)) as Cork;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Cork create() => Cork._();
  Cork createEmptyInstance() => create();
  static $pb.PbList<Cork> createRepeated() => $pb.PbList<Cork>();
  @$core.pragma('dart2js:noInline')
  static Cork getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Cork>(create);
  static Cork? _defaultInstance;

  /// The unique identifier of the cork and its root key.
  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// The encoded issuer of the cork.
  @$pb.TagNumber(2)
  $10.Any get issuer => $_getN(1);
  @$pb.TagNumber(2)
  set issuer($10.Any v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIssuer() => $_has(1);
  @$pb.TagNumber(2)
  void clearIssuer() => clearField(2);
  @$pb.TagNumber(2)
  $10.Any ensureIssuer() => $_ensure(1);

  /// The encoded bearer of the cork.
  @$pb.TagNumber(3)
  $10.Any get bearer => $_getN(2);
  @$pb.TagNumber(3)
  set bearer($10.Any v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBearer() => $_has(2);
  @$pb.TagNumber(3)
  void clearBearer() => clearField(3);
  @$pb.TagNumber(3)
  $10.Any ensureBearer() => $_ensure(2);

  /// The encoded audience of the cork.
  @$pb.TagNumber(4)
  $10.Any get audience => $_getN(3);
  @$pb.TagNumber(4)
  set audience($10.Any v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAudience() => $_has(3);
  @$pb.TagNumber(4)
  void clearAudience() => clearField(4);
  @$pb.TagNumber(4)
  $10.Any ensureAudience() => $_ensure(3);

  /// The encoded claims of the cork.
  @$pb.TagNumber(5)
  $10.Any get claims => $_getN(4);
  @$pb.TagNumber(5)
  set claims($10.Any v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasClaims() => $_has(4);
  @$pb.TagNumber(5)
  void clearClaims() => clearField(5);
  @$pb.TagNumber(5)
  $10.Any ensureClaims() => $_ensure(4);

  /// The encoded caveats of the cork.
  @$pb.TagNumber(6)
  $core.List<$10.Any> get caveats => $_getList(5);

  /// The final signature of the cork.
  @$pb.TagNumber(999)
  $core.List<$core.int> get signature => $_getN(6);
  @$pb.TagNumber(999)
  set signature($core.List<$core.int> v) {
    $_setBytes(6, v);
  }

  @$pb.TagNumber(999)
  $core.bool hasSignature() => $_has(6);
  @$pb.TagNumber(999)
  void clearSignature() => clearField(999);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
