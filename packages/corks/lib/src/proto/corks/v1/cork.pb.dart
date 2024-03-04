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

import '../../cedar/v3/entity.pb.dart' as $4;
import '../../cedar/v3/policy.pb.dart' as $5;

class Cork extends $pb.GeneratedMessage {
  factory Cork({
    $core.List<$core.int>? id,
    $core.List<$core.int>? keyId,
    Bearer? bearer,
    $core.Iterable<Caveat>? caveats,
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (keyId != null) {
      $result.keyId = keyId;
    }
    if (bearer != null) {
      $result.bearer = bearer;
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
  factory Cork.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Cork.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Cork', package: const $pb.PackageName(_omitMessageNames ? '' : 'corks.v1'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'keyId', $pb.PbFieldType.OY)
    ..aOM<Bearer>(3, _omitFieldNames ? '' : 'bearer', subBuilder: Bearer.create)
    ..pc<Caveat>(4, _omitFieldNames ? '' : 'caveats', $pb.PbFieldType.PM, subBuilder: Caveat.create)
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Cork clone() => Cork()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Cork copyWith(void Function(Cork) updates) => super.copyWith((message) => updates(message as Cork)) as Cork;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Cork create() => Cork._();
  Cork createEmptyInstance() => create();
  static $pb.PbList<Cork> createRepeated() => $pb.PbList<Cork>();
  @$core.pragma('dart2js:noInline')
  static Cork getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Cork>(create);
  static Cork? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get keyId => $_getN(1);
  @$pb.TagNumber(2)
  set keyId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKeyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeyId() => clearField(2);

  @$pb.TagNumber(3)
  Bearer get bearer => $_getN(2);
  @$pb.TagNumber(3)
  set bearer(Bearer v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBearer() => $_has(2);
  @$pb.TagNumber(3)
  void clearBearer() => clearField(3);
  @$pb.TagNumber(3)
  Bearer ensureBearer() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<Caveat> get caveats => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.int> get signature => $_getN(4);
  @$pb.TagNumber(5)
  set signature($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSignature() => $_has(4);
  @$pb.TagNumber(5)
  void clearSignature() => clearField(5);
}

enum Bearer_Bearer {
  entity, 
  notSet
}

class Bearer extends $pb.GeneratedMessage {
  factory Bearer({
    $core.List<$core.int>? signature,
    $4.Entity? entity,
  }) {
    final $result = create();
    if (signature != null) {
      $result.signature = signature;
    }
    if (entity != null) {
      $result.entity = entity;
    }
    return $result;
  }
  Bearer._() : super();
  factory Bearer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Bearer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Bearer_Bearer> _Bearer_BearerByTag = {
    2 : Bearer_Bearer.entity,
    0 : Bearer_Bearer.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Bearer', package: const $pb.PackageName(_omitMessageNames ? '' : 'corks.v1'), createEmptyInstance: create)
    ..oo(0, [2])
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..aOM<$4.Entity>(2, _omitFieldNames ? '' : 'entity', subBuilder: $4.Entity.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Bearer clone() => Bearer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Bearer copyWith(void Function(Bearer) updates) => super.copyWith((message) => updates(message as Bearer)) as Bearer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Bearer create() => Bearer._();
  Bearer createEmptyInstance() => create();
  static $pb.PbList<Bearer> createRepeated() => $pb.PbList<Bearer>();
  @$core.pragma('dart2js:noInline')
  static Bearer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Bearer>(create);
  static Bearer? _defaultInstance;

  Bearer_Bearer whichBearer() => _Bearer_BearerByTag[$_whichOneof(0)]!;
  void clearBearer() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.List<$core.int> get signature => $_getN(0);
  @$pb.TagNumber(1)
  set signature($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => clearField(1);

  @$pb.TagNumber(2)
  $4.Entity get entity => $_getN(1);
  @$pb.TagNumber(2)
  set entity($4.Entity v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEntity() => $_has(1);
  @$pb.TagNumber(2)
  void clearEntity() => clearField(2);
  @$pb.TagNumber(2)
  $4.Entity ensureEntity() => $_ensure(1);
}

enum Caveat_Block {
  policy, 
  notSet
}

class Caveat extends $pb.GeneratedMessage {
  factory Caveat({
    $core.List<$core.int>? signature,
    $5.Policy? policy,
  }) {
    final $result = create();
    if (signature != null) {
      $result.signature = signature;
    }
    if (policy != null) {
      $result.policy = policy;
    }
    return $result;
  }
  Caveat._() : super();
  factory Caveat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Caveat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Caveat_Block> _Caveat_BlockByTag = {
    2 : Caveat_Block.policy,
    0 : Caveat_Block.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Caveat', package: const $pb.PackageName(_omitMessageNames ? '' : 'corks.v1'), createEmptyInstance: create)
    ..oo(0, [2])
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..aOM<$5.Policy>(2, _omitFieldNames ? '' : 'policy', subBuilder: $5.Policy.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Caveat clone() => Caveat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Caveat copyWith(void Function(Caveat) updates) => super.copyWith((message) => updates(message as Caveat)) as Caveat;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Caveat create() => Caveat._();
  Caveat createEmptyInstance() => create();
  static $pb.PbList<Caveat> createRepeated() => $pb.PbList<Caveat>();
  @$core.pragma('dart2js:noInline')
  static Caveat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Caveat>(create);
  static Caveat? _defaultInstance;

  Caveat_Block whichBlock() => _Caveat_BlockByTag[$_whichOneof(0)]!;
  void clearBlock() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.List<$core.int> get signature => $_getN(0);
  @$pb.TagNumber(1)
  set signature($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => clearField(1);

  @$pb.TagNumber(2)
  $5.Policy get policy => $_getN(1);
  @$pb.TagNumber(2)
  set policy($5.Policy v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPolicy() => $_has(1);
  @$pb.TagNumber(2)
  void clearPolicy() => clearField(2);
  @$pb.TagNumber(2)
  $5.Policy ensurePolicy() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
