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

class Cork extends $pb.GeneratedMessage {
  factory Cork({
    $core.List<$core.int>? id,
    $core.List<$core.int>? keyId,
    SignedBlock? bearer,
    $core.Iterable<SignedBlock>? caveats,
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
    ..aOM<SignedBlock>(3, _omitFieldNames ? '' : 'bearer', subBuilder: SignedBlock.create)
    ..pc<SignedBlock>(4, _omitFieldNames ? '' : 'caveats', $pb.PbFieldType.PM, subBuilder: SignedBlock.create)
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
  SignedBlock get bearer => $_getN(2);
  @$pb.TagNumber(3)
  set bearer(SignedBlock v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBearer() => $_has(2);
  @$pb.TagNumber(3)
  void clearBearer() => clearField(3);
  @$pb.TagNumber(3)
  SignedBlock ensureBearer() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<SignedBlock> get caveats => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.int> get signature => $_getN(4);
  @$pb.TagNumber(5)
  set signature($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSignature() => $_has(4);
  @$pb.TagNumber(5)
  void clearSignature() => clearField(5);
}

class SignedBlock extends $pb.GeneratedMessage {
  factory SignedBlock({
    $core.List<$core.int>? block,
    $core.List<$core.int>? typeUrl,
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (block != null) {
      $result.block = block;
    }
    if (typeUrl != null) {
      $result.typeUrl = typeUrl;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  SignedBlock._() : super();
  factory SignedBlock.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignedBlock.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignedBlock', package: const $pb.PackageName(_omitMessageNames ? '' : 'corks.v1'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'block', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'typeUrl', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignedBlock clone() => SignedBlock()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignedBlock copyWith(void Function(SignedBlock) updates) => super.copyWith((message) => updates(message as SignedBlock)) as SignedBlock;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignedBlock create() => SignedBlock._();
  SignedBlock createEmptyInstance() => create();
  static $pb.PbList<SignedBlock> createRepeated() => $pb.PbList<SignedBlock>();
  @$core.pragma('dart2js:noInline')
  static SignedBlock getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignedBlock>(create);
  static SignedBlock? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get block => $_getN(0);
  @$pb.TagNumber(1)
  set block($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlock() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlock() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get typeUrl => $_getN(1);
  @$pb.TagNumber(2)
  set typeUrl($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTypeUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearTypeUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get signature => $_getN(2);
  @$pb.TagNumber(3)
  set signature($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignature() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
