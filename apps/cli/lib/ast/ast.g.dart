// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ast.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const NodeType _$project = const NodeType._('project');
const NodeType _$api = const NodeType._('api');
const NodeType _$apiPublic = const NodeType._('apiPublic');
const NodeType _$apiAuthenticated = const NodeType._('apiAuthenticated');
const NodeType _$apiMiddleware = const NodeType._('apiMiddleware');
const NodeType _$cloudFunction = const NodeType._('cloudFunction');
const NodeType _$cloudFunctionParameter =
    const NodeType._('cloudFunctionParameter');
const NodeType _$environmentVariable = const NodeType._('environmentVariable');

NodeType _$valueOf(String name) {
  switch (name) {
    case 'project':
      return _$project;
    case 'api':
      return _$api;
    case 'apiPublic':
      return _$apiPublic;
    case 'apiAuthenticated':
      return _$apiAuthenticated;
    case 'apiMiddleware':
      return _$apiMiddleware;
    case 'cloudFunction':
      return _$cloudFunction;
    case 'cloudFunctionParameter':
      return _$cloudFunctionParameter;
    case 'environmentVariable':
      return _$environmentVariable;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<NodeType> _$values = new BuiltSet<NodeType>(const <NodeType>[
  _$project,
  _$api,
  _$apiPublic,
  _$apiAuthenticated,
  _$apiMiddleware,
  _$cloudFunction,
  _$cloudFunctionParameter,
  _$environmentVariable,
]);

Serializer<Project> _$projectSerializer = new _$ProjectSerializer();
Serializer<Api> _$apiSerializer = new _$ApiSerializer();
Serializer<ApiPublic> _$apiPublicSerializer = new _$ApiPublicSerializer();
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
Serializer<NodeType> _$nodeTypeSerializer = new _$NodeTypeSerializer();
Serializer<NodeReference> _$nodeReferenceSerializer =
    new _$NodeReferenceSerializer();
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
      'apis',
      serializers.serialize(object.apis,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(Api)])),
      'envVars',
      serializers.serialize(object.envVars,
          specifiedType: const FullType(
              BuiltList, const [const FullType(EnvironmentVariable)])),
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

class _$ApiPublicSerializer implements StructuredSerializer<ApiPublic> {
  @override
  final Iterable<Type> types = const [ApiPublic, _$ApiPublic];
  @override
  final String wireName = 'ApiPublic';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiPublic object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(SourceLocation)),
    ];

    return result;
  }

  @override
  ApiPublic deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiPublicBuilder();

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
    Object? value;
    value = object.references;
    if (value != null) {
      result
        ..add('references')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NodeReference)));
    }
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
        case 'references':
          result.references.replace(serializers.deserialize(value,
              specifiedType: const FullType(NodeReference))! as NodeReference);
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
      'exceptionTypes',
      serializers.serialize(object.exceptionTypes,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Reference)])),
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
        case 'exceptionTypes':
          result.exceptionTypes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Reference)]))!
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
      'envName',
      serializers.serialize(object.envName,
          specifiedType: const FullType(String)),
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
        case 'envName':
          result.envName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NodeTypeSerializer implements PrimitiveSerializer<NodeType> {
  @override
  final Iterable<Type> types = const <Type>[NodeType];
  @override
  final String wireName = 'NodeType';

  @override
  Object serialize(Serializers serializers, NodeType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  NodeType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NodeType.valueOf(serialized as String);
}

class _$NodeReferenceSerializer implements StructuredSerializer<NodeReference> {
  @override
  final Iterable<Type> types = const [NodeReference, _$NodeReference];
  @override
  final String wireName = 'NodeReference';

  @override
  Iterable<Object?> serialize(Serializers serializers, NodeReference object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(NodeType)),
    ];

    return result;
  }

  @override
  NodeReference deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NodeReferenceBuilder();

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
              specifiedType: const FullType(NodeType))! as NodeType;
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
  final BuiltMap<String, Api> apis;
  @override
  final BuiltList<EnvironmentVariable> envVars;

  factory _$Project([void Function(ProjectBuilder)? updates]) =>
      (new ProjectBuilder()..update(updates))._build();

  _$Project._(
      {required this.name,
      required this.reference,
      required this.location,
      required this.apis,
      required this.envVars})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Project', 'name');
    BuiltValueNullFieldError.checkNotNull(reference, r'Project', 'reference');
    BuiltValueNullFieldError.checkNotNull(location, r'Project', 'location');
    BuiltValueNullFieldError.checkNotNull(apis, r'Project', 'apis');
    BuiltValueNullFieldError.checkNotNull(envVars, r'Project', 'envVars');
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
        apis == other.apis &&
        envVars == other.envVars;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, apis.hashCode);
    _$hash = $jc(_$hash, envVars.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Project')
          ..add('name', name)
          ..add('reference', reference)
          ..add('location', location)
          ..add('apis', apis)
          ..add('envVars', envVars))
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

  MapBuilder<String, Api>? _apis;
  MapBuilder<String, Api> get apis =>
      _$this._apis ??= new MapBuilder<String, Api>();
  set apis(MapBuilder<String, Api>? apis) => _$this._apis = apis;

  ListBuilder<EnvironmentVariable>? _envVars;
  ListBuilder<EnvironmentVariable> get envVars =>
      _$this._envVars ??= new ListBuilder<EnvironmentVariable>();
  set envVars(ListBuilder<EnvironmentVariable>? envVars) =>
      _$this._envVars = envVars;

  ProjectBuilder();

  ProjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _reference = $v.reference;
      _location = $v.location.toBuilder();
      _apis = $v.apis.toBuilder();
      _envVars = $v.envVars.toBuilder();
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
              apis: apis.build(),
              envVars: envVars.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
        _$failedField = 'apis';
        apis.build();
        _$failedField = 'envVars';
        envVars.build();
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

