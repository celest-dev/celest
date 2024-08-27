//
//  Generated code. Do not modify.
//  source: cedar/v3/cork.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'entity.pb.dart' as $51;
import 'entity_id.pb.dart' as $48;
import 'expr.pb.dart' as $50;

/// A bearer token that can be used to make claims about an entity for the purpose
/// of authorization and authentication w/ Cedar.
class Cork extends $pb.GeneratedMessage {
  factory Cork({
    $core.List<$core.int>? id,
    $48.EntityId? issuer,
    $48.EntityId? bearer,
    $48.EntityId? audience,
    $51.Entity? claims,
    $core.Iterable<$50.Expr>? caveats,
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..aOM<$48.EntityId>(2, _omitFieldNames ? '' : 'issuer',
        subBuilder: $48.EntityId.create)
    ..aOM<$48.EntityId>(3, _omitFieldNames ? '' : 'bearer',
        subBuilder: $48.EntityId.create)
    ..aOM<$48.EntityId>(4, _omitFieldNames ? '' : 'audience',
        subBuilder: $48.EntityId.create)
    ..aOM<$51.Entity>(5, _omitFieldNames ? '' : 'claims',
        subBuilder: $51.Entity.create)
    ..pc<$50.Expr>(6, _omitFieldNames ? '' : 'caveats', $pb.PbFieldType.PM,
        subBuilder: $50.Expr.create)
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

  /// The unique identifier of the cork.
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

  /// The issuing authority of the cork.
  @$pb.TagNumber(2)
  $48.EntityId get issuer => $_getN(1);
  @$pb.TagNumber(2)
  set issuer($48.EntityId v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIssuer() => $_has(1);
  @$pb.TagNumber(2)
  void clearIssuer() => clearField(2);
  @$pb.TagNumber(2)
  $48.EntityId ensureIssuer() => $_ensure(1);

  /// The bearer of the cork, about which [claims] can be made.
  @$pb.TagNumber(3)
  $48.EntityId get bearer => $_getN(2);
  @$pb.TagNumber(3)
  set bearer($48.EntityId v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBearer() => $_has(2);
  @$pb.TagNumber(3)
  void clearBearer() => clearField(3);
  @$pb.TagNumber(3)
  $48.EntityId ensureBearer() => $_ensure(2);

  /// The intended audience of the cork.
  @$pb.TagNumber(4)
  $48.EntityId get audience => $_getN(3);
  @$pb.TagNumber(4)
  set audience($48.EntityId v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAudience() => $_has(3);
  @$pb.TagNumber(4)
  void clearAudience() => clearField(4);
  @$pb.TagNumber(4)
  $48.EntityId ensureAudience() => $_ensure(3);

  /// Claims made about the [bearer] of the cork.
  @$pb.TagNumber(5)
  $51.Entity get claims => $_getN(4);
  @$pb.TagNumber(5)
  set claims($51.Entity v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasClaims() => $_has(4);
  @$pb.TagNumber(5)
  void clearClaims() => clearField(5);
  @$pb.TagNumber(5)
  $51.Entity ensureClaims() => $_ensure(4);

  ///  The caveats to this cork's validity and usage.
  ///
  ///  Caveats are structured conditions which must be met for the cork to be considered
  ///  valid and for its claims to be considered true.
  ///
  ///  Effectively, these form the body of a `forbid unless` policy AND'd together.
  @$pb.TagNumber(6)
  $core.List<$50.Expr> get caveats => $_getList(5);

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
