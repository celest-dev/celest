/// Provides builders and serializers for Cedar policies which conform to the
/// official JSON format: https://docs.cedarpolicy.com/policies/json-format.html.
library;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:cedar_common/cedar_common.dart';

part 'cedar_policy.g.dart';

enum CedarPolicyEffect {
  permit,
  forbid;

  factory CedarPolicyEffect.fromJson(String json) => values.byName(json);

  String toJson() => name;
}

enum CedarPolicyOp {
  all('All'),
  equals('=='),
  in$('in'),
  is$('is');

  const CedarPolicyOp(this.name);

  factory CedarPolicyOp.fromJson(String json) => values.firstWhere(
        (op) => op.name == json,
        orElse: () => throw ArgumentError.value(
          json,
          'json',
          'Invalid CedarPolicyOp. Expected one of: ${values.map((v) => v.name).join(', ')}',
        ),
      );

  final String name;

  String toJson() => name;
}

enum CedarPolicyConditionKind {
  when,
  unless;

  factory CedarPolicyConditionKind.fromJson(String json) => values.byName(json);

  String toJson() => name;
}

abstract class CedarPolicy implements Built<CedarPolicy, CedarPolicyBuilder> {
  factory CedarPolicy({
    String? id,
    required CedarPolicyEffect effect,
    required CedarPolicyPrincipal principal,
    required CedarPolicyAction action,
    required CedarPolicyResource resource,
    required List<CedarPolicyCondition> conditions,
    Map<String, String>? annotations,
  }) {
    return _$CedarPolicy._(
      id: id,
      effect: effect,
      principal: principal,
      action: action,
      resource: resource,
      conditions: conditions.build(),
      annotations: annotations?.build(),
    );
  }

  factory CedarPolicy.build([
    void Function(CedarPolicyBuilder) updates,
  ]) = _$CedarPolicy;
  CedarPolicy._();

  /// An optional name to uniquely identify the policy when performing
  /// authorization checks later.
  @BuiltValueField(serialize: false)
  String? get id;

  CedarPolicyEffect get effect;
  CedarPolicyPrincipal get principal;
  CedarPolicyAction get action;
  CedarPolicyResource get resource;
  BuiltList<CedarPolicyCondition> get conditions;
  BuiltMap<String, String>? get annotations;

  Map<String, Object?> toJson() => {
        'effect': effect.toJson(),
        'principal': principal.toJson(),
        'action': action.toJson(),
        'resource': resource.toJson(),
        'conditions': conditions.map((c) => c.toJson()).toList(),
        if (annotations != null) 'annotations': annotations!.toMap(),
      };

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
}

abstract class CedarPolicyPrincipal
    implements Built<CedarPolicyPrincipal, CedarPolicyPrincipalBuilder> {
  factory CedarPolicyPrincipal({
    required CedarPolicyOp op,
    CedarEntityId? entity,
    String? entityType,
  }) {
    return CedarPolicyPrincipal.build(
      (b) => b
        ..op = op
        ..entity = entity
        ..entityType = entityType,
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
        _expectAbsent('entity', policy.entity);
        _expectAbsent('entityType', policy.entityType);
      case CedarPolicyOp.equals:
        _expectPresent('entity', policy.entity);
        _expectAbsent('entityType', policy.entityType);
      case CedarPolicyOp.in$:
        _expectPresent('entity', policy.entity);
        _expectAbsent('entityType', policy.entityType);
      case CedarPolicyOp.is$:
        _expectPresent('entityType', policy.entityType);
        _expectAbsent('entity', policy.entity);
      default:
        throw ArgumentError.value(policy.op, 'op', 'Invalid op for principal');
    }
  }

  CedarPolicyOp get op;
  CedarEntityId? get entity;

  @BuiltValueField(wireName: 'entity_type')
  String? get entityType;

  Map<String, Object?> toJson() => {
        'op': op.toJson(),
        if (entity != null) 'entity': entity!.toJson(),
        if (entityType != null) 'entity_type': entityType,
      };

  factory CedarPolicyPrincipal.fromJson(Map<String, Object?> json) {
    return CedarPolicyPrincipal(
      op: CedarPolicyOp.fromJson(json['op'] as String),
      entity: json['entity'] == null
          ? null
          : CedarEntityId.fromJson(json['entity'] as Map<String, Object?>),
      entityType: json['entity_type'] as String?,
    );
  }
}

