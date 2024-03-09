// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cedar_policy.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CedarPolicyEffect _$permit = const CedarPolicyEffect._('permit');
const CedarPolicyEffect _$forbid = const CedarPolicyEffect._('forbid');

CedarPolicyEffect _$CedarPolicyEffectValueOf(String name) {
  switch (name) {
    case 'permit':
      return _$permit;
    case 'forbid':
      return _$forbid;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CedarPolicyEffect> _$CedarPolicyEffectValues =
    new BuiltSet<CedarPolicyEffect>(const <CedarPolicyEffect>[
  _$permit,
  _$forbid,
]);

const CedarPolicyOp _$all = const CedarPolicyOp._('all');
const CedarPolicyOp _$equals = const CedarPolicyOp._('equals');
const CedarPolicyOp _$in$ = const CedarPolicyOp._('in\$');
const CedarPolicyOp _$is$ = const CedarPolicyOp._('is\$');

CedarPolicyOp _$CedarPolicyOpValueOf(String name) {
  switch (name) {
    case 'all':
      return _$all;
    case 'equals':
      return _$equals;
    case 'in\$':
      return _$in$;
    case 'is\$':
      return _$is$;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CedarPolicyOp> _$CedarPolicyOpValues =
    new BuiltSet<CedarPolicyOp>(const <CedarPolicyOp>[
  _$all,
  _$equals,
  _$in$,
  _$is$,
]);

const CedarPolicyConditionKind _$when =
    const CedarPolicyConditionKind._('when');
const CedarPolicyConditionKind _$unless =
    const CedarPolicyConditionKind._('unless');

CedarPolicyConditionKind _$CedarPolicyConditionKindValueOf(String name) {
  switch (name) {
    case 'when':
      return _$when;
    case 'unless':
      return _$unless;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CedarPolicyConditionKind> _$CedarPolicyConditionKindValues =
    new BuiltSet<CedarPolicyConditionKind>(const <CedarPolicyConditionKind>[
  _$when,
  _$unless,
]);

Serializer<CedarPolicyEffect> _$cedarPolicyEffectSerializer =
    new _$CedarPolicyEffectSerializer();
Serializer<CedarPolicyOp> _$cedarPolicyOpSerializer =
    new _$CedarPolicyOpSerializer();
Serializer<CedarPolicyConditionKind> _$cedarPolicyConditionKindSerializer =
    new _$CedarPolicyConditionKindSerializer();
Serializer<CedarPolicy> _$cedarPolicySerializer = new _$CedarPolicySerializer();
Serializer<CedarPolicyPrincipal> _$cedarPolicyPrincipalSerializer =
    new _$CedarPolicyPrincipalSerializer();
Serializer<CedarPolicyAction> _$cedarPolicyActionSerializer =
    new _$CedarPolicyActionSerializer();
Serializer<CedarPolicyResource> _$cedarPolicyResourceSerializer =
    new _$CedarPolicyResourceSerializer();
Serializer<CedarPolicyCondition> _$cedarPolicyConditionSerializer =
    new _$CedarPolicyConditionSerializer();

class _$CedarPolicyEffectSerializer
    implements PrimitiveSerializer<CedarPolicyEffect> {
  @override
  final Iterable<Type> types = const <Type>[CedarPolicyEffect];
  @override
  final String wireName = 'CedarPolicyEffect';

  @override
  Object serialize(Serializers serializers, CedarPolicyEffect object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  CedarPolicyEffect deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CedarPolicyEffect.valueOf(serialized as String);
}

class _$CedarPolicyOpSerializer implements PrimitiveSerializer<CedarPolicyOp> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'all': 'All',
    'equals': '==',
    'in\$': 'in',
    'is\$': 'is',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'All': 'all',
    '==': 'equals',
    'in': 'in\$',
    'is': 'is\$',
  };

  @override
  final Iterable<Type> types = const <Type>[CedarPolicyOp];
  @override
  final String wireName = 'CedarPolicyOp';

  @override
  Object serialize(Serializers serializers, CedarPolicyOp object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CedarPolicyOp deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CedarPolicyOp.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CedarPolicyConditionKindSerializer
    implements PrimitiveSerializer<CedarPolicyConditionKind> {
  @override
  final Iterable<Type> types = const <Type>[CedarPolicyConditionKind];
  @override
  final String wireName = 'CedarPolicyConditionKind';

  @override
  Object serialize(Serializers serializers, CedarPolicyConditionKind object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  CedarPolicyConditionKind deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CedarPolicyConditionKind.valueOf(serialized as String);
}

class _$CedarPolicySerializer implements StructuredSerializer<CedarPolicy> {
  @override
  final Iterable<Type> types = const [CedarPolicy, _$CedarPolicy];
  @override
  final String wireName = 'CedarPolicy';

  @override
  Iterable<Object?> serialize(Serializers serializers, CedarPolicy object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'effect',
      serializers.serialize(object.effect,
          specifiedType: const FullType(CedarPolicyEffect)),
      'principal',
      serializers.serialize(object.principal,
          specifiedType: const FullType(CedarPolicyPrincipal)),
      'action',
      serializers.serialize(object.action,
          specifiedType: const FullType(CedarPolicyAction)),
      'resource',
      serializers.serialize(object.resource,
          specifiedType: const FullType(CedarPolicyResource)),
      'conditions',
      serializers.serialize(object.conditions,
          specifiedType: const FullType(
              BuiltList, const [const FullType(CedarPolicyCondition)])),
    ];
    Object? value;
    value = object.annotations;
    if (value != null) {
      result
        ..add('annotations')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(String)])));
    }
    return result;
  }

  @override
  CedarPolicy deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CedarPolicyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'effect':
          result.effect = serializers.deserialize(value,
                  specifiedType: const FullType(CedarPolicyEffect))!
              as CedarPolicyEffect;
          break;
        case 'principal':
          result.principal.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CedarPolicyPrincipal))!
              as CedarPolicyPrincipal);
          break;
        case 'action':
          result.action.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CedarPolicyAction))!
              as CedarPolicyAction);
          break;
        case 'resource':
          result.resource.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CedarPolicyResource))!
              as CedarPolicyResource);
          break;
        case 'conditions':
          result.conditions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CedarPolicyCondition)]))!
              as BuiltList<Object?>);
          break;
        case 'annotations':
          result.annotations.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(String)]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$CedarPolicyPrincipalSerializer
    implements StructuredSerializer<CedarPolicyPrincipal> {
  @override
  final Iterable<Type> types = const [
    CedarPolicyPrincipal,
    _$CedarPolicyPrincipal
  ];
  @override
  final String wireName = 'CedarPolicyPrincipal';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CedarPolicyPrincipal object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'op',
      serializers.serialize(object.op,
          specifiedType: const FullType(CedarPolicyOp)),
    ];
    Object? value;
    value = object.entity;
    if (value != null) {
      result
        ..add('entity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CedarEntityId)));
    }
    value = object.entityType;
    if (value != null) {
      result
        ..add('entity_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CedarPolicyPrincipal deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CedarPolicyPrincipalBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'op':
          result.op = serializers.deserialize(value,
              specifiedType: const FullType(CedarPolicyOp))! as CedarPolicyOp;
          break;
        case 'entity':
          result.entity.replace(serializers.deserialize(value,
              specifiedType: const FullType(CedarEntityId))! as CedarEntityId);
          break;
        case 'entity_type':
          result.entityType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CedarPolicyActionSerializer
    implements StructuredSerializer<CedarPolicyAction> {
  @override
  final Iterable<Type> types = const [CedarPolicyAction, _$CedarPolicyAction];
  @override
  final String wireName = 'CedarPolicyAction';

  @override
  Iterable<Object?> serialize(Serializers serializers, CedarPolicyAction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'op',
      serializers.serialize(object.op,
          specifiedType: const FullType(CedarPolicyOp)),
    ];
    Object? value;
    value = object.entity;
    if (value != null) {
      result
        ..add('entity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CedarEntityId)));
    }
    value = object.entities;
    if (value != null) {
      result
        ..add('entities')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(CedarEntityId)])));
    }
    return result;
  }

  @override
  CedarPolicyAction deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CedarPolicyActionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'op':
          result.op = serializers.deserialize(value,
              specifiedType: const FullType(CedarPolicyOp))! as CedarPolicyOp;
          break;
        case 'entity':
          result.entity.replace(serializers.deserialize(value,
              specifiedType: const FullType(CedarEntityId))! as CedarEntityId);
          break;
        case 'entities':
          result.entities.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CedarEntityId)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$CedarPolicyResourceSerializer
    implements StructuredSerializer<CedarPolicyResource> {
  @override
  final Iterable<Type> types = const [
    CedarPolicyResource,
    _$CedarPolicyResource
  ];
  @override
  final String wireName = 'CedarPolicyResource';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CedarPolicyResource object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'op',
      serializers.serialize(object.op,
          specifiedType: const FullType(CedarPolicyOp)),
    ];
    Object? value;
    value = object.entity;
    if (value != null) {
      result
        ..add('entity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CedarEntityId)));
    }
    value = object.entityType;
    if (value != null) {
      result
        ..add('entity_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CedarPolicyResource deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CedarPolicyResourceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'op':
          result.op = serializers.deserialize(value,
              specifiedType: const FullType(CedarPolicyOp))! as CedarPolicyOp;
          break;
        case 'entity':
          result.entity.replace(serializers.deserialize(value,
              specifiedType: const FullType(CedarEntityId))! as CedarEntityId);
          break;
        case 'entity_type':
          result.entityType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CedarPolicyConditionSerializer
    implements StructuredSerializer<CedarPolicyCondition> {
  @override
  final Iterable<Type> types = const [
    CedarPolicyCondition,
    _$CedarPolicyCondition
  ];
  @override
  final String wireName = 'CedarPolicyCondition';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CedarPolicyCondition object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'kind',
      serializers.serialize(object.kind,
          specifiedType: const FullType(CedarPolicyConditionKind)),
      'body',
      serializers.serialize(object.bodyJson,
          specifiedType: const FullType(JsonObject)),
    ];

    return result;
  }

  @override
  CedarPolicyCondition deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CedarPolicyConditionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'kind':
          result.kind = serializers.deserialize(value,
                  specifiedType: const FullType(CedarPolicyConditionKind))!
              as CedarPolicyConditionKind;
          break;
        case 'body':
          result.bodyJson = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
      }
    }

    return result.build();
  }
}

