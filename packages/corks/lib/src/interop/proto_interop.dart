@internal
library;

import 'dart:typed_data';

import 'package:cedar_common/cedar_common.dart' as cedar;
import 'package:corks/src/proto/cedar/v3/entity.pb.dart';
import 'package:corks/src/proto/cedar/v3/entity_id.pb.dart';
import 'package:corks/src/proto/cedar/v3/expr.pb.dart';
import 'package:corks/src/proto/cedar/v3/policy.pb.dart';
import 'package:corks/src/proto/cedar/v3/value.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:meta/meta.dart';

extension type CedarPolicy._(cedar.CedarPolicy _policy)
    implements cedar.CedarPolicy {
  factory CedarPolicy.fromProto(Policy policy) =>
      CedarPolicy._(policy.fromProto());

  factory CedarPolicy.fromJson(Map<String, Object?> json) =>
      CedarPolicy._(cedar.CedarPolicy.fromJson(json));

  factory CedarPolicy.fromProtoBuffer(Uint8List buffer) =>
      CedarPolicy._(Policy.fromBuffer(buffer).fromProto());

  factory CedarPolicy.fromProtoJson(Map<String, Object?> json) =>
      CedarPolicy._((Policy.create()..mergeFromProto3Json(json)).fromProto());

  Policy toProto() => _policy.toProto();

  Map<String, Object?> toProtoJson() =>
      toProto().toProto3Json() as Map<String, Object?>;

  Uint8List toProtoBuffer() => toProto().writeToBuffer();
}

extension PolicyOpFromProto on PolicyOp {
  cedar.CedarPolicyOp fromProto() => switch (this) {
        PolicyOp.POLICY_OP_ALL => cedar.CedarPolicyOp.all,
        PolicyOp.POLICY_OP_EQUALS => cedar.CedarPolicyOp.equals,
        PolicyOp.POLICY_OP_IN => cedar.CedarPolicyOp.in$,
        PolicyOp.POLICY_OP_IS => cedar.CedarPolicyOp.is$,
        PolicyOp.POLICY_OP_UNSPECIFIED => throw ArgumentError(
            'PolicyOp.POLICY_OP_UNSPECIFIED is not a valid PolicyOp',
          ),
        _ => throw UnimplementedError(),
      };
}

extension PolicyOpToProto on cedar.CedarPolicyOp {
  PolicyOp toProto() => switch (this) {
        cedar.CedarPolicyOp.all => PolicyOp.POLICY_OP_ALL,
        cedar.CedarPolicyOp.equals => PolicyOp.POLICY_OP_EQUALS,
        cedar.CedarPolicyOp.in$ => PolicyOp.POLICY_OP_IN,
        cedar.CedarPolicyOp.is$ => PolicyOp.POLICY_OP_IS,
        _ => throw UnimplementedError(),
      };
}

extension PolicyEffectFromProto on PolicyEffect {
  cedar.CedarPolicyEffect fromProto() => switch (this) {
        PolicyEffect.POLICY_EFFECT_FORBID => cedar.CedarPolicyEffect.forbid,
        PolicyEffect.POLICY_EFFECT_PERMIT => cedar.CedarPolicyEffect.permit,
        PolicyEffect.POLICY_EFFECT_UNSPECIFIED => throw ArgumentError(
            'PolicyEffect.POLICY_EFFECT_UNSPECIFIED is not a valid PolicyEffect',
          ),
        _ => throw UnimplementedError(),
      };
}

extension PolicyEffectToProto on cedar.CedarPolicyEffect {
  PolicyEffect toProto() => switch (this) {
        cedar.CedarPolicyEffect.forbid => PolicyEffect.POLICY_EFFECT_FORBID,
        cedar.CedarPolicyEffect.permit => PolicyEffect.POLICY_EFFECT_PERMIT,
        _ => throw UnimplementedError(),
      };
}

extension PolicyConditionKindFromProto on PolicyConditionKind {
  cedar.CedarPolicyConditionKind fromProto() => switch (this) {
        PolicyConditionKind.POLICY_CONDITION_KIND_WHEN =>
          cedar.CedarPolicyConditionKind.when,
        PolicyConditionKind.POLICY_CONDITION_KIND_UNLESS =>
          cedar.CedarPolicyConditionKind.unless,
        PolicyConditionKind.POLICY_CONDITION_KIND_UNSPECIFIED =>
          throw ArgumentError(
            'PolicyConditionKind.POLICY_CONDITION_KIND_UNSPECIFIED is not a valid PolicyConditionKind',
          ),
        _ => throw UnimplementedError(),
      };
}

