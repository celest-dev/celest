// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ast.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Project> _$projectSerializer = new _$ProjectSerializer();
Serializer<ProjectClass> _$projectClassSerializer =
    new _$ProjectClassSerializer();
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
      'implementation',
      serializers.serialize(object.implementation,
          specifiedType: const FullType(ProjectClass)),
      'apis',
      serializers.serialize(object.apis,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Api)])),
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
        case 'implementation':
          result.implementation.replace(serializers.deserialize(value,
              specifiedType: const FullType(ProjectClass))! as ProjectClass);
          break;
        case 'apis':
          result.apis.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Api)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ProjectClassSerializer implements StructuredSerializer<ProjectClass> {
  @override
  final Iterable<Type> types = const [ProjectClass, _$ProjectClass];
  @override
  final String wireName = 'ProjectClass';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProjectClass object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(SourceLocation)),
    ];

    return result;
  }

  @override
  ProjectClass deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProjectClassBuilder();

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

class _$ApiSerializer implements StructuredSerializer<Api> {
  @override
  final Iterable<Type> types = const [Api, _$Api];
  @override
  final String wireName = 'Api';

  @override
  Iterable<Object?> serialize(Serializers serializers, Api object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'uri',
      serializers.serialize(object.uri, specifiedType: const FullType(Uri)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'metadata',
      serializers.serialize(object.metadata,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ApiMetadata)])),
      'functions',
      serializers.serialize(object.functions,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CloudFunction)])),
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
        case 'uri':
          result.uri = serializers.deserialize(value,
              specifiedType: const FullType(Uri))! as Uri;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
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
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CloudFunction)]))!
              as BuiltList<Object?>);
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
      'parameters',
      serializers.serialize(object.parameters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Parameter)])),
      'returnType',
      serializers.serialize(object.returnType,
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
      'uri',
      serializers.serialize(object.uri, specifiedType: const FullType(Uri)),
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
        case 'uri':
          result.uri = serializers.deserialize(value,
              specifiedType: const FullType(Uri))! as Uri;
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
  final ProjectClass implementation;
  @override
  final BuiltList<Api> apis;

  factory _$Project([void Function(ProjectBuilder)? updates]) =>
      (new ProjectBuilder()..update(updates))._build();

  _$Project._(
      {required this.name, required this.implementation, required this.apis})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Project', 'name');
    BuiltValueNullFieldError.checkNotNull(
        implementation, r'Project', 'implementation');
    BuiltValueNullFieldError.checkNotNull(apis, r'Project', 'apis');
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
        implementation == other.implementation &&
        apis == other.apis;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, implementation.hashCode);
    _$hash = $jc(_$hash, apis.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Project')
          ..add('name', name)
          ..add('implementation', implementation)
          ..add('apis', apis))
        .toString();
  }
}

class ProjectBuilder implements Builder<Project, ProjectBuilder> {
  _$Project? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ProjectClassBuilder? _implementation;
  ProjectClassBuilder get implementation =>
      _$this._implementation ??= new ProjectClassBuilder();
  set implementation(ProjectClassBuilder? implementation) =>
      _$this._implementation = implementation;

  ListBuilder<Api>? _apis;
  ListBuilder<Api> get apis => _$this._apis ??= new ListBuilder<Api>();
  set apis(ListBuilder<Api>? apis) => _$this._apis = apis;

  ProjectBuilder();

  ProjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _implementation = $v.implementation.toBuilder();
      _apis = $v.apis.toBuilder();
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
              implementation: implementation.build(),
              apis: apis.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'implementation';
        implementation.build();
        _$failedField = 'apis';
        apis.build();
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

class _$ProjectClass extends ProjectClass {
  @override
  final String name;
  @override
  final SourceLocation location;

  factory _$ProjectClass([void Function(ProjectClassBuilder)? updates]) =>
      (new ProjectClassBuilder()..update(updates))._build();

  _$ProjectClass._({required this.name, required this.location}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ProjectClass', 'name');
    BuiltValueNullFieldError.checkNotNull(
        location, r'ProjectClass', 'location');
  }

  @override
  ProjectClass rebuild(void Function(ProjectClassBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProjectClassBuilder toBuilder() => new ProjectClassBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProjectClass &&
        name == other.name &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProjectClass')
          ..add('name', name)
          ..add('location', location))
        .toString();
  }
}

class ProjectClassBuilder
    implements Builder<ProjectClass, ProjectClassBuilder> {
  _$ProjectClass? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  SourceLocationBuilder? _location;
  SourceLocationBuilder get location =>
      _$this._location ??= new SourceLocationBuilder();
  set location(SourceLocationBuilder? location) => _$this._location = location;

  ProjectClassBuilder();

  ProjectClassBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _location = $v.location.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProjectClass other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProjectClass;
  }