class _$CedarPolicy extends CedarPolicy {
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
      {required this.effect,
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

  CedarEntityIdBuilder? _entity;
  CedarEntityIdBuilder get entity =>
      _$this._entity ??= new CedarEntityIdBuilder();
  set entity(CedarEntityIdBuilder? entity) => _$this._entity = entity;

  String? _entityType;
  String? get entityType => _$this._entityType;
  set entityType(String? entityType) => _$this._entityType = entityType;

  CedarPolicyPrincipalBuilder();

  CedarPolicyPrincipalBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _op = $v.op;
      _entity = $v.entity?.toBuilder();
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
    _$CedarPolicyPrincipal _$result;
    try {
      _$result = _$v ??
          new _$CedarPolicyPrincipal._(
              op: BuiltValueNullFieldError.checkNotNull(
                  op, r'CedarPolicyPrincipal', 'op'),
              entity: _entity?.build(),
              entityType: entityType);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entity';
        _entity?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CedarPolicyPrincipal', _$failedField, e.toString());
      }
      rethrow;
    }
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

  CedarEntityIdBuilder? _entity;
  CedarEntityIdBuilder get entity =>
      _$this._entity ??= new CedarEntityIdBuilder();
  set entity(CedarEntityIdBuilder? entity) => _$this._entity = entity;

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
      _entity = $v.entity?.toBuilder();
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
              entity: _entity?.build(),
              entities: _entities?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entity';
        _entity?.build();
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

