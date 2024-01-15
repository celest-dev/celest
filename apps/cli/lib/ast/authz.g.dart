// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authz.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Policy> _$policySerializer = new _$PolicySerializer();
Serializer<PolicyStatement> _$policyStatementSerializer =
    new _$PolicyStatementSerializer();

class _$PolicySerializer implements StructuredSerializer<Policy> {
  @override
  final Iterable<Type> types = const [Policy, _$Policy];
  @override
  final String wireName = 'Policy';

  @override
  Iterable<Object?> serialize(Serializers serializers, Policy object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'grantor',
      serializers.serialize(object.grantor,
          specifiedType: const FullType(String)),
      'statements',
      serializers.serialize(object.statements,
          specifiedType: const FullType(
              BuiltSet, const [const FullType(PolicyStatement)])),
    ];

    return result;
  }

  @override
  Policy deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PolicyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'grantor':
          result.grantor = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'statements':
          result.statements.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltSet, const [const FullType(PolicyStatement)]))!
              as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PolicyStatementSerializer
    implements StructuredSerializer<PolicyStatement> {
  @override
  final Iterable<Type> types = const [PolicyStatement, _$PolicyStatement];
  @override
  final String wireName = 'PolicyStatement';

  @override
  Iterable<Object?> serialize(Serializers serializers, PolicyStatement object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'grantee',
      serializers.serialize(object.grantee,
          specifiedType: const FullType(String)),
      'actions',
      serializers.serialize(object.actions,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  PolicyStatement deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PolicyStatementBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'grantee':
          result.grantee = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'actions':
          result.actions.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))!
              as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Policy extends Policy {
  @override
  final String grantor;
  @override
  final BuiltSet<PolicyStatement> statements;

  factory _$Policy([void Function(PolicyBuilder)? updates]) =>
      (new PolicyBuilder()..update(updates))._build();

  _$Policy._({required this.grantor, required this.statements}) : super._() {
    BuiltValueNullFieldError.checkNotNull(grantor, r'Policy', 'grantor');
    BuiltValueNullFieldError.checkNotNull(statements, r'Policy', 'statements');
  }

  @override
  Policy rebuild(void Function(PolicyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PolicyBuilder toBuilder() => new PolicyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Policy &&
        grantor == other.grantor &&
        statements == other.statements;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, grantor.hashCode);
    _$hash = $jc(_$hash, statements.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Policy')
          ..add('grantor', grantor)
          ..add('statements', statements))
        .toString();
  }
}

class PolicyBuilder implements Builder<Policy, PolicyBuilder> {
  _$Policy? _$v;

  String? _grantor;
  String? get grantor => _$this._grantor;
  set grantor(String? grantor) => _$this._grantor = grantor;

  SetBuilder<PolicyStatement>? _statements;
  SetBuilder<PolicyStatement> get statements =>
      _$this._statements ??= new SetBuilder<PolicyStatement>();
  set statements(SetBuilder<PolicyStatement>? statements) =>
      _$this._statements = statements;

  PolicyBuilder();

  PolicyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _grantor = $v.grantor;
      _statements = $v.statements.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Policy other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Policy;
  }

  @override
  void update(void Function(PolicyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Policy build() => _build();

  _$Policy _build() {
    _$Policy _$result;
    try {
      _$result = _$v ??
          new _$Policy._(
              grantor: BuiltValueNullFieldError.checkNotNull(
                  grantor, r'Policy', 'grantor'),
              statements: statements.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'statements';
        statements.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Policy', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PolicyStatement extends PolicyStatement {
  @override
  final String grantee;
  @override
  final BuiltSet<String> actions;

  factory _$PolicyStatement([void Function(PolicyStatementBuilder)? updates]) =>
      (new PolicyStatementBuilder()..update(updates))._build();

  _$PolicyStatement._({required this.grantee, required this.actions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        grantee, r'PolicyStatement', 'grantee');
    BuiltValueNullFieldError.checkNotNull(
        actions, r'PolicyStatement', 'actions');
  }

  @override
  PolicyStatement rebuild(void Function(PolicyStatementBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PolicyStatementBuilder toBuilder() =>
      new PolicyStatementBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PolicyStatement &&
        grantee == other.grantee &&
        actions == other.actions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, grantee.hashCode);
    _$hash = $jc(_$hash, actions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PolicyStatement')
          ..add('grantee', grantee)
          ..add('actions', actions))
        .toString();
  }
}

class PolicyStatementBuilder
    implements Builder<PolicyStatement, PolicyStatementBuilder> {
  _$PolicyStatement? _$v;

  String? _grantee;
  String? get grantee => _$this._grantee;
  set grantee(String? grantee) => _$this._grantee = grantee;

  SetBuilder<String>? _actions;
  SetBuilder<String> get actions =>
      _$this._actions ??= new SetBuilder<String>();
  set actions(SetBuilder<String>? actions) => _$this._actions = actions;

  PolicyStatementBuilder();

  PolicyStatementBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _grantee = $v.grantee;
      _actions = $v.actions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PolicyStatement other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PolicyStatement;
  }

  @override
  void update(void Function(PolicyStatementBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PolicyStatement build() => _build();

  _$PolicyStatement _build() {
    _$PolicyStatement _$result;
    try {
      _$result = _$v ??
          new _$PolicyStatement._(
              grantee: BuiltValueNullFieldError.checkNotNull(
                  grantee, r'PolicyStatement', 'grantee'),
              actions: actions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'actions';
        actions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PolicyStatement', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
