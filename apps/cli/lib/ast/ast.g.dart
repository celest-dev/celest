// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ast.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Project> _$projectSerializer = new _$ProjectSerializer();
Serializer<Environment> _$environmentSerializer = new _$EnvironmentSerializer();
Serializer<Api> _$apiSerializer = new _$ApiSerializer();
Serializer<ApiAnonymous> _$apiAnonymousSerializer =
    new _$ApiAnonymousSerializer();
Serializer<ApiAuthenticated> _$apiAuthenticatedSerializer =
    new _$ApiAuthenticatedSerializer();
Serializer<ApiMiddleware> _$apiMiddlewareSerializer =
    new _$ApiMiddlewareSerializer();
Serializer<CloudFunctionParameter> _$cloudFunctionParameterSerializer =
    new _$CloudFunctionParameterSerializer();
Serializer<CloudFunction> _$cloudFunctionSerializer =
    new _$CloudFunctionSerializer();
Serializer<EnvironmentVariable> _$environmentVariableSerializer =
    new _$EnvironmentVariableSerializer();
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
      'envVars',
      serializers.serialize(object.envVars,
          specifiedType: const FullType(
              BuiltList, const [const FullType(EnvironmentVariable)])),
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
        case 'envVars':
          result.envVars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(EnvironmentVariable)]))!
              as BuiltList<Object?>);
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

class _$ApiAnonymousSerializer implements StructuredSerializer<ApiAnonymous> {
  @override
  final Iterable<Type> types = const [ApiAnonymous, _$ApiAnonymous];
  @override
  final String wireName = 'ApiAnonymous';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiAnonymous object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(SourceLocation)),
    ];

    return result;
  }

  @override
  ApiAnonymous deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiAnonymousBuilder();

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

class _$ApiAuthenticatedSerializer
    implements StructuredSerializer<ApiAuthenticated> {
  @override
  final Iterable<Type> types = const [ApiAuthenticated, _$ApiAuthenticated];
  @override
  final String wireName = 'ApiAuthenticated';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiAuthenticated object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(SourceLocation)),
    ];

    return result;
  }

  @override
  ApiAuthenticated deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiAuthenticatedBuilder();

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

class _$ApiMiddlewareSerializer implements StructuredSerializer<ApiMiddleware> {
  @override
  final Iterable<Type> types = const [ApiMiddleware, _$ApiMiddleware];
  @override
  final String wireName = 'ApiMiddleware';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiMiddleware object,
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
  ApiMiddleware deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiMiddlewareBuilder();

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

class _$CloudFunctionParameterSerializer
    implements StructuredSerializer<CloudFunctionParameter> {
  @override
  final Iterable<Type> types = const [
    CloudFunctionParameter,
    _$CloudFunctionParameter
  ];
  @override
  final String wireName = 'CloudFunctionParameter';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CloudFunctionParameter object,
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
  CloudFunctionParameter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CloudFunctionParameterBuilder();

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
          specifiedType: const FullType(
              BuiltList, const [const FullType(CloudFunctionParameter)])),
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
              specifiedType: const FullType(BuiltList, const [
                const FullType(CloudFunctionParameter)
              ]))! as BuiltList<Object?>);
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