abstract class CedarPolicyAction
    implements Built<CedarPolicyAction, CedarPolicyActionBuilder> {
  factory CedarPolicyAction({
    required CedarPolicyOp op,
    CedarEntityId? entity,
    List<CedarEntityId>? entities,
  }) {
    return CedarPolicyAction.build((b) {
      b
        ..op = op
        ..entity = entity;
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
        _expectAbsent('entity', policy.entity);
        expectNoEntities();
      case CedarPolicyOp.equals:
        _expectPresent('entity', policy.entity);
        expectNoEntities();
      case CedarPolicyOp.in$:
        if (policy.entity != null) {
          expectNoEntities();
        } else if (policy._entities != null) {
          _expectAbsent('entity', policy.entity);
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
}

abstract class CedarPolicyResource
    implements Built<CedarPolicyResource, CedarPolicyResourceBuilder> {
  factory CedarPolicyResource({
    required CedarPolicyOp op,
    CedarEntityId? entity,
    String? entityType,
  }) {
    return CedarPolicyResource.build((b) {
      b
        ..op = op
        ..entity = entity
        ..entityType = entityType;
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
        _expectAbsent('entity', policy.entity);
        _expectAbsent('entityType', policy.entityType);
      case CedarPolicyOp.equals:
        _expectPresent('entity', policy.entity);
        _expectAbsent('entityType', policy.entityType);
      case CedarPolicyOp.in$:
        _expectPresent('entity', policy.entity);
        _expectAbsent('entityType', policy.entityType);
      case CedarPolicyOp.is$:
        _expectPresent('entityType', policy.entityType);
        _expectAbsent('entity', policy.entity);
      default:
        throw ArgumentError.value(policy.op, 'op', 'Invalid op for resource');
    }
  }

  CedarPolicyOp get op;
  CedarEntityId? get entity;

  @BuiltValueField(wireName: 'entity_type')
  String? get entityType;

  Map<String, Object?> toJson() => {
        'op': op.toJson(),
        if (entity != null) 'entity': entity!.toJson(),
        if (entityType != null) 'entity_type': entityType,
      };

  factory CedarPolicyResource.fromJson(Map<String, Object?> json) {
    return CedarPolicyResource(
      op: CedarPolicyOp.fromJson(json['op'] as String),
      entity: json['entity'] == null
          ? null
          : CedarEntityId.fromJson(json['entity'] as Map<String, Object?>),
      entityType: json['entity_type'] as String?,
    );
  }
}

abstract class CedarPolicyCondition
    implements Built<CedarPolicyCondition, CedarPolicyConditionBuilder> {
  factory CedarPolicyCondition({
    required CedarPolicyConditionKind kind,
    required JsonExpr body,
  }) {
    return _$CedarPolicyCondition._(kind: kind, body: body);
  }

  factory CedarPolicyCondition.build([
    void Function(CedarPolicyConditionBuilder) updates,
  ]) = _$CedarPolicyCondition;
  CedarPolicyCondition._();

  CedarPolicyConditionKind get kind;
  JsonExpr get body;

  Map<String, Object?> toJson() => {
        'kind': kind.toJson(),
        'body': body.toJson(),
      };

  factory CedarPolicyCondition.fromJson(Map<String, Object?> json) =>
      CedarPolicyCondition(
        kind: CedarPolicyConditionKind.fromJson(json['kind'] as String),
        body: JsonExpr.fromJson(json['body'] as Map<String, Object?>),
      );
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
