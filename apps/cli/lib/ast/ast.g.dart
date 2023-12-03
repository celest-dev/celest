// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ast.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Project> _$projectSerializer = new _$ProjectSerializer();
Serializer<Environment> _$environmentSerializer = new _$EnvironmentSerializer();
Serializer<Api> _$apiSerializer = new _$ApiSerializer();
Serializer<ApiMetadataAuthenticated> _$apiMetadataAuthenticatedSerializer =
    new _$ApiMetadataAuthenticatedSerializer();
Serializer<ApiMetadataMiddleware> _$apiMetadataMiddlewareSerializer =
    new _$ApiMetadataMiddlewareSerializer();
Serializer<Parameter> _$parameterSerializer = new _$ParameterSerializer();
Serializer<CloudFunction> _$cloudFunctionSerializer =
    new _$CloudFunctionSerializer();
Serializer<SourceLocation> _$sourceLocationSerializer =
    new _$SourceLocationSerializer();

class _$ProjectSerializer implements StructuredSerializer<Project> {
  @override
  final Iterable<Type> types = const [Project, _$Project];
  @override
  final String wireName = 'Project';

  @override
  Iterable<Object?> serialize(Serializers serializers, Project object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'reference',
      serializers.serialize(object.reference,
          specifiedType: const FullType(Reference)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(SourceLocation)),
      'environmentNames',
      serializers.serialize(object.environmentNames,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'baseEnvironment',
      serializers.serialize(object.baseEnvironment,
          specifiedType: const FullType(Environment)),
      'environmentOverrides',
      serializers.serialize(object.environmentOverrides,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(Environment)])),
    ];

    return result;
  }

  @override
  Project deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProjectBuilder();

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
        case 'reference':
          result.reference = serializers.deserialize(value,
              specifiedType: const FullType(Reference))! as Reference;
          break;
        case 'location':
          result.location.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SourceLocation))!
              as SourceLocation);
          break;
        case 'environmentNames':
          result.environmentNames.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'baseEnvironment':
          result.baseEnvironment.replace(serializers.deserialize(value,
              specifiedType: const FullType(Environment))! as Environment);
          break;
        case 'environmentOverrides':
          result.environmentOverrides.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(Environment)
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$EnvironmentSerializer implements StructuredSerializer<Environment> {
  @override
  final Iterable<Type> types = const [Environment, _$Environment];
  @override
  final String wireName = 'Environment';

  @override
  Iterable<Object?> serialize(Serializers serializers, Environment object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'apis',
      serializers.serialize(object.apis,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(Api)])),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Environment deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EnvironmentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'apis':
          result.apis.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(Api)]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$ApiSerializer implements StructuredSerializer<Api> {
  @override
  final Iterable<Type> types = const [Api, _$Api];
  @override
  final String wireName = 'Api';

  @override
  Iterable<Object?> serialize(Serializers serializers, Api object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'environmentName',
      serializers.serialize(object.environmentName,
          specifiedType: const FullType(String)),
      'metadata',
      serializers.serialize(object.metadata,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ApiMetadata)])),
      'functions',
      serializers.serialize(object.functions,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(CloudFunction)])),
    ];

    return result;
  }

  @override
  Api deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiBuilder();

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
        case 'environmentName':
          result.environmentName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'metadata':
          result.metadata.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ApiMetadata)]))!
              as BuiltList<Object?>);
          break;
        case 'functions':
          result.functions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(CloudFunction)
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$ApiMetadataAuthenticatedSerializer
    implements StructuredSerializer<ApiMetadataAuthenticated> {
  @override
  final Iterable<Type> types = const [
    ApiMetadataAuthenticated,
    _$ApiMetadataAuthenticated
  ];
  @override
  final String wireName = 'ApiMetadataAuthenticated';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ApiMetadataAuthenticated object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(SourceLocation)),
    ];

    return result;
  }

  @override
  ApiMetadataAuthenticated deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiMetadataAuthenticatedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'location':
          result.location.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SourceLocation))!
              as SourceLocation);
          break;
      }
    }

    return result.build();
  }
}