  @override
  void update(void Function(ProjectClassBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProjectClass build() => _build();

  _$ProjectClass _build() {
    _$ProjectClass _$result;
    try {
      _$result = _$v ??
          new _$ProjectClass._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ProjectClass', 'name'),
              location: location.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProjectClass', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Api extends Api {
  @override
  final Uri uri;
  @override
  final String name;
  @override
  final BuiltList<ApiMetadata> metadata;
  @override
  final BuiltList<CloudFunction> functions;

  factory _$Api([void Function(ApiBuilder)? updates]) =>
      (new ApiBuilder()..update(updates))._build();

  _$Api._(
      {required this.uri,
      required this.name,
      required this.metadata,
      required this.functions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uri, r'Api', 'uri');
    BuiltValueNullFieldError.checkNotNull(name, r'Api', 'name');
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
        uri == other.uri &&
        name == other.name &&
        metadata == other.metadata &&
        functions == other.functions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, uri.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, metadata.hashCode);
    _$hash = $jc(_$hash, functions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Api')
          ..add('uri', uri)
          ..add('name', name)
          ..add('metadata', metadata)
          ..add('functions', functions))
        .toString();
  }
}

class ApiBuilder implements Builder<Api, ApiBuilder> {
  _$Api? _$v;

  Uri? _uri;
  Uri? get uri => _$this._uri;
  set uri(Uri? uri) => _$this._uri = uri;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<ApiMetadata>? _metadata;
  ListBuilder<ApiMetadata> get metadata =>
      _$this._metadata ??= new ListBuilder<ApiMetadata>();
  set metadata(ListBuilder<ApiMetadata>? metadata) =>
      _$this._metadata = metadata;

  ListBuilder<CloudFunction>? _functions;
  ListBuilder<CloudFunction> get functions =>
      _$this._functions ??= new ListBuilder<CloudFunction>();
  set functions(ListBuilder<CloudFunction>? functions) =>
      _$this._functions = functions;

  ApiBuilder();

  ApiBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uri = $v.uri;
      _name = $v.name;
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
              uri: BuiltValueNullFieldError.checkNotNull(uri, r'Api', 'uri'),
              name: BuiltValueNullFieldError.checkNotNull(name, r'Api', 'name'),
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
  final BuiltList<Parameter> parameters;
  @override
  final Reference returnType;
  @override
  final BuiltList<ApiMetadata> metadata;
  @override
  final SourceLocation location;

  factory _$CloudFunction([void Function(CloudFunctionBuilder)? updates]) =>
      (new CloudFunctionBuilder()..update(updates))._build();

  _$CloudFunction._(
      {required this.name,
      required this.parameters,
      required this.returnType,
      required this.metadata,
      required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'CloudFunction', 'name');
    BuiltValueNullFieldError.checkNotNull(
        parameters, r'CloudFunction', 'parameters');
    BuiltValueNullFieldError.checkNotNull(
        returnType, r'CloudFunction', 'returnType');
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
        parameters == other.parameters &&
        returnType == other.returnType &&
        metadata == other.metadata &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, parameters.hashCode);
    _$hash = $jc(_$hash, returnType.hashCode);
    _$hash = $jc(_$hash, metadata.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CloudFunction')
          ..add('name', name)
          ..add('parameters', parameters)
          ..add('returnType', returnType)
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

  ListBuilder<Parameter>? _parameters;
  ListBuilder<Parameter> get parameters =>
      _$this._parameters ??= new ListBuilder<Parameter>();
  set parameters(ListBuilder<Parameter>? parameters) =>
      _$this._parameters = parameters;

  Reference? _returnType;
  Reference? get returnType => _$this._returnType;
  set returnType(Reference? returnType) => _$this._returnType = returnType;

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
      _parameters = $v.parameters.toBuilder();
      _returnType = $v.returnType;
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
              parameters: parameters.build(),
              returnType: BuiltValueNullFieldError.checkNotNull(
                  returnType, r'CloudFunction', 'returnType'),
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
  final Uri uri;
  @override
  final int line;
  @override
  final int column;

  factory _$SourceLocation([void Function(SourceLocationBuilder)? updates]) =>
      (new SourceLocationBuilder()..update(updates))._build();

  _$SourceLocation._(
      {required this.uri, required this.line, required this.column})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uri, r'SourceLocation', 'uri');
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
        uri == other.uri &&
        line == other.line &&
        column == other.column;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, uri.hashCode);
    _$hash = $jc(_$hash, line.hashCode);
    _$hash = $jc(_$hash, column.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SourceLocation')
          ..add('uri', uri)
          ..add('line', line)
          ..add('column', column))
        .toString();
  }
}

class SourceLocationBuilder
    implements Builder<SourceLocation, SourceLocationBuilder> {
  _$SourceLocation? _$v;

  Uri? _uri;
  Uri? get uri => _$this._uri;
  set uri(Uri? uri) => _$this._uri = uri;

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
      _uri = $v.uri;
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
            uri: BuiltValueNullFieldError.checkNotNull(
                uri, r'SourceLocation', 'uri'),
            line: BuiltValueNullFieldError.checkNotNull(
                line, r'SourceLocation', 'line'),
            column: BuiltValueNullFieldError.checkNotNull(
                column, r'SourceLocation', 'column'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