extension PolicyConditionKindToProto on cedar.CedarPolicyConditionKind {
  PolicyConditionKind toProto() => switch (this) {
        cedar.CedarPolicyConditionKind.when =>
          PolicyConditionKind.POLICY_CONDITION_KIND_WHEN,
        cedar.CedarPolicyConditionKind.unless =>
          PolicyConditionKind.POLICY_CONDITION_KIND_UNLESS,
        _ => throw UnimplementedError(),
      };
}

extension PolicyFromProto on Policy {
  cedar.CedarPolicy fromProto() => cedar.CedarPolicy(
        id: hasId() ? id : null,
        effect: effect.fromProto(),
        principal: cedar.CedarPolicyPrincipal(
          op: principal.op.fromProto(),
          entity: principal.hasEntity() ? principal.entity.fromProto() : null,
          entityType: principal.hasEntityType() ? principal.entityType : null,
        ),
        action: cedar.CedarPolicyAction(
          op: action.op.fromProto(),
          entity: action.hasEntity() ? action.entity.fromProto() : null,
          entities: action.hasEntity()
              ? null
              : [
                  for (final entity in action.entities) entity.fromProto(),
                ],
        ),
        resource: cedar.CedarPolicyResource(
          op: resource.op.fromProto(),
          entity: resource.hasEntity() ? resource.entity.fromProto() : null,
          entityType: resource.hasEntityType() ? resource.entityType : null,
        ),
        conditions: [
          for (final condition in conditions) condition.fromProto(),
        ],
        annotations: annotations.isNotEmpty ? annotations : null,
      );
}

extension PolicyToProto on cedar.CedarPolicy {
  Policy toProto() => Policy(
        id: id,
        effect: effect.toProto(),
        principal: PolicyPrincipal(
          op: principal.op.toProto(),
          entity: principal.entity?.toProto(),
          entityType: principal.entityType,
        ),
        action: PolicyAction(
          op: action.op.toProto(),
          entity: action.entity?.toProto(),
          entities: action.entities == null
              ? null
              : [for (final entity in action.entities!) entity.toProto()],
        ),
        resource: PolicyResource(
          op: resource.op.toProto(),
          entity: resource.entity?.toProto(),
          entityType: resource.entityType,
        ),
        conditions: [
          for (final condition in conditions) condition.toProto(),
        ],
        annotations: annotations?.toMap(),
      );
}

extension PolicyConditionFromProto on PolicyCondition {
  cedar.CedarPolicyCondition fromProto() => cedar.CedarPolicyCondition(
        kind: kind.fromProto(),
        body: body.fromProto(),
      );
}

extension PolicyConditionToProto on cedar.CedarPolicyCondition {
  PolicyCondition toProto() => PolicyCondition(
        kind: kind.toProto(),
        body: body.toProto(),
      );
}

extension EntityIdFromProto on EntityId {
  cedar.CedarEntityId fromProto() => cedar.CedarEntityId(type, id);
}

extension EntityIdToProto on cedar.CedarEntityId {
  EntityId toProto() => EntityId(type: type, id: id);
}

extension EntityFromProto on Entity {
  cedar.CedarEntity fromProto() => cedar.CedarEntity(
        id: uid.fromProto(),
        parents: [for (final parent in parents) parent.fromProto()],
        attributes: attributes.map((k, v) => MapEntry(k, v.fromProto())),
      );
}

extension EntityToProto on cedar.CedarEntity {
  Entity toProto() => Entity(
        uid: id.toProto(),
        parents: [for (final parent in parents) parent.toProto()],
        attributes: attributes.asMap().map((k, v) => MapEntry(k, v.toProto())),
      );
}

extension type CedarExpr._(cedar.JsonExpr _expr) implements cedar.JsonExpr {
  factory CedarExpr.fromProtoJson(Map<String, Object?> json) {
    final message = Expr.create()..mergeFromProto3Json(json);
    return CedarExpr._(message.fromProto());
  }

  factory CedarExpr.fromProtoBuffer(Uint8List buffer) {
    final message = Expr.fromBuffer(buffer);
    return CedarExpr._(message.fromProto());
  }

  factory CedarExpr.fromJson(Map<String, Object?> json) =>
      CedarExpr._(cedar.JsonExpr.fromJson(json));

  Expr toProto() => _expr.toProto();

  Map<String, Object?> toProtoJson() =>
      toProto().toProto3Json() as Map<String, Object?>;

  Uint8List toProtoBuffer() => toProto().writeToBuffer();
}