class _$ApiMetadataMiddlewareSerializer
    implements StructuredSerializer<ApiMetadataMiddleware> {
  @override
  final Iterable<Type> types = const [
    ApiMetadataMiddleware,
    _$ApiMetadataMiddleware
  ];
  @override
  final String wireName = 'ApiMetadataMiddleware';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ApiMetadataMiddleware object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(Reference)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(SourceLocation)),
    ];

    return result;
  }

  @override
  ApiMetadataMiddleware deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiMetadataMiddlewareBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(Reference))! as Reference;
          break;
        case 'location':
          result.location.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SourceLocation))!
              as SourceLocation);
          break;
      }
    }

    return result.build();
  }
}

class _$ParameterSerializer implements StructuredSerializer<Parameter> {
  @override
  final Iterable<Type> types = const [Parameter, _$Parameter];
  @override
  final String wireName = 'Parameter';

  @override
  Iterable<Object?> serialize(Serializers serializers, Parameter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(Reference)),
      'required',
      serializers.serialize(object.required,
          specifiedType: const FullType(bool)),
      'named',
      serializers.serialize(object.named, specifiedType: const FullType(bool)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(SourceLocation)),
    ];

    return result;
  }

  @override
  Parameter deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ParameterBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(Reference))! as Reference;
          break;
        case 'required':
          result.required = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'named':
          result.named = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'location':
          result.location.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SourceLocation))!
              as SourceLocation);
          break;
      }
    }

    return result.build();
  }
}

class _$CloudFunctionSerializer implements StructuredSerializer<CloudFunction> {
  @override
  final Iterable<Type> types = const [CloudFunction, _$CloudFunction];
  @override
  final String wireName = 'CloudFunction';

  @override
  Iterable<Object?> serialize(Serializers serializers, CloudFunction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'apiName',
      serializers.serialize(object.apiName,
          specifiedType: const FullType(String)),
      'parameters',
      serializers.serialize(object.parameters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Parameter)])),
      'returnType',
      serializers.serialize(object.returnType,
          specifiedType: const FullType(Reference)),
      'flattenedReturnType',
      serializers.serialize(object.flattenedReturnType,
          specifiedType: const FullType(Reference)),
      'metadata',
      serializers.serialize(object.metadata,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ApiMetadata)])),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(SourceLocation)),
    ];

    return result;
  }

  @override
  CloudFunction deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CloudFunctionBuilder();

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
        case 'parameters':
          result.parameters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Parameter)]))!
              as BuiltList<Object?>);
          break;
        case 'returnType':
          result.returnType = serializers.deserialize(value,
              specifiedType: const FullType(Reference))! as Reference;
          break;
        case 'flattenedReturnType':
          result.flattenedReturnType = serializers.deserialize(value,
              specifiedType: const FullType(Reference))! as Reference;
          break;
        case 'metadata':
          result.metadata.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ApiMetadata)]))!
              as BuiltList<Object?>);
          break;
        case 'location':
          result.location.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SourceLocation))!
              as SourceLocation);
          break;
      }
    }

    return result.build();
  }
}

