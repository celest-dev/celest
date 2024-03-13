/// Provides builders and serializers for Cedar policies which conform to the
/// official JSON format.
///
/// See:
/// - https://docs.cedarpolicy.com/auth/authorization.html
/// - https://docs.cedarpolicy.com/policies/json-format.html
library;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:cedar/cedar.dart';

part 'cedar_policy.g.dart';

class CedarPolicyEffect extends EnumClass {
  const CedarPolicyEffect._(super.name);

  static const CedarPolicyEffect permit = _$permit;
  static const CedarPolicyEffect forbid = _$forbid;

  static BuiltSet<CedarPolicyEffect> get values => _$CedarPolicyEffectValues;
  static CedarPolicyEffect valueOf(String name) =>
      _$CedarPolicyEffectValueOf(name);

  static CedarPolicyEffect fromJson(String json) =>
      _$CedarPolicyEffectValueOf(json);

  String toJson() => name;

  static Serializer<CedarPolicyEffect> get serializer =>
      _$cedarPolicyEffectSerializer;
}

class CedarPolicyOp extends EnumClass {
  const CedarPolicyOp._(super.name);

  @BuiltValueEnumConst(wireName: 'All')
  static const CedarPolicyOp all = _$all;

  @BuiltValueEnumConst(wireName: '==')
  static const CedarPolicyOp equals = _$equals;

  @BuiltValueEnumConst(wireName: 'in')
  static const CedarPolicyOp in$ = _$in$;

  @BuiltValueEnumConst(wireName: 'is')
  static const CedarPolicyOp is$ = _$is$;

  static BuiltSet<CedarPolicyOp> get values => _$CedarPolicyOpValues;
  static CedarPolicyOp valueOf(String name) => _$CedarPolicyOpValueOf(name);

  static CedarPolicyOp fromJson(String json) =>
      cedarSerializers.deserializeWith(CedarPolicyOp.serializer, json)!;

  String toJson() =>
      cedarSerializers.serializeWith(CedarPolicyOp.serializer, this) as String;

  static Serializer<CedarPolicyOp> get serializer => _$cedarPolicyOpSerializer;
}

class CedarPolicyConditionKind extends EnumClass {
  const CedarPolicyConditionKind._(super.name);

  static const CedarPolicyConditionKind when = _$when;
  static const CedarPolicyConditionKind unless = _$unless;

  static BuiltSet<CedarPolicyConditionKind> get values =>
      _$CedarPolicyConditionKindValues;
  static CedarPolicyConditionKind valueOf(String name) =>
      _$CedarPolicyConditionKindValueOf(name);

  static CedarPolicyConditionKind fromJson(String json) =>
      _$CedarPolicyConditionKindValueOf(json);

  String toJson() => name;

  static Serializer<CedarPolicyConditionKind> get serializer =>
      _$cedarPolicyConditionKindSerializer;
}

class CedarSlotId extends EnumClass {
  const CedarSlotId._(super.name);

  @BuiltValueEnumConst(wireName: '?principal')
  static const CedarSlotId principal = _$principal;

  @BuiltValueEnumConst(wireName: '?resource')
  static const CedarSlotId resource = _$resource;

  static BuiltSet<CedarSlotId> get values => _$CedarSlotIdValues;
  static CedarSlotId valueOf(String name) => _$CedarSlotIdValueOf(name);

  static CedarSlotId fromJson(String json) =>
      cedarSerializers.deserializeWith(CedarSlotId.serializer, json)!;

  String toJson() =>
      cedarSerializers.serializeWith(CedarSlotId.serializer, this) as String;

  static Serializer<CedarSlotId> get serializer => _$cedarSlotIdSerializer;
}