  CedarEntityIdBuilder? _entity;
  CedarEntityIdBuilder get entity =>
      _$this._entity ??= new CedarEntityIdBuilder();
  set entity(CedarEntityIdBuilder? entity) => _$this._entity = entity;

  String? _entityType;
  String? get entityType => _$this._entityType;
  set entityType(String? entityType) => _$this._entityType = entityType;

  CedarPolicyResourceBuilder();

  CedarPolicyResourceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _op = $v.op;
      _entity = $v.entity?.toBuilder();
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
    _$CedarPolicyResource _$result;
    try {
      _$result = _$v ??
          new _$CedarPolicyResource._(
              op: BuiltValueNullFieldError.checkNotNull(
                  op, r'CedarPolicyResource', 'op'),
              entity: _entity?.build(),
              entityType: entityType);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entity';
        _entity?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CedarPolicyResource', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CedarPolicyCondition extends CedarPolicyCondition {
  @override
  final CedarPolicyConditionKind kind;
  @override
  final JsonObject bodyJson;

  factory _$CedarPolicyCondition(
          [void Function(CedarPolicyConditionBuilder)? updates]) =>
      (new CedarPolicyConditionBuilder()..update(updates))._build();

  _$CedarPolicyCondition._({required this.kind, required this.bodyJson})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        kind, r'CedarPolicyCondition', 'kind');
    BuiltValueNullFieldError.checkNotNull(
        bodyJson, r'CedarPolicyCondition', 'bodyJson');
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
        bodyJson == other.bodyJson;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jc(_$hash, bodyJson.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CedarPolicyCondition')
          ..add('kind', kind)
          ..add('bodyJson', bodyJson))
        .toString();
  }
}

class CedarPolicyConditionBuilder
    implements Builder<CedarPolicyCondition, CedarPolicyConditionBuilder> {
  _$CedarPolicyCondition? _$v;

  CedarPolicyConditionKind? _kind;
  CedarPolicyConditionKind? get kind => _$this._kind;
  set kind(CedarPolicyConditionKind? kind) => _$this._kind = kind;

  JsonObject? _bodyJson;
  JsonObject? get bodyJson => _$this._bodyJson;
  set bodyJson(JsonObject? bodyJson) => _$this._bodyJson = bodyJson;

  CedarPolicyConditionBuilder();

  CedarPolicyConditionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kind = $v.kind;
      _bodyJson = $v.bodyJson;
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
            bodyJson: BuiltValueNullFieldError.checkNotNull(
                bodyJson, r'CedarPolicyCondition', 'bodyJson'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