class _$SourceLocationSerializer
    implements StructuredSerializer<SourceLocation> {
  @override
  final Iterable<Type> types = const [SourceLocation, _$SourceLocation];
  @override
  final String wireName = 'SourceLocation';

  @override
  Iterable<Object?> serialize(Serializers serializers, SourceLocation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'path',
      serializers.serialize(object.path, specifiedType: const FullType(String)),
      'line',
      serializers.serialize(object.line, specifiedType: const FullType(int)),
      'column',
      serializers.serialize(object.column, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  SourceLocation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SourceLocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'path':
          result.path = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'line':
          result.line = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'column':
          result.column = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Project extends Project {
  @override
  final String name;
  @override
  final Reference reference;
  @override
  final SourceLocation location;
  @override
  final BuiltList<String> environmentNames;
  @override
  final Environment baseEnvironment;
  @override
  final BuiltMap<String, Environment> environmentOverrides;

  factory _$Project([void Function(ProjectBuilder)? updates]) =>
      (new ProjectBuilder()..update(updates))._build();

  _$Project._(
      {required this.name,
      required this.reference,
      required this.location,
      required this.environmentNames,
      required this.baseEnvironment,
      required this.environmentOverrides})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Project', 'name');
    BuiltValueNullFieldError.checkNotNull(reference, r'Project', 'reference');
    BuiltValueNullFieldError.checkNotNull(location, r'Project', 'location');
    BuiltValueNullFieldError.checkNotNull(
        environmentNames, r'Project', 'environmentNames');
    BuiltValueNullFieldError.checkNotNull(
        baseEnvironment, r'Project', 'baseEnvironment');
    BuiltValueNullFieldError.checkNotNull(
        environmentOverrides, r'Project', 'environmentOverrides');
  }

  @override
  Project rebuild(void Function(ProjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProjectBuilder toBuilder() => new ProjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Project &&
        name == other.name &&
        reference == other.reference &&
        location == other.location &&
        environmentNames == other.environmentNames &&
        baseEnvironment == other.baseEnvironment &&
        environmentOverrides == other.environmentOverrides;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, environmentNames.hashCode);
    _$hash = $jc(_$hash, baseEnvironment.hashCode);
    _$hash = $jc(_$hash, environmentOverrides.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Project')
          ..add('name', name)
          ..add('reference', reference)
          ..add('location', location)
          ..add('environmentNames', environmentNames)
          ..add('baseEnvironment', baseEnvironment)
          ..add('environmentOverrides', environmentOverrides))
        .toString();
  }
}

class ProjectBuilder implements Builder<Project, ProjectBuilder> {
  _$Project? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  Reference? _reference;
  Reference? get reference => _$this._reference;
  set reference(Reference? reference) => _$this._reference = reference;

  SourceLocationBuilder? _location;
  SourceLocationBuilder get location =>
      _$this._location ??= new SourceLocationBuilder();
  set location(SourceLocationBuilder? location) => _$this._location = location;

  ListBuilder<String>? _environmentNames;
  ListBuilder<String> get environmentNames =>
      _$this._environmentNames ??= new ListBuilder<String>();
  set environmentNames(ListBuilder<String>? environmentNames) =>
      _$this._environmentNames = environmentNames;

  EnvironmentBuilder? _baseEnvironment;
  EnvironmentBuilder get baseEnvironment =>
      _$this._baseEnvironment ??= new EnvironmentBuilder();
  set baseEnvironment(EnvironmentBuilder? baseEnvironment) =>
      _$this._baseEnvironment = baseEnvironment;

  MapBuilder<String, Environment>? _environmentOverrides;
  MapBuilder<String, Environment> get environmentOverrides =>
      _$this._environmentOverrides ??= new MapBuilder<String, Environment>();
  set environmentOverrides(
          MapBuilder<String, Environment>? environmentOverrides) =>
      _$this._environmentOverrides = environmentOverrides;

  ProjectBuilder();

  ProjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _reference = $v.reference;
      _location = $v.location.toBuilder();
      _environmentNames = $v.environmentNames.toBuilder();
      _baseEnvironment = $v.baseEnvironment.toBuilder();
      _environmentOverrides = $v.environmentOverrides.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Project other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Project;
  }

  @override
  void update(void Function(ProjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Project build() => _build();

  _$Project _build() {
    _$Project _$result;
    try {
      _$result = _$v ??
          new _$Project._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'Project', 'name'),
              reference: BuiltValueNullFieldError.checkNotNull(
                  reference, r'Project', 'reference'),
              location: location.build(),
              environmentNames: environmentNames.build(),
              baseEnvironment: baseEnvironment.build(),
              environmentOverrides: environmentOverrides.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
        _$failedField = 'environmentNames';
        environmentNames.build();
        _$failedField = 'baseEnvironment';
        baseEnvironment.build();
        _$failedField = 'environmentOverrides';
        environmentOverrides.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Project', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Environment extends Environment {
  @override
  final String? name;
  @override
  final BuiltMap<String, Api> apis;

  factory _$Environment([void Function(EnvironmentBuilder)? updates]) =>
      (new EnvironmentBuilder()..update(updates))._build();

  _$Environment._({this.name, required this.apis}) : super._() {
    BuiltValueNullFieldError.checkNotNull(apis, r'Environment', 'apis');
  }

  @override
  Environment rebuild(void Function(EnvironmentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnvironmentBuilder toBuilder() => new EnvironmentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Environment && name == other.name && apis == other.apis;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, apis.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Environment')
          ..add('name', name)
          ..add('apis', apis))
        .toString();
  }
}

class EnvironmentBuilder implements Builder<Environment, EnvironmentBuilder> {
  _$Environment? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  MapBuilder<String, Api>? _apis;
  MapBuilder<String, Api> get apis =>
      _$this._apis ??= new MapBuilder<String, Api>();
  set apis(MapBuilder<String, Api>? apis) => _$this._apis = apis;

  EnvironmentBuilder();

  EnvironmentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _apis = $v.apis.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Environment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Environment;
  }

  @override
  void update(void Function(EnvironmentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Environment build() => _build();

  _$Environment _build() {
    _$Environment _$result;
    try {
      _$result = _$v ?? new _$Environment._(name: name, apis: apis.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apis';
        apis.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Environment', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Api extends Api {
  @override
  final String name;
  @override
  final String environmentName;
  @override
  final BuiltList<ApiMetadata> metadata;
  @override
  final BuiltMap<String, CloudFunction> functions;

  factory _$Api([void Function(ApiBuilder)? updates]) =>
      (new ApiBuilder()..update(updates))._build();

  _$Api._(
      {required this.name,
      required this.environmentName,
      required this.metadata,
      required this.functions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Api', 'name');
    BuiltValueNullFieldError.checkNotNull(
        environmentName, r'Api', 'environmentName');
    BuiltValueNullFieldError.checkNotNull(metadata, r'Api', 'metadata');
    BuiltValueNullFieldError.checkNotNull(functions, r'Api', 'functions');
  }

  @override
  Api rebuild(void Function(ApiBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiBuilder toBuilder() => new ApiBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Api &&
        name == other.name &&
        environmentName == other.environmentName &&
        metadata == other.metadata &&
        functions == other.functions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, environmentName.hashCode);
    _$hash = $jc(_$hash, metadata.hashCode);
    _$hash = $jc(_$hash, functions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Api')
          ..add('name', name)
          ..add('environmentName', environmentName)
          ..add('metadata', metadata)
          ..add('functions', functions))
        .toString();
  }
}

class ApiBuilder implements Builder<Api, ApiBuilder> {
  _$Api? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _environmentName;
  String? get environmentName => _$this._environmentName;
  set environmentName(String? environmentName) =>
      _$this._environmentName = environmentName;

  ListBuilder<ApiMetadata>? _metadata;
  ListBuilder<ApiMetadata> get metadata =>
      _$this._metadata ??= new ListBuilder<ApiMetadata>();
  set metadata(ListBuilder<ApiMetadata>? metadata) =>
      _$this._metadata = metadata;

  MapBuilder<String, CloudFunction>? _functions;
  MapBuilder<String, CloudFunction> get functions =>
      _$this._functions ??= new MapBuilder<String, CloudFunction>();
  set functions(MapBuilder<String, CloudFunction>? functions) =>
      _$this._functions = functions;

  ApiBuilder();

  ApiBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _environmentName = $v.environmentName;
      _metadata = $v.metadata.toBuilder();
      _functions = $v.functions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Api other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Api;
  }

  @override
  void update(void Function(ApiBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Api build() => _build();

  _$Api _build() {
    _$Api _$result;
    try {
      _$result = _$v ??
          new _$Api._(
              name: BuiltValueNullFieldError.checkNotNull(name, r'Api', 'name'),
              environmentName: BuiltValueNullFieldError.checkNotNull(
                  environmentName, r'Api', 'environmentName'),
              metadata: metadata.build(),
              functions: functions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'metadata';
        metadata.build();
        _$failedField = 'functions';
        functions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Api', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ApiMetadataAuthenticated extends ApiMetadataAuthenticated {
  @override
  final SourceLocation location;

  factory _$ApiMetadataAuthenticated(
          [void Function(ApiMetadataAuthenticatedBuilder)? updates]) =>
      (new ApiMetadataAuthenticatedBuilder()..update(updates))._build();

  _$ApiMetadataAuthenticated._({required this.location}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        location, r'ApiMetadataAuthenticated', 'location');
  }

  @override
  ApiMetadataAuthenticated rebuild(
          void Function(ApiMetadataAuthenticatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiMetadataAuthenticatedBuilder toBuilder() =>
      new ApiMetadataAuthenticatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiMetadataAuthenticated && location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiMetadataAuthenticated')
          ..add('location', location))
        .toString();
  }
}

class ApiMetadataAuthenticatedBuilder
    implements
        Builder<ApiMetadataAuthenticated, ApiMetadataAuthenticatedBuilder> {
  _$ApiMetadataAuthenticated? _$v;

  SourceLocationBuilder? _location;
  SourceLocationBuilder get location =>
      _$this._location ??= new SourceLocationBuilder();
  set location(SourceLocationBuilder? location) => _$this._location = location;

  ApiMetadataAuthenticatedBuilder();

  ApiMetadataAuthenticatedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _location = $v.location.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiMetadataAuthenticated other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiMetadataAuthenticated;
  }

  @override
  void update(void Function(ApiMetadataAuthenticatedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiMetadataAuthenticated build() => _build();

  _$ApiMetadataAuthenticated _build() {
    _$ApiMetadataAuthenticated _$result;
    try {
      _$result =
          _$v ?? new _$ApiMetadataAuthenticated._(location: location.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiMetadataAuthenticated', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ApiMetadataMiddleware extends ApiMetadataMiddleware {
  @override
  final Reference type;
  @override
  final SourceLocation location;

  factory _$ApiMetadataMiddleware(
          [void Function(ApiMetadataMiddlewareBuilder)? updates]) =>
      (new ApiMetadataMiddlewareBuilder()..update(updates))._build();

  _$ApiMetadataMiddleware._({required this.type, required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        type, r'ApiMetadataMiddleware', 'type');
    BuiltValueNullFieldError.checkNotNull(
        location, r'ApiMetadataMiddleware', 'location');
  }

  @override
  ApiMetadataMiddleware rebuild(
          void Function(ApiMetadataMiddlewareBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiMetadataMiddlewareBuilder toBuilder() =>
      new ApiMetadataMiddlewareBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiMetadataMiddleware &&
        type == other.type &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiMetadataMiddleware')
          ..add('type', type)
          ..add('location', location))
        .toString();
  }
}

class ApiMetadataMiddlewareBuilder
    implements Builder<ApiMetadataMiddleware, ApiMetadataMiddlewareBuilder> {
  _$ApiMetadataMiddleware? _$v;

  Reference? _type;
  Reference? get type => _$this._type;
  set type(Reference? type) => _$this._type = type;

  SourceLocationBuilder? _location;
  SourceLocationBuilder get location =>
      _$this._location ??= new SourceLocationBuilder();
  set location(SourceLocationBuilder? location) => _$this._location = location;

  ApiMetadataMiddlewareBuilder();

  ApiMetadataMiddlewareBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _location = $v.location.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiMetadataMiddleware other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiMetadataMiddleware;
  }

  @override
  void update(void Function(ApiMetadataMiddlewareBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiMetadataMiddleware build() => _build();

  _$ApiMetadataMiddleware _build() {
    _$ApiMetadataMiddleware _$result;
    try {
      _$result = _$v ??
          new _$ApiMetadataMiddleware._(
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'ApiMetadataMiddleware', 'type'),
              location: location.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiMetadataMiddleware', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Parameter extends Parameter {
  @override
  final String name;
  @override
  final Reference type;
  @override
  final bool required;
  @override
  final bool named;
  @override
  final SourceLocation location;

  factory _$Parameter([void Function(ParameterBuilder)? updates]) =>
      (new ParameterBuilder()..update(updates))._build();

  _$Parameter._(
      {required this.name,
      required this.type,
      required this.required,
      required this.named,
      required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Parameter', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'Parameter', 'type');
    BuiltValueNullFieldError.checkNotNull(required, r'Parameter', 'required');
    BuiltValueNullFieldError.checkNotNull(named, r'Parameter', 'named');
    BuiltValueNullFieldError.checkNotNull(location, r'Parameter', 'location');
  }

  @override
  Parameter rebuild(void Function(ParameterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ParameterBuilder toBuilder() => new ParameterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Parameter &&
        name == other.name &&
        type == other.type &&
        required == other.required &&
        named == other.named &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, named.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Parameter')
          ..add('name', name)
          ..add('type', type)
          ..add('required', required)
          ..add('named', named)
          ..add('location', location))
        .toString();
  }
}

class ParameterBuilder implements Builder<Parameter, ParameterBuilder> {
  _$Parameter? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  Reference? _type;
  Reference? get type => _$this._type;
  set type(Reference? type) => _$this._type = type;

  bool? _required;
  bool? get required => _$this._required;
  set required(bool? required) => _$this._required = required;

  bool? _named;
  bool? get named => _$this._named;
  set named(bool? named) => _$this._named = named;

  SourceLocationBuilder? _location;
  SourceLocationBuilder get location =>
      _$this._location ??= new SourceLocationBuilder();
  set location(SourceLocationBuilder? location) => _$this._location = location;

  ParameterBuilder();

  ParameterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _required = $v.required;
      _named = $v.named;
      _location = $v.location.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Parameter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Parameter;
  }

  @override
  void update(void Function(ParameterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Parameter build() => _build();

  _$Parameter _build() {
    _$Parameter _$result;
    try {
      _$result = _$v ??
          new _$Parameter._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'Parameter', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'Parameter', 'type'),
              required: BuiltValueNullFieldError.checkNotNull(
                  required, r'Parameter', 'required'),
              named: BuiltValueNullFieldError.checkNotNull(
                  named, r'Parameter', 'named'),
              location: location.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Parameter', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CloudFunction extends CloudFunction {
  @override
  final String name;
  @override
  final String apiName;
  @override
  final BuiltList<Parameter> parameters;
  @override
  final Reference returnType;
  @override
  final Reference flattenedReturnType;
  @override
  final BuiltList<ApiMetadata> metadata;
  @override
  final SourceLocation location;

  factory _$CloudFunction([void Function(CloudFunctionBuilder)? updates]) =>
      (new CloudFunctionBuilder()..update(updates))._build();

  _$CloudFunction._(
      {required this.name,
      required this.apiName,
      required this.parameters,
      required this.returnType,
      required this.flattenedReturnType,
      required this.metadata,
      required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'CloudFunction', 'name');
    BuiltValueNullFieldError.checkNotNull(apiName, r'CloudFunction', 'apiName');
    BuiltValueNullFieldError.checkNotNull(
        parameters, r'CloudFunction', 'parameters');
    BuiltValueNullFieldError.checkNotNull(
        returnType, r'CloudFunction', 'returnType');
    BuiltValueNullFieldError.checkNotNull(
        flattenedReturnType, r'CloudFunction', 'flattenedReturnType');
    BuiltValueNullFieldError.checkNotNull(
        metadata, r'CloudFunction', 'metadata');
    BuiltValueNullFieldError.checkNotNull(
        location, r'CloudFunction', 'location');
  }

  @override
  CloudFunction rebuild(void Function(CloudFunctionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CloudFunctionBuilder toBuilder() => new CloudFunctionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CloudFunction &&
        name == other.name &&
        apiName == other.apiName &&
        parameters == other.parameters &&
        returnType == other.returnType &&
        flattenedReturnType == other.flattenedReturnType &&
        metadata == other.metadata &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, apiName.hashCode);
    _$hash = $jc(_$hash, parameters.hashCode);
    _$hash = $jc(_$hash, returnType.hashCode);
    _$hash = $jc(_$hash, flattenedReturnType.hashCode);
    _$hash = $jc(_$hash, metadata.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CloudFunction')
          ..add('name', name)
          ..add('apiName', apiName)
          ..add('parameters', parameters)
          ..add('returnType', returnType)
          ..add('flattenedReturnType', flattenedReturnType)
          ..add('metadata', metadata)
          ..add('location', location))
        .toString();
  }
}

class CloudFunctionBuilder
    implements Builder<CloudFunction, CloudFunctionBuilder> {
  _$CloudFunction? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _apiName;
  String? get apiName => _$this._apiName;
  set apiName(String? apiName) => _$this._apiName = apiName;

  ListBuilder<Parameter>? _parameters;
  ListBuilder<Parameter> get parameters =>
      _$this._parameters ??= new ListBuilder<Parameter>();
  set parameters(ListBuilder<Parameter>? parameters) =>
      _$this._parameters = parameters;

  Reference? _returnType;
  Reference? get returnType => _$this._returnType;
  set returnType(Reference? returnType) => _$this._returnType = returnType;

  Reference? _flattenedReturnType;
  Reference? get flattenedReturnType => _$this._flattenedReturnType;
  set flattenedReturnType(Reference? flattenedReturnType) =>
      _$this._flattenedReturnType = flattenedReturnType;

  ListBuilder<ApiMetadata>? _metadata;
  ListBuilder<ApiMetadata> get metadata =>
      _$this._metadata ??= new ListBuilder<ApiMetadata>();
  set metadata(ListBuilder<ApiMetadata>? metadata) =>
      _$this._metadata = metadata;

  SourceLocationBuilder? _location;
  SourceLocationBuilder get location =>
      _$this._location ??= new SourceLocationBuilder();
  set location(SourceLocationBuilder? location) => _$this._location = location;

  CloudFunctionBuilder();

  CloudFunctionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _apiName = $v.apiName;
      _parameters = $v.parameters.toBuilder();
      _returnType = $v.returnType;
      _flattenedReturnType = $v.flattenedReturnType;
      _metadata = $v.metadata.toBuilder();
      _location = $v.location.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CloudFunction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CloudFunction;
  }

  @override
  void update(void Function(CloudFunctionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CloudFunction build() => _build();

  _$CloudFunction _build() {
    _$CloudFunction _$result;
    try {
      _$result = _$v ??
          new _$CloudFunction._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'CloudFunction', 'name'),
              apiName: BuiltValueNullFieldError.checkNotNull(
                  apiName, r'CloudFunction', 'apiName'),
              parameters: parameters.build(),
              returnType: BuiltValueNullFieldError.checkNotNull(
                  returnType, r'CloudFunction', 'returnType'),
              flattenedReturnType: BuiltValueNullFieldError.checkNotNull(
                  flattenedReturnType, r'CloudFunction', 'flattenedReturnType'),
              metadata: metadata.build(),
              location: location.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'parameters';
        parameters.build();

        _$failedField = 'metadata';
        metadata.build();
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CloudFunction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SourceLocation extends SourceLocation {
  @override
  final String path;
  @override
  final int line;
  @override
  final int column;

  factory _$SourceLocation([void Function(SourceLocationBuilder)? updates]) =>
      (new SourceLocationBuilder()..update(updates))._build();

  _$SourceLocation._(
      {required this.path, required this.line, required this.column})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(path, r'SourceLocation', 'path');
    BuiltValueNullFieldError.checkNotNull(line, r'SourceLocation', 'line');
    BuiltValueNullFieldError.checkNotNull(column, r'SourceLocation', 'column');
  }

  @override
  SourceLocation rebuild(void Function(SourceLocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SourceLocationBuilder toBuilder() =>
      new SourceLocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SourceLocation &&
        path == other.path &&
        line == other.line &&
        column == other.column;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, path.hashCode);
    _$hash = $jc(_$hash, line.hashCode);
    _$hash = $jc(_$hash, column.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SourceLocation')
          ..add('path', path)
          ..add('line', line)
          ..add('column', column))
        .toString();
  }
}

class SourceLocationBuilder
    implements Builder<SourceLocation, SourceLocationBuilder> {
  _$SourceLocation? _$v;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  int? _line;
  int? get line => _$this._line;
  set line(int? line) => _$this._line = line;

  int? _column;
  int? get column => _$this._column;
  set column(int? column) => _$this._column = column;

  SourceLocationBuilder();

  SourceLocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _path = $v.path;
      _line = $v.line;
      _column = $v.column;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SourceLocation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SourceLocation;
  }

  @override
  void update(void Function(SourceLocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SourceLocation build() => _build();

  _$SourceLocation _build() {
    final _$result = _$v ??
        new _$SourceLocation._(
            path: BuiltValueNullFieldError.checkNotNull(
                path, r'SourceLocation', 'path'),
            line: BuiltValueNullFieldError.checkNotNull(
                line, r'SourceLocation', 'line'),
            column: BuiltValueNullFieldError.checkNotNull(
                column, r'SourceLocation', 'column'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
