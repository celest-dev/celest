//
//  Generated code. Do not modify.
//  source: cedar/v3/policy.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'entity_id.pb.dart' as $48;
import 'expr.pb.dart' as $50;
import 'policy.pbenum.dart';

export 'policy.pbenum.dart';

class PolicySet extends $pb.GeneratedMessage {
  factory PolicySet({
    $core.Iterable<Policy>? policies,
  }) {
    final $result = create();
    if (policies != null) {
      $result.policies.addAll(policies);
    }
    return $result;
  }
  PolicySet._() : super();
  factory PolicySet.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PolicySet.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PolicySet',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..pc<Policy>(1, _omitFieldNames ? '' : 'policies', $pb.PbFieldType.PM,
        subBuilder: Policy.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PolicySet clone() => PolicySet()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PolicySet copyWith(void Function(PolicySet) updates) =>
      super.copyWith((message) => updates(message as PolicySet)) as PolicySet;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PolicySet create() => PolicySet._();
  PolicySet createEmptyInstance() => create();
  static $pb.PbList<PolicySet> createRepeated() => $pb.PbList<PolicySet>();
  @$core.pragma('dart2js:noInline')
  static PolicySet getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PolicySet>(create);
  static PolicySet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Policy> get policies => $_getList(0);
}

class Policy extends $pb.GeneratedMessage {
  factory Policy({
    $core.String? id,
    PolicyEffect? effect,
    PolicyPrincipal? principal,
    PolicyAction? action,
    PolicyResource? resource,
    $core.Iterable<PolicyCondition>? conditions,
    $core.Map<$core.String, $core.String>? annotations,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (effect != null) {
      $result.effect = effect;
    }
    if (principal != null) {
      $result.principal = principal;
    }
    if (action != null) {
      $result.action = action;
    }
    if (resource != null) {
      $result.resource = resource;
    }
    if (conditions != null) {
      $result.conditions.addAll(conditions);
    }
    if (annotations != null) {
      $result.annotations.addAll(annotations);
    }
    return $result;
  }
  Policy._() : super();
  factory Policy.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Policy.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Policy',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..e<PolicyEffect>(2, _omitFieldNames ? '' : 'effect', $pb.PbFieldType.OE,
        defaultOrMaker: PolicyEffect.POLICY_EFFECT_UNSPECIFIED,
        valueOf: PolicyEffect.valueOf,
        enumValues: PolicyEffect.values)
    ..aOM<PolicyPrincipal>(3, _omitFieldNames ? '' : 'principal',
        subBuilder: PolicyPrincipal.create)
    ..aOM<PolicyAction>(4, _omitFieldNames ? '' : 'action',
        subBuilder: PolicyAction.create)
    ..aOM<PolicyResource>(5, _omitFieldNames ? '' : 'resource',
        subBuilder: PolicyResource.create)
    ..pc<PolicyCondition>(
        6, _omitFieldNames ? '' : 'conditions', $pb.PbFieldType.PM,
        subBuilder: PolicyCondition.create)
    ..m<$core.String, $core.String>(7, _omitFieldNames ? '' : 'annotations',
        entryClassName: 'Policy.AnnotationsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('cedar.v3'))
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Policy clone() => Policy()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Policy copyWith(void Function(Policy) updates) =>
      super.copyWith((message) => updates(message as Policy)) as Policy;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Policy create() => Policy._();
  Policy createEmptyInstance() => create();
  static $pb.PbList<Policy> createRepeated() => $pb.PbList<Policy>();
  @$core.pragma('dart2js:noInline')
  static Policy getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Policy>(create);
  static Policy? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  PolicyEffect get effect => $_getN(1);
  @$pb.TagNumber(2)
  set effect(PolicyEffect v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEffect() => $_has(1);
  @$pb.TagNumber(2)
  void clearEffect() => clearField(2);

  @$pb.TagNumber(3)
  PolicyPrincipal get principal => $_getN(2);
  @$pb.TagNumber(3)
  set principal(PolicyPrincipal v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrincipal() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrincipal() => clearField(3);
  @$pb.TagNumber(3)
  PolicyPrincipal ensurePrincipal() => $_ensure(2);

  @$pb.TagNumber(4)
  PolicyAction get action => $_getN(3);
  @$pb.TagNumber(4)
  set action(PolicyAction v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAction() => $_has(3);
  @$pb.TagNumber(4)
  void clearAction() => clearField(4);
  @$pb.TagNumber(4)
  PolicyAction ensureAction() => $_ensure(3);

  @$pb.TagNumber(5)
  PolicyResource get resource => $_getN(4);
  @$pb.TagNumber(5)
  set resource(PolicyResource v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasResource() => $_has(4);
  @$pb.TagNumber(5)
  void clearResource() => clearField(5);
  @$pb.TagNumber(5)
  PolicyResource ensureResource() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<PolicyCondition> get conditions => $_getList(5);

  @$pb.TagNumber(7)
  $core.Map<$core.String, $core.String> get annotations => $_getMap(6);
}

class PolicyPrincipal extends $pb.GeneratedMessage {
  factory PolicyPrincipal({
    PolicyOp? op,
    $48.EntityId? entity,
    $core.String? entityType,
  }) {
    final $result = create();
    if (op != null) {
      $result.op = op;
    }
    if (entity != null) {
      $result.entity = entity;
    }
    if (entityType != null) {
      $result.entityType = entityType;
    }
    return $result;
  }
  PolicyPrincipal._() : super();
  factory PolicyPrincipal.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PolicyPrincipal.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PolicyPrincipal',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..e<PolicyOp>(1, _omitFieldNames ? '' : 'op', $pb.PbFieldType.OE,
        defaultOrMaker: PolicyOp.POLICY_OP_UNSPECIFIED,
        valueOf: PolicyOp.valueOf,
        enumValues: PolicyOp.values)
    ..aOM<$48.EntityId>(2, _omitFieldNames ? '' : 'entity',
        subBuilder: $48.EntityId.create)
    ..aOS(3, _omitFieldNames ? '' : 'entityType')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PolicyPrincipal clone() => PolicyPrincipal()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PolicyPrincipal copyWith(void Function(PolicyPrincipal) updates) =>
      super.copyWith((message) => updates(message as PolicyPrincipal))
          as PolicyPrincipal;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PolicyPrincipal create() => PolicyPrincipal._();
  PolicyPrincipal createEmptyInstance() => create();
  static $pb.PbList<PolicyPrincipal> createRepeated() =>
      $pb.PbList<PolicyPrincipal>();
  @$core.pragma('dart2js:noInline')
  static PolicyPrincipal getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PolicyPrincipal>(create);
  static PolicyPrincipal? _defaultInstance;

  @$pb.TagNumber(1)
  PolicyOp get op => $_getN(0);
  @$pb.TagNumber(1)
  set op(PolicyOp v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOp() => $_has(0);
  @$pb.TagNumber(1)
  void clearOp() => clearField(1);

  @$pb.TagNumber(2)
  $48.EntityId get entity => $_getN(1);
  @$pb.TagNumber(2)
  set entity($48.EntityId v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEntity() => $_has(1);
  @$pb.TagNumber(2)
  void clearEntity() => clearField(2);
  @$pb.TagNumber(2)
  $48.EntityId ensureEntity() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get entityType => $_getSZ(2);
  @$pb.TagNumber(3)
  set entityType($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEntityType() => $_has(2);
  @$pb.TagNumber(3)
  void clearEntityType() => clearField(3);
}

class PolicyAction extends $pb.GeneratedMessage {
  factory PolicyAction({
    PolicyOp? op,
    $48.EntityId? entity,
    $core.Iterable<$48.EntityId>? entities,
  }) {
    final $result = create();
    if (op != null) {
      $result.op = op;
    }
    if (entity != null) {
      $result.entity = entity;
    }
    if (entities != null) {
      $result.entities.addAll(entities);
    }
    return $result;
  }
  PolicyAction._() : super();
  factory PolicyAction.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PolicyAction.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PolicyAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..e<PolicyOp>(1, _omitFieldNames ? '' : 'op', $pb.PbFieldType.OE,
        defaultOrMaker: PolicyOp.POLICY_OP_UNSPECIFIED,
        valueOf: PolicyOp.valueOf,
        enumValues: PolicyOp.values)
    ..aOM<$48.EntityId>(2, _omitFieldNames ? '' : 'entity',
        subBuilder: $48.EntityId.create)
    ..pc<$48.EntityId>(3, _omitFieldNames ? '' : 'entities', $pb.PbFieldType.PM,
        subBuilder: $48.EntityId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PolicyAction clone() => PolicyAction()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PolicyAction copyWith(void Function(PolicyAction) updates) =>
      super.copyWith((message) => updates(message as PolicyAction))
          as PolicyAction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PolicyAction create() => PolicyAction._();
  PolicyAction createEmptyInstance() => create();
  static $pb.PbList<PolicyAction> createRepeated() =>
      $pb.PbList<PolicyAction>();
  @$core.pragma('dart2js:noInline')
  static PolicyAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PolicyAction>(create);
  static PolicyAction? _defaultInstance;

  @$pb.TagNumber(1)
  PolicyOp get op => $_getN(0);
  @$pb.TagNumber(1)
  set op(PolicyOp v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOp() => $_has(0);
  @$pb.TagNumber(1)
  void clearOp() => clearField(1);

  @$pb.TagNumber(2)
  $48.EntityId get entity => $_getN(1);
  @$pb.TagNumber(2)
  set entity($48.EntityId v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEntity() => $_has(1);
  @$pb.TagNumber(2)
  void clearEntity() => clearField(2);
  @$pb.TagNumber(2)
  $48.EntityId ensureEntity() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$48.EntityId> get entities => $_getList(2);
}

class PolicyResource extends $pb.GeneratedMessage {
  factory PolicyResource({
    PolicyOp? op,
    $48.EntityId? entity,
    $core.String? entityType,
  }) {
    final $result = create();
    if (op != null) {
      $result.op = op;
    }
    if (entity != null) {
      $result.entity = entity;
    }
    if (entityType != null) {
      $result.entityType = entityType;
    }
    return $result;
  }
  PolicyResource._() : super();
  factory PolicyResource.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PolicyResource.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PolicyResource',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..e<PolicyOp>(1, _omitFieldNames ? '' : 'op', $pb.PbFieldType.OE,
        defaultOrMaker: PolicyOp.POLICY_OP_UNSPECIFIED,
        valueOf: PolicyOp.valueOf,
        enumValues: PolicyOp.values)
    ..aOM<$48.EntityId>(2, _omitFieldNames ? '' : 'entity',
        subBuilder: $48.EntityId.create)
    ..aOS(3, _omitFieldNames ? '' : 'entityType')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PolicyResource clone() => PolicyResource()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PolicyResource copyWith(void Function(PolicyResource) updates) =>
      super.copyWith((message) => updates(message as PolicyResource))
          as PolicyResource;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PolicyResource create() => PolicyResource._();
  PolicyResource createEmptyInstance() => create();
  static $pb.PbList<PolicyResource> createRepeated() =>
      $pb.PbList<PolicyResource>();
  @$core.pragma('dart2js:noInline')
  static PolicyResource getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PolicyResource>(create);
  static PolicyResource? _defaultInstance;

  @$pb.TagNumber(1)
  PolicyOp get op => $_getN(0);
  @$pb.TagNumber(1)
  set op(PolicyOp v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOp() => $_has(0);
  @$pb.TagNumber(1)
  void clearOp() => clearField(1);

  @$pb.TagNumber(2)
  $48.EntityId get entity => $_getN(1);
  @$pb.TagNumber(2)
  set entity($48.EntityId v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEntity() => $_has(1);
  @$pb.TagNumber(2)
  void clearEntity() => clearField(2);
  @$pb.TagNumber(2)
  $48.EntityId ensureEntity() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get entityType => $_getSZ(2);
  @$pb.TagNumber(3)
  set entityType($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEntityType() => $_has(2);
  @$pb.TagNumber(3)
  void clearEntityType() => clearField(3);
}

class PolicyCondition extends $pb.GeneratedMessage {
  factory PolicyCondition({
    PolicyConditionKind? kind,
    $50.Expr? body,
  }) {
    final $result = create();
    if (kind != null) {
      $result.kind = kind;
    }
    if (body != null) {
      $result.body = body;
    }
    return $result;
  }
  PolicyCondition._() : super();
  factory PolicyCondition.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PolicyCondition.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PolicyCondition',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..e<PolicyConditionKind>(
        1, _omitFieldNames ? '' : 'kind', $pb.PbFieldType.OE,
        defaultOrMaker: PolicyConditionKind.POLICY_CONDITION_KIND_UNSPECIFIED,
        valueOf: PolicyConditionKind.valueOf,
        enumValues: PolicyConditionKind.values)
    ..aOM<$50.Expr>(2, _omitFieldNames ? '' : 'body',
        subBuilder: $50.Expr.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PolicyCondition clone() => PolicyCondition()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PolicyCondition copyWith(void Function(PolicyCondition) updates) =>
      super.copyWith((message) => updates(message as PolicyCondition))
          as PolicyCondition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PolicyCondition create() => PolicyCondition._();
  PolicyCondition createEmptyInstance() => create();
  static $pb.PbList<PolicyCondition> createRepeated() =>
      $pb.PbList<PolicyCondition>();
  @$core.pragma('dart2js:noInline')
  static PolicyCondition getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PolicyCondition>(create);
  static PolicyCondition? _defaultInstance;

  @$pb.TagNumber(1)
  PolicyConditionKind get kind => $_getN(0);
  @$pb.TagNumber(1)
  set kind(PolicyConditionKind v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKind() => $_has(0);
  @$pb.TagNumber(1)
  void clearKind() => clearField(1);

  @$pb.TagNumber(2)
  $50.Expr get body => $_getN(1);
  @$pb.TagNumber(2)
  set body($50.Expr v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearBody() => clearField(2);
  @$pb.TagNumber(2)
  $50.Expr ensureBody() => $_ensure(1);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
