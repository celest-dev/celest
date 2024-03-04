// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cedar_policy.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CedarPolicy extends CedarPolicy {
  @override
  final String? id;
  @override
  final CedarPolicyEffect effect;
  @override
  final CedarPolicyPrincipal principal;
  @override
  final CedarPolicyAction action;
  @override
  final CedarPolicyResource resource;
  @override
  final BuiltList<CedarPolicyCondition> conditions;
  @override
  final BuiltMap<String, String>? annotations;

  factory _$CedarPolicy([void Function(CedarPolicyBuilder)? updates]) =>
      (new CedarPolicyBuilder()..update(updates))._build();

  _$CedarPolicy._(
      {this.id,
      required this.effect,
      required this.principal,
      required this.action,
      required this.resource,
      required this.conditions,
      this.annotations})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(effect, r'CedarPolicy', 'effect');
    BuiltValueNullFieldError.checkNotNull(
        principal, r'CedarPolicy', 'principal');
    BuiltValueNullFieldError.checkNotNull(action, r'CedarPolicy', 'action');
    BuiltValueNullFieldError.checkNotNull(resource, r'CedarPolicy', 'resource');
    BuiltValueNullFieldError.checkNotNull(
        conditions, r'CedarPolicy', 'conditions');
  }

  @override
  CedarPolicy rebuild(void Function(CedarPolicyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CedarPolicyBuilder toBuilder() => new CedarPolicyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CedarPolicy &&
        id == other.id &&
        effect == other.effect &&
        principal == other.principal &&
        action == other.action &&
        resource == other.resource &&
        conditions == other.conditions &&
        annotations == other.annotations;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, effect.hashCode);
    _$hash = $jc(_$hash, principal.hashCode);
    _$hash = $jc(_$hash, action.hashCode);
    _$hash = $jc(_$hash, resource.hashCode);
    _$hash = $jc(_$hash, conditions.hashCode);
    _$hash = $jc(_$hash, annotations.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CedarPolicy')
          ..add('id', id)
          ..add('effect', effect)
          ..add('principal', principal)
          ..add('action', action)
          ..add('resource', resource)
          ..add('conditions', conditions)
          ..add('annotations', annotations))
        .toString();
  }
}

class CedarPolicyBuilder implements Builder<CedarPolicy, CedarPolicyBuilder> {
  _$CedarPolicy? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  CedarPolicyEffect? _effect;
  CedarPolicyEffect? get effect => _$this._effect;
  set effect(CedarPolicyEffect? effect) => _$this._effect = effect;

  CedarPolicyPrincipalBuilder? _principal;
  CedarPolicyPrincipalBuilder get principal =>
      _$this._principal ??= new CedarPolicyPrincipalBuilder();
  set principal(CedarPolicyPrincipalBuilder? principal) =>
      _$this._principal = principal;

  CedarPolicyActionBuilder? _action;
  CedarPolicyActionBuilder get action =>
      _$this._action ??= new CedarPolicyActionBuilder();
  set action(CedarPolicyActionBuilder? action) => _$this._action = action;

  CedarPolicyResourceBuilder? _resource;
  CedarPolicyResourceBuilder get resource =>
      _$this._resource ??= new CedarPolicyResourceBuilder();
  set resource(CedarPolicyResourceBuilder? resource) =>
      _$this._resource = resource;

  ListBuilder<CedarPolicyCondition>? _conditions;
  ListBuilder<CedarPolicyCondition> get conditions =>
      _$this._conditions ??= new ListBuilder<CedarPolicyCondition>();
  set conditions(ListBuilder<CedarPolicyCondition>? conditions) =>
      _$this._conditions = conditions;

  MapBuilder<String, String>? _annotations;
  MapBuilder<String, String> get annotations =>
      _$this._annotations ??= new MapBuilder<String, String>();
  set annotations(MapBuilder<String, String>? annotations) =>
      _$this._annotations = annotations;

  CedarPolicyBuilder();

  CedarPolicyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _effect = $v.effect;
      _principal = $v.principal.toBuilder();
      _action = $v.action.toBuilder();
      _resource = $v.resource.toBuilder();
      _conditions = $v.conditions.toBuilder();
      _annotations = $v.annotations?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CedarPolicy other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CedarPolicy;
  }

  @override
  void update(void Function(CedarPolicyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CedarPolicy build() => _build();

  _$CedarPolicy _build() {
    _$CedarPolicy _$result;
    try {
      _$result = _$v ??
          new _$CedarPolicy._(
              id: id,
              effect: BuiltValueNullFieldError.checkNotNull(
                  effect, r'CedarPolicy', 'effect'),
              principal: principal.build(),
              action: action.build(),
              resource: resource.build(),
              conditions: conditions.build(),
              annotations: _annotations?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'principal';
        principal.build();
        _$failedField = 'action';
        action.build();
        _$failedField = 'resource';
        resource.build();
        _$failedField = 'conditions';
        conditions.build();
        _$failedField = 'annotations';
        _annotations?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CedarPolicy', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CedarPolicyPrincipal extends CedarPolicyPrincipal {
  @override
  final CedarPolicyOp op;
  @override
  final CedarEntityId? entity;
  @override
  final String? entityType;

  factory _$CedarPolicyPrincipal(
          [void Function(CedarPolicyPrincipalBuilder)? updates]) =>
      (new CedarPolicyPrincipalBuilder()..update(updates))._build();

  _$CedarPolicyPrincipal._({required this.op, this.entity, this.entityType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(op, r'CedarPolicyPrincipal', 'op');
  }

  @override
  CedarPolicyPrincipal rebuild(
          void Function(CedarPolicyPrincipalBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CedarPolicyPrincipalBuilder toBuilder() =>
      new CedarPolicyPrincipalBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CedarPolicyPrincipal &&
        op == other.op &&
        entity == other.entity &&
        entityType == other.entityType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, op.hashCode);
    _$hash = $jc(_$hash, entity.hashCode);
    _$hash = $jc(_$hash, entityType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CedarPolicyPrincipal')
          ..add('op', op)
          ..add('entity', entity)
          ..add('entityType', entityType))
        .toString();
  }
}

class CedarPolicyPrincipalBuilder
    implements Builder<CedarPolicyPrincipal, CedarPolicyPrincipalBuilder> {
  _$CedarPolicyPrincipal? _$v;

  CedarPolicyOp? _op;
  CedarPolicyOp? get op => _$this._op;
  set op(CedarPolicyOp? op) => _$this._op = op;

  CedarEntityId? _entity;
  CedarEntityId? get entity => _$this._entity;
  set entity(CedarEntityId? entity) => _$this._entity = entity;

  String? _entityType;
  String? get entityType => _$this._entityType;
  set entityType(String? entityType) => _$this._entityType = entityType;

  CedarPolicyPrincipalBuilder();

  CedarPolicyPrincipalBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _op = $v.op;
      _entity = $v.entity;
      _entityType = $v.entityType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CedarPolicyPrincipal other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CedarPolicyPrincipal;
  }

  @override
  void update(void Function(CedarPolicyPrincipalBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CedarPolicyPrincipal build() => _build();

  _$CedarPolicyPrincipal _build() {
    CedarPolicyPrincipal._validate(this);
    final _$result = _$v ??
        new _$CedarPolicyPrincipal._(
            op: BuiltValueNullFieldError.checkNotNull(
                op, r'CedarPolicyPrincipal', 'op'),
            entity: entity,
            entityType: entityType);
    replace(_$result);
    return _$result;
  }
}

class _$CedarPolicyAction extends CedarPolicyAction {
  @override
  final CedarPolicyOp op;
  @override
  final CedarEntityId? entity;
  @override
  final BuiltList<CedarEntityId>? entities;

  factory _$CedarPolicyAction(
          [void Function(CedarPolicyActionBuilder)? updates]) =>
      (new CedarPolicyActionBuilder()..update(updates))._build();

  _$CedarPolicyAction._({required this.op, this.entity, this.entities})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(op, r'CedarPolicyAction', 'op');
  }

  @override
  CedarPolicyAction rebuild(void Function(CedarPolicyActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CedarPolicyActionBuilder toBuilder() =>
      new CedarPolicyActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CedarPolicyAction &&
        op == other.op &&
        entity == other.entity &&
        entities == other.entities;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, op.hashCode);
    _$hash = $jc(_$hash, entity.hashCode);
    _$hash = $jc(_$hash, entities.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CedarPolicyAction')
          ..add('op', op)
          ..add('entity', entity)
          ..add('entities', entities))
        .toString();
  }
}

class CedarPolicyActionBuilder
    implements Builder<CedarPolicyAction, CedarPolicyActionBuilder> {
  _$CedarPolicyAction? _$v;

  CedarPolicyOp? _op;
  CedarPolicyOp? get op => _$this._op;
  set op(CedarPolicyOp? op) => _$this._op = op;

  CedarEntityId? _entity;
  CedarEntityId? get entity => _$this._entity;
  set entity(CedarEntityId? entity) => _$this._entity = entity;

  ListBuilder<CedarEntityId>? _entities;
  ListBuilder<CedarEntityId> get entities =>
      _$this._entities ??= new ListBuilder<CedarEntityId>();
  set entities(ListBuilder<CedarEntityId>? entities) =>
      _$this._entities = entities;

  CedarPolicyActionBuilder();

  CedarPolicyActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _op = $v.op;
      _entity = $v.entity;
      _entities = $v.entities?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CedarPolicyAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CedarPolicyAction;
  }

  @override
  void update(void Function(CedarPolicyActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CedarPolicyAction build() => _build();

  _$CedarPolicyAction _build() {
    CedarPolicyAction._validate(this);
    _$CedarPolicyAction _$result;
    try {
      _$result = _$v ??
          new _$CedarPolicyAction._(
              op: BuiltValueNullFieldError.checkNotNull(
                  op, r'CedarPolicyAction', 'op'),
              entity: entity,
              entities: _entities?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entities';
        _entities?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CedarPolicyAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CedarPolicyResource extends CedarPolicyResource {
  @override
  final CedarPolicyOp op;
  @override
  final CedarEntityId? entity;
  @override
  final String? entityType;

  factory _$CedarPolicyResource(
          [void Function(CedarPolicyResourceBuilder)? updates]) =>
      (new CedarPolicyResourceBuilder()..update(updates))._build();

  _$CedarPolicyResource._({required this.op, this.entity, this.entityType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(op, r'CedarPolicyResource', 'op');
  }

  @override
  CedarPolicyResource rebuild(
          void Function(CedarPolicyResourceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CedarPolicyResourceBuilder toBuilder() =>
      new CedarPolicyResourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CedarPolicyResource &&
        op == other.op &&
        entity == other.entity &&
        entityType == other.entityType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, op.hashCode);
    _$hash = $jc(_$hash, entity.hashCode);
    _$hash = $jc(_$hash, entityType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CedarPolicyResource')
          ..add('op', op)
          ..add('entity', entity)
          ..add('entityType', entityType))
        .toString();
  }
}

class CedarPolicyResourceBuilder
    implements Builder<CedarPolicyResource, CedarPolicyResourceBuilder> {
  _$CedarPolicyResource? _$v;

  CedarPolicyOp? _op;
  CedarPolicyOp? get op => _$this._op;
  set op(CedarPolicyOp? op) => _$this._op = op;

  CedarEntityId? _entity;
  CedarEntityId? get entity => _$this._entity;
  set entity(CedarEntityId? entity) => _$this._entity = entity;

  String? _entityType;
  String? get entityType => _$this._entityType;
  set entityType(String? entityType) => _$this._entityType = entityType;

  CedarPolicyResourceBuilder();

  CedarPolicyResourceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _op = $v.op;
      _entity = $v.entity;
      _entityType = $v.entityType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CedarPolicyResource other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CedarPolicyResource;
  }

  @override
  void update(void Function(CedarPolicyResourceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CedarPolicyResource build() => _build();

  _$CedarPolicyResource _build() {
    CedarPolicyResource._validate(this);
    final _$result = _$v ??
        new _$CedarPolicyResource._(
            op: BuiltValueNullFieldError.checkNotNull(
                op, r'CedarPolicyResource', 'op'),
            entity: entity,
            entityType: entityType);
    replace(_$result);
    return _$result;
  }
}

class _$CedarPolicyCondition extends CedarPolicyCondition {
  @override
  final CedarPolicyConditionKind kind;
  @override
  final JsonExpr body;

  factory _$CedarPolicyCondition(
          [void Function(CedarPolicyConditionBuilder)? updates]) =>
      (new CedarPolicyConditionBuilder()..update(updates))._build();

  _$CedarPolicyCondition._({required this.kind, required this.body})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        kind, r'CedarPolicyCondition', 'kind');
    BuiltValueNullFieldError.checkNotNull(
        body, r'CedarPolicyCondition', 'body');
  }

  @override
  CedarPolicyCondition rebuild(
          void Function(CedarPolicyConditionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CedarPolicyConditionBuilder toBuilder() =>
      new CedarPolicyConditionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CedarPolicyCondition &&
        kind == other.kind &&
        body == other.body;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CedarPolicyCondition')
          ..add('kind', kind)
          ..add('body', body))
        .toString();
  }
}

class CedarPolicyConditionBuilder
    implements Builder<CedarPolicyCondition, CedarPolicyConditionBuilder> {
  _$CedarPolicyCondition? _$v;

  CedarPolicyConditionKind? _kind;
  CedarPolicyConditionKind? get kind => _$this._kind;
  set kind(CedarPolicyConditionKind? kind) => _$this._kind = kind;

  JsonExpr? _body;
  JsonExpr? get body => _$this._body;
  set body(JsonExpr? body) => _$this._body = body;

  CedarPolicyConditionBuilder();

  CedarPolicyConditionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kind = $v.kind;
      _body = $v.body;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CedarPolicyCondition other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CedarPolicyCondition;
  }

  @override
  void update(void Function(CedarPolicyConditionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CedarPolicyCondition build() => _build();

  _$CedarPolicyCondition _build() {
    final _$result = _$v ??
        new _$CedarPolicyCondition._(
            kind: BuiltValueNullFieldError.checkNotNull(
                kind, r'CedarPolicyCondition', 'kind'),
            body: BuiltValueNullFieldError.checkNotNull(
                body, r'CedarPolicyCondition', 'body'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
