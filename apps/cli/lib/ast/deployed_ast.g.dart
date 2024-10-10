// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deployed_ast.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LocalDeployedProject> _$localDeployedProjectSerializer =
    new _$LocalDeployedProjectSerializer();
Serializer<RemoteDeployedProject> _$remoteDeployedProjectSerializer =
    new _$RemoteDeployedProjectSerializer();
Serializer<DeployedApi> _$deployedApiSerializer = new _$DeployedApiSerializer();
Serializer<DeployedFunction> _$deployedFunctionSerializer =
    new _$DeployedFunctionSerializer();

class _$LocalDeployedProjectSerializer
    implements StructuredSerializer<LocalDeployedProject> {
  @override
  final Iterable<Type> types = const [
    LocalDeployedProject,
    _$LocalDeployedProject
  ];
  @override
  final String wireName = 'LocalDeployedProject';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, LocalDeployedProject object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'port',
      serializers.serialize(object.port, specifiedType: const FullType(int)),
      'apis',
      serializers.serialize(object.apis,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(DeployedApi)])),
    ];

    return result;
  }

  @override
  LocalDeployedProject deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LocalDeployedProjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'port':
          result.port = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'apis':
          result.apis.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(DeployedApi)
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$RemoteDeployedProjectSerializer
    implements StructuredSerializer<RemoteDeployedProject> {
  @override
  final Iterable<Type> types = const [
    RemoteDeployedProject,
    _$RemoteDeployedProject
  ];
  @override
  final String wireName = 'RemoteDeployedProject';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, RemoteDeployedProject object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'baseUri',
      serializers.serialize(object.baseUri, specifiedType: const FullType(Uri)),
      'apis',
      serializers.serialize(object.apis,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(DeployedApi)])),
    ];

    return result;
  }

  @override
  RemoteDeployedProject deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RemoteDeployedProjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'baseUri':
          result.baseUri = serializers.deserialize(value,
              specifiedType: const FullType(Uri))! as Uri;
          break;
        case 'apis':
          result.apis.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(DeployedApi)
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$DeployedApiSerializer implements StructuredSerializer<DeployedApi> {
  @override
  final Iterable<Type> types = const [DeployedApi, _$DeployedApi];
  @override
  final String wireName = 'DeployedApi';

  @override
  Iterable<Object?> serialize(Serializers serializers, DeployedApi object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'functions',
      serializers.serialize(object.functions,
          specifiedType: const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(DeployedFunction)
          ])),
    ];

    return result;
  }

  @override
  DeployedApi deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeployedApiBuilder();

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
                const FullType(DeployedFunction)
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$DeployedFunctionSerializer
    implements StructuredSerializer<DeployedFunction> {
  @override
  final Iterable<Type> types = const [DeployedFunction, _$DeployedFunction];
  @override
  final String wireName = 'DeployedFunction';

  @override
  Iterable<Object?> serialize(Serializers serializers, DeployedFunction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'uri',
      serializers.serialize(object.uri, specifiedType: const FullType(Uri)),
    ];

    return result;
  }

  @override
  DeployedFunction deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeployedFunctionBuilder();

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
        case 'uri':
          result.uri = serializers.deserialize(value,
              specifiedType: const FullType(Uri))! as Uri;
          break;
      }
    }

    return result.build();
  }
}

class _$LocalDeployedProject extends LocalDeployedProject {
  @override
  final int port;
  @override
  final BuiltMap<String, DeployedApi> apis;

  factory _$LocalDeployedProject(
          [void Function(LocalDeployedProjectBuilder)? updates]) =>
      (new LocalDeployedProjectBuilder()..update(updates))._build();

  _$LocalDeployedProject._({required this.port, required this.apis})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        port, r'LocalDeployedProject', 'port');
    BuiltValueNullFieldError.checkNotNull(
        apis, r'LocalDeployedProject', 'apis');
  }

  @override
  LocalDeployedProject rebuild(
          void Function(LocalDeployedProjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocalDeployedProjectBuilder toBuilder() =>
      new LocalDeployedProjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocalDeployedProject &&
        port == other.port &&
        apis == other.apis;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, port.hashCode);
    _$hash = $jc(_$hash, apis.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LocalDeployedProject')
          ..add('port', port)
          ..add('apis', apis))
        .toString();
  }
}

