// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolved_ast.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResolvedProject> _$resolvedProjectSerializer =
    new _$ResolvedProjectSerializer();
Serializer<ResolvedApi> _$resolvedApiSerializer = new _$ResolvedApiSerializer();
Serializer<ResolvedCloudFunction> _$resolvedCloudFunctionSerializer =
    new _$ResolvedCloudFunctionSerializer();
Serializer<ResolvedEnvironmentVariable>
    _$resolvedEnvironmentVariableSerializer =
    new _$ResolvedEnvironmentVariableSerializer();

class _$ResolvedProjectSerializer
    implements StructuredSerializer<ResolvedProject> {
  @override
  final Iterable<Type> types = const [ResolvedProject, _$ResolvedProject];
  @override
  final String wireName = 'ResolvedProject';

  @override
  Iterable<Object?> serialize(Serializers serializers, ResolvedProject object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'apis',
      serializers.serialize(object.apis,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(ResolvedApi)])),
      'envVars',
      serializers.serialize(object.envVars,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ResolvedEnvironmentVariable)])),
    ];

    return result;
  }

  @override
  ResolvedProject deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResolvedProjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'apis':
          result.apis.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(ResolvedApi)
              ]))!);
          break;
        case 'envVars':
          result.envVars.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(ResolvedEnvironmentVariable)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedApiSerializer implements StructuredSerializer<ResolvedApi> {
  @override
  final Iterable<Type> types = const [ResolvedApi, _$ResolvedApi];
  @override
  final String wireName = 'ResolvedApi';

  @override
  Iterable<Object?> serialize(Serializers serializers, ResolvedApi object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'functions',
      serializers.serialize(object.functions,
          specifiedType: const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(ResolvedCloudFunction)
          ])),
    ];
    Object? value;
    value = object.policy;
    if (value != null) {
      result
        ..add('policy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Policy)));
    }
    return result;
  }

  @override
  ResolvedApi deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResolvedApiBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'functions':
          result.functions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(ResolvedCloudFunction)
              ]))!);
          break;
        case 'policy':
          result.policy.replace(serializers.deserialize(value,
              specifiedType: const FullType(Policy))! as Policy);
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedCloudFunctionSerializer
    implements StructuredSerializer<ResolvedCloudFunction> {
  @override
  final Iterable<Type> types = const [
    ResolvedCloudFunction,
    _$ResolvedCloudFunction
  ];
  @override
  final String wireName = 'ResolvedCloudFunction';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ResolvedCloudFunction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'apiName',
      serializers.serialize(object.apiName,
          specifiedType: const FullType(String)),
      'envVars',
      serializers.serialize(object.envVars,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(String)])),
    ];
    Object? value;
    value = object.policy;
    if (value != null) {
      result
        ..add('policy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Policy)));
    }
    return result;
  }

  @override
  ResolvedCloudFunction deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResolvedCloudFunctionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'apiName':
          result.apiName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'envVars':
          result.envVars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))!
              as BuiltSet<Object?>);
          break;
        case 'policy':
          result.policy.replace(serializers.deserialize(value,
              specifiedType: const FullType(Policy))! as Policy);
          break;
      }
    }

    return result.build();
  }
}

class _$ResolvedEnvironmentVariableSerializer
    implements StructuredSerializer<ResolvedEnvironmentVariable> {
  @override
  final Iterable<Type> types = const [
    ResolvedEnvironmentVariable,
    _$ResolvedEnvironmentVariable
  ];
  @override
  final String wireName = 'ResolvedEnvironmentVariable';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ResolvedEnvironmentVariable object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ResolvedEnvironmentVariable deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResolvedEnvironmentVariableBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class ResolvedNodeBuilder {
  void replace(ResolvedNode other);
  void update(void Function(ResolvedNodeBuilder) updates);
}

class _$ResolvedProject extends ResolvedProject {
  @override
  final String name;
  @override
  final BuiltMap<String, ResolvedApi> apis;
  @override
  final BuiltList<ResolvedEnvironmentVariable> envVars;

  factory _$ResolvedProject([void Function(ResolvedProjectBuilder)? updates]) =>
      (new ResolvedProjectBuilder()..update(updates))._build();

  _$ResolvedProject._(
      {required this.name, required this.apis, required this.envVars})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ResolvedProject', 'name');
    BuiltValueNullFieldError.checkNotNull(apis, r'ResolvedProject', 'apis');
    BuiltValueNullFieldError.checkNotNull(
        envVars, r'ResolvedProject', 'envVars');
  }

  @override
  ResolvedProject rebuild(void Function(ResolvedProjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResolvedProjectBuilder toBuilder() =>
      new ResolvedProjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedProject &&
        name == other.name &&
        apis == other.apis &&
        envVars == other.envVars;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, apis.hashCode);
    _$hash = $jc(_$hash, envVars.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedProject')
          ..add('name', name)
          ..add('apis', apis)
          ..add('envVars', envVars))
        .toString();
  }
}