abstract class CedarPolicy implements Built<CedarPolicy, CedarPolicyBuilder> {
  factory CedarPolicy({
    required CedarPolicyEffect effect,
    required CedarPolicyPrincipal principal,
    required CedarPolicyAction action,
    required CedarPolicyResource resource,
    List<CedarPolicyCondition> conditions = const [],
    Map<String, String>? annotations,
  }) {
    return _$CedarPolicy._(
      effect: effect,
      principal: principal,
      action: action,
      resource: resource,
      conditions: conditions.build(),
      annotations: annotations?.build(),
    );
  }

  factory CedarPolicy.fromJson(Map<String, dynamic> json) {
    return CedarPolicy(
      effect: CedarPolicyEffect.fromJson(json['effect'] as String),
      principal: CedarPolicyPrincipal.fromJson(
        json['principal'] as Map<String, Object?>,
      ),
      action: CedarPolicyAction.fromJson(
        json['action'] as Map<String, Object?>,
      ),
      resource: CedarPolicyResource.fromJson(
        json['resource'] as Map<String, Object?>,
      ),
      conditions: (json['conditions'] as List<Object?>)
          .map((c) => CedarPolicyCondition.fromJson(c as Map<String, Object?>))
          .toList(),
      annotations: (json['annotations'] as Map<String, Object?>?)?.cast(),
    );
  }

  factory CedarPolicy.build([
    void Function(CedarPolicyBuilder) updates,
  ]) = _$CedarPolicy;
  CedarPolicy._();

  CedarPolicyEffect get effect;
  CedarPolicyPrincipal get principal;
  CedarPolicyAction get action;
  CedarPolicyResource get resource;
  BuiltList<CedarPolicyCondition> get conditions;
  BuiltMap<String, String>? get annotations;

  bool get isTemplate => principal.slot != null || resource.slot != null;

  Map<String, Object?> toJson() => {
        'effect': effect.toJson(),
        'principal': principal.toJson(),
        'action': action.toJson(),
        'resource': resource.toJson(),
        'conditions': conditions.map((c) => c.toJson()).toList(),
        if (annotations != null) 'annotations': annotations!.toMap(),
      };

  static Serializer<CedarPolicy> get serializer => _$cedarPolicySerializer;
}

abstract class CedarPolicyPrincipal
    implements Built<CedarPolicyPrincipal, CedarPolicyPrincipalBuilder> {
  factory CedarPolicyPrincipal({
    required CedarPolicyOp op,
    CedarEntityId? entity,
    String? entityType,
    CedarSlotId? slot,
  }) {
    return CedarPolicyPrincipal.build((b) {
      b
        ..op = op
        ..entityType = entityType
        ..slot = slot;
      if (entity != null) {
        b.entity.replace(entity);
      }
    });
  }

  factory CedarPolicyPrincipal.fromJson(Map<String, Object?> json) {
    return CedarPolicyPrincipal(
      op: CedarPolicyOp.fromJson(json['op'] as String),
      entity: json['entity'] == null
          ? null
          : CedarEntityId.fromJson(json['entity'] as Map<String, Object?>),
      entityType: json['entity_type'] as String?,
      slot: json['slot'] == null
          ? null
          : CedarSlotId.fromJson(json['slot'] as String),
    );
  }

  factory CedarPolicyPrincipal.build([
    void Function(CedarPolicyPrincipalBuilder) updates,
  ]) = _$CedarPolicyPrincipal;
  CedarPolicyPrincipal._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(CedarPolicyPrincipalBuilder policy) {
    switch (policy.op) {
      case CedarPolicyOp.all:
        _expectAbsent('entity', policy._entity);
        _expectAbsent('entityType', policy.entityType);
        _expectAbsent('slot', policy.slot);
      case CedarPolicyOp.equals:
        if (policy._entity == null && policy.slot == null) {
          throw ArgumentError(
            'entity and slot must be specified for op equals',
          );
        }
        _expectAbsent('entityType', policy.entityType);
      case CedarPolicyOp.in$:
        if (policy._entity == null && policy.slot == null) {
          throw ArgumentError(
            'entity and slot must be specified for op in',
          );
        }
        _expectAbsent('entityType', policy.entityType);
      case CedarPolicyOp.is$:
        _expectPresent('entityType', policy.entityType);
        _expectAbsent('entity', policy._entity);
        _expectAbsent('slot', policy.slot);
      default:
        throw ArgumentError.value(policy.op, 'op', 'Invalid op for principal');
    }
  }

  CedarPolicyOp get op;
  CedarEntityId? get entity;

  @BuiltValueField(wireName: 'entity_type')
  String? get entityType;
  CedarSlotId? get slot;

  Map<String, Object?> toJson() => {
        'op': op.toJson(),
        if (entity != null) 'entity': entity!.toJson(),
        if (entityType != null) 'entity_type': entityType,
        if (slot != null) 'slot': slot!.toJson(),
      };

  static Serializer<CedarPolicyPrincipal> get serializer =>
      _$cedarPolicyPrincipalSerializer;
}

