// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cedar_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CedarEntity> _$cedarEntitySerializer = new _$CedarEntitySerializer();

class _$CedarEntitySerializer implements StructuredSerializer<CedarEntity> {
  @override
  final Iterable<Type> types = const [CedarEntity, _$CedarEntity];
  @override
  final String wireName = 'CedarEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, CedarEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id,
          specifiedType: const FullType(CedarEntityId)),
      'parents',
      serializers.serialize(object.parents,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CedarEntityId)])),
      'attributes',
      serializers.serialize(object.attributes,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(CedarValueJson)])),
    ];

    return result;
  }

  @override
  CedarEntity deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CedarEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id.replace(serializers.deserialize(value,
              specifiedType: const FullType(CedarEntityId))! as CedarEntityId);
          break;
        case 'parents':
          result.parents.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CedarEntityId)]))!
              as BuiltList<Object?>);
          break;
        case 'attributes':
          result.attributes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(CedarValueJson)
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$CedarEntity extends CedarEntity {
  @override
  final CedarEntityId id;
  @override
  final BuiltList<CedarEntityId> parents;
  @override
  final BuiltMap<String, CedarValueJson> attributes;

  factory _$CedarEntity([void Function(CedarEntityBuilder)? updates]) =>
      (new CedarEntityBuilder()..update(updates))._build();

  _$CedarEntity._(
      {required this.id, required this.parents, required this.attributes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'CedarEntity', 'id');
    BuiltValueNullFieldError.checkNotNull(parents, r'CedarEntity', 'parents');
    BuiltValueNullFieldError.checkNotNull(
        attributes, r'CedarEntity', 'attributes');
  }

  @override
  CedarEntity rebuild(void Function(CedarEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CedarEntityBuilder toBuilder() => new CedarEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CedarEntity &&
        id == other.id &&
        parents == other.parents &&
        attributes == other.attributes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, parents.hashCode);
    _$hash = $jc(_$hash, attributes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CedarEntity')
          ..add('id', id)
          ..add('parents', parents)
          ..add('attributes', attributes))
        .toString();
  }
}

class CedarEntityBuilder implements Builder<CedarEntity, CedarEntityBuilder> {
  _$CedarEntity? _$v;

  CedarEntityIdBuilder? _id;
  CedarEntityIdBuilder get id => _$this._id ??= new CedarEntityIdBuilder();
  set id(CedarEntityIdBuilder? id) => _$this._id = id;

  ListBuilder<CedarEntityId>? _parents;
  ListBuilder<CedarEntityId> get parents =>
      _$this._parents ??= new ListBuilder<CedarEntityId>();
  set parents(ListBuilder<CedarEntityId>? parents) => _$this._parents = parents;

  MapBuilder<String, CedarValueJson>? _attributes;
  MapBuilder<String, CedarValueJson> get attributes =>
      _$this._attributes ??= new MapBuilder<String, CedarValueJson>();
  set attributes(MapBuilder<String, CedarValueJson>? attributes) =>
      _$this._attributes = attributes;

  CedarEntityBuilder();

  CedarEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id.toBuilder();
      _parents = $v.parents.toBuilder();
      _attributes = $v.attributes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CedarEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CedarEntity;
  }

  @override
  void update(void Function(CedarEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CedarEntity build() => _build();

  _$CedarEntity _build() {
    _$CedarEntity _$result;
    try {
      _$result = _$v ??
          new _$CedarEntity._(
              id: id.build(),
              parents: parents.build(),
              attributes: attributes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'id';
        id.build();
        _$failedField = 'parents';
        parents.build();
        _$failedField = 'attributes';
        attributes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CedarEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