class LocalDeployedProjectBuilder
    implements Builder<LocalDeployedProject, LocalDeployedProjectBuilder> {
  _$LocalDeployedProject? _$v;

  int? _port;
  int? get port => _$this._port;
  set port(int? port) => _$this._port = port;

  MapBuilder<String, DeployedApi>? _apis;
  MapBuilder<String, DeployedApi> get apis =>
      _$this._apis ??= new MapBuilder<String, DeployedApi>();
  set apis(MapBuilder<String, DeployedApi>? apis) => _$this._apis = apis;

  LocalDeployedProjectBuilder();

  LocalDeployedProjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _port = $v.port;
      _apis = $v.apis.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LocalDeployedProject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LocalDeployedProject;
  }

  @override
  void update(void Function(LocalDeployedProjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LocalDeployedProject build() => _build();

  _$LocalDeployedProject _build() {
    _$LocalDeployedProject _$result;
    try {
      _$result = _$v ??
          new _$LocalDeployedProject._(
              port: BuiltValueNullFieldError.checkNotNull(
                  port, r'LocalDeployedProject', 'port'),
              apis: apis.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apis';
        apis.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LocalDeployedProject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$RemoteDeployedProject extends RemoteDeployedProject {
  @override
  final Uri baseUri;
  @override
  final BuiltMap<String, DeployedApi> apis;

  factory _$RemoteDeployedProject(
          [void Function(RemoteDeployedProjectBuilder)? updates]) =>
      (new RemoteDeployedProjectBuilder()..update(updates))._build();

  _$RemoteDeployedProject._({required this.baseUri, required this.apis})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        baseUri, r'RemoteDeployedProject', 'baseUri');
    BuiltValueNullFieldError.checkNotNull(
        apis, r'RemoteDeployedProject', 'apis');
  }

  @override
  RemoteDeployedProject rebuild(
          void Function(RemoteDeployedProjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoteDeployedProjectBuilder toBuilder() =>
      new RemoteDeployedProjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteDeployedProject &&
        baseUri == other.baseUri &&
        apis == other.apis;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, baseUri.hashCode);
    _$hash = $jc(_$hash, apis.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RemoteDeployedProject')
          ..add('baseUri', baseUri)
          ..add('apis', apis))
        .toString();
  }
}

class RemoteDeployedProjectBuilder
    implements Builder<RemoteDeployedProject, RemoteDeployedProjectBuilder> {
  _$RemoteDeployedProject? _$v;

  Uri? _baseUri;
  Uri? get baseUri => _$this._baseUri;
  set baseUri(Uri? baseUri) => _$this._baseUri = baseUri;

  MapBuilder<String, DeployedApi>? _apis;
  MapBuilder<String, DeployedApi> get apis =>
      _$this._apis ??= new MapBuilder<String, DeployedApi>();
  set apis(MapBuilder<String, DeployedApi>? apis) => _$this._apis = apis;

  RemoteDeployedProjectBuilder();

  RemoteDeployedProjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _baseUri = $v.baseUri;
      _apis = $v.apis.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoteDeployedProject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RemoteDeployedProject;
  }

  @override
  void update(void Function(RemoteDeployedProjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RemoteDeployedProject build() => _build();

  _$RemoteDeployedProject _build() {
    _$RemoteDeployedProject _$result;
    try {
      _$result = _$v ??
          new _$RemoteDeployedProject._(
              baseUri: BuiltValueNullFieldError.checkNotNull(
                  baseUri, r'RemoteDeployedProject', 'baseUri'),
              apis: apis.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apis';
        apis.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RemoteDeployedProject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DeployedApi extends DeployedApi {
  @override
  final String name;
  @override
  final BuiltMap<String, DeployedFunction> functions;

  factory _$DeployedApi([void Function(DeployedApiBuilder)? updates]) =>
      (new DeployedApiBuilder()..update(updates))._build();

  _$DeployedApi._({required this.name, required this.functions}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'DeployedApi', 'name');
    BuiltValueNullFieldError.checkNotNull(
        functions, r'DeployedApi', 'functions');
  }

  @override
  DeployedApi rebuild(void Function(DeployedApiBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeployedApiBuilder toBuilder() => new DeployedApiBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeployedApi &&
        name == other.name &&
        functions == other.functions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, functions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeployedApi')
          ..add('name', name)
          ..add('functions', functions))
        .toString();
  }
}

class DeployedApiBuilder implements Builder<DeployedApi, DeployedApiBuilder> {
  _$DeployedApi? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  MapBuilder<String, DeployedFunction>? _functions;
  MapBuilder<String, DeployedFunction> get functions =>
      _$this._functions ??= new MapBuilder<String, DeployedFunction>();
  set functions(MapBuilder<String, DeployedFunction>? functions) =>
      _$this._functions = functions;

  DeployedApiBuilder();

  DeployedApiBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _functions = $v.functions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeployedApi other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeployedApi;
  }

  @override
  void update(void Function(DeployedApiBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeployedApi build() => _build();

  _$DeployedApi _build() {
    _$DeployedApi _$result;
    try {
      _$result = _$v ??
          new _$DeployedApi._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'DeployedApi', 'name'),
              functions: functions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'functions';
        functions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DeployedApi', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DeployedFunction extends DeployedFunction {
  @override
  final String name;
  @override
  final Uri uri;

  factory _$DeployedFunction(
          [void Function(DeployedFunctionBuilder)? updates]) =>
      (new DeployedFunctionBuilder()..update(updates))._build();

  _$DeployedFunction._({required this.name, required this.uri}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'DeployedFunction', 'name');
    BuiltValueNullFieldError.checkNotNull(uri, r'DeployedFunction', 'uri');
  }

  @override
  DeployedFunction rebuild(void Function(DeployedFunctionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeployedFunctionBuilder toBuilder() =>
      new DeployedFunctionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeployedFunction && name == other.name && uri == other.uri;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, uri.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeployedFunction')
          ..add('name', name)
          ..add('uri', uri))
        .toString();
  }
}

class DeployedFunctionBuilder
    implements Builder<DeployedFunction, DeployedFunctionBuilder> {
  _$DeployedFunction? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  Uri? _uri;
  Uri? get uri => _$this._uri;
  set uri(Uri? uri) => _$this._uri = uri;

  DeployedFunctionBuilder();

  DeployedFunctionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _uri = $v.uri;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeployedFunction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeployedFunction;
  }

  @override
  void update(void Function(DeployedFunctionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeployedFunction build() => _build();

  _$DeployedFunction _build() {
    final _$result = _$v ??
        new _$DeployedFunction._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'DeployedFunction', 'name'),
            uri: BuiltValueNullFieldError.checkNotNull(
                uri, r'DeployedFunction', 'uri'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
