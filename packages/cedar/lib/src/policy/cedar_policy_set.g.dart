// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cedar_policy_set.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CedarPolicySet> _$cedarPolicySetSerializer =
    new _$CedarPolicySetSerializer();

class _$CedarPolicySetSerializer
    implements StructuredSerializer<CedarPolicySet> {
  @override
  final Iterable<Type> types = const [CedarPolicySet, _$CedarPolicySet];
  @override
  final String wireName = 'CedarPolicySet';

  @override
  Iterable<Object?> serialize(Serializers serializers, CedarPolicySet object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'policies',
      serializers.serialize(object.policies,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(CedarPolicy)])),
      'templates',
      serializers.serialize(object.templates,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(CedarPolicy)])),
    ];

    return result;
  }

  @override
  CedarPolicySet deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CedarPolicySetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'policies':
          result.policies.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(CedarPolicy)
              ]))!);
          break;
        case 'templates':
          result.templates.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(CedarPolicy)
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$CedarPolicySet extends CedarPolicySet {
  @override
  final BuiltMap<String, CedarPolicy> policies;
  @override
  final BuiltMap<String, CedarPolicy> templates;

  factory _$CedarPolicySet([void Function(CedarPolicySetBuilder)? updates]) =>
      (new CedarPolicySetBuilder()..update(updates))._build();

  _$CedarPolicySet._({required this.policies, required this.templates})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        policies, r'CedarPolicySet', 'policies');
    BuiltValueNullFieldError.checkNotNull(
        templates, r'CedarPolicySet', 'templates');
  }

  @override
  CedarPolicySet rebuild(void Function(CedarPolicySetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CedarPolicySetBuilder toBuilder() =>
      new CedarPolicySetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CedarPolicySet &&
        policies == other.policies &&
        templates == other.templates;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, policies.hashCode);
    _$hash = $jc(_$hash, templates.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CedarPolicySet')
          ..add('policies', policies)
          ..add('templates', templates))
        .toString();
  }
}

class CedarPolicySetBuilder
    implements Builder<CedarPolicySet, CedarPolicySetBuilder> {
  _$CedarPolicySet? _$v;

  MapBuilder<String, CedarPolicy>? _policies;
  MapBuilder<String, CedarPolicy> get policies =>
      _$this._policies ??= new MapBuilder<String, CedarPolicy>();
  set policies(MapBuilder<String, CedarPolicy>? policies) =>
      _$this._policies = policies;

  MapBuilder<String, CedarPolicy>? _templates;
  MapBuilder<String, CedarPolicy> get templates =>
      _$this._templates ??= new MapBuilder<String, CedarPolicy>();
  set templates(MapBuilder<String, CedarPolicy>? templates) =>
      _$this._templates = templates;

  CedarPolicySetBuilder();

  CedarPolicySetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _policies = $v.policies.toBuilder();
      _templates = $v.templates.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CedarPolicySet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CedarPolicySet;
  }

  @override
  void update(void Function(CedarPolicySetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CedarPolicySet build() => _build();

  _$CedarPolicySet _build() {
    _$CedarPolicySet _$result;
    try {
      _$result = _$v ??
          new _$CedarPolicySet._(
              policies: policies.build(), templates: templates.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'policies';
        policies.build();
        _$failedField = 'templates';
        templates.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CedarPolicySet', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