class _$EnvironmentVariableSerializer
    implements StructuredSerializer<EnvironmentVariable> {
  @override
  final Iterable<Type> types = const [
    EnvironmentVariable,
    _$EnvironmentVariable
  ];
  @override
  final String wireName = 'EnvironmentVariable';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EnvironmentVariable object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'dartName',
      serializers.serialize(object.dartName,
          specifiedType: const FullType(String)),
      'envName',
      serializers.serialize(object.envName,
          specifiedType: const FullType(String)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(SourceLocation)),
    ];

    return result;
  }

  @override
  EnvironmentVariable deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EnvironmentVariableBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dartName':
          result.dartName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'envName':
          result.envName = serializers.deserialize(value,
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
  @override
  final BuiltList<EnvironmentVariable> envVars;

  factory _$Environment([void Function(EnvironmentBuilder)? updates]) =>
      (new EnvironmentBuilder()..update(updates))._build();

  _$Environment._({this.name, required this.apis, required this.envVars})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(apis, r'Environment', 'apis');
    BuiltValueNullFieldError.checkNotNull(envVars, r'Environment', 'envVars');
  }

  @override
  Environment rebuild(void Function(EnvironmentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnvironmentBuilder toBuilder() => new EnvironmentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Environment &&
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
    return (newBuiltValueToStringHelper(r'Environment')
          ..add('name', name)
          ..add('apis', apis)
          ..add('envVars', envVars))
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

  ListBuilder<EnvironmentVariable>? _envVars;
  ListBuilder<EnvironmentVariable> get envVars =>
      _$this._envVars ??= new ListBuilder<EnvironmentVariable>();
  set envVars(ListBuilder<EnvironmentVariable>? envVars) =>
      _$this._envVars = envVars;

  EnvironmentBuilder();

  EnvironmentBuilder get _$this {
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
      _$result = _$v ??
          new _$Environment._(
              name: name, apis: apis.build(), envVars: envVars.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apis';
        apis.build();
        _$failedField = 'envVars';
        envVars.build();
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

class _$ApiAnonymous extends ApiAnonymous {
  @override
  final SourceLocation location;

  factory _$ApiAnonymous([void Function(ApiAnonymousBuilder)? updates]) =>
      (new ApiAnonymousBuilder()..update(updates))._build();

  _$ApiAnonymous._({required this.location}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        location, r'ApiAnonymous', 'location');
  }

  @override
  ApiAnonymous rebuild(void Function(ApiAnonymousBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiAnonymousBuilder toBuilder() => new ApiAnonymousBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiAnonymous && location == other.location;
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
    return (newBuiltValueToStringHelper(r'ApiAnonymous')
          ..add('location', location))
        .toString();
  }
}

class ApiAnonymousBuilder
    implements Builder<ApiAnonymous, ApiAnonymousBuilder> {
  _$ApiAnonymous? _$v;

  SourceLocationBuilder? _location;
  SourceLocationBuilder get location =>
      _$this._location ??= new SourceLocationBuilder();
  set location(SourceLocationBuilder? location) => _$this._location = location;

  ApiAnonymousBuilder();

  ApiAnonymousBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _location = $v.location.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiAnonymous other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiAnonymous;
  }

  @override
  void update(void Function(ApiAnonymousBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiAnonymous build() => _build();

  _$ApiAnonymous _build() {
    _$ApiAnonymous _$result;
    try {
      _$result = _$v ?? new _$ApiAnonymous._(location: location.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiAnonymous', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ApiAuthenticated extends ApiAuthenticated {
  @override
  final SourceLocation location;

  factory _$ApiAuthenticated(
          [void Function(ApiAuthenticatedBuilder)? updates]) =>
      (new ApiAuthenticatedBuilder()..update(updates))._build();

  _$ApiAuthenticated._({required this.location}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        location, r'ApiAuthenticated', 'location');
  }

  @override
  ApiAuthenticated rebuild(void Function(ApiAuthenticatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiAuthenticatedBuilder toBuilder() =>
      new ApiAuthenticatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiAuthenticated && location == other.location;
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
    return (newBuiltValueToStringHelper(r'ApiAuthenticated')
          ..add('location', location))
        .toString();
  }
}

class ApiAuthenticatedBuilder
    implements Builder<ApiAuthenticated, ApiAuthenticatedBuilder> {
  _$ApiAuthenticated? _$v;

  SourceLocationBuilder? _location;
  SourceLocationBuilder get location =>
      _$this._location ??= new SourceLocationBuilder();
  set location(SourceLocationBuilder? location) => _$this._location = location;

  ApiAuthenticatedBuilder();

  ApiAuthenticatedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _location = $v.location.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiAuthenticated other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiAuthenticated;
  }

  @override
  void update(void Function(ApiAuthenticatedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiAuthenticated build() => _build();

  _$ApiAuthenticated _build() {
    _$ApiAuthenticated _$result;
    try {
      _$result = _$v ?? new _$ApiAuthenticated._(location: location.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiAuthenticated', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ApiMiddleware extends ApiMiddleware {
  @override
  final Reference type;
  @override
  final SourceLocation location;

  factory _$ApiMiddleware([void Function(ApiMiddlewareBuilder)? updates]) =>
      (new ApiMiddlewareBuilder()..update(updates))._build();

  _$ApiMiddleware._({required this.type, required this.location}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'ApiMiddleware', 'type');
    BuiltValueNullFieldError.checkNotNull(
        location, r'ApiMiddleware', 'location');
  }

  @override
  ApiMiddleware rebuild(void Function(ApiMiddlewareBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiMiddlewareBuilder toBuilder() => new ApiMiddlewareBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiMiddleware &&
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
    return (newBuiltValueToStringHelper(r'ApiMiddleware')
          ..add('type', type)
          ..add('location', location))
        .toString();
  }
}

class ApiMiddlewareBuilder
    implements Builder<ApiMiddleware, ApiMiddlewareBuilder> {
  _$ApiMiddleware? _$v;

  Reference? _type;
  Reference? get type => _$this._type;
  set type(Reference? type) => _$this._type = type;

  SourceLocationBuilder? _location;
  SourceLocationBuilder get location =>
      _$this._location ??= new SourceLocationBuilder();
  set location(SourceLocationBuilder? location) => _$this._location = location;

  ApiMiddlewareBuilder();

  ApiMiddlewareBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _location = $v.location.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiMiddleware other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiMiddleware;
  }

  @override
  void update(void Function(ApiMiddlewareBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiMiddleware build() => _build();

  _$ApiMiddleware _build() {
    _$ApiMiddleware _$result;
    try {
      _$result = _$v ??
          new _$ApiMiddleware._(
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'ApiMiddleware', 'type'),
              location: location.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiMiddleware', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CloudFunctionParameter extends CloudFunctionParameter {
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

  factory _$CloudFunctionParameter(
          [void Function(CloudFunctionParameterBuilder)? updates]) =>
      (new CloudFunctionParameterBuilder()..update(updates))._build();

  _$CloudFunctionParameter._(
      {required this.name,
      required this.type,
      required this.required,
      required this.named,
      required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'CloudFunctionParameter', 'name');
    BuiltValueNullFieldError.checkNotNull(
        type, r'CloudFunctionParameter', 'type');
    BuiltValueNullFieldError.checkNotNull(
        required, r'CloudFunctionParameter', 'required');
    BuiltValueNullFieldError.checkNotNull(
        named, r'CloudFunctionParameter', 'named');
    BuiltValueNullFieldError.checkNotNull(
        location, r'CloudFunctionParameter', 'location');
  }

  @override
  CloudFunctionParameter rebuild(
          void Function(CloudFunctionParameterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CloudFunctionParameterBuilder toBuilder() =>
      new CloudFunctionParameterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CloudFunctionParameter &&
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
    return (newBuiltValueToStringHelper(r'CloudFunctionParameter')
          ..add('name', name)
          ..add('type', type)
          ..add('required', required)
          ..add('named', named)
          ..add('location', location))
        .toString();
  }
}

class CloudFunctionParameterBuilder
    implements Builder<CloudFunctionParameter, CloudFunctionParameterBuilder> {
  _$CloudFunctionParameter? _$v;

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

  CloudFunctionParameterBuilder();

  CloudFunctionParameterBuilder get _$this {
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
  void replace(CloudFunctionParameter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CloudFunctionParameter;
  }

  @override
  void update(void Function(CloudFunctionParameterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CloudFunctionParameter build() => _build();

  _$CloudFunctionParameter _build() {
    _$CloudFunctionParameter _$result;
    try {
      _$result = _$v ??
          new _$CloudFunctionParameter._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'CloudFunctionParameter', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'CloudFunctionParameter', 'type'),
              required: BuiltValueNullFieldError.checkNotNull(
                  required, r'CloudFunctionParameter', 'required'),
              named: BuiltValueNullFieldError.checkNotNull(
                  named, r'CloudFunctionParameter', 'named'),
              location: location.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CloudFunctionParameter', _$failedField, e.toString());
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
  final BuiltList<CloudFunctionParameter> parameters;
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

  ListBuilder<CloudFunctionParameter>? _parameters;
  ListBuilder<CloudFunctionParameter> get parameters =>
      _$this._parameters ??= new ListBuilder<CloudFunctionParameter>();
  set parameters(ListBuilder<CloudFunctionParameter>? parameters) =>
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

class _$EnvironmentVariable extends EnvironmentVariable {
  @override
  final String dartName;
  @override
  final String envName;
  @override
  final SourceLocation location;

  factory _$EnvironmentVariable(
          [void Function(EnvironmentVariableBuilder)? updates]) =>
      (new EnvironmentVariableBuilder()..update(updates))._build();

  _$EnvironmentVariable._(
      {required this.dartName, required this.envName, required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        dartName, r'EnvironmentVariable', 'dartName');
    BuiltValueNullFieldError.checkNotNull(
        envName, r'EnvironmentVariable', 'envName');
    BuiltValueNullFieldError.checkNotNull(
        location, r'EnvironmentVariable', 'location');
  }

  @override
  EnvironmentVariable rebuild(
          void Function(EnvironmentVariableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnvironmentVariableBuilder toBuilder() =>
      new EnvironmentVariableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnvironmentVariable &&
        dartName == other.dartName &&
        envName == other.envName &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dartName.hashCode);
    _$hash = $jc(_$hash, envName.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EnvironmentVariable')
          ..add('dartName', dartName)
          ..add('envName', envName)
          ..add('location', location))
        .toString();
  }
}

class EnvironmentVariableBuilder
    implements Builder<EnvironmentVariable, EnvironmentVariableBuilder> {
  _$EnvironmentVariable? _$v;

  String? _dartName;
  String? get dartName => _$this._dartName;
  set dartName(String? dartName) => _$this._dartName = dartName;

  String? _envName;
  String? get envName => _$this._envName;
  set envName(String? envName) => _$this._envName = envName;

  SourceLocationBuilder? _location;
  SourceLocationBuilder get location =>
      _$this._location ??= new SourceLocationBuilder();
  set location(SourceLocationBuilder? location) => _$this._location = location;

  EnvironmentVariableBuilder();

  EnvironmentVariableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dartName = $v.dartName;
      _envName = $v.envName;
      _location = $v.location.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnvironmentVariable other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EnvironmentVariable;
  }

  @override
  void update(void Function(EnvironmentVariableBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EnvironmentVariable build() => _build();

  _$EnvironmentVariable _build() {
    _$EnvironmentVariable _$result;
    try {
      _$result = _$v ??
          new _$EnvironmentVariable._(
              dartName: BuiltValueNullFieldError.checkNotNull(
                  dartName, r'EnvironmentVariable', 'dartName'),
              envName: BuiltValueNullFieldError.checkNotNull(
                  envName, r'EnvironmentVariable', 'envName'),
              location: location.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EnvironmentVariable', _$failedField, e.toString());
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
