// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolved_ast.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NodeId> _$nodeIdSerializer = new _$NodeIdSerializer();
Serializer<ResolvedProject> _$resolvedProjectSerializer =
    new _$ResolvedProjectSerializer();
Serializer<ResolvedApi> _$resolvedApiSerializer = new _$ResolvedApiSerializer();
Serializer<ResolvedCloudFunction> _$resolvedCloudFunctionSerializer =
    new _$ResolvedCloudFunctionSerializer();
Serializer<ResolvedEnvironmentVariable>
    _$resolvedEnvironmentVariableSerializer =
    new _$ResolvedEnvironmentVariableSerializer();
Serializer<Policy> _$policySerializer = new _$PolicySerializer();
Serializer<PolicyStatement> _$policyStatementSerializer =
    new _$PolicyStatementSerializer();
Serializer<Role> _$roleSerializer = new _$RoleSerializer();

class _$NodeIdSerializer implements StructuredSerializer<NodeId> {
  @override
  final Iterable<Type> types = const [NodeId, _$NodeId];
  @override
  final String wireName = 'NodeId';

  @override
  Iterable<Object?> serialize(Serializers serializers, NodeId object,
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
  NodeId deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NodeIdBuilder();

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

class _$PolicySerializer implements StructuredSerializer<Policy> {
  @override
  final Iterable<Type> types = const [Policy, _$Policy];
  @override
  final String wireName = 'Policy';

  @override
  Iterable<Object?> serialize(Serializers serializers, Policy object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
          specifiedType: const FullType(NodeId)),
      'actions',
      serializers.serialize(object.actions,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(CelestAction)])),
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
          result.grantee.replace(serializers.deserialize(value,
              specifiedType: const FullType(NodeId))! as NodeId);
          break;
        case 'actions':
          result.actions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltSet, const [const FullType(CelestAction)]))!
              as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$RoleSerializer implements StructuredSerializer<Role> {
  @override
  final Iterable<Type> types = const [Role, _$Role];
  @override
  final String wireName = 'Role';

  @override
  Iterable<Object?> serialize(Serializers serializers, Role object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Role deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RoleBuilder();

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
      }
    }

    return result.build();
  }
}

class _$NodeId extends NodeId {
  @override
  final String type;
  @override
  final String id;

  factory _$NodeId([void Function(NodeIdBuilder)? updates]) =>
      (new NodeIdBuilder()..update(updates))._build();

  _$NodeId._({required this.type, required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'NodeId', 'type');
    BuiltValueNullFieldError.checkNotNull(id, r'NodeId', 'id');
  }

  @override
  NodeId rebuild(void Function(NodeIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NodeIdBuilder toBuilder() => new NodeIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NodeId && type == other.type && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NodeId')
          ..add('type', type)
          ..add('id', id))
        .toString();
  }
}

class NodeIdBuilder implements Builder<NodeId, NodeIdBuilder> {
  _$NodeId? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  NodeIdBuilder();

  NodeIdBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NodeId other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NodeId;
  }

  @override
  void update(void Function(NodeIdBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NodeId build() => _build();

  _$NodeId _build() {
    final _$result = _$v ??
        new _$NodeId._(
            type:
                BuiltValueNullFieldError.checkNotNull(type, r'NodeId', 'type'),
            id: BuiltValueNullFieldError.checkNotNull(id, r'NodeId', 'id'));
    replace(_$result);
    return _$result;
  }
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
    implements Builder<ResolvedProject, ResolvedProjectBuilder> {
  _$ResolvedProject? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  MapBuilder<String, ResolvedApi>? _apis;
  MapBuilder<String, ResolvedApi> get apis =>
      _$this._apis ??= new MapBuilder<String, ResolvedApi>();
  set apis(MapBuilder<String, ResolvedApi>? apis) => _$this._apis = apis;

  ListBuilder<ResolvedEnvironmentVariable>? _envVars;
  ListBuilder<ResolvedEnvironmentVariable> get envVars =>
      _$this._envVars ??= new ListBuilder<ResolvedEnvironmentVariable>();
  set envVars(ListBuilder<ResolvedEnvironmentVariable>? envVars) =>
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
  void replace(ResolvedProject other) {
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

class ResolvedApiBuilder implements Builder<ResolvedApi, ResolvedApiBuilder> {
  _$ResolvedApi? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  MapBuilder<String, ResolvedCloudFunction>? _functions;
  MapBuilder<String, ResolvedCloudFunction> get functions =>
      _$this._functions ??= new MapBuilder<String, ResolvedCloudFunction>();
  set functions(MapBuilder<String, ResolvedCloudFunction>? functions) =>
      _$this._functions = functions;

  PolicyBuilder? _policy;
  PolicyBuilder get policy => _$this._policy ??= new PolicyBuilder();
  set policy(PolicyBuilder? policy) => _$this._policy = policy;

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
  void replace(ResolvedApi other) {
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
    implements Builder<ResolvedCloudFunction, ResolvedCloudFunctionBuilder> {
  _$ResolvedCloudFunction? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _apiName;
  String? get apiName => _$this._apiName;
  set apiName(String? apiName) => _$this._apiName = apiName;

  SetBuilder<String>? _envVars;
  SetBuilder<String> get envVars =>
      _$this._envVars ??= new SetBuilder<String>();
  set envVars(SetBuilder<String>? envVars) => _$this._envVars = envVars;

  PolicyBuilder? _policy;
  PolicyBuilder get policy => _$this._policy ??= new PolicyBuilder();
  set policy(PolicyBuilder? policy) => _$this._policy = policy;

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
  void replace(ResolvedCloudFunction other) {
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
            ResolvedEnvironmentVariableBuilder> {
  _$ResolvedEnvironmentVariable? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

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
  void replace(ResolvedEnvironmentVariable other) {
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

class _$Policy extends Policy {
  @override
  final BuiltSet<PolicyStatement> statements;

  factory _$Policy([void Function(PolicyBuilder)? updates]) =>
      (new PolicyBuilder()..update(updates))._build();

  _$Policy._({required this.statements}) : super._() {
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
    return other is Policy && statements == other.statements;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, statements.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Policy')
          ..add('statements', statements))
        .toString();
  }
}

class PolicyBuilder implements Builder<Policy, PolicyBuilder> {
  _$Policy? _$v;

  SetBuilder<PolicyStatement>? _statements;
  SetBuilder<PolicyStatement> get statements =>
      _$this._statements ??= new SetBuilder<PolicyStatement>();
  set statements(SetBuilder<PolicyStatement>? statements) =>
      _$this._statements = statements;

  PolicyBuilder();

  PolicyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
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
      _$result = _$v ?? new _$Policy._(statements: statements.build());
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
  final NodeId grantee;
  @override
  final BuiltSet<CelestAction> actions;

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

  NodeIdBuilder? _grantee;
  NodeIdBuilder get grantee => _$this._grantee ??= new NodeIdBuilder();
  set grantee(NodeIdBuilder? grantee) => _$this._grantee = grantee;

  SetBuilder<CelestAction>? _actions;
  SetBuilder<CelestAction> get actions =>
      _$this._actions ??= new SetBuilder<CelestAction>();
  set actions(SetBuilder<CelestAction>? actions) => _$this._actions = actions;

  PolicyStatementBuilder();

  PolicyStatementBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _grantee = $v.grantee.toBuilder();
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
              grantee: grantee.build(), actions: actions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'grantee';
        grantee.build();
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

class _$Role extends Role {
  @override
  final String name;

  factory _$Role([void Function(RoleBuilder)? updates]) =>
      (new RoleBuilder()..update(updates))._build();

  _$Role._({required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Role', 'name');
  }

  @override
  Role rebuild(void Function(RoleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoleBuilder toBuilder() => new RoleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Role && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Role')..add('name', name)).toString();
  }
}

class RoleBuilder implements Builder<Role, RoleBuilder> {
  _$Role? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  RoleBuilder();

  RoleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Role other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Role;
  }

  @override
  void update(void Function(RoleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Role build() => _build();

  _$Role _build() {
    final _$result = _$v ??
        new _$Role._(
            name: BuiltValueNullFieldError.checkNotNull(name, r'Role', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