extension ValueFromProto on Value {
  cedar.CedarValueJson fromProto() => switch (whichValue()) {
        Value_Value.bool_3 => cedar.CedarValueJson.bool(bool_3),
        Value_Value.entity =>
          cedar.CedarValueJson.entity(entity.uid.fromProto()),
        Value_Value.extension_6 => cedar.CedarValueJson.extension(
            cedar.CedarExtensionInvocation(
              fn: extension_6.fn,
              arg: extension_6.arg.fromProto(),
            ),
          ),
        Value_Value.long => cedar.CedarValueJson.long(long.toInt()),
        Value_Value.record => cedar.CedarValueJson.record(
            record.values.map((key, value) => MapEntry(key, value.fromProto())),
          ),
        Value_Value.set => cedar.CedarValueJson.set([
            for (final value in set.values) value.fromProto(),
          ]),
        Value_Value.string => cedar.CedarValueJson.string(string),
        Value_Value.notSet => throw ArgumentError.value(
            whichValue(),
            'value',
            'An unset value is not allowed',
          ),
      };
}

extension ValueToProto on cedar.CedarValueJson {
  Value toProto() => switch (this) {
        cedar.CedarValueBool(:final value) => Value(bool_3: value),
        cedar.CedarValueEntity(:final entityId) =>
          Value(entity: EntityValue(uid: entityId.toProto())),
        cedar.CedarValueExtension(:final extension) => Value(
            extension_6: ExtensionValue(
              fn: extension.fn,
              arg: extension.arg.toProto(),
            ),
          ),
        cedar.CedarValueLong(:final value) => Value(long: Int64(value)),
        cedar.CedarValueRecord(:final attributes) => Value(
            record: RecordValue(
              values: attributes
                  .map((key, value) => MapEntry(key, value.toProto())),
            ),
          ),
        cedar.CedarValueSet(:final elements) => Value(
            set: SetValue(
              values: [for (final value in elements) value.toProto()],
            ),
          ),
        cedar.CedarValueString(:final value) => Value(string: value),
      };
}