abstract class CedarPolicyAction
    implements Built<CedarPolicyAction, CedarPolicyActionBuilder> {
  factory CedarPolicyAction({
    required CedarPolicyOp op,
    CedarEntityId? entity,
    List<CedarEntityId>? entities,
  }) {
    return CedarPolicyAction.build((b) {
      b.op = op;
      if (entity != null) {
        b.entity.replace(entity);
      }
      if (entities != null) {
        b.entities.addAll(entities);
      }
    });
  }

  factory CedarPolicyAction.build([
    void Function(CedarPolicyActionBuilder) updates,
  ]) = _$CedarPolicyAction;
  CedarPolicyAction._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(CedarPolicyActionBuilder policy) {
    void expectNoEntities() {
      if (policy._entities case final entities? when entities.isNotEmpty) {
        throw ArgumentError.value(
          policy._entities,
          'entities',
          'Should be empty',
        );
      }
    }

    switch (policy.op) {
      case CedarPolicyOp.all:
        _expectAbsent('entity', policy._entity);
        expectNoEntities();
      case CedarPolicyOp.equals:
        _expectPresent('entity', policy._entity);
        expectNoEntities();
      case CedarPolicyOp.in$:
        if (policy._entity != null) {
          expectNoEntities();
        } else if (policy._entities != null) {
          _expectAbsent('entity', policy._entity);
        } else {
          throw ArgumentError(
            'Either entity or entities must be specified',
          );
        }
      case CedarPolicyOp.is$:
      default:
        throw ArgumentError.value(policy.op, 'op', 'Invalid op for action');
    }
  }

  CedarPolicyOp get op;
  CedarEntityId? get entity;
  BuiltList<CedarEntityId>? get entities;

  Map<String, Object?> toJson() => {
        'op': op.toJson(),
        if (entity != null) 'entity': entity!.toJson(),
        if (entities != null && op == CedarPolicyOp.in$)
          'entities': entities!.map((e) => e.toJson()).toList(),
      };

  static CedarPolicyAction fromJson(Map<String, Object?> json) {
    return CedarPolicyAction(
      op: CedarPolicyOp.fromJson(json['op'] as String),
      entity: json['entity'] == null
          ? null
          : CedarEntityId.fromJson(json['entity'] as Map<String, Object?>),
      entities: (json['entities'] as List<Object?>?)
          ?.map((e) => CedarEntityId.fromJson(e as Map<String, Object?>))
          .toList(),
    );
  }

  static Serializer<CedarPolicyAction> get serializer =>
      _$cedarPolicyActionSerializer;
}