class ResolvedProjectBuilder
    implements
        Builder<ResolvedProject, ResolvedProjectBuilder>,
        ResolvedNodeBuilder {
  _$ResolvedProject? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  MapBuilder<String, ResolvedApi>? _apis;
  MapBuilder<String, ResolvedApi> get apis =>
      _$this._apis ??= new MapBuilder<String, ResolvedApi>();
  set apis(covariant MapBuilder<String, ResolvedApi>? apis) =>
      _$this._apis = apis;

  ListBuilder<ResolvedEnvironmentVariable>? _envVars;
  ListBuilder<ResolvedEnvironmentVariable> get envVars =>
      _$this._envVars ??= new ListBuilder<ResolvedEnvironmentVariable>();
  set envVars(covariant ListBuilder<ResolvedEnvironmentVariable>? envVars) =>
      _$this._envVars = envVars;

  ResolvedProjectBuilder();

  ResolvedProjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _apis = $v.apis.toBuilder();
      _envVars = $v.envVars.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ResolvedProject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResolvedProject;
  }

  @override
  void update(void Function(ResolvedProjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedProject build() => _build();

  _$ResolvedProject _build() {
    _$ResolvedProject _$result;
    try {
      _$result = _$v ??
          new _$ResolvedProject._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ResolvedProject', 'name'),
              apis: apis.build(),
              envVars: envVars.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apis';
        apis.build();
        _$failedField = 'envVars';
        envVars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ResolvedProject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedApi extends ResolvedApi {
  @override
  final String name;
  @override
  final BuiltMap<String, ResolvedCloudFunction> functions;
  @override
  final Policy? policy;

  factory _$ResolvedApi([void Function(ResolvedApiBuilder)? updates]) =>
      (new ResolvedApiBuilder()..update(updates))._build();

  _$ResolvedApi._({required this.name, required this.functions, this.policy})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ResolvedApi', 'name');
    BuiltValueNullFieldError.checkNotNull(
        functions, r'ResolvedApi', 'functions');
  }

  @override
  ResolvedApi rebuild(void Function(ResolvedApiBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResolvedApiBuilder toBuilder() => new ResolvedApiBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedApi &&
        name == other.name &&
        functions == other.functions &&
        policy == other.policy;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, functions.hashCode);
    _$hash = $jc(_$hash, policy.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedApi')
          ..add('name', name)
          ..add('functions', functions)
          ..add('policy', policy))
        .toString();
  }
}

class ResolvedApiBuilder
    implements Builder<ResolvedApi, ResolvedApiBuilder>, ResolvedNodeBuilder {
  _$ResolvedApi? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  MapBuilder<String, ResolvedCloudFunction>? _functions;
  MapBuilder<String, ResolvedCloudFunction> get functions =>
      _$this._functions ??= new MapBuilder<String, ResolvedCloudFunction>();
  set functions(
          covariant MapBuilder<String, ResolvedCloudFunction>? functions) =>
      _$this._functions = functions;

  PolicyBuilder? _policy;
  PolicyBuilder get policy => _$this._policy ??= new PolicyBuilder();
  set policy(covariant PolicyBuilder? policy) => _$this._policy = policy;

  ResolvedApiBuilder();

  ResolvedApiBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _functions = $v.functions.toBuilder();
      _policy = $v.policy?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ResolvedApi other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResolvedApi;
  }

  @override
  void update(void Function(ResolvedApiBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedApi build() => _build();

  _$ResolvedApi _build() {
    _$ResolvedApi _$result;
    try {
      _$result = _$v ??
          new _$ResolvedApi._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ResolvedApi', 'name'),
              functions: functions.build(),
              policy: _policy?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'functions';
        functions.build();
        _$failedField = 'policy';
        _policy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ResolvedApi', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedCloudFunction extends ResolvedCloudFunction {
  @override
  final String name;
  @override
  final String apiName;
  @override
  final BuiltSet<String> envVars;
  @override
  final Policy? policy;

  factory _$ResolvedCloudFunction(
          [void Function(ResolvedCloudFunctionBuilder)? updates]) =>
      (new ResolvedCloudFunctionBuilder()..update(updates))._build();

  _$ResolvedCloudFunction._(
      {required this.name,
      required this.apiName,
      required this.envVars,
      this.policy})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'ResolvedCloudFunction', 'name');
    BuiltValueNullFieldError.checkNotNull(
        apiName, r'ResolvedCloudFunction', 'apiName');
    BuiltValueNullFieldError.checkNotNull(
        envVars, r'ResolvedCloudFunction', 'envVars');
  }

  @override
  ResolvedCloudFunction rebuild(
          void Function(ResolvedCloudFunctionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResolvedCloudFunctionBuilder toBuilder() =>
      new ResolvedCloudFunctionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedCloudFunction &&
        name == other.name &&
        apiName == other.apiName &&
        envVars == other.envVars &&
        policy == other.policy;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, apiName.hashCode);
    _$hash = $jc(_$hash, envVars.hashCode);
    _$hash = $jc(_$hash, policy.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedCloudFunction')
          ..add('name', name)
          ..add('apiName', apiName)
          ..add('envVars', envVars)
          ..add('policy', policy))
        .toString();
  }
}

class ResolvedCloudFunctionBuilder
    implements
        Builder<ResolvedCloudFunction, ResolvedCloudFunctionBuilder>,
        ResolvedNodeBuilder {
  _$ResolvedCloudFunction? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _apiName;
  String? get apiName => _$this._apiName;
  set apiName(covariant String? apiName) => _$this._apiName = apiName;

  SetBuilder<String>? _envVars;
  SetBuilder<String> get envVars =>
      _$this._envVars ??= new SetBuilder<String>();
  set envVars(covariant SetBuilder<String>? envVars) =>
      _$this._envVars = envVars;

  PolicyBuilder? _policy;
  PolicyBuilder get policy => _$this._policy ??= new PolicyBuilder();
  set policy(covariant PolicyBuilder? policy) => _$this._policy = policy;

  ResolvedCloudFunctionBuilder();

  ResolvedCloudFunctionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _apiName = $v.apiName;
      _envVars = $v.envVars.toBuilder();
      _policy = $v.policy?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ResolvedCloudFunction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResolvedCloudFunction;
  }

  @override
  void update(void Function(ResolvedCloudFunctionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedCloudFunction build() => _build();

  _$ResolvedCloudFunction _build() {
    _$ResolvedCloudFunction _$result;
    try {
      _$result = _$v ??
          new _$ResolvedCloudFunction._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ResolvedCloudFunction', 'name'),
              apiName: BuiltValueNullFieldError.checkNotNull(
                  apiName, r'ResolvedCloudFunction', 'apiName'),
              envVars: envVars.build(),
              policy: _policy?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'envVars';
        envVars.build();
        _$failedField = 'policy';
        _policy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ResolvedCloudFunction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ResolvedEnvironmentVariable extends ResolvedEnvironmentVariable {
  @override
  final String name;
  @override
  final String value;

  factory _$ResolvedEnvironmentVariable(
          [void Function(ResolvedEnvironmentVariableBuilder)? updates]) =>
      (new ResolvedEnvironmentVariableBuilder()..update(updates))._build();

  _$ResolvedEnvironmentVariable._({required this.name, required this.value})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'ResolvedEnvironmentVariable', 'name');
    BuiltValueNullFieldError.checkNotNull(
        value, r'ResolvedEnvironmentVariable', 'value');
  }

  @override
  ResolvedEnvironmentVariable rebuild(
          void Function(ResolvedEnvironmentVariableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResolvedEnvironmentVariableBuilder toBuilder() =>
      new ResolvedEnvironmentVariableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolvedEnvironmentVariable &&
        name == other.name &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolvedEnvironmentVariable')
          ..add('name', name)
          ..add('value', value))
        .toString();
  }
}

class ResolvedEnvironmentVariableBuilder
    implements
        Builder<ResolvedEnvironmentVariable,
            ResolvedEnvironmentVariableBuilder>,
        ResolvedNodeBuilder {
  _$ResolvedEnvironmentVariable? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _value;
  String? get value => _$this._value;
  set value(covariant String? value) => _$this._value = value;

  ResolvedEnvironmentVariableBuilder();

  ResolvedEnvironmentVariableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ResolvedEnvironmentVariable other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResolvedEnvironmentVariable;
  }

  @override
  void update(void Function(ResolvedEnvironmentVariableBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolvedEnvironmentVariable build() => _build();

  _$ResolvedEnvironmentVariable _build() {
    final _$result = _$v ??
        new _$ResolvedEnvironmentVariable._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ResolvedEnvironmentVariable', 'name'),
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'ResolvedEnvironmentVariable', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