extension ExprFromProto on Expr {
  cedar.JsonExpr fromProto() => switch (whichExpr()) {
        Expr_Expr.and => cedar.JsonExpr.and(
            and.left.fromProto(),
            and.right.fromProto(),
          ),
        Expr_Expr.contains => cedar.JsonExpr.contains(
            contains.left.fromProto(),
            contains.right.fromProto(),
          ),
        Expr_Expr.containsAll => cedar.JsonExpr.containsAll(
            containsAll.left.fromProto(),
            containsAll.right.fromProto(),
          ),
        Expr_Expr.containsAny => cedar.JsonExpr.containsAny(
            containsAny.left.fromProto(),
            containsAny.right.fromProto(),
          ),
        Expr_Expr.equals => cedar.JsonExpr.equals(
            equals.left.fromProto(),
            equals.right.fromProto(),
          ),
        Expr_Expr.funcCall => cedar.JsonExpr.funcCall(
            cedar.JsonExprOpFunc(funcCall.fn),
            [for (final arg in funcCall.args) arg.fromProto()],
          ),
        Expr_Expr.getAttribute => cedar.JsonExpr.getAttribute(
            getAttribute.left.fromProto(),
            getAttribute.attr,
          ),
        Expr_Expr.greaterThan => cedar.JsonExpr.greaterThan(
            greaterThan.left.fromProto(),
            greaterThan.right.fromProto(),
          ),
        Expr_Expr.greaterThanOrEquals => cedar.JsonExpr.greaterThanOrEquals(
            greaterThanOrEquals.left.fromProto(),
            greaterThanOrEquals.right.fromProto(),
          ),
        Expr_Expr.hasAttribute => cedar.JsonExpr.hasAttribute(
            hasAttribute.left.fromProto(),
            hasAttribute.attr,
          ),
        Expr_Expr.ifThenElse => cedar.JsonExpr.ifThenElse(
            cond: ifThenElse.if_.fromProto(),
            then: ifThenElse.then.fromProto(),
            else$: ifThenElse.else_.fromProto(),
          ),
        Expr_Expr.in_ => cedar.JsonExpr.in$(
            in_.left.fromProto(),
            in_.right.fromProto(),
          ),
        Expr_Expr.is_ => cedar.JsonExpr.is$(
            is_.left.fromProto(),
            is_.entityType,
            is_.hasIn_() ? is_.in_.fromProto() : null,
          ),
        Expr_Expr.lessThan => cedar.JsonExpr.lessThan(
            lessThan.left.fromProto(),
            lessThan.right.fromProto(),
          ),
        Expr_Expr.lessThanOrEquals => cedar.JsonExpr.lessThanOrEquals(
            lessThanOrEquals.left.fromProto(),
            lessThanOrEquals.right.fromProto(),
          ),
        Expr_Expr.like => cedar.JsonExpr.like(
            like.left.fromProto(),
            like.pattern,
          ),
        Expr_Expr.minus => cedar.JsonExpr.minus(
            minus.left.fromProto(),
            minus.right.fromProto(),
          ),
        Expr_Expr.neg => cedar.JsonExpr.neg(neg.expr.fromProto()),
        Expr_Expr.not => cedar.JsonExpr.not(not.expr.fromProto()),
        Expr_Expr.notEquals => cedar.JsonExpr.notEquals(
            notEquals.left.fromProto(),
            notEquals.right.fromProto(),
          ),
        Expr_Expr.or => cedar.JsonExpr.or(
            or.left.fromProto(),
            or.right.fromProto(),
          ),
        Expr_Expr.plus => cedar.JsonExpr.plus(
            plus.left.fromProto(),
            plus.right.fromProto(),
          ),
        Expr_Expr.record => cedar.JsonExpr.record(
            record.attributes
                .map((key, value) => MapEntry(key, value.fromProto())),
          ),
        Expr_Expr.set => cedar.JsonExpr.set([
            for (final value in set.expressions) value.fromProto(),
          ]),
        Expr_Expr.slot => cedar.JsonExpr.slot(
            switch (slot.slotId) {
              SlotId.SLOT_ID_PRINCIPAL => cedar.CedarSlotId.principal,
              SlotId.SLOT_ID_RESOURCE => cedar.CedarSlotId.resource,
              SlotId.SLOT_ID_UNSPECIFIED => throw ArgumentError.value(
                  slot.slotId,
                  'slot',
                  'SlotId.SLOT_ID_UNSPECIFIED is not allowed',
                ),
              _ => throw UnimplementedError(),
            },
          ),
        Expr_Expr.times => cedar.JsonExpr.times(
            times.left.fromProto(),
            times.right.fromProto(),
          ),
        Expr_Expr.unknown => cedar.JsonExpr.unknown(unknown.name),
        Expr_Expr.value => cedar.JsonExpr.value(value.value.fromProto()),
        Expr_Expr.var_ => cedar.JsonExpr.variable(
            switch (var_.variable) {
              Variable.VARIABLE_ACTION => cedar.CedarVariable.action,
              Variable.VARIABLE_CONTEXT => cedar.CedarVariable.context,
              Variable.VARIABLE_PRINCIPAL => cedar.CedarVariable.principal,
              Variable.VARIABLE_RESOURCE => cedar.CedarVariable.resource,
              Variable.VARIABLE_UNSPECIFIED => throw ArgumentError.value(
                  var_.variable,
                  'var_2',
                  'Variable.VARIABLE_UNSPECIFIED is not allowed',
                ),
              _ => throw UnimplementedError(),
            },
          ),
        Expr_Expr.notSet => throw ArgumentError.value(
            whichExpr(),
            'expr',
            'An unset expression is not allowed',
          ),
      };
}

