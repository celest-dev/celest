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

import 'entity_uid.pb.dart' as $1;
import 'expr.pb.dart' as $4;
import 'expr.pbenum.dart' as $4;
import 'policy.pbenum.dart';

export 'policy.pbenum.dart';

class PolicySet extends $pb.GeneratedMessage {
  factory PolicySet({
    $core.Map<$core.String, Policy>? policies,
    $core.Map<$core.String, Policy>? templates,
    $core.Iterable<TemplateLink>? templateLinks,
  }) {
    final $result = create();
    if (policies != null) {
      $result.policies.addAll(policies);
    }
    if (templates != null) {
      $result.templates.addAll(templates);
    }
    if (templateLinks != null) {
      $result.templateLinks.addAll(templateLinks);
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
    ..m<$core.String, Policy>(1, _omitFieldNames ? '' : 'policies',
        entryClassName: 'PolicySet.PoliciesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: Policy.create,
        valueDefaultOrMaker: Policy.getDefault,
        packageName: const $pb.PackageName('cedar.v3'))
    ..m<$core.String, Policy>(2, _omitFieldNames ? '' : 'templates',
        entryClassName: 'PolicySet.TemplatesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: Policy.create,
        valueDefaultOrMaker: Policy.getDefault,
        packageName: const $pb.PackageName('cedar.v3'))
    ..pc<TemplateLink>(
        3, _omitFieldNames ? '' : 'templateLinks', $pb.PbFieldType.PM,
        subBuilder: TemplateLink.create)
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
  $core.Map<$core.String, Policy> get policies => $_getMap(0);

  @$pb.TagNumber(2)
  $core.Map<$core.String, Policy> get templates => $_getMap(1);

  @$pb.TagNumber(3)
  $core.List<TemplateLink> get templateLinks => $_getList(2);
}

class Policy extends $pb.GeneratedMessage {
  factory Policy({
    $core.String? id,
    Effect? effect,
    PrincipalConstraint? principal,
    ActionConstraint? action,
    ResourceConstraint? resource,
    $core.Iterable<Condition>? conditions,
    Annotations? annotations,
    Position? position,
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
      $result.annotations = annotations;
    }
    if (position != null) {
      $result.position = position;
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
    ..e<Effect>(2, _omitFieldNames ? '' : 'effect', $pb.PbFieldType.OE,
        defaultOrMaker: Effect.EFFECT_UNSPECIFIED,
        valueOf: Effect.valueOf,
        enumValues: Effect.values)
    ..aOM<PrincipalConstraint>(3, _omitFieldNames ? '' : 'principal',
        subBuilder: PrincipalConstraint.create)
    ..aOM<ActionConstraint>(4, _omitFieldNames ? '' : 'action',
        subBuilder: ActionConstraint.create)
    ..aOM<ResourceConstraint>(5, _omitFieldNames ? '' : 'resource',
        subBuilder: ResourceConstraint.create)
    ..pc<Condition>(6, _omitFieldNames ? '' : 'conditions', $pb.PbFieldType.PM,
        subBuilder: Condition.create)
    ..aOM<Annotations>(7, _omitFieldNames ? '' : 'annotations',
        subBuilder: Annotations.create)
    ..aOM<Position>(8, _omitFieldNames ? '' : 'position',
        subBuilder: Position.create)
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
  Effect get effect => $_getN(1);
  @$pb.TagNumber(2)
  set effect(Effect v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEffect() => $_has(1);
  @$pb.TagNumber(2)
  void clearEffect() => clearField(2);

  @$pb.TagNumber(3)
  PrincipalConstraint get principal => $_getN(2);
  @$pb.TagNumber(3)
  set principal(PrincipalConstraint v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrincipal() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrincipal() => clearField(3);
  @$pb.TagNumber(3)
  PrincipalConstraint ensurePrincipal() => $_ensure(2);

  @$pb.TagNumber(4)
  ActionConstraint get action => $_getN(3);
  @$pb.TagNumber(4)
  set action(ActionConstraint v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAction() => $_has(3);
  @$pb.TagNumber(4)
  void clearAction() => clearField(4);
  @$pb.TagNumber(4)
  ActionConstraint ensureAction() => $_ensure(3);

  @$pb.TagNumber(5)
  ResourceConstraint get resource => $_getN(4);
  @$pb.TagNumber(5)
  set resource(ResourceConstraint v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasResource() => $_has(4);
  @$pb.TagNumber(5)
  void clearResource() => clearField(5);
  @$pb.TagNumber(5)
  ResourceConstraint ensureResource() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<Condition> get conditions => $_getList(5);

  @$pb.TagNumber(7)
  Annotations get annotations => $_getN(6);
  @$pb.TagNumber(7)
  set annotations(Annotations v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAnnotations() => $_has(6);
  @$pb.TagNumber(7)
  void clearAnnotations() => clearField(7);
  @$pb.TagNumber(7)
  Annotations ensureAnnotations() => $_ensure(6);

  @$pb.TagNumber(8)
  Position get position => $_getN(7);
  @$pb.TagNumber(8)
  set position(Position v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPosition() => $_has(7);
  @$pb.TagNumber(8)
  void clearPosition() => clearField(8);
  @$pb.TagNumber(8)
  Position ensurePosition() => $_ensure(7);
}

class Annotations extends $pb.GeneratedMessage {
  factory Annotations({
    $core.Map<$core.String, $core.String>? annotations,
  }) {
    final $result = create();
    if (annotations != null) {
      $result.annotations.addAll(annotations);
    }
    return $result;
  }
  Annotations._() : super();
  factory Annotations.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Annotations.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Annotations',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'annotations',
        entryClassName: 'Annotations.AnnotationsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('cedar.v3'))
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Annotations clone() => Annotations()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Annotations copyWith(void Function(Annotations) updates) =>
      super.copyWith((message) => updates(message as Annotations))
          as Annotations;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Annotations create() => Annotations._();
  Annotations createEmptyInstance() => create();
  static $pb.PbList<Annotations> createRepeated() => $pb.PbList<Annotations>();
  @$core.pragma('dart2js:noInline')
  static Annotations getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Annotations>(create);
  static Annotations? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, $core.String> get annotations => $_getMap(0);
}

class Position extends $pb.GeneratedMessage {
  factory Position({
    $core.String? filename,
    $core.int? offset,
    $core.int? line,
    $core.int? column,
  }) {
    final $result = create();
    if (filename != null) {
      $result.filename = filename;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    if (line != null) {
      $result.line = line;
    }
    if (column != null) {
      $result.column = column;
    }
    return $result;
  }
  Position._() : super();
  factory Position.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Position.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Position',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'filename')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'line', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'column', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Position clone() => Position()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Position copyWith(void Function(Position) updates) =>
      super.copyWith((message) => updates(message as Position)) as Position;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Position create() => Position._();
  Position createEmptyInstance() => create();
  static $pb.PbList<Position> createRepeated() => $pb.PbList<Position>();
  @$core.pragma('dart2js:noInline')
  static Position getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Position>(create);
  static Position? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filename => $_getSZ(0);
  @$pb.TagNumber(1)
  set filename($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFilename() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilename() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get offset => $_getIZ(1);
  @$pb.TagNumber(2)
  set offset($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get line => $_getIZ(2);
  @$pb.TagNumber(3)
  set line($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLine() => $_has(2);
  @$pb.TagNumber(3)
  void clearLine() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get column => $_getIZ(3);
  @$pb.TagNumber(4)
  set column($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasColumn() => $_has(3);
  @$pb.TagNumber(4)
  void clearColumn() => clearField(4);
}

enum PrincipalConstraint_Constraint { all, equals, in_, isIn, is_5, notSet }

class PrincipalConstraint extends $pb.GeneratedMessage {
  factory PrincipalConstraint({
    PrincipalAll? all,
    PrincipalEquals? equals,
    PrincipalIn? in_,
    PrincipalIsIn? isIn,
    PrincipalIs? is_5,
  }) {
    final $result = create();
    if (all != null) {
      $result.all = all;
    }
    if (equals != null) {
      $result.equals = equals;
    }
    if (in_ != null) {
      $result.in_ = in_;
    }
    if (isIn != null) {
      $result.isIn = isIn;
    }
    if (is_5 != null) {
      $result.is_5 = is_5;
    }
    return $result;
  }
  PrincipalConstraint._() : super();
  factory PrincipalConstraint.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrincipalConstraint.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, PrincipalConstraint_Constraint>
      _PrincipalConstraint_ConstraintByTag = {
    1: PrincipalConstraint_Constraint.all,
    2: PrincipalConstraint_Constraint.equals,
    3: PrincipalConstraint_Constraint.in_,
    4: PrincipalConstraint_Constraint.isIn,
    5: PrincipalConstraint_Constraint.is_5,
    0: PrincipalConstraint_Constraint.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrincipalConstraint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<PrincipalAll>(1, _omitFieldNames ? '' : 'all',
        subBuilder: PrincipalAll.create)
    ..aOM<PrincipalEquals>(2, _omitFieldNames ? '' : 'equals',
        subBuilder: PrincipalEquals.create)
    ..aOM<PrincipalIn>(3, _omitFieldNames ? '' : 'in',
        subBuilder: PrincipalIn.create)
    ..aOM<PrincipalIsIn>(4, _omitFieldNames ? '' : 'isIn',
        subBuilder: PrincipalIsIn.create)
    ..aOM<PrincipalIs>(5, _omitFieldNames ? '' : 'is',
        subBuilder: PrincipalIs.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrincipalConstraint clone() => PrincipalConstraint()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrincipalConstraint copyWith(void Function(PrincipalConstraint) updates) =>
      super.copyWith((message) => updates(message as PrincipalConstraint))
          as PrincipalConstraint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrincipalConstraint create() => PrincipalConstraint._();
  PrincipalConstraint createEmptyInstance() => create();
  static $pb.PbList<PrincipalConstraint> createRepeated() =>
      $pb.PbList<PrincipalConstraint>();
  @$core.pragma('dart2js:noInline')
  static PrincipalConstraint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrincipalConstraint>(create);
  static PrincipalConstraint? _defaultInstance;

  PrincipalConstraint_Constraint whichConstraint() =>
      _PrincipalConstraint_ConstraintByTag[$_whichOneof(0)]!;
  void clearConstraint() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  PrincipalAll get all => $_getN(0);
  @$pb.TagNumber(1)
  set all(PrincipalAll v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAll() => $_has(0);
  @$pb.TagNumber(1)
  void clearAll() => clearField(1);
  @$pb.TagNumber(1)
  PrincipalAll ensureAll() => $_ensure(0);

  @$pb.TagNumber(2)
  PrincipalEquals get equals => $_getN(1);
  @$pb.TagNumber(2)
  set equals(PrincipalEquals v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEquals() => $_has(1);
  @$pb.TagNumber(2)
  void clearEquals() => clearField(2);
  @$pb.TagNumber(2)
  PrincipalEquals ensureEquals() => $_ensure(1);

  @$pb.TagNumber(3)
  PrincipalIn get in_ => $_getN(2);
  @$pb.TagNumber(3)
  set in_(PrincipalIn v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIn_() => $_has(2);
  @$pb.TagNumber(3)
  void clearIn_() => clearField(3);
  @$pb.TagNumber(3)
  PrincipalIn ensureIn_() => $_ensure(2);

  @$pb.TagNumber(4)
  PrincipalIsIn get isIn => $_getN(3);
  @$pb.TagNumber(4)
  set isIn(PrincipalIsIn v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsIn() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsIn() => clearField(4);
  @$pb.TagNumber(4)
  PrincipalIsIn ensureIsIn() => $_ensure(3);

  @$pb.TagNumber(5)
  PrincipalIs get is_5 => $_getN(4);
  @$pb.TagNumber(5)
  set is_5(PrincipalIs v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIs_5() => $_has(4);
  @$pb.TagNumber(5)
  void clearIs_5() => clearField(5);
  @$pb.TagNumber(5)
  PrincipalIs ensureIs_5() => $_ensure(4);
}

class PrincipalAll extends $pb.GeneratedMessage {
  factory PrincipalAll() => create();
  PrincipalAll._() : super();
  factory PrincipalAll.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrincipalAll.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrincipalAll',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrincipalAll clone() => PrincipalAll()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrincipalAll copyWith(void Function(PrincipalAll) updates) =>
      super.copyWith((message) => updates(message as PrincipalAll))
          as PrincipalAll;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrincipalAll create() => PrincipalAll._();
  PrincipalAll createEmptyInstance() => create();
  static $pb.PbList<PrincipalAll> createRepeated() =>
      $pb.PbList<PrincipalAll>();
  @$core.pragma('dart2js:noInline')
  static PrincipalAll getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrincipalAll>(create);
  static PrincipalAll? _defaultInstance;
}

enum PrincipalEquals_Component { slot, entity, notSet }

class PrincipalEquals extends $pb.GeneratedMessage {
  factory PrincipalEquals({
    $4.SlotId? slot,
    $1.EntityUid? entity,
  }) {
    final $result = create();
    if (slot != null) {
      $result.slot = slot;
    }
    if (entity != null) {
      $result.entity = entity;
    }
    return $result;
  }
  PrincipalEquals._() : super();
  factory PrincipalEquals.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrincipalEquals.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, PrincipalEquals_Component>
      _PrincipalEquals_ComponentByTag = {
    1: PrincipalEquals_Component.slot,
    2: PrincipalEquals_Component.entity,
    0: PrincipalEquals_Component.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrincipalEquals',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<$4.SlotId>(1, _omitFieldNames ? '' : 'slot', $pb.PbFieldType.OE,
        defaultOrMaker: $4.SlotId.SLOT_ID_UNSPECIFIED,
        valueOf: $4.SlotId.valueOf,
        enumValues: $4.SlotId.values)
    ..aOM<$1.EntityUid>(2, _omitFieldNames ? '' : 'entity',
        subBuilder: $1.EntityUid.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrincipalEquals clone() => PrincipalEquals()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrincipalEquals copyWith(void Function(PrincipalEquals) updates) =>
      super.copyWith((message) => updates(message as PrincipalEquals))
          as PrincipalEquals;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrincipalEquals create() => PrincipalEquals._();
  PrincipalEquals createEmptyInstance() => create();
  static $pb.PbList<PrincipalEquals> createRepeated() =>
      $pb.PbList<PrincipalEquals>();
  @$core.pragma('dart2js:noInline')
  static PrincipalEquals getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrincipalEquals>(create);
  static PrincipalEquals? _defaultInstance;

  PrincipalEquals_Component whichComponent() =>
      _PrincipalEquals_ComponentByTag[$_whichOneof(0)]!;
  void clearComponent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $4.SlotId get slot => $_getN(0);
  @$pb.TagNumber(1)
  set slot($4.SlotId v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSlot() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlot() => clearField(1);

  @$pb.TagNumber(2)
  $1.EntityUid get entity => $_getN(1);
  @$pb.TagNumber(2)
  set entity($1.EntityUid v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEntity() => $_has(1);
  @$pb.TagNumber(2)
  void clearEntity() => clearField(2);
  @$pb.TagNumber(2)
  $1.EntityUid ensureEntity() => $_ensure(1);
}

enum PrincipalIn_Component { slot, entity, notSet }

class PrincipalIn extends $pb.GeneratedMessage {
  factory PrincipalIn({
    $4.SlotId? slot,
    $1.EntityUid? entity,
  }) {
    final $result = create();
    if (slot != null) {
      $result.slot = slot;
    }
    if (entity != null) {
      $result.entity = entity;
    }
    return $result;
  }
  PrincipalIn._() : super();
  factory PrincipalIn.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrincipalIn.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, PrincipalIn_Component>
      _PrincipalIn_ComponentByTag = {
    1: PrincipalIn_Component.slot,
    2: PrincipalIn_Component.entity,
    0: PrincipalIn_Component.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrincipalIn',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<$4.SlotId>(1, _omitFieldNames ? '' : 'slot', $pb.PbFieldType.OE,
        defaultOrMaker: $4.SlotId.SLOT_ID_UNSPECIFIED,
        valueOf: $4.SlotId.valueOf,
        enumValues: $4.SlotId.values)
    ..aOM<$1.EntityUid>(2, _omitFieldNames ? '' : 'entity',
        subBuilder: $1.EntityUid.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrincipalIn clone() => PrincipalIn()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrincipalIn copyWith(void Function(PrincipalIn) updates) =>
      super.copyWith((message) => updates(message as PrincipalIn))
          as PrincipalIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrincipalIn create() => PrincipalIn._();
  PrincipalIn createEmptyInstance() => create();
  static $pb.PbList<PrincipalIn> createRepeated() => $pb.PbList<PrincipalIn>();
  @$core.pragma('dart2js:noInline')
  static PrincipalIn getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrincipalIn>(create);
  static PrincipalIn? _defaultInstance;

  PrincipalIn_Component whichComponent() =>
      _PrincipalIn_ComponentByTag[$_whichOneof(0)]!;
  void clearComponent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $4.SlotId get slot => $_getN(0);
  @$pb.TagNumber(1)
  set slot($4.SlotId v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSlot() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlot() => clearField(1);

  @$pb.TagNumber(2)
  $1.EntityUid get entity => $_getN(1);
  @$pb.TagNumber(2)
  set entity($1.EntityUid v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEntity() => $_has(1);
  @$pb.TagNumber(2)
  void clearEntity() => clearField(2);
  @$pb.TagNumber(2)
  $1.EntityUid ensureEntity() => $_ensure(1);
}

enum PrincipalIsIn_In { slot, entity, notSet }

class PrincipalIsIn extends $pb.GeneratedMessage {
  factory PrincipalIsIn({
    $core.String? entityType,
    $4.SlotId? slot,
    $1.EntityUid? entity,
  }) {
    final $result = create();
    if (entityType != null) {
      $result.entityType = entityType;
    }
    if (slot != null) {
      $result.slot = slot;
    }
    if (entity != null) {
      $result.entity = entity;
    }
    return $result;
  }
  PrincipalIsIn._() : super();
  factory PrincipalIsIn.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrincipalIsIn.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, PrincipalIsIn_In> _PrincipalIsIn_InByTag = {
    2: PrincipalIsIn_In.slot,
    3: PrincipalIsIn_In.entity,
    0: PrincipalIsIn_In.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrincipalIsIn',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOS(1, _omitFieldNames ? '' : 'entityType')
    ..e<$4.SlotId>(2, _omitFieldNames ? '' : 'slot', $pb.PbFieldType.OE,
        defaultOrMaker: $4.SlotId.SLOT_ID_UNSPECIFIED,
        valueOf: $4.SlotId.valueOf,
        enumValues: $4.SlotId.values)
    ..aOM<$1.EntityUid>(3, _omitFieldNames ? '' : 'entity',
        subBuilder: $1.EntityUid.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrincipalIsIn clone() => PrincipalIsIn()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrincipalIsIn copyWith(void Function(PrincipalIsIn) updates) =>
      super.copyWith((message) => updates(message as PrincipalIsIn))
          as PrincipalIsIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrincipalIsIn create() => PrincipalIsIn._();
  PrincipalIsIn createEmptyInstance() => create();
  static $pb.PbList<PrincipalIsIn> createRepeated() =>
      $pb.PbList<PrincipalIsIn>();
  @$core.pragma('dart2js:noInline')
  static PrincipalIsIn getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrincipalIsIn>(create);
  static PrincipalIsIn? _defaultInstance;

  PrincipalIsIn_In whichIn() => _PrincipalIsIn_InByTag[$_whichOneof(0)]!;
  void clearIn() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get entityType => $_getSZ(0);
  @$pb.TagNumber(1)
  set entityType($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEntityType() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntityType() => clearField(1);

  @$pb.TagNumber(2)
  $4.SlotId get slot => $_getN(1);
  @$pb.TagNumber(2)
  set slot($4.SlotId v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSlot() => $_has(1);
  @$pb.TagNumber(2)
  void clearSlot() => clearField(2);

  @$pb.TagNumber(3)
  $1.EntityUid get entity => $_getN(2);
  @$pb.TagNumber(3)
  set entity($1.EntityUid v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEntity() => $_has(2);
  @$pb.TagNumber(3)
  void clearEntity() => clearField(3);
  @$pb.TagNumber(3)
  $1.EntityUid ensureEntity() => $_ensure(2);
}

class PrincipalIs extends $pb.GeneratedMessage {
  factory PrincipalIs({
    $core.String? entityType,
  }) {
    final $result = create();
    if (entityType != null) {
      $result.entityType = entityType;
    }
    return $result;
  }
  PrincipalIs._() : super();
  factory PrincipalIs.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrincipalIs.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrincipalIs',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'entityType')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrincipalIs clone() => PrincipalIs()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrincipalIs copyWith(void Function(PrincipalIs) updates) =>
      super.copyWith((message) => updates(message as PrincipalIs))
          as PrincipalIs;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrincipalIs create() => PrincipalIs._();
  PrincipalIs createEmptyInstance() => create();
  static $pb.PbList<PrincipalIs> createRepeated() => $pb.PbList<PrincipalIs>();
  @$core.pragma('dart2js:noInline')
  static PrincipalIs getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrincipalIs>(create);
  static PrincipalIs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get entityType => $_getSZ(0);
  @$pb.TagNumber(1)
  set entityType($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEntityType() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntityType() => clearField(1);
}

enum ActionConstraint_Constraint { all, equals, in_, inSet, notSet }

class ActionConstraint extends $pb.GeneratedMessage {
  factory ActionConstraint({
    ActionAll? all,
    ActionEquals? equals,
    ActionIn? in_,
    ActionInSet? inSet,
  }) {
    final $result = create();
    if (all != null) {
      $result.all = all;
    }
    if (equals != null) {
      $result.equals = equals;
    }
    if (in_ != null) {
      $result.in_ = in_;
    }
    if (inSet != null) {
      $result.inSet = inSet;
    }
    return $result;
  }
  ActionConstraint._() : super();
  factory ActionConstraint.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ActionConstraint.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ActionConstraint_Constraint>
      _ActionConstraint_ConstraintByTag = {
    1: ActionConstraint_Constraint.all,
    2: ActionConstraint_Constraint.equals,
    3: ActionConstraint_Constraint.in_,
    4: ActionConstraint_Constraint.inSet,
    0: ActionConstraint_Constraint.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActionConstraint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOM<ActionAll>(1, _omitFieldNames ? '' : 'all',
        subBuilder: ActionAll.create)
    ..aOM<ActionEquals>(2, _omitFieldNames ? '' : 'equals',
        subBuilder: ActionEquals.create)
    ..aOM<ActionIn>(3, _omitFieldNames ? '' : 'in', subBuilder: ActionIn.create)
    ..aOM<ActionInSet>(4, _omitFieldNames ? '' : 'inSet',
        subBuilder: ActionInSet.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ActionConstraint clone() => ActionConstraint()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ActionConstraint copyWith(void Function(ActionConstraint) updates) =>
      super.copyWith((message) => updates(message as ActionConstraint))
          as ActionConstraint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActionConstraint create() => ActionConstraint._();
  ActionConstraint createEmptyInstance() => create();
  static $pb.PbList<ActionConstraint> createRepeated() =>
      $pb.PbList<ActionConstraint>();
  @$core.pragma('dart2js:noInline')
  static ActionConstraint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActionConstraint>(create);
  static ActionConstraint? _defaultInstance;

  ActionConstraint_Constraint whichConstraint() =>
      _ActionConstraint_ConstraintByTag[$_whichOneof(0)]!;
  void clearConstraint() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ActionAll get all => $_getN(0);
  @$pb.TagNumber(1)
  set all(ActionAll v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAll() => $_has(0);
  @$pb.TagNumber(1)
  void clearAll() => clearField(1);
  @$pb.TagNumber(1)
  ActionAll ensureAll() => $_ensure(0);

  @$pb.TagNumber(2)
  ActionEquals get equals => $_getN(1);
  @$pb.TagNumber(2)
  set equals(ActionEquals v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEquals() => $_has(1);
  @$pb.TagNumber(2)
  void clearEquals() => clearField(2);
  @$pb.TagNumber(2)
  ActionEquals ensureEquals() => $_ensure(1);

  @$pb.TagNumber(3)
  ActionIn get in_ => $_getN(2);
  @$pb.TagNumber(3)
  set in_(ActionIn v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIn_() => $_has(2);
  @$pb.TagNumber(3)
  void clearIn_() => clearField(3);
  @$pb.TagNumber(3)
  ActionIn ensureIn_() => $_ensure(2);

  @$pb.TagNumber(4)
  ActionInSet get inSet => $_getN(3);
  @$pb.TagNumber(4)
  set inSet(ActionInSet v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasInSet() => $_has(3);
  @$pb.TagNumber(4)
  void clearInSet() => clearField(4);
  @$pb.TagNumber(4)
  ActionInSet ensureInSet() => $_ensure(3);
}

class ActionAll extends $pb.GeneratedMessage {
  factory ActionAll() => create();
  ActionAll._() : super();
  factory ActionAll.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ActionAll.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActionAll',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ActionAll clone() => ActionAll()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ActionAll copyWith(void Function(ActionAll) updates) =>
      super.copyWith((message) => updates(message as ActionAll)) as ActionAll;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActionAll create() => ActionAll._();
  ActionAll createEmptyInstance() => create();
  static $pb.PbList<ActionAll> createRepeated() => $pb.PbList<ActionAll>();
  @$core.pragma('dart2js:noInline')
  static ActionAll getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActionAll>(create);
  static ActionAll? _defaultInstance;
}

class ActionEquals extends $pb.GeneratedMessage {
  factory ActionEquals({
    $1.EntityUid? entity,
  }) {
    final $result = create();
    if (entity != null) {
      $result.entity = entity;
    }
    return $result;
  }
  ActionEquals._() : super();
  factory ActionEquals.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ActionEquals.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActionEquals',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..aOM<$1.EntityUid>(1, _omitFieldNames ? '' : 'entity',
        subBuilder: $1.EntityUid.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ActionEquals clone() => ActionEquals()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ActionEquals copyWith(void Function(ActionEquals) updates) =>
      super.copyWith((message) => updates(message as ActionEquals))
          as ActionEquals;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActionEquals create() => ActionEquals._();
  ActionEquals createEmptyInstance() => create();
  static $pb.PbList<ActionEquals> createRepeated() =>
      $pb.PbList<ActionEquals>();
  @$core.pragma('dart2js:noInline')
  static ActionEquals getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActionEquals>(create);
  static ActionEquals? _defaultInstance;

  @$pb.TagNumber(1)
  $1.EntityUid get entity => $_getN(0);
  @$pb.TagNumber(1)
  set entity($1.EntityUid v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEntity() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntity() => clearField(1);
  @$pb.TagNumber(1)
  $1.EntityUid ensureEntity() => $_ensure(0);
}

class ActionIn extends $pb.GeneratedMessage {
  factory ActionIn({
    $1.EntityUid? entity,
  }) {
    final $result = create();
    if (entity != null) {
      $result.entity = entity;
    }
    return $result;
  }
  ActionIn._() : super();
  factory ActionIn.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ActionIn.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActionIn',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..aOM<$1.EntityUid>(1, _omitFieldNames ? '' : 'entity',
        subBuilder: $1.EntityUid.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ActionIn clone() => ActionIn()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ActionIn copyWith(void Function(ActionIn) updates) =>
      super.copyWith((message) => updates(message as ActionIn)) as ActionIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActionIn create() => ActionIn._();
  ActionIn createEmptyInstance() => create();
  static $pb.PbList<ActionIn> createRepeated() => $pb.PbList<ActionIn>();
  @$core.pragma('dart2js:noInline')
  static ActionIn getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActionIn>(create);
  static ActionIn? _defaultInstance;

  @$pb.TagNumber(1)
  $1.EntityUid get entity => $_getN(0);
  @$pb.TagNumber(1)
  set entity($1.EntityUid v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEntity() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntity() => clearField(1);
  @$pb.TagNumber(1)
  $1.EntityUid ensureEntity() => $_ensure(0);
}

class ActionInSet extends $pb.GeneratedMessage {
  factory ActionInSet({
    $core.Iterable<$1.EntityUid>? entities,
  }) {
    final $result = create();
    if (entities != null) {
      $result.entities.addAll(entities);
    }
    return $result;
  }
  ActionInSet._() : super();
  factory ActionInSet.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ActionInSet.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActionInSet',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..pc<$1.EntityUid>(1, _omitFieldNames ? '' : 'entities', $pb.PbFieldType.PM,
        subBuilder: $1.EntityUid.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ActionInSet clone() => ActionInSet()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ActionInSet copyWith(void Function(ActionInSet) updates) =>
      super.copyWith((message) => updates(message as ActionInSet))
          as ActionInSet;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActionInSet create() => ActionInSet._();
  ActionInSet createEmptyInstance() => create();
  static $pb.PbList<ActionInSet> createRepeated() => $pb.PbList<ActionInSet>();
  @$core.pragma('dart2js:noInline')
  static ActionInSet getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActionInSet>(create);
  static ActionInSet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.EntityUid> get entities => $_getList(0);
}

enum ResourceConstraint_Constraint { all, equals, in_, isIn, is_5, notSet }

class ResourceConstraint extends $pb.GeneratedMessage {
  factory ResourceConstraint({
    ResourceAll? all,
    ResourceEquals? equals,
    ResourceIn? in_,
    ResourceIsIn? isIn,
    ResourceIs? is_5,
  }) {
    final $result = create();
    if (all != null) {
      $result.all = all;
    }
    if (equals != null) {
      $result.equals = equals;
    }
    if (in_ != null) {
      $result.in_ = in_;
    }
    if (isIn != null) {
      $result.isIn = isIn;
    }
    if (is_5 != null) {
      $result.is_5 = is_5;
    }
    return $result;
  }
  ResourceConstraint._() : super();
  factory ResourceConstraint.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResourceConstraint.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ResourceConstraint_Constraint>
      _ResourceConstraint_ConstraintByTag = {
    1: ResourceConstraint_Constraint.all,
    2: ResourceConstraint_Constraint.equals,
    3: ResourceConstraint_Constraint.in_,
    4: ResourceConstraint_Constraint.isIn,
    5: ResourceConstraint_Constraint.is_5,
    0: ResourceConstraint_Constraint.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResourceConstraint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<ResourceAll>(1, _omitFieldNames ? '' : 'all',
        subBuilder: ResourceAll.create)
    ..aOM<ResourceEquals>(2, _omitFieldNames ? '' : 'equals',
        subBuilder: ResourceEquals.create)
    ..aOM<ResourceIn>(3, _omitFieldNames ? '' : 'in',
        subBuilder: ResourceIn.create)
    ..aOM<ResourceIsIn>(4, _omitFieldNames ? '' : 'isIn',
        subBuilder: ResourceIsIn.create)
    ..aOM<ResourceIs>(5, _omitFieldNames ? '' : 'is',
        subBuilder: ResourceIs.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResourceConstraint clone() => ResourceConstraint()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResourceConstraint copyWith(void Function(ResourceConstraint) updates) =>
      super.copyWith((message) => updates(message as ResourceConstraint))
          as ResourceConstraint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResourceConstraint create() => ResourceConstraint._();
  ResourceConstraint createEmptyInstance() => create();
  static $pb.PbList<ResourceConstraint> createRepeated() =>
      $pb.PbList<ResourceConstraint>();
  @$core.pragma('dart2js:noInline')
  static ResourceConstraint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResourceConstraint>(create);
  static ResourceConstraint? _defaultInstance;

  ResourceConstraint_Constraint whichConstraint() =>
      _ResourceConstraint_ConstraintByTag[$_whichOneof(0)]!;
  void clearConstraint() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ResourceAll get all => $_getN(0);
  @$pb.TagNumber(1)
  set all(ResourceAll v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAll() => $_has(0);
  @$pb.TagNumber(1)
  void clearAll() => clearField(1);
  @$pb.TagNumber(1)
  ResourceAll ensureAll() => $_ensure(0);

  @$pb.TagNumber(2)
  ResourceEquals get equals => $_getN(1);
  @$pb.TagNumber(2)
  set equals(ResourceEquals v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEquals() => $_has(1);
  @$pb.TagNumber(2)
  void clearEquals() => clearField(2);
  @$pb.TagNumber(2)
  ResourceEquals ensureEquals() => $_ensure(1);

  @$pb.TagNumber(3)
  ResourceIn get in_ => $_getN(2);
  @$pb.TagNumber(3)
  set in_(ResourceIn v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIn_() => $_has(2);
  @$pb.TagNumber(3)
  void clearIn_() => clearField(3);
  @$pb.TagNumber(3)
  ResourceIn ensureIn_() => $_ensure(2);

  @$pb.TagNumber(4)
  ResourceIsIn get isIn => $_getN(3);
  @$pb.TagNumber(4)
  set isIn(ResourceIsIn v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsIn() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsIn() => clearField(4);
  @$pb.TagNumber(4)
  ResourceIsIn ensureIsIn() => $_ensure(3);

  @$pb.TagNumber(5)
  ResourceIs get is_5 => $_getN(4);
  @$pb.TagNumber(5)
  set is_5(ResourceIs v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIs_5() => $_has(4);
  @$pb.TagNumber(5)
  void clearIs_5() => clearField(5);
  @$pb.TagNumber(5)
  ResourceIs ensureIs_5() => $_ensure(4);
}

class ResourceAll extends $pb.GeneratedMessage {
  factory ResourceAll() => create();
  ResourceAll._() : super();
  factory ResourceAll.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResourceAll.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResourceAll',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResourceAll clone() => ResourceAll()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResourceAll copyWith(void Function(ResourceAll) updates) =>
      super.copyWith((message) => updates(message as ResourceAll))
          as ResourceAll;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResourceAll create() => ResourceAll._();
  ResourceAll createEmptyInstance() => create();
  static $pb.PbList<ResourceAll> createRepeated() => $pb.PbList<ResourceAll>();
  @$core.pragma('dart2js:noInline')
  static ResourceAll getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResourceAll>(create);
  static ResourceAll? _defaultInstance;
}

enum ResourceEquals_Component { slot, entity, notSet }

class ResourceEquals extends $pb.GeneratedMessage {
  factory ResourceEquals({
    $4.SlotId? slot,
    $1.EntityUid? entity,
  }) {
    final $result = create();
    if (slot != null) {
      $result.slot = slot;
    }
    if (entity != null) {
      $result.entity = entity;
    }
    return $result;
  }
  ResourceEquals._() : super();
  factory ResourceEquals.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResourceEquals.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ResourceEquals_Component>
      _ResourceEquals_ComponentByTag = {
    1: ResourceEquals_Component.slot,
    2: ResourceEquals_Component.entity,
    0: ResourceEquals_Component.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResourceEquals',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<$4.SlotId>(1, _omitFieldNames ? '' : 'slot', $pb.PbFieldType.OE,
        defaultOrMaker: $4.SlotId.SLOT_ID_UNSPECIFIED,
        valueOf: $4.SlotId.valueOf,
        enumValues: $4.SlotId.values)
    ..aOM<$1.EntityUid>(2, _omitFieldNames ? '' : 'entity',
        subBuilder: $1.EntityUid.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResourceEquals clone() => ResourceEquals()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResourceEquals copyWith(void Function(ResourceEquals) updates) =>
      super.copyWith((message) => updates(message as ResourceEquals))
          as ResourceEquals;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResourceEquals create() => ResourceEquals._();
  ResourceEquals createEmptyInstance() => create();
  static $pb.PbList<ResourceEquals> createRepeated() =>
      $pb.PbList<ResourceEquals>();
  @$core.pragma('dart2js:noInline')
  static ResourceEquals getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResourceEquals>(create);
  static ResourceEquals? _defaultInstance;

  ResourceEquals_Component whichComponent() =>
      _ResourceEquals_ComponentByTag[$_whichOneof(0)]!;
  void clearComponent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $4.SlotId get slot => $_getN(0);
  @$pb.TagNumber(1)
  set slot($4.SlotId v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSlot() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlot() => clearField(1);

  @$pb.TagNumber(2)
  $1.EntityUid get entity => $_getN(1);
  @$pb.TagNumber(2)
  set entity($1.EntityUid v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEntity() => $_has(1);
  @$pb.TagNumber(2)
  void clearEntity() => clearField(2);
  @$pb.TagNumber(2)
  $1.EntityUid ensureEntity() => $_ensure(1);
}

enum ResourceIn_Component { slot, entity, notSet }

class ResourceIn extends $pb.GeneratedMessage {
  factory ResourceIn({
    $4.SlotId? slot,
    $1.EntityUid? entity,
  }) {
    final $result = create();
    if (slot != null) {
      $result.slot = slot;
    }
    if (entity != null) {
      $result.entity = entity;
    }
    return $result;
  }
  ResourceIn._() : super();
  factory ResourceIn.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResourceIn.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ResourceIn_Component>
      _ResourceIn_ComponentByTag = {
    1: ResourceIn_Component.slot,
    2: ResourceIn_Component.entity,
    0: ResourceIn_Component.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResourceIn',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<$4.SlotId>(1, _omitFieldNames ? '' : 'slot', $pb.PbFieldType.OE,
        defaultOrMaker: $4.SlotId.SLOT_ID_UNSPECIFIED,
        valueOf: $4.SlotId.valueOf,
        enumValues: $4.SlotId.values)
    ..aOM<$1.EntityUid>(2, _omitFieldNames ? '' : 'entity',
        subBuilder: $1.EntityUid.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResourceIn clone() => ResourceIn()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResourceIn copyWith(void Function(ResourceIn) updates) =>
      super.copyWith((message) => updates(message as ResourceIn)) as ResourceIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResourceIn create() => ResourceIn._();
  ResourceIn createEmptyInstance() => create();
  static $pb.PbList<ResourceIn> createRepeated() => $pb.PbList<ResourceIn>();
  @$core.pragma('dart2js:noInline')
  static ResourceIn getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResourceIn>(create);
  static ResourceIn? _defaultInstance;

  ResourceIn_Component whichComponent() =>
      _ResourceIn_ComponentByTag[$_whichOneof(0)]!;
  void clearComponent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $4.SlotId get slot => $_getN(0);
  @$pb.TagNumber(1)
  set slot($4.SlotId v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSlot() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlot() => clearField(1);

  @$pb.TagNumber(2)
  $1.EntityUid get entity => $_getN(1);
  @$pb.TagNumber(2)
  set entity($1.EntityUid v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEntity() => $_has(1);
  @$pb.TagNumber(2)
  void clearEntity() => clearField(2);
  @$pb.TagNumber(2)
  $1.EntityUid ensureEntity() => $_ensure(1);
}

enum ResourceIsIn_In { slot, entity, notSet }

class ResourceIsIn extends $pb.GeneratedMessage {
  factory ResourceIsIn({
    $core.String? entityType,
    $4.SlotId? slot,
    $1.EntityUid? entity,
  }) {
    final $result = create();
    if (entityType != null) {
      $result.entityType = entityType;
    }
    if (slot != null) {
      $result.slot = slot;
    }
    if (entity != null) {
      $result.entity = entity;
    }
    return $result;
  }
  ResourceIsIn._() : super();
  factory ResourceIsIn.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResourceIsIn.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ResourceIsIn_In> _ResourceIsIn_InByTag = {
    2: ResourceIsIn_In.slot,
    3: ResourceIsIn_In.entity,
    0: ResourceIsIn_In.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResourceIsIn',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOS(1, _omitFieldNames ? '' : 'entityType')
    ..e<$4.SlotId>(2, _omitFieldNames ? '' : 'slot', $pb.PbFieldType.OE,
        defaultOrMaker: $4.SlotId.SLOT_ID_UNSPECIFIED,
        valueOf: $4.SlotId.valueOf,
        enumValues: $4.SlotId.values)
    ..aOM<$1.EntityUid>(3, _omitFieldNames ? '' : 'entity',
        subBuilder: $1.EntityUid.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResourceIsIn clone() => ResourceIsIn()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResourceIsIn copyWith(void Function(ResourceIsIn) updates) =>
      super.copyWith((message) => updates(message as ResourceIsIn))
          as ResourceIsIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResourceIsIn create() => ResourceIsIn._();
  ResourceIsIn createEmptyInstance() => create();
  static $pb.PbList<ResourceIsIn> createRepeated() =>
      $pb.PbList<ResourceIsIn>();
  @$core.pragma('dart2js:noInline')
  static ResourceIsIn getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResourceIsIn>(create);
  static ResourceIsIn? _defaultInstance;

  ResourceIsIn_In whichIn() => _ResourceIsIn_InByTag[$_whichOneof(0)]!;
  void clearIn() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get entityType => $_getSZ(0);
  @$pb.TagNumber(1)
  set entityType($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEntityType() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntityType() => clearField(1);

  @$pb.TagNumber(2)
  $4.SlotId get slot => $_getN(1);
  @$pb.TagNumber(2)
  set slot($4.SlotId v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSlot() => $_has(1);
  @$pb.TagNumber(2)
  void clearSlot() => clearField(2);

  @$pb.TagNumber(3)
  $1.EntityUid get entity => $_getN(2);
  @$pb.TagNumber(3)
  set entity($1.EntityUid v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEntity() => $_has(2);
  @$pb.TagNumber(3)
  void clearEntity() => clearField(3);
  @$pb.TagNumber(3)
  $1.EntityUid ensureEntity() => $_ensure(2);
}

class ResourceIs extends $pb.GeneratedMessage {
  factory ResourceIs({
    $core.String? entityType,
  }) {
    final $result = create();
    if (entityType != null) {
      $result.entityType = entityType;
    }
    return $result;
  }
  ResourceIs._() : super();
  factory ResourceIs.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResourceIs.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResourceIs',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'entityType')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResourceIs clone() => ResourceIs()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResourceIs copyWith(void Function(ResourceIs) updates) =>
      super.copyWith((message) => updates(message as ResourceIs)) as ResourceIs;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResourceIs create() => ResourceIs._();
  ResourceIs createEmptyInstance() => create();
  static $pb.PbList<ResourceIs> createRepeated() => $pb.PbList<ResourceIs>();
  @$core.pragma('dart2js:noInline')
  static ResourceIs getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResourceIs>(create);
  static ResourceIs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get entityType => $_getSZ(0);
  @$pb.TagNumber(1)
  set entityType($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEntityType() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntityType() => clearField(1);
}

class Condition extends $pb.GeneratedMessage {
  factory Condition({
    ConditionKind? kind,
    $4.Expr? body,
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
  Condition._() : super();
  factory Condition.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Condition.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Condition',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..e<ConditionKind>(1, _omitFieldNames ? '' : 'kind', $pb.PbFieldType.OE,
        defaultOrMaker: ConditionKind.CONDITION_KIND_UNSPECIFIED,
        valueOf: ConditionKind.valueOf,
        enumValues: ConditionKind.values)
    ..aOM<$4.Expr>(2, _omitFieldNames ? '' : 'body', subBuilder: $4.Expr.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Condition clone() => Condition()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Condition copyWith(void Function(Condition) updates) =>
      super.copyWith((message) => updates(message as Condition)) as Condition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Condition create() => Condition._();
  Condition createEmptyInstance() => create();
  static $pb.PbList<Condition> createRepeated() => $pb.PbList<Condition>();
  @$core.pragma('dart2js:noInline')
  static Condition getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Condition>(create);
  static Condition? _defaultInstance;

  @$pb.TagNumber(1)
  ConditionKind get kind => $_getN(0);
  @$pb.TagNumber(1)
  set kind(ConditionKind v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKind() => $_has(0);
  @$pb.TagNumber(1)
  void clearKind() => clearField(1);

  @$pb.TagNumber(2)
  $4.Expr get body => $_getN(1);
  @$pb.TagNumber(2)
  set body($4.Expr v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearBody() => clearField(2);
  @$pb.TagNumber(2)
  $4.Expr ensureBody() => $_ensure(1);
}

class TemplateLink extends $pb.GeneratedMessage {
  factory TemplateLink({
    $core.String? templateId,
    $core.String? newId,
    $core.Map<$core.String, $1.EntityUid>? values,
  }) {
    final $result = create();
    if (templateId != null) {
      $result.templateId = templateId;
    }
    if (newId != null) {
      $result.newId = newId;
    }
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  TemplateLink._() : super();
  factory TemplateLink.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TemplateLink.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TemplateLink',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'templateId')
    ..aOS(2, _omitFieldNames ? '' : 'newId')
    ..m<$core.String, $1.EntityUid>(3, _omitFieldNames ? '' : 'values',
        entryClassName: 'TemplateLink.ValuesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $1.EntityUid.create,
        valueDefaultOrMaker: $1.EntityUid.getDefault,
        packageName: const $pb.PackageName('cedar.v3'))
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TemplateLink clone() => TemplateLink()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TemplateLink copyWith(void Function(TemplateLink) updates) =>
      super.copyWith((message) => updates(message as TemplateLink))
          as TemplateLink;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TemplateLink create() => TemplateLink._();
  TemplateLink createEmptyInstance() => create();
  static $pb.PbList<TemplateLink> createRepeated() =>
      $pb.PbList<TemplateLink>();
  @$core.pragma('dart2js:noInline')
  static TemplateLink getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TemplateLink>(create);
  static TemplateLink? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get templateId => $_getSZ(0);
  @$pb.TagNumber(1)
  set templateId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTemplateId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTemplateId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get newId => $_getSZ(1);
  @$pb.TagNumber(2)
  set newId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNewId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewId() => clearField(2);

  @$pb.TagNumber(3)
  $core.Map<$core.String, $1.EntityUid> get values => $_getMap(2);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