abstract class CedarPolicyResource
    implements Built<CedarPolicyResource, CedarPolicyResourceBuilder> {
  factory CedarPolicyResource({
    required CedarPolicyOp op,
    CedarEntityId? entity,
    String? entityType,
    CedarSlotId? slot,
  }) {
    return CedarPolicyResource.build((b) {
      b
        ..op = op
        ..entityType = entityType
        ..slot = slot;
      if (entity != null) {
        b.entity.replace(entity);
      }
    });
  }

  factory CedarPolicyResource.build([
    void Function(CedarPolicyResourceBuilder) updates,
  ]) = _$CedarPolicyResource;
  CedarPolicyResource._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(CedarPolicyResourceBuilder policy) {
    switch (policy.op) {
      case CedarPolicyOp.all:
        _expectAbsent('entity', policy._entity);
        _expectAbsent('entityType', policy.entityType);
        _expectAbsent('slot', policy.slot);
      case CedarPolicyOp.equals:
        if (policy._entity == null && policy.slot == null) {
          throw ArgumentError(
            'entity and slot must be specified for op equals',
          );
        }
        _expectAbsent('entityType', policy.entityType);
      case CedarPolicyOp.in$:
        if (policy._entity == null && policy.slot == null) {
          throw ArgumentError(
            'entity and slot must be specified for op in',
          );
        }
        _expectAbsent('entityType', policy.entityType);
      case CedarPolicyOp.is$:
        _expectPresent('entityType', policy.entityType);
        _expectAbsent('entity', policy._entity);
        _expectAbsent('slot', policy.slot);
      default:
        throw ArgumentError.value(policy.op, 'op', 'Invalid op for resource');
    }
  }

  CedarPolicyOp get op;
  CedarEntityId? get entity;

  @BuiltValueField(wireName: 'entity_type')
  String? get entityType;
  CedarSlotId? get slot;

  Map<String, Object?> toJson() => {
        'op': op.toJson(),
        if (entity != null) 'entity': entity!.toJson(),
        if (entityType != null) 'entity_type': entityType,
        if (slot != null) 'slot': slot!.toJson(),
      };

  factory CedarPolicyResource.fromJson(Map<String, Object?> json) {
    return CedarPolicyResource(
      op: CedarPolicyOp.fromJson(json['op'] as String),
      entity: json['entity'] == null
          ? null
          : CedarEntityId.fromJson(json['entity'] as Map<String, Object?>),
      entityType: json['entity_type'] as String?,
      slot: json['slot'] == null
          ? null
          : CedarSlotId.fromJson(json['slot'] as String),
    );
  }

  static Serializer<CedarPolicyResource> get serializer =>
      _$cedarPolicyResourceSerializer;
}

abstract class CedarPolicyCondition
    implements Built<CedarPolicyCondition, CedarPolicyConditionBuilder> {
  factory CedarPolicyCondition({
    required CedarPolicyConditionKind kind,
    required JsonExpr body,
  }) {
    return _$CedarPolicyCondition._(
      kind: kind,
      bodyJson: JsonObject(body.toJson()),
    );
  }

  factory CedarPolicyCondition.build([
    void Function(CedarPolicyConditionBuilder) updates,
  ]) = _$CedarPolicyCondition;
  CedarPolicyCondition._();

  CedarPolicyConditionKind get kind;

  @BuiltValueField(wireName: 'body')
  JsonObject get bodyJson;

  JsonExpr get body => JsonExpr.fromJson(bodyJson.asMap.cast());

  Map<String, Object?> toJson() => {
        'kind': kind.toJson(),
        'body': bodyJson.asMap,
      };

  factory CedarPolicyCondition.fromJson(Map<String, Object?> json) =>
      CedarPolicyCondition.build(
        (b) => b
          ..kind = CedarPolicyConditionKind.fromJson(json['kind'] as String)
          ..bodyJson = JsonObject(json['body'] as Map<String, Object?>),
      );

  static Serializer<CedarPolicyCondition> get serializer =>
      _$cedarPolicyConditionSerializer;
}

void _expectPresent(String name, Object? value) {
  if (value == null) {
    throw ArgumentError.notNull(name);
  }
}

void _expectAbsent(String name, Object? value) {
  if (value != null) {
    throw ArgumentError.value(
      value,
      name,
      'Should be absent',
    );
  }
}