extension ExprToProto on cedar.JsonExpr {
  Expr toProto() => switch (this) {
        cedar.JsonExprAnd(:final left, :final right) => Expr(
            and: ExprAnd(
              left: left.toProto(),
              right: right.toProto(),
            ),
          ),
        cedar.JsonExprContains(:final left, :final right) => Expr(
            contains: ExprContains(
              left: left.toProto(),
              right: right.toProto(),
            ),
          ),
        cedar.JsonExprContainsAll(:final left, :final right) => Expr(
            containsAll: ExprContainsAll(
              left: left.toProto(),
              right: right.toProto(),
            ),
          ),
        cedar.JsonExprContainsAny(:final left, :final right) => Expr(
            containsAny: ExprContainsAny(
              left: left.toProto(),
              right: right.toProto(),
            ),
          ),
        cedar.JsonExprEquals(:final left, :final right) => Expr(
            equals: ExprEquals(
              left: left.toProto(),
              right: right.toProto(),
            ),
          ),
        cedar.JsonExprFuncCall(:final fn, :final args) => Expr(
            funcCall: ExprFuncCall(
              fn: fn.name,
              args: [for (final arg in args) arg.toProto()],
            ),
          ),
        cedar.JsonExprGetAttribute(:final left, :final attr) => Expr(
            getAttribute: ExprGetAttribute(
              left: left.toProto(),
              attr: attr,
            ),
          ),
        cedar.JsonExprGreaterThan(:final left, :final right) => Expr(
            greaterThan: ExprGreaterThan(
              left: left.toProto(),
              right: right.toProto(),
            ),
          ),
        cedar.JsonExprGreaterThanOrEquals(:final left, :final right) => Expr(
            greaterThanOrEquals: ExprGreaterThanOrEquals(
              left: left.toProto(),
              right: right.toProto(),
            ),
          ),
        cedar.JsonExprHasAttribute(:final left, :final attr) => Expr(
            hasAttribute: ExprHasAttribute(
              left: left.toProto(),
              attr: attr,
            ),
          ),
        cedar.JsonExprIfThenElse(:final cond, :final then, :final else$) =>
          Expr(
            ifThenElse: ExprIfThenElse(
              if_: cond.toProto(),
              then: then.toProto(),
              else_: else$.toProto(),
            ),
          ),
        cedar.JsonExprIn(:final left, :final right) => Expr(
            in_: ExprIn(
              left: left.toProto(),
              right: right.toProto(),
            ),
          ),
        cedar.JsonExprIs(:final left, :final entityType, :final inExpr) => Expr(
            is_: ExprIs(
              left: left.toProto(),
              entityType: entityType,
              in_: inExpr?.toProto(),
            ),
          ),
        cedar.JsonExprLessThan(:final left, :final right) => Expr(
            lessThan: ExprLessThan(
              left: left.toProto(),
              right: right.toProto(),
            ),
          ),
        cedar.JsonExprLessThanOrEquals(:final left, :final right) => Expr(
            lessThanOrEquals: ExprLessThanOrEquals(
              left: left.toProto(),
              right: right.toProto(),
            ),
          ),
        cedar.JsonExprLike(:final left, :final pattern) => Expr(
            like: ExprLike(
              left: left.toProto(),
              pattern: pattern,
            ),
          ),
        cedar.JsonExprMinus(:final left, :final right) => Expr(
            minus: ExprMinus(
              left: left.toProto(),
              right: right.toProto(),
            ),
          ),
        cedar.JsonExprNeg(:final arg) => Expr(
            neg: ExprNeg(
              expr: arg.toProto(),
            ),
          ),
        cedar.JsonExprNot(:final arg) => Expr(
            not: ExprNot(
              expr: arg.toProto(),
            ),
          ),
        cedar.JsonExprNotEquals(:final left, :final right) => Expr(
            notEquals: ExprNotEquals(
              left: left.toProto(),
              right: right.toProto(),
            ),
          ),
        cedar.JsonExprOr(:final left, :final right) => Expr(
            or: ExprOr(
              left: left.toProto(),
              right: right.toProto(),
            ),
          ),
        cedar.JsonExprPlus(:final left, :final right) => Expr(
            plus: ExprPlus(
              left: left.toProto(),
              right: right.toProto(),
            ),
          ),
        cedar.JsonExprRecord(:final attributes) => Expr(
            record: ExprRecord(
              attributes: attributes
                  .map((key, value) => MapEntry(key, value.toProto())),
            ),
          ),
        cedar.JsonExprSet(:final expressions) => Expr(
            set: ExprSet(
              expressions: [for (final value in expressions) value.toProto()],
            ),
          ),
        cedar.JsonExprSlot(:final slotId) => Expr(
            slot: ExprSlot(
              slotId: switch (slotId) {
                cedar.CedarSlotId.principal => SlotId.SLOT_ID_PRINCIPAL,
                cedar.CedarSlotId.resource => SlotId.SLOT_ID_RESOURCE,
              },
            ),
          ),
        cedar.JsonExprTimes(:final left, :final right) => Expr(
            times: ExprTimes(
              left: left.toProto(),
              right: right.toProto(),
            ),
          ),
        cedar.JsonExprUnknown(:final name) => Expr(
            unknown: ExprUnknown(
              name: name,
            ),
          ),
        cedar.JsonExprValue(:final value) => Expr(
            value: ExprValue(
              value: value.toProto(),
            ),
          ),
        cedar.JsonExprVariable(:final variable) => Expr(
            var_: ExprVar(
              variable: switch (variable) {
                cedar.CedarVariable.action => Variable.VARIABLE_ACTION,
                cedar.CedarVariable.context => Variable.VARIABLE_CONTEXT,
                cedar.CedarVariable.principal => Variable.VARIABLE_PRINCIPAL,
                cedar.CedarVariable.resource => Variable.VARIABLE_RESOURCE,
              },
            ),
          ),
      };
}
