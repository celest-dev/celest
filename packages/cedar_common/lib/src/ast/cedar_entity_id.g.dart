// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cedar_entity_id.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CedarEntityId> _$cedarEntityIdSerializer =
    new _$CedarEntityIdSerializer();

class _$CedarEntityIdSerializer implements StructuredSerializer<CedarEntityId> {
  @override
  final Iterable<Type> types = const [CedarEntityId, _$CedarEntityId];
  @override
  final String wireName = 'CedarEntityId';

  @override
  Iterable<Object?> serialize(Serializers serializers, CedarEntityId object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CedarEntityId deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CedarEntityIdBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CedarEntityId extends CedarEntityId {
  @override
  final String type;
  @override
  final String id;

  factory _$CedarEntityId([void Function(CedarEntityIdBuilder)? updates]) =>
      (new CedarEntityIdBuilder()..update(updates))._build();

  _$CedarEntityId._({required this.type, required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'CedarEntityId', 'type');
    BuiltValueNullFieldError.checkNotNull(id, r'CedarEntityId', 'id');
  }

  @override
  CedarEntityId rebuild(void Function(CedarEntityIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CedarEntityIdBuilder toBuilder() => new CedarEntityIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CedarEntityId && type == other.type && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class CedarEntityIdBuilder
    implements Builder<CedarEntityId, CedarEntityIdBuilder> {
  _$CedarEntityId? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  CedarEntityIdBuilder();

  CedarEntityIdBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CedarEntityId other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CedarEntityId;
  }

  @override
  void update(void Function(CedarEntityIdBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CedarEntityId build() => _build();

  _$CedarEntityId _build() {
    final _$result = _$v ??
        new _$CedarEntityId._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'CedarEntityId', 'type'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CedarEntityId', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