class _$Api extends Api {
  @override
  final String name;
  @override
  final BuiltList<ApiMetadata> metadata;
  @override
  final BuiltMap<String, CloudFunction> functions;

  factory _$Api([void Function(ApiBuilder)? updates]) =>
      (new ApiBuilder()..update(updates))._build();

  _$Api._({required this.name, required this.metadata, required this.functions})
      : super._() {
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
        name == other.name &&
        metadata == other.metadata &&
        functions == other.functions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, metadata.hashCode);
    _$hash = $jc(_$hash, functions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Api')
          ..add('name', name)
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

class _$ApiPublic extends ApiPublic {
  @override
  final SourceLocation location;

  factory _$ApiPublic([void Function(ApiPublicBuilder)? updates]) =>
      (new ApiPublicBuilder()..update(updates))._build();

  _$ApiPublic._({required this.location}) : super._() {
    BuiltValueNullFieldError.checkNotNull(location, r'ApiPublic', 'location');
  }

  @override
  ApiPublic rebuild(void Function(ApiPublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiPublicBuilder toBuilder() => new ApiPublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiPublic && location == other.location;
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
    return (newBuiltValueToStringHelper(r'ApiPublic')
          ..add('location', location))
        .toString();
  }
}

class ApiPublicBuilder implements Builder<ApiPublic, ApiPublicBuilder> {
  _$ApiPublic? _$v;

  SourceLocationBuilder? _location;
  SourceLocationBuilder get location =>
      _$this._location ??= new SourceLocationBuilder();
  set location(SourceLocationBuilder? location) => _$this._location = location;

  ApiPublicBuilder();

  ApiPublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _location = $v.location.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiPublic other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiPublic;
  }

  @override
  void update(void Function(ApiPublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiPublic build() => _build();

  _$ApiPublic _build() {
    _$ApiPublic _$result;
    try {
      _$result = _$v ?? new _$ApiPublic._(location: location.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiPublic', _$failedField, e.toString());
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
  @override
  final NodeReference? references;

  factory _$CloudFunctionParameter(
          [void Function(CloudFunctionParameterBuilder)? updates]) =>
      (new CloudFunctionParameterBuilder()..update(updates))._build();

  _$CloudFunctionParameter._(
      {required this.name,
      required this.type,
      required this.required,
      required this.named,
      required this.location,
      this.references})
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
        location == other.location &&
        references == other.references;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, named.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, references.hashCode);
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
          ..add('location', location)
          ..add('references', references))
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

  NodeReferenceBuilder? _references;
  NodeReferenceBuilder get references =>
      _$this._references ??= new NodeReferenceBuilder();
  set references(NodeReferenceBuilder? references) =>
      _$this._references = references;

  CloudFunctionParameterBuilder();

  CloudFunctionParameterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _required = $v.required;
      _named = $v.named;
      _location = $v.location.toBuilder();
      _references = $v.references?.toBuilder();
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
              location: location.build(),
              references: _references?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
        _$failedField = 'references';
        _references?.build();
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
  final BuiltList<Reference> exceptionTypes;
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
      required this.exceptionTypes,
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
        exceptionTypes, r'CloudFunction', 'exceptionTypes');
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
        exceptionTypes == other.exceptionTypes &&
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
    _$hash = $jc(_$hash, exceptionTypes.hashCode);
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
          ..add('exceptionTypes', exceptionTypes)
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

  ListBuilder<Reference>? _exceptionTypes;
  ListBuilder<Reference> get exceptionTypes =>
      _$this._exceptionTypes ??= new ListBuilder<Reference>();
  set exceptionTypes(ListBuilder<Reference>? exceptionTypes) =>
      _$this._exceptionTypes = exceptionTypes;

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
      _exceptionTypes = $v.exceptionTypes.toBuilder();
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
              exceptionTypes: exceptionTypes.build(),
              location: location.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'parameters';
        parameters.build();

        _$failedField = 'metadata';
        metadata.build();
        _$failedField = 'exceptionTypes';
        exceptionTypes.build();
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
  final String envName;

  factory _$EnvironmentVariable(
          [void Function(EnvironmentVariableBuilder)? updates]) =>
      (new EnvironmentVariableBuilder()..update(updates))._build();

  _$EnvironmentVariable._({required this.envName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        envName, r'EnvironmentVariable', 'envName');
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
    return other is EnvironmentVariable && envName == other.envName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, envName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EnvironmentVariable')
          ..add('envName', envName))
        .toString();
  }
}

class EnvironmentVariableBuilder
    implements Builder<EnvironmentVariable, EnvironmentVariableBuilder> {
  _$EnvironmentVariable? _$v;

  String? _envName;
  String? get envName => _$this._envName;
  set envName(String? envName) => _$this._envName = envName;

  EnvironmentVariableBuilder();

  EnvironmentVariableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _envName = $v.envName;
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
    final _$result = _$v ??
        new _$EnvironmentVariable._(
            envName: BuiltValueNullFieldError.checkNotNull(
                envName, r'EnvironmentVariable', 'envName'));
    replace(_$result);
    return _$result;
  }
}

class _$NodeReference extends NodeReference {
  @override
  final String name;
  @override
  final NodeType type;

  factory _$NodeReference([void Function(NodeReferenceBuilder)? updates]) =>
      (new NodeReferenceBuilder()..update(updates))._build();

  _$NodeReference._({required this.name, required this.type}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'NodeReference', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'NodeReference', 'type');
  }

  @override
  NodeReference rebuild(void Function(NodeReferenceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NodeReferenceBuilder toBuilder() => new NodeReferenceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NodeReference && name == other.name && type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NodeReference')
          ..add('name', name)
          ..add('type', type))
        .toString();
  }
}

class NodeReferenceBuilder
    implements Builder<NodeReference, NodeReferenceBuilder> {
  _$NodeReference? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  NodeType? _type;
  NodeType? get type => _$this._type;
  set type(NodeType? type) => _$this._type = type;

  NodeReferenceBuilder();

  NodeReferenceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NodeReference other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NodeReference;
  }

  @override
  void update(void Function(NodeReferenceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NodeReference build() => _build();

  _$NodeReference _build() {
    final _$result = _$v ??
        new _$NodeReference._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'NodeReference', 'name'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'NodeReference', 'type'));
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
