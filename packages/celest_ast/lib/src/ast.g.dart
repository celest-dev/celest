// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ast.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const Region _$northAmerica = const Region._('northAmerica');
const Region _$europe = const Region._('europe');
const Region _$asiaPacific = const Region._('asiaPacific');

Region _$RegionValueOf(String name) {
  switch (name) {
    case 'northAmerica':
      return _$northAmerica;
    case 'europe':
      return _$europe;
    case 'asiaPacific':
      return _$asiaPacific;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<Region> _$RegionValues = new BuiltSet<Region>(const <Region>[
  _$northAmerica,
  _$europe,
  _$asiaPacific,
]);

const StreamType _$unidirectionalServer =
    const StreamType._('unidirectionalServer');
const StreamType _$unidirectionalClient =
    const StreamType._('unidirectionalClient');
const StreamType _$bidirectional = const StreamType._('bidirectional');

StreamType _$StreamTypeValueOf(String name) {
  switch (name) {
    case 'unidirectionalServer':
      return _$unidirectionalServer;
    case 'unidirectionalClient':
      return _$unidirectionalClient;
    case 'bidirectional':
      return _$bidirectional;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<StreamType> _$StreamTypeValues =
    new BuiltSet<StreamType>(const <StreamType>[
  _$unidirectionalServer,
  _$unidirectionalClient,
  _$bidirectional,
]);

const AuthProviderType _$emailOtp = const AuthProviderType._('emailOtp');
const AuthProviderType _$smsOtp = const AuthProviderType._('smsOtp');
const AuthProviderType _$google = const AuthProviderType._('google');
const AuthProviderType _$gitHub = const AuthProviderType._('gitHub');
const AuthProviderType _$apple = const AuthProviderType._('apple');
const AuthProviderType _$firebase = const AuthProviderType._('firebase');
const AuthProviderType _$supabase = const AuthProviderType._('supabase');

AuthProviderType _$AuthProviderTypeValueOf(String name) {
  switch (name) {
    case 'emailOtp':
      return _$emailOtp;
    case 'smsOtp':
      return _$smsOtp;
    case 'google':
      return _$google;
    case 'gitHub':
      return _$gitHub;
    case 'apple':
      return _$apple;
    case 'firebase':
      return _$firebase;
    case 'supabase':
      return _$supabase;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AuthProviderType> _$AuthProviderTypeValues =
    new BuiltSet<AuthProviderType>(const <AuthProviderType>[
  _$emailOtp,
  _$smsOtp,
  _$google,
  _$gitHub,
  _$apple,
  _$firebase,
  _$supabase,
]);

const NodeType _$project = const NodeType._('project');
const NodeType _$api = const NodeType._('api');
const NodeType _$apiPublic = const NodeType._('apiPublic');
const NodeType _$apiAuthenticated = const NodeType._('apiAuthenticated');
const NodeType _$apiMiddleware = const NodeType._('apiMiddleware');
const NodeType _$cloudFunction = const NodeType._('cloudFunction');
const NodeType _$cloudFunctionParameter =
    const NodeType._('cloudFunctionParameter');
const NodeType _$variable = const NodeType._('variable');
const NodeType _$secret = const NodeType._('secret');
const NodeType _$userContext = const NodeType._('userContext');
const NodeType _$httpHeader = const NodeType._('httpHeader');
const NodeType _$httpQuery = const NodeType._('httpQuery');
const NodeType _$httpLabel = const NodeType._('httpLabel');

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
    case 'variable':
      return _$variable;
    case 'secret':
      return _$secret;
    case 'userContext':
      return _$userContext;
    case 'httpHeader':
      return _$httpHeader;
    case 'httpQuery':
      return _$httpQuery;
    case 'httpLabel':
      return _$httpLabel;
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
  _$variable,
  _$secret,
  _$userContext,
  _$httpHeader,
  _$httpQuery,
  _$httpLabel,
]);

const DatabaseSchemaType _$drift = const DatabaseSchemaType._('drift');

DatabaseSchemaType _$DatabaseSchemaTypeValueOf(String name) {
  switch (name) {
    case 'drift':
      return _$drift;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<DatabaseSchemaType> _$DatabaseSchemaTypeValues =
    new BuiltSet<DatabaseSchemaType>(const <DatabaseSchemaType>[
  _$drift,
]);

const DatabaseProviderType _$celest = const DatabaseProviderType._('celest');

DatabaseProviderType _$databaseProviderTypeValueOf(String name) {
  switch (name) {
    case 'celest':
      return _$celest;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<DatabaseProviderType> _$databaseProviderType =
    new BuiltSet<DatabaseProviderType>(const <DatabaseProviderType>[
  _$celest,
]);

Serializer<Region> _$regionSerializer = new _$RegionSerializer();
Serializer<Project> _$projectSerializer = new _$ProjectSerializer();
Serializer<Api> _$apiSerializer = new _$ApiSerializer();
Serializer<ApiPublic> _$apiPublicSerializer = new _$ApiPublicSerializer();
Serializer<ApiAuthenticated> _$apiAuthenticatedSerializer =
    new _$ApiAuthenticatedSerializer();
Serializer<ApiMiddleware> _$apiMiddlewareSerializer =
    new _$ApiMiddlewareSerializer();
Serializer<ApiHttpConfig> _$apiHttpConfigSerializer =
    new _$ApiHttpConfigSerializer();
Serializer<ApiHttpError> _$apiHttpErrorSerializer =
    new _$ApiHttpErrorSerializer();
Serializer<CloudFunctionParameter> _$cloudFunctionParameterSerializer =
    new _$CloudFunctionParameterSerializer();
Serializer<StreamType> _$streamTypeSerializer = new _$StreamTypeSerializer();
Serializer<CloudFunction> _$cloudFunctionSerializer =
    new _$CloudFunctionSerializer();
Serializer<Variable> _$variableSerializer = new _$VariableSerializer();
Serializer<Secret> _$secretSerializer = new _$SecretSerializer();
Serializer<Auth> _$authSerializer = new _$AuthSerializer();
Serializer<AuthProviderType> _$authProviderTypeSerializer =
    new _$AuthProviderTypeSerializer();
Serializer<EmailAuthProvider> _$emailAuthProviderSerializer =
    new _$EmailAuthProviderSerializer();
Serializer<SmsAuthProvider> _$smsAuthProviderSerializer =
    new _$SmsAuthProviderSerializer();
Serializer<GoogleAuthProvider> _$googleAuthProviderSerializer =
    new _$GoogleAuthProviderSerializer();
Serializer<AppleAuthProvider> _$appleAuthProviderSerializer =
    new _$AppleAuthProviderSerializer();
Serializer<GitHubAuthProvider> _$gitHubAuthProviderSerializer =
    new _$GitHubAuthProviderSerializer();
Serializer<FirebaseExternalAuthProvider>
    _$firebaseExternalAuthProviderSerializer =
    new _$FirebaseExternalAuthProviderSerializer();
Serializer<SupabaseExternalAuthProvider>
    _$supabaseExternalAuthProviderSerializer =
    new _$SupabaseExternalAuthProviderSerializer();
Serializer<NodeType> _$nodeTypeSerializer = new _$NodeTypeSerializer();
Serializer<NodeReference> _$nodeReferenceSerializer =
    new _$NodeReferenceSerializer();
Serializer<DatabaseSchemaType> _$databaseSchemaTypeSerializer =
    new _$DatabaseSchemaTypeSerializer();
Serializer<DriftDatabaseSchema> _$driftDatabaseSchemaSerializer =
    new _$DriftDatabaseSchemaSerializer();
Serializer<Database> _$databaseSerializer = new _$DatabaseSerializer();
Serializer<CelestDatabaseConfig> _$celestDatabaseConfigSerializer =
    new _$CelestDatabaseConfigSerializer();

class _$RegionSerializer implements PrimitiveSerializer<Region> {
  @override
  final Iterable<Type> types = const <Type>[Region];
  @override
  final String wireName = 'Region';

  @override
  Object serialize(Serializers serializers, Region object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  Region deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Region.valueOf(serialized as String);
}

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
      'environment',
      serializers.serialize(object.environment,
          specifiedType: const FullType(String)),
      'reference',
      serializers.serialize(object.reference,
          specifiedType: const FullType(Reference)),
      'apis',
      serializers.serialize(object.apis,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(Api)])),
      'variables',
      serializers.serialize(object.variables,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Variable)])),
      'secrets',
      serializers.serialize(object.secrets,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Secret)])),
      'databases',
      serializers.serialize(object.databases,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(Database)])),
      'sdkConfig',
      serializers.serialize(object.sdkConfig,
          specifiedType: const FullType(SdkConfiguration)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
    ];
    Object? value;
    value = object.displayName;
    if (value != null) {
      result
        ..add('displayName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.primaryRegion;
    if (value != null) {
      result
        ..add('primaryRegion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Region)));
    }
    value = object.auth;
    if (value != null) {
      result
        ..add('auth')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Auth)));
    }
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
        case 'environment':
          result.environment = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'primaryRegion':
          result.primaryRegion = serializers.deserialize(value,
              specifiedType: const FullType(Region)) as Region?;
          break;
        case 'reference':
          result.reference = serializers.deserialize(value,
              specifiedType: const FullType(Reference))! as Reference;
          break;
        case 'apis':
          result.apis.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(Api)]))!);
          break;
        case 'variables':
          result.variables.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Variable)]))!
              as BuiltList<Object?>);
          break;
        case 'secrets':
          result.secrets.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Secret)]))!
              as BuiltList<Object?>);
          break;
        case 'auth':
          result.auth.replace(serializers.deserialize(value,
              specifiedType: const FullType(Auth))! as Auth);
          break;
        case 'databases':
          result.databases.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(Database)]))!);
          break;
        case 'sdkConfig':
          result.sdkConfig.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SdkConfiguration))!
              as SdkConfiguration);
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
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
      'docs',
      serializers.serialize(object.docs,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'exceptionTypes',
      serializers.serialize(object.exceptionTypes,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(Reference)])),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
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
        case 'docs':
          result.docs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'exceptionTypes':
          result.exceptionTypes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltSet, const [const FullType(Reference)]))!
              as BuiltSet<Object?>);
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
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
          specifiedType: const FullType(FileSpan)),
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
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
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
          specifiedType: const FullType(FileSpan)),
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
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
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
          specifiedType: const FullType(FileSpan)),
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
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
          break;
      }
    }

    return result.build();
  }
}

class _$ApiHttpConfigSerializer implements StructuredSerializer<ApiHttpConfig> {
  @override
  final Iterable<Type> types = const [ApiHttpConfig, _$ApiHttpConfig];
  @override
  final String wireName = 'ApiHttpConfig';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiHttpConfig object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'method',
      serializers.serialize(object.method,
          specifiedType: const FullType(String)),
      'statusCode',
      serializers.serialize(object.statusCode,
          specifiedType: const FullType(int)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
    ];

    return result;
  }

  @override
  ApiHttpConfig deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiHttpConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'method':
          result.method = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'statusCode':
          result.statusCode = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
          break;
      }
    }

    return result.build();
  }
}

class _$ApiHttpErrorSerializer implements StructuredSerializer<ApiHttpError> {
  @override
  final Iterable<Type> types = const [ApiHttpError, _$ApiHttpError];
  @override
  final String wireName = 'ApiHttpError';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiHttpError object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(TypeReference)),
      'statusCode',
      serializers.serialize(object.statusCode,
          specifiedType: const FullType(int)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
    ];

    return result;
  }

  @override
  ApiHttpError deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiHttpErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeReference))! as TypeReference);
          break;
        case 'statusCode':
          result.statusCode = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
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
      'annotations',
      serializers.serialize(object.annotations,
          specifiedType:
              const FullType(BuiltList, const [const FullType(DartValue)])),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
    ];
    Object? value;
    value = object.references;
    if (value != null) {
      result
        ..add('references')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NodeReference)));
    }
    value = object.defaultTo;
    if (value != null) {
      result
        ..add('defaultTo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DartValue)));
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
        case 'references':
          result.references.replace(serializers.deserialize(value,
              specifiedType: const FullType(NodeReference))! as NodeReference);
          break;
        case 'annotations':
          result.annotations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DartValue)]))!
              as BuiltList<Object?>);
          break;
        case 'defaultTo':
          result.defaultTo = serializers.deserialize(value,
              specifiedType: const FullType(DartValue)) as DartValue?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
          break;
      }
    }

    return result.build();
  }
}

class _$StreamTypeSerializer implements PrimitiveSerializer<StreamType> {
  @override
  final Iterable<Type> types = const <Type>[StreamType];
  @override
  final String wireName = 'StreamType';

  @override
  Object serialize(Serializers serializers, StreamType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  StreamType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      StreamType.valueOf(serialized as String);
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
      'typeParameters',
      serializers.serialize(object.typeParameters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Reference)])),
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
      'annotations',
      serializers.serialize(object.annotations,
          specifiedType:
              const FullType(BuiltList, const [const FullType(DartValue)])),
      'docs',
      serializers.serialize(object.docs,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
    ];
    Object? value;
    value = object.streamType;
    if (value != null) {
      result
        ..add('streamType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(StreamType)));
    }
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
        case 'typeParameters':
          result.typeParameters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Reference)]))!
              as BuiltList<Object?>);
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
        case 'streamType':
          result.streamType = serializers.deserialize(value,
              specifiedType: const FullType(StreamType)) as StreamType?;
          break;
        case 'metadata':
          result.metadata.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ApiMetadata)]))!
              as BuiltList<Object?>);
          break;
        case 'annotations':
          result.annotations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DartValue)]))!
              as BuiltList<Object?>);
          break;
        case 'docs':
          result.docs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
          break;
      }
    }

    return result.build();
  }
}

class _$VariableSerializer implements StructuredSerializer<Variable> {
  @override
  final Iterable<Type> types = const [Variable, _$Variable];
  @override
  final String wireName = 'Variable';

  @override
  Iterable<Object?> serialize(Serializers serializers, Variable object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'docs',
      serializers.serialize(object.docs,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.value;
    if (value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dartName;
    if (value != null) {
      result
        ..add('dartName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Variable deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VariableBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'dartName':
          result.dartName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'docs':
          result.docs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$SecretSerializer implements StructuredSerializer<Secret> {
  @override
  final Iterable<Type> types = const [Secret, _$Secret];
  @override
  final String wireName = 'Secret';

  @override
  Iterable<Object?> serialize(Serializers serializers, Secret object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'docs',
      serializers.serialize(object.docs,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.dartName;
    if (value != null) {
      result
        ..add('dartName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Secret deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SecretBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'dartName':
          result.dartName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'docs':
          result.docs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$AuthSerializer implements StructuredSerializer<Auth> {
  @override
  final Iterable<Type> types = const [Auth, _$Auth];
  @override
  final String wireName = 'Auth';

  @override
  Iterable<Object?> serialize(Serializers serializers, Auth object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'providers',
      serializers.serialize(object.providers,
          specifiedType:
              const FullType(BuiltList, const [const FullType(AuthProvider)])),
      'externalProviders',
      serializers.serialize(object.externalProviders,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ExternalAuthProvider)])),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
    ];

    return result;
  }

  @override
  Auth deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'providers':
          result.providers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AuthProvider)]))!
              as BuiltList<Object?>);
          break;
        case 'externalProviders':
          result.externalProviders.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ExternalAuthProvider)]))!
              as BuiltList<Object?>);
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthProviderTypeSerializer
    implements PrimitiveSerializer<AuthProviderType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'emailOtp': 'EMAIL_OTP',
    'smsOtp': 'SMS_OTP',
    'google': 'GOOGLE',
    'gitHub': 'GITHUB',
    'apple': 'APPLE',
    'firebase': 'FIREBASE',
    'supabase': 'SUPABASE',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'EMAIL_OTP': 'emailOtp',
    'SMS_OTP': 'smsOtp',
    'GOOGLE': 'google',
    'GITHUB': 'gitHub',
    'APPLE': 'apple',
    'FIREBASE': 'firebase',
    'SUPABASE': 'supabase',
  };

  @override
  final Iterable<Type> types = const <Type>[AuthProviderType];
  @override
  final String wireName = 'AuthProviderType';

  @override
  Object serialize(Serializers serializers, AuthProviderType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AuthProviderType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AuthProviderType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$EmailAuthProviderSerializer
    implements StructuredSerializer<EmailAuthProvider> {
  @override
  final Iterable<Type> types = const [EmailAuthProvider, _$EmailAuthProvider];
  @override
  final String wireName = 'EmailAuthProvider';

  @override
  Iterable<Object?> serialize(Serializers serializers, EmailAuthProvider object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(AuthProviderType)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
    ];

    return result;
  }

  @override
  EmailAuthProvider deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EmailAuthProviderBuilder();

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
                  specifiedType: const FullType(AuthProviderType))!
              as AuthProviderType;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
          break;
      }
    }

    return result.build();
  }
}

class _$SmsAuthProviderSerializer
    implements StructuredSerializer<SmsAuthProvider> {
  @override
  final Iterable<Type> types = const [SmsAuthProvider, _$SmsAuthProvider];
  @override
  final String wireName = 'SmsAuthProvider';

  @override
  Iterable<Object?> serialize(Serializers serializers, SmsAuthProvider object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(AuthProviderType)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
    ];

    return result;
  }

  @override
  SmsAuthProvider deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SmsAuthProviderBuilder();

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
                  specifiedType: const FullType(AuthProviderType))!
              as AuthProviderType;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
          break;
      }
    }

    return result.build();
  }
}

class _$GoogleAuthProviderSerializer
    implements StructuredSerializer<GoogleAuthProvider> {
  @override
  final Iterable<Type> types = const [GoogleAuthProvider, _$GoogleAuthProvider];
  @override
  final String wireName = 'GoogleAuthProvider';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GoogleAuthProvider object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'clientId',
      serializers.serialize(object.clientId,
          specifiedType: const FullType(Secret)),
      'clientSecret',
      serializers.serialize(object.clientSecret,
          specifiedType: const FullType(Secret)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(AuthProviderType)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
    ];

    return result;
  }

  @override
  GoogleAuthProvider deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GoogleAuthProviderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'clientId':
          result.clientId.replace(serializers.deserialize(value,
              specifiedType: const FullType(Secret))! as Secret);
          break;
        case 'clientSecret':
          result.clientSecret.replace(serializers.deserialize(value,
              specifiedType: const FullType(Secret))! as Secret);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(AuthProviderType))!
              as AuthProviderType;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
          break;
      }
    }

    return result.build();
  }
}

class _$AppleAuthProviderSerializer
    implements StructuredSerializer<AppleAuthProvider> {
  @override
  final Iterable<Type> types = const [AppleAuthProvider, _$AppleAuthProvider];
  @override
  final String wireName = 'AppleAuthProvider';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppleAuthProvider object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'clientId',
      serializers.serialize(object.clientId,
          specifiedType: const FullType(Secret)),
      'teamId',
      serializers.serialize(object.teamId,
          specifiedType: const FullType(Secret)),
      'keyId',
      serializers.serialize(object.keyId,
          specifiedType: const FullType(Secret)),
      'privateKey',
      serializers.serialize(object.privateKey,
          specifiedType: const FullType(Secret)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(AuthProviderType)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
    ];

    return result;
  }

  @override
  AppleAuthProvider deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppleAuthProviderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'clientId':
          result.clientId.replace(serializers.deserialize(value,
              specifiedType: const FullType(Secret))! as Secret);
          break;
        case 'teamId':
          result.teamId.replace(serializers.deserialize(value,
              specifiedType: const FullType(Secret))! as Secret);
          break;
        case 'keyId':
          result.keyId.replace(serializers.deserialize(value,
              specifiedType: const FullType(Secret))! as Secret);
          break;
        case 'privateKey':
          result.privateKey.replace(serializers.deserialize(value,
              specifiedType: const FullType(Secret))! as Secret);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(AuthProviderType))!
              as AuthProviderType;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
          break;
      }
    }

    return result.build();
  }
}

class _$GitHubAuthProviderSerializer
    implements StructuredSerializer<GitHubAuthProvider> {
  @override
  final Iterable<Type> types = const [GitHubAuthProvider, _$GitHubAuthProvider];
  @override
  final String wireName = 'GitHubAuthProvider';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GitHubAuthProvider object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'clientId',
      serializers.serialize(object.clientId,
          specifiedType: const FullType(Secret)),
      'clientSecret',
      serializers.serialize(object.clientSecret,
          specifiedType: const FullType(Secret)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(AuthProviderType)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
    ];

    return result;
  }

  @override
  GitHubAuthProvider deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GitHubAuthProviderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'clientId':
          result.clientId.replace(serializers.deserialize(value,
              specifiedType: const FullType(Secret))! as Secret);
          break;
        case 'clientSecret':
          result.clientSecret.replace(serializers.deserialize(value,
              specifiedType: const FullType(Secret))! as Secret);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(AuthProviderType))!
              as AuthProviderType;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
          break;
      }
    }

    return result.build();
  }
}

class _$FirebaseExternalAuthProviderSerializer
    implements StructuredSerializer<FirebaseExternalAuthProvider> {
  @override
  final Iterable<Type> types = const [
    FirebaseExternalAuthProvider,
    _$FirebaseExternalAuthProvider
  ];
  @override
  final String wireName = 'FirebaseExternalAuthProvider';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, FirebaseExternalAuthProvider object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'projectId',
      serializers.serialize(object.projectId,
          specifiedType: const FullType(Variable)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(AuthProviderType)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
    ];

    return result;
  }

  @override
  FirebaseExternalAuthProvider deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FirebaseExternalAuthProviderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'projectId':
          result.projectId.replace(serializers.deserialize(value,
              specifiedType: const FullType(Variable))! as Variable);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(AuthProviderType))!
              as AuthProviderType;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
          break;
      }
    }

    return result.build();
  }
}

class _$SupabaseExternalAuthProviderSerializer
    implements StructuredSerializer<SupabaseExternalAuthProvider> {
  @override
  final Iterable<Type> types = const [
    SupabaseExternalAuthProvider,
    _$SupabaseExternalAuthProvider
  ];
  @override
  final String wireName = 'SupabaseExternalAuthProvider';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SupabaseExternalAuthProvider object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'projectUrl',
      serializers.serialize(object.projectUrl,
          specifiedType: const FullType(Variable)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(AuthProviderType)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
    ];
    Object? value;
    value = object.jwtSecret;
    if (value != null) {
      result
        ..add('jwtSecret')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Secret)));
    }
    return result;
  }

  @override
  SupabaseExternalAuthProvider deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SupabaseExternalAuthProviderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'projectUrl':
          result.projectUrl.replace(serializers.deserialize(value,
              specifiedType: const FullType(Variable))! as Variable);
          break;
        case 'jwtSecret':
          result.jwtSecret.replace(serializers.deserialize(value,
              specifiedType: const FullType(Secret))! as Secret);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(AuthProviderType))!
              as AuthProviderType;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
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

class _$DatabaseSchemaTypeSerializer
    implements PrimitiveSerializer<DatabaseSchemaType> {
  @override
  final Iterable<Type> types = const <Type>[DatabaseSchemaType];
  @override
  final String wireName = 'DatabaseSchemaType';

  @override
  Object serialize(Serializers serializers, DatabaseSchemaType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  DatabaseSchemaType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DatabaseSchemaType.valueOf(serialized as String);
}

class _$DriftDatabaseSchemaSerializer
    implements StructuredSerializer<DriftDatabaseSchema> {
  @override
  final Iterable<Type> types = const [
    DriftDatabaseSchema,
    _$DriftDatabaseSchema
  ];
  @override
  final String wireName = 'DriftDatabaseSchema';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DriftDatabaseSchema object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'declaration',
      serializers.serialize(object.declaration,
          specifiedType: const FullType(TypeReference)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
    ];

    return result;
  }

  @override
  DriftDatabaseSchema deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DriftDatabaseSchemaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'declaration':
          result.declaration.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeReference))! as TypeReference);
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
          break;
      }
    }

    return result.build();
  }
}

class _$DatabaseSerializer implements StructuredSerializer<Database> {
  @override
  final Iterable<Type> types = const [Database, _$Database];
  @override
  final String wireName = 'Database';

  @override
  Iterable<Object?> serialize(Serializers serializers, Database object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'dartName',
      serializers.serialize(object.dartName,
          specifiedType: const FullType(String)),
      'docs',
      serializers.serialize(object.docs,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'schema',
      serializers.serialize(object.schema,
          specifiedType: const FullType(DatabaseSchema)),
      'config',
      serializers.serialize(object.config,
          specifiedType: const FullType(DatabaseConfig)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(FileSpan)),
    ];

    return result;
  }

  @override
  Database deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DatabaseBuilder();

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
        case 'dartName':
          result.dartName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'docs':
          result.docs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'schema':
          result.schema = serializers.deserialize(value,
              specifiedType: const FullType(DatabaseSchema))! as DatabaseSchema;
          break;
        case 'config':
          result.config = serializers.deserialize(value,
              specifiedType: const FullType(DatabaseConfig))! as DatabaseConfig;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(FileSpan))! as FileSpan;
          break;
      }
    }

    return result.build();
  }
}

class _$CelestDatabaseConfigSerializer
    implements StructuredSerializer<CelestDatabaseConfig> {
  @override
  final Iterable<Type> types = const [
    CelestDatabaseConfig,
    _$CelestDatabaseConfig
  ];
  @override
  final String wireName = 'CelestDatabaseConfig';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CelestDatabaseConfig object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'hostname',
      serializers.serialize(object.hostname,
          specifiedType: const FullType(Variable)),
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(Secret)),
    ];

    return result;
  }

  @override
  CelestDatabaseConfig deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CelestDatabaseConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'hostname':
          result.hostname.replace(serializers.deserialize(value,
              specifiedType: const FullType(Variable))! as Variable);
          break;
        case 'token':
          result.token.replace(serializers.deserialize(value,
              specifiedType: const FullType(Secret))! as Secret);
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
  final String environment;
  @override
  final String? displayName;
  @override
  final Region? primaryRegion;
  @override
  final Reference reference;
  @override
  final BuiltMap<String, Api> apis;
  @override
  final BuiltList<Variable> variables;
  @override
  final BuiltList<Secret> secrets;
  @override
  final Auth? auth;
  @override
  final BuiltMap<String, Database> databases;
  @override
  final SdkConfiguration sdkConfig;
  @override
  final FileSpan location;

  factory _$Project([void Function(ProjectBuilder)? updates]) =>
      (new ProjectBuilder()..update(updates))._build();

  _$Project._(
      {required this.name,
      required this.environment,
      this.displayName,
      this.primaryRegion,
      required this.reference,
      required this.apis,
      required this.variables,
      required this.secrets,
      this.auth,
      required this.databases,
      required this.sdkConfig,
      required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Project', 'name');
    BuiltValueNullFieldError.checkNotNull(
        environment, r'Project', 'environment');
    BuiltValueNullFieldError.checkNotNull(reference, r'Project', 'reference');
    BuiltValueNullFieldError.checkNotNull(apis, r'Project', 'apis');
    BuiltValueNullFieldError.checkNotNull(variables, r'Project', 'variables');
    BuiltValueNullFieldError.checkNotNull(secrets, r'Project', 'secrets');
    BuiltValueNullFieldError.checkNotNull(databases, r'Project', 'databases');
    BuiltValueNullFieldError.checkNotNull(sdkConfig, r'Project', 'sdkConfig');
    BuiltValueNullFieldError.checkNotNull(location, r'Project', 'location');
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
        environment == other.environment &&
        displayName == other.displayName &&
        primaryRegion == other.primaryRegion &&
        reference == other.reference &&
        apis == other.apis &&
        variables == other.variables &&
        secrets == other.secrets &&
        auth == other.auth &&
        databases == other.databases &&
        sdkConfig == other.sdkConfig &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, environment.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, primaryRegion.hashCode);
    _$hash = $jc(_$hash, reference.hashCode);
    _$hash = $jc(_$hash, apis.hashCode);
    _$hash = $jc(_$hash, variables.hashCode);
    _$hash = $jc(_$hash, secrets.hashCode);
    _$hash = $jc(_$hash, auth.hashCode);
    _$hash = $jc(_$hash, databases.hashCode);
    _$hash = $jc(_$hash, sdkConfig.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Project')
          ..add('name', name)
          ..add('environment', environment)
          ..add('displayName', displayName)
          ..add('primaryRegion', primaryRegion)
          ..add('reference', reference)
          ..add('apis', apis)
          ..add('variables', variables)
          ..add('secrets', secrets)
          ..add('auth', auth)
          ..add('databases', databases)
          ..add('sdkConfig', sdkConfig)
          ..add('location', location))
        .toString();
  }
}

class ProjectBuilder implements Builder<Project, ProjectBuilder> {
  _$Project? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _environment;
  String? get environment => _$this._environment;
  set environment(String? environment) => _$this._environment = environment;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  Region? _primaryRegion;
  Region? get primaryRegion => _$this._primaryRegion;
  set primaryRegion(Region? primaryRegion) =>
      _$this._primaryRegion = primaryRegion;

  Reference? _reference;
  Reference? get reference => _$this._reference;
  set reference(Reference? reference) => _$this._reference = reference;

  MapBuilder<String, Api>? _apis;
  MapBuilder<String, Api> get apis =>
      _$this._apis ??= new MapBuilder<String, Api>();
  set apis(MapBuilder<String, Api>? apis) => _$this._apis = apis;

  ListBuilder<Variable>? _variables;
  ListBuilder<Variable> get variables =>
      _$this._variables ??= new ListBuilder<Variable>();
  set variables(ListBuilder<Variable>? variables) =>
      _$this._variables = variables;

  ListBuilder<Secret>? _secrets;
  ListBuilder<Secret> get secrets =>
      _$this._secrets ??= new ListBuilder<Secret>();
  set secrets(ListBuilder<Secret>? secrets) => _$this._secrets = secrets;

  AuthBuilder? _auth;
  AuthBuilder get auth => _$this._auth ??= new AuthBuilder();
  set auth(AuthBuilder? auth) => _$this._auth = auth;

  MapBuilder<String, Database>? _databases;
  MapBuilder<String, Database> get databases =>
      _$this._databases ??= new MapBuilder<String, Database>();
  set databases(MapBuilder<String, Database>? databases) =>
      _$this._databases = databases;

  SdkConfigurationBuilder? _sdkConfig;
  SdkConfigurationBuilder get sdkConfig =>
      _$this._sdkConfig ??= new SdkConfigurationBuilder();
  set sdkConfig(SdkConfigurationBuilder? sdkConfig) =>
      _$this._sdkConfig = sdkConfig;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(FileSpan? location) => _$this._location = location;

  ProjectBuilder();

  ProjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _environment = $v.environment;
      _displayName = $v.displayName;
      _primaryRegion = $v.primaryRegion;
      _reference = $v.reference;
      _apis = $v.apis.toBuilder();
      _variables = $v.variables.toBuilder();
      _secrets = $v.secrets.toBuilder();
      _auth = $v.auth?.toBuilder();
      _databases = $v.databases.toBuilder();
      _sdkConfig = $v.sdkConfig.toBuilder();
      _location = $v.location;
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
              environment: BuiltValueNullFieldError.checkNotNull(
                  environment, r'Project', 'environment'),
              displayName: displayName,
              primaryRegion: primaryRegion,
              reference: BuiltValueNullFieldError.checkNotNull(
                  reference, r'Project', 'reference'),
              apis: apis.build(),
              variables: variables.build(),
              secrets: secrets.build(),
              auth: _auth?.build(),
              databases: databases.build(),
              sdkConfig: sdkConfig.build(),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'Project', 'location'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apis';
        apis.build();
        _$failedField = 'variables';
        variables.build();
        _$failedField = 'secrets';
        secrets.build();
        _$failedField = 'auth';
        _auth?.build();
        _$failedField = 'databases';
        databases.build();
        _$failedField = 'sdkConfig';
        sdkConfig.build();
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
  @override
  final BuiltList<String> docs;
  @override
  final BuiltSet<Reference> exceptionTypes;
  @override
  final FileSpan location;

  factory _$Api([void Function(ApiBuilder)? updates]) =>
      (new ApiBuilder()..update(updates))._build();

  _$Api._(
      {required this.name,
      required this.metadata,
      required this.functions,
      required this.docs,
      required this.exceptionTypes,
      required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Api', 'name');
    BuiltValueNullFieldError.checkNotNull(metadata, r'Api', 'metadata');
    BuiltValueNullFieldError.checkNotNull(functions, r'Api', 'functions');
    BuiltValueNullFieldError.checkNotNull(docs, r'Api', 'docs');
    BuiltValueNullFieldError.checkNotNull(
        exceptionTypes, r'Api', 'exceptionTypes');
    BuiltValueNullFieldError.checkNotNull(location, r'Api', 'location');
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
        functions == other.functions &&
        docs == other.docs &&
        exceptionTypes == other.exceptionTypes &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, metadata.hashCode);
    _$hash = $jc(_$hash, functions.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, exceptionTypes.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Api')
          ..add('name', name)
          ..add('metadata', metadata)
          ..add('functions', functions)
          ..add('docs', docs)
          ..add('exceptionTypes', exceptionTypes)
          ..add('location', location))
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

  ListBuilder<String>? _docs;
  ListBuilder<String> get docs => _$this._docs ??= new ListBuilder<String>();
  set docs(ListBuilder<String>? docs) => _$this._docs = docs;

  SetBuilder<Reference>? _exceptionTypes;
  SetBuilder<Reference> get exceptionTypes =>
      _$this._exceptionTypes ??= new SetBuilder<Reference>();
  set exceptionTypes(SetBuilder<Reference>? exceptionTypes) =>
      _$this._exceptionTypes = exceptionTypes;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(FileSpan? location) => _$this._location = location;

  ApiBuilder();

  ApiBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _metadata = $v.metadata.toBuilder();
      _functions = $v.functions.toBuilder();
      _docs = $v.docs.toBuilder();
      _exceptionTypes = $v.exceptionTypes.toBuilder();
      _location = $v.location;
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
              functions: functions.build(),
              docs: docs.build(),
              exceptionTypes: exceptionTypes.build(),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'Api', 'location'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'metadata';
        metadata.build();
        _$failedField = 'functions';
        functions.build();
        _$failedField = 'docs';
        docs.build();
        _$failedField = 'exceptionTypes';
        exceptionTypes.build();
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
  final FileSpan location;

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

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(FileSpan? location) => _$this._location = location;

  ApiPublicBuilder();

  ApiPublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _location = $v.location;
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
    final _$result = _$v ??
        new _$ApiPublic._(
            location: BuiltValueNullFieldError.checkNotNull(
                location, r'ApiPublic', 'location'));
    replace(_$result);
    return _$result;
  }
}

class _$ApiAuthenticated extends ApiAuthenticated {
  @override
  final FileSpan location;

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

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(FileSpan? location) => _$this._location = location;

  ApiAuthenticatedBuilder();

  ApiAuthenticatedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _location = $v.location;
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
    final _$result = _$v ??
        new _$ApiAuthenticated._(
            location: BuiltValueNullFieldError.checkNotNull(
                location, r'ApiAuthenticated', 'location'));
    replace(_$result);
    return _$result;
  }
}

class _$ApiMiddleware extends ApiMiddleware {
  @override
  final Reference type;
  @override
  final FileSpan location;

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

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(FileSpan? location) => _$this._location = location;

  ApiMiddlewareBuilder();

  ApiMiddlewareBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _location = $v.location;
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
    final _$result = _$v ??
        new _$ApiMiddleware._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'ApiMiddleware', 'type'),
            location: BuiltValueNullFieldError.checkNotNull(
                location, r'ApiMiddleware', 'location'));
    replace(_$result);
    return _$result;
  }
}

class _$ApiHttpConfig extends ApiHttpConfig {
  @override
  final String method;
  @override
  final int statusCode;
  @override
  final FileSpan location;

  factory _$ApiHttpConfig([void Function(ApiHttpConfigBuilder)? updates]) =>
      (new ApiHttpConfigBuilder()..update(updates))._build();

  _$ApiHttpConfig._(
      {required this.method, required this.statusCode, required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(method, r'ApiHttpConfig', 'method');
    BuiltValueNullFieldError.checkNotNull(
        statusCode, r'ApiHttpConfig', 'statusCode');
    BuiltValueNullFieldError.checkNotNull(
        location, r'ApiHttpConfig', 'location');
  }

  @override
  ApiHttpConfig rebuild(void Function(ApiHttpConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiHttpConfigBuilder toBuilder() => new ApiHttpConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiHttpConfig &&
        method == other.method &&
        statusCode == other.statusCode &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, method.hashCode);
    _$hash = $jc(_$hash, statusCode.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiHttpConfig')
          ..add('method', method)
          ..add('statusCode', statusCode)
          ..add('location', location))
        .toString();
  }
}

class ApiHttpConfigBuilder
    implements Builder<ApiHttpConfig, ApiHttpConfigBuilder> {
  _$ApiHttpConfig? _$v;

  String? _method;
  String? get method => _$this._method;
  set method(String? method) => _$this._method = method;

  int? _statusCode;
  int? get statusCode => _$this._statusCode;
  set statusCode(int? statusCode) => _$this._statusCode = statusCode;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(FileSpan? location) => _$this._location = location;

  ApiHttpConfigBuilder();

  ApiHttpConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _method = $v.method;
      _statusCode = $v.statusCode;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiHttpConfig other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiHttpConfig;
  }

  @override
  void update(void Function(ApiHttpConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiHttpConfig build() => _build();

  _$ApiHttpConfig _build() {
    final _$result = _$v ??
        new _$ApiHttpConfig._(
            method: BuiltValueNullFieldError.checkNotNull(
                method, r'ApiHttpConfig', 'method'),
            statusCode: BuiltValueNullFieldError.checkNotNull(
                statusCode, r'ApiHttpConfig', 'statusCode'),
            location: BuiltValueNullFieldError.checkNotNull(
                location, r'ApiHttpConfig', 'location'));
    replace(_$result);
    return _$result;
  }
}

class _$ApiHttpError extends ApiHttpError {
  @override
  final TypeReference type;
  @override
  final int statusCode;
  @override
  final FileSpan location;

  factory _$ApiHttpError([void Function(ApiHttpErrorBuilder)? updates]) =>
      (new ApiHttpErrorBuilder()..update(updates))._build();

  _$ApiHttpError._(
      {required this.type, required this.statusCode, required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'ApiHttpError', 'type');
    BuiltValueNullFieldError.checkNotNull(
        statusCode, r'ApiHttpError', 'statusCode');
    BuiltValueNullFieldError.checkNotNull(
        location, r'ApiHttpError', 'location');
  }

  @override
  ApiHttpError rebuild(void Function(ApiHttpErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiHttpErrorBuilder toBuilder() => new ApiHttpErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiHttpError &&
        type == other.type &&
        statusCode == other.statusCode &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, statusCode.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiHttpError')
          ..add('type', type)
          ..add('statusCode', statusCode)
          ..add('location', location))
        .toString();
  }
}

class ApiHttpErrorBuilder
    implements Builder<ApiHttpError, ApiHttpErrorBuilder> {
  _$ApiHttpError? _$v;

  TypeReferenceBuilder? _type;
  TypeReferenceBuilder get type => _$this._type ??= new TypeReferenceBuilder();
  set type(TypeReferenceBuilder? type) => _$this._type = type;

  int? _statusCode;
  int? get statusCode => _$this._statusCode;
  set statusCode(int? statusCode) => _$this._statusCode = statusCode;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(FileSpan? location) => _$this._location = location;

  ApiHttpErrorBuilder();

  ApiHttpErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type.toBuilder();
      _statusCode = $v.statusCode;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiHttpError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiHttpError;
  }

  @override
  void update(void Function(ApiHttpErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiHttpError build() => _build();

  _$ApiHttpError _build() {
    _$ApiHttpError _$result;
    try {
      _$result = _$v ??
          new _$ApiHttpError._(
              type: type.build(),
              statusCode: BuiltValueNullFieldError.checkNotNull(
                  statusCode, r'ApiHttpError', 'statusCode'),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'ApiHttpError', 'location'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'type';
        type.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiHttpError', _$failedField, e.toString());
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
  final NodeReference? references;
  @override
  final BuiltList<Expression> annotationExpressions;
  @override
  final BuiltList<DartValue> annotations;
  @override
  final Expression? defaultToExpression;
  @override
  final DartValue? defaultTo;
  @override
  final FileSpan location;

  factory _$CloudFunctionParameter(
          [void Function(CloudFunctionParameterBuilder)? updates]) =>
      (new CloudFunctionParameterBuilder()..update(updates))._build();

  _$CloudFunctionParameter._(
      {required this.name,
      required this.type,
      required this.required,
      required this.named,
      this.references,
      required this.annotationExpressions,
      required this.annotations,
      this.defaultToExpression,
      this.defaultTo,
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
    BuiltValueNullFieldError.checkNotNull(annotationExpressions,
        r'CloudFunctionParameter', 'annotationExpressions');
    BuiltValueNullFieldError.checkNotNull(
        annotations, r'CloudFunctionParameter', 'annotations');
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
        references == other.references &&
        annotationExpressions == other.annotationExpressions &&
        annotations == other.annotations &&
        defaultToExpression == other.defaultToExpression &&
        defaultTo == other.defaultTo &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, named.hashCode);
    _$hash = $jc(_$hash, references.hashCode);
    _$hash = $jc(_$hash, annotationExpressions.hashCode);
    _$hash = $jc(_$hash, annotations.hashCode);
    _$hash = $jc(_$hash, defaultToExpression.hashCode);
    _$hash = $jc(_$hash, defaultTo.hashCode);
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
          ..add('references', references)
          ..add('annotationExpressions', annotationExpressions)
          ..add('annotations', annotations)
          ..add('defaultToExpression', defaultToExpression)
          ..add('defaultTo', defaultTo)
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

  NodeReferenceBuilder? _references;
  NodeReferenceBuilder get references =>
      _$this._references ??= new NodeReferenceBuilder();
  set references(NodeReferenceBuilder? references) =>
      _$this._references = references;

  ListBuilder<Expression>? _annotationExpressions;
  ListBuilder<Expression> get annotationExpressions =>
      _$this._annotationExpressions ??= new ListBuilder<Expression>();
  set annotationExpressions(ListBuilder<Expression>? annotationExpressions) =>
      _$this._annotationExpressions = annotationExpressions;

  ListBuilder<DartValue>? _annotations;
  ListBuilder<DartValue> get annotations =>
      _$this._annotations ??= new ListBuilder<DartValue>();
  set annotations(ListBuilder<DartValue>? annotations) =>
      _$this._annotations = annotations;

  Expression? _defaultToExpression;
  Expression? get defaultToExpression => _$this._defaultToExpression;
  set defaultToExpression(Expression? defaultToExpression) =>
      _$this._defaultToExpression = defaultToExpression;

  DartValue? _defaultTo;
  DartValue? get defaultTo => _$this._defaultTo;
  set defaultTo(DartValue? defaultTo) => _$this._defaultTo = defaultTo;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(FileSpan? location) => _$this._location = location;

  CloudFunctionParameterBuilder();

  CloudFunctionParameterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _required = $v.required;
      _named = $v.named;
      _references = $v.references?.toBuilder();
      _annotationExpressions = $v.annotationExpressions.toBuilder();
      _annotations = $v.annotations.toBuilder();
      _defaultToExpression = $v.defaultToExpression;
      _defaultTo = $v.defaultTo;
      _location = $v.location;
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
              references: _references?.build(),
              annotationExpressions: annotationExpressions.build(),
              annotations: annotations.build(),
              defaultToExpression: defaultToExpression,
              defaultTo: defaultTo,
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'CloudFunctionParameter', 'location'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'references';
        _references?.build();
        _$failedField = 'annotationExpressions';
        annotationExpressions.build();
        _$failedField = 'annotations';
        annotations.build();
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
  final BuiltList<Reference> typeParameters;
  @override
  final BuiltList<CloudFunctionParameter> parameters;
  @override
  final Reference returnType;
  @override
  final Reference flattenedReturnType;
  @override
  final StreamType? streamType;
  @override
  final BuiltList<ApiMetadata> metadata;
  @override
  final BuiltList<Expression> annotationExpressions;
  @override
  final BuiltList<DartValue> annotations;
  @override
  final BuiltList<String> docs;
  @override
  final FileSpan location;

  factory _$CloudFunction([void Function(CloudFunctionBuilder)? updates]) =>
      (new CloudFunctionBuilder()..update(updates))._build();

  _$CloudFunction._(
      {required this.name,
      required this.apiName,
      required this.typeParameters,
      required this.parameters,
      required this.returnType,
      required this.flattenedReturnType,
      this.streamType,
      required this.metadata,
      required this.annotationExpressions,
      required this.annotations,
      required this.docs,
      required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'CloudFunction', 'name');
    BuiltValueNullFieldError.checkNotNull(apiName, r'CloudFunction', 'apiName');
    BuiltValueNullFieldError.checkNotNull(
        typeParameters, r'CloudFunction', 'typeParameters');
    BuiltValueNullFieldError.checkNotNull(
        parameters, r'CloudFunction', 'parameters');
    BuiltValueNullFieldError.checkNotNull(
        returnType, r'CloudFunction', 'returnType');
    BuiltValueNullFieldError.checkNotNull(
        flattenedReturnType, r'CloudFunction', 'flattenedReturnType');
    BuiltValueNullFieldError.checkNotNull(
        metadata, r'CloudFunction', 'metadata');
    BuiltValueNullFieldError.checkNotNull(
        annotationExpressions, r'CloudFunction', 'annotationExpressions');
    BuiltValueNullFieldError.checkNotNull(
        annotations, r'CloudFunction', 'annotations');
    BuiltValueNullFieldError.checkNotNull(docs, r'CloudFunction', 'docs');
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
        typeParameters == other.typeParameters &&
        parameters == other.parameters &&
        returnType == other.returnType &&
        flattenedReturnType == other.flattenedReturnType &&
        streamType == other.streamType &&
        metadata == other.metadata &&
        annotationExpressions == other.annotationExpressions &&
        annotations == other.annotations &&
        docs == other.docs &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, apiName.hashCode);
    _$hash = $jc(_$hash, typeParameters.hashCode);
    _$hash = $jc(_$hash, parameters.hashCode);
    _$hash = $jc(_$hash, returnType.hashCode);
    _$hash = $jc(_$hash, flattenedReturnType.hashCode);
    _$hash = $jc(_$hash, streamType.hashCode);
    _$hash = $jc(_$hash, metadata.hashCode);
    _$hash = $jc(_$hash, annotationExpressions.hashCode);
    _$hash = $jc(_$hash, annotations.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CloudFunction')
          ..add('name', name)
          ..add('apiName', apiName)
          ..add('typeParameters', typeParameters)
          ..add('parameters', parameters)
          ..add('returnType', returnType)
          ..add('flattenedReturnType', flattenedReturnType)
          ..add('streamType', streamType)
          ..add('metadata', metadata)
          ..add('annotationExpressions', annotationExpressions)
          ..add('annotations', annotations)
          ..add('docs', docs)
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

  ListBuilder<Reference>? _typeParameters;
  ListBuilder<Reference> get typeParameters =>
      _$this._typeParameters ??= new ListBuilder<Reference>();
  set typeParameters(ListBuilder<Reference>? typeParameters) =>
      _$this._typeParameters = typeParameters;

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

  StreamType? _streamType;
  StreamType? get streamType => _$this._streamType;
  set streamType(StreamType? streamType) => _$this._streamType = streamType;

  ListBuilder<ApiMetadata>? _metadata;
  ListBuilder<ApiMetadata> get metadata =>
      _$this._metadata ??= new ListBuilder<ApiMetadata>();
  set metadata(ListBuilder<ApiMetadata>? metadata) =>
      _$this._metadata = metadata;

  ListBuilder<Expression>? _annotationExpressions;
  ListBuilder<Expression> get annotationExpressions =>
      _$this._annotationExpressions ??= new ListBuilder<Expression>();
  set annotationExpressions(ListBuilder<Expression>? annotationExpressions) =>
      _$this._annotationExpressions = annotationExpressions;

  ListBuilder<DartValue>? _annotations;
  ListBuilder<DartValue> get annotations =>
      _$this._annotations ??= new ListBuilder<DartValue>();
  set annotations(ListBuilder<DartValue>? annotations) =>
      _$this._annotations = annotations;

  ListBuilder<String>? _docs;
  ListBuilder<String> get docs => _$this._docs ??= new ListBuilder<String>();
  set docs(ListBuilder<String>? docs) => _$this._docs = docs;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(FileSpan? location) => _$this._location = location;

  CloudFunctionBuilder();

  CloudFunctionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _apiName = $v.apiName;
      _typeParameters = $v.typeParameters.toBuilder();
      _parameters = $v.parameters.toBuilder();
      _returnType = $v.returnType;
      _flattenedReturnType = $v.flattenedReturnType;
      _streamType = $v.streamType;
      _metadata = $v.metadata.toBuilder();
      _annotationExpressions = $v.annotationExpressions.toBuilder();
      _annotations = $v.annotations.toBuilder();
      _docs = $v.docs.toBuilder();
      _location = $v.location;
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
              typeParameters: typeParameters.build(),
              parameters: parameters.build(),
              returnType: BuiltValueNullFieldError.checkNotNull(
                  returnType, r'CloudFunction', 'returnType'),
              flattenedReturnType: BuiltValueNullFieldError.checkNotNull(
                  flattenedReturnType, r'CloudFunction', 'flattenedReturnType'),
              streamType: streamType,
              metadata: metadata.build(),
              annotationExpressions: annotationExpressions.build(),
              annotations: annotations.build(),
              docs: docs.build(),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'CloudFunction', 'location'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeParameters';
        typeParameters.build();
        _$failedField = 'parameters';
        parameters.build();

        _$failedField = 'metadata';
        metadata.build();
        _$failedField = 'annotationExpressions';
        annotationExpressions.build();
        _$failedField = 'annotations';
        annotations.build();
        _$failedField = 'docs';
        docs.build();
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

class _$Variable extends Variable {
  @override
  final String? value;
  @override
  final FileSpan location;
  @override
  final String name;
  @override
  final String? dartName;
  @override
  final BuiltList<String> docs;

  factory _$Variable([void Function(VariableBuilder)? updates]) =>
      (new VariableBuilder()..update(updates))._build();

  _$Variable._(
      {this.value,
      required this.location,
      required this.name,
      this.dartName,
      required this.docs})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(location, r'Variable', 'location');
    BuiltValueNullFieldError.checkNotNull(name, r'Variable', 'name');
    BuiltValueNullFieldError.checkNotNull(docs, r'Variable', 'docs');
  }

  @override
  Variable rebuild(void Function(VariableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VariableBuilder toBuilder() => new VariableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Variable &&
        value == other.value &&
        location == other.location &&
        name == other.name &&
        dartName == other.dartName &&
        docs == other.docs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, dartName.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Variable')
          ..add('value', value)
          ..add('location', location)
          ..add('name', name)
          ..add('dartName', dartName)
          ..add('docs', docs))
        .toString();
  }
}

class VariableBuilder implements Builder<Variable, VariableBuilder> {
  _$Variable? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(FileSpan? location) => _$this._location = location;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _dartName;
  String? get dartName => _$this._dartName;
  set dartName(String? dartName) => _$this._dartName = dartName;

  ListBuilder<String>? _docs;
  ListBuilder<String> get docs => _$this._docs ??= new ListBuilder<String>();
  set docs(ListBuilder<String>? docs) => _$this._docs = docs;

  VariableBuilder();

  VariableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _location = $v.location;
      _name = $v.name;
      _dartName = $v.dartName;
      _docs = $v.docs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Variable other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Variable;
  }

  @override
  void update(void Function(VariableBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Variable build() => _build();

  _$Variable _build() {
    _$Variable _$result;
    try {
      _$result = _$v ??
          new _$Variable._(
              value: value,
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'Variable', 'location'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'Variable', 'name'),
              dartName: dartName,
              docs: docs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'docs';
        docs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Variable', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Secret extends Secret {
  @override
  final FileSpan location;
  @override
  final String name;
  @override
  final String? dartName;
  @override
  final BuiltList<String> docs;

  factory _$Secret([void Function(SecretBuilder)? updates]) =>
      (new SecretBuilder()..update(updates))._build();

  _$Secret._(
      {required this.location,
      required this.name,
      this.dartName,
      required this.docs})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(location, r'Secret', 'location');
    BuiltValueNullFieldError.checkNotNull(name, r'Secret', 'name');
    BuiltValueNullFieldError.checkNotNull(docs, r'Secret', 'docs');
  }

  @override
  Secret rebuild(void Function(SecretBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SecretBuilder toBuilder() => new SecretBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Secret &&
        location == other.location &&
        name == other.name &&
        dartName == other.dartName &&
        docs == other.docs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, dartName.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Secret')
          ..add('location', location)
          ..add('name', name)
          ..add('dartName', dartName)
          ..add('docs', docs))
        .toString();
  }
}

class SecretBuilder implements Builder<Secret, SecretBuilder> {
  _$Secret? _$v;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(FileSpan? location) => _$this._location = location;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _dartName;
  String? get dartName => _$this._dartName;
  set dartName(String? dartName) => _$this._dartName = dartName;

  ListBuilder<String>? _docs;
  ListBuilder<String> get docs => _$this._docs ??= new ListBuilder<String>();
  set docs(ListBuilder<String>? docs) => _$this._docs = docs;

  SecretBuilder();

  SecretBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _location = $v.location;
      _name = $v.name;
      _dartName = $v.dartName;
      _docs = $v.docs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Secret other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Secret;
  }

  @override
  void update(void Function(SecretBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Secret build() => _build();

  _$Secret _build() {
    _$Secret _$result;
    try {
      _$result = _$v ??
          new _$Secret._(
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'Secret', 'location'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'Secret', 'name'),
              dartName: dartName,
              docs: docs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'docs';
        docs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Secret', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Auth extends Auth {
  @override
  final BuiltList<AuthProvider> providers;
  @override
  final BuiltList<ExternalAuthProvider> externalProviders;
  @override
  final FileSpan location;

  factory _$Auth([void Function(AuthBuilder)? updates]) =>
      (new AuthBuilder()..update(updates))._build();

  _$Auth._(
      {required this.providers,
      required this.externalProviders,
      required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(providers, r'Auth', 'providers');
    BuiltValueNullFieldError.checkNotNull(
        externalProviders, r'Auth', 'externalProviders');
    BuiltValueNullFieldError.checkNotNull(location, r'Auth', 'location');
  }

  @override
  Auth rebuild(void Function(AuthBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthBuilder toBuilder() => new AuthBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Auth &&
        providers == other.providers &&
        externalProviders == other.externalProviders &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, providers.hashCode);
    _$hash = $jc(_$hash, externalProviders.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Auth')
          ..add('providers', providers)
          ..add('externalProviders', externalProviders)
          ..add('location', location))
        .toString();
  }
}

class AuthBuilder implements Builder<Auth, AuthBuilder> {
  _$Auth? _$v;

  ListBuilder<AuthProvider>? _providers;
  ListBuilder<AuthProvider> get providers =>
      _$this._providers ??= new ListBuilder<AuthProvider>();
  set providers(ListBuilder<AuthProvider>? providers) =>
      _$this._providers = providers;

  ListBuilder<ExternalAuthProvider>? _externalProviders;
  ListBuilder<ExternalAuthProvider> get externalProviders =>
      _$this._externalProviders ??= new ListBuilder<ExternalAuthProvider>();
  set externalProviders(ListBuilder<ExternalAuthProvider>? externalProviders) =>
      _$this._externalProviders = externalProviders;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(FileSpan? location) => _$this._location = location;

  AuthBuilder();

  AuthBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _providers = $v.providers.toBuilder();
      _externalProviders = $v.externalProviders.toBuilder();
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Auth other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Auth;
  }

  @override
  void update(void Function(AuthBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Auth build() => _build();

  _$Auth _build() {
    _$Auth _$result;
    try {
      _$result = _$v ??
          new _$Auth._(
              providers: providers.build(),
              externalProviders: externalProviders.build(),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'Auth', 'location'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'providers';
        providers.build();
        _$failedField = 'externalProviders';
        externalProviders.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Auth', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class AuthProviderBuilder {
  void replace(AuthProvider other);
  void update(void Function(AuthProviderBuilder) updates);
  String? get name;
  set name(String? name);

  AuthProviderType? get type;
  set type(AuthProviderType? type);

  FileSpan? get location;
  set location(FileSpan? location);
}

abstract mixin class ExternalAuthProviderBuilder {
  void replace(ExternalAuthProvider other);
  void update(void Function(ExternalAuthProviderBuilder) updates);
  String? get name;
  set name(String? name);

  AuthProviderType? get type;
  set type(AuthProviderType? type);

  FileSpan? get location;
  set location(FileSpan? location);
}

class _$EmailAuthProvider extends EmailAuthProvider {
  @override
  final String name;
  @override
  final AuthProviderType type;
  @override
  final FileSpan location;

  factory _$EmailAuthProvider(
          [void Function(EmailAuthProviderBuilder)? updates]) =>
      (new EmailAuthProviderBuilder()..update(updates))._build();

  _$EmailAuthProvider._(
      {required this.name, required this.type, required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'EmailAuthProvider', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'EmailAuthProvider', 'type');
    BuiltValueNullFieldError.checkNotNull(
        location, r'EmailAuthProvider', 'location');
  }

  @override
  EmailAuthProvider rebuild(void Function(EmailAuthProviderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmailAuthProviderBuilder toBuilder() =>
      new EmailAuthProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmailAuthProvider &&
        name == other.name &&
        type == other.type &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EmailAuthProvider')
          ..add('name', name)
          ..add('type', type)
          ..add('location', location))
        .toString();
  }
}

class EmailAuthProviderBuilder
    implements
        Builder<EmailAuthProvider, EmailAuthProviderBuilder>,
        AuthProviderBuilder {
  _$EmailAuthProvider? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  AuthProviderType? _type;
  AuthProviderType? get type => _$this._type;
  set type(covariant AuthProviderType? type) => _$this._type = type;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(covariant FileSpan? location) => _$this._location = location;

  EmailAuthProviderBuilder();

  EmailAuthProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant EmailAuthProvider other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EmailAuthProvider;
  }

  @override
  void update(void Function(EmailAuthProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EmailAuthProvider build() => _build();

  _$EmailAuthProvider _build() {
    EmailAuthProvider._finalize(this);
    final _$result = _$v ??
        new _$EmailAuthProvider._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'EmailAuthProvider', 'name'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'EmailAuthProvider', 'type'),
            location: BuiltValueNullFieldError.checkNotNull(
                location, r'EmailAuthProvider', 'location'));
    replace(_$result);
    return _$result;
  }
}

class _$SmsAuthProvider extends SmsAuthProvider {
  @override
  final String name;
  @override
  final AuthProviderType type;
  @override
  final FileSpan location;

  factory _$SmsAuthProvider([void Function(SmsAuthProviderBuilder)? updates]) =>
      (new SmsAuthProviderBuilder()..update(updates))._build();

  _$SmsAuthProvider._(
      {required this.name, required this.type, required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'SmsAuthProvider', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'SmsAuthProvider', 'type');
    BuiltValueNullFieldError.checkNotNull(
        location, r'SmsAuthProvider', 'location');
  }

  @override
  SmsAuthProvider rebuild(void Function(SmsAuthProviderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SmsAuthProviderBuilder toBuilder() =>
      new SmsAuthProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SmsAuthProvider &&
        name == other.name &&
        type == other.type &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SmsAuthProvider')
          ..add('name', name)
          ..add('type', type)
          ..add('location', location))
        .toString();
  }
}

class SmsAuthProviderBuilder
    implements
        Builder<SmsAuthProvider, SmsAuthProviderBuilder>,
        AuthProviderBuilder {
  _$SmsAuthProvider? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  AuthProviderType? _type;
  AuthProviderType? get type => _$this._type;
  set type(covariant AuthProviderType? type) => _$this._type = type;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(covariant FileSpan? location) => _$this._location = location;

  SmsAuthProviderBuilder();

  SmsAuthProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SmsAuthProvider other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SmsAuthProvider;
  }

  @override
  void update(void Function(SmsAuthProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SmsAuthProvider build() => _build();

  _$SmsAuthProvider _build() {
    SmsAuthProvider._finalize(this);
    final _$result = _$v ??
        new _$SmsAuthProvider._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'SmsAuthProvider', 'name'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'SmsAuthProvider', 'type'),
            location: BuiltValueNullFieldError.checkNotNull(
                location, r'SmsAuthProvider', 'location'));
    replace(_$result);
    return _$result;
  }
}

class _$GoogleAuthProvider extends GoogleAuthProvider {
  @override
  final Secret clientId;
  @override
  final Secret clientSecret;
  @override
  final String name;
  @override
  final AuthProviderType type;
  @override
  final FileSpan location;

  factory _$GoogleAuthProvider(
          [void Function(GoogleAuthProviderBuilder)? updates]) =>
      (new GoogleAuthProviderBuilder()..update(updates))._build();

  _$GoogleAuthProvider._(
      {required this.clientId,
      required this.clientSecret,
      required this.name,
      required this.type,
      required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        clientId, r'GoogleAuthProvider', 'clientId');
    BuiltValueNullFieldError.checkNotNull(
        clientSecret, r'GoogleAuthProvider', 'clientSecret');
    BuiltValueNullFieldError.checkNotNull(name, r'GoogleAuthProvider', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'GoogleAuthProvider', 'type');
    BuiltValueNullFieldError.checkNotNull(
        location, r'GoogleAuthProvider', 'location');
  }

  @override
  GoogleAuthProvider rebuild(
          void Function(GoogleAuthProviderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GoogleAuthProviderBuilder toBuilder() =>
      new GoogleAuthProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GoogleAuthProvider &&
        clientId == other.clientId &&
        clientSecret == other.clientSecret &&
        name == other.name &&
        type == other.type &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clientId.hashCode);
    _$hash = $jc(_$hash, clientSecret.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GoogleAuthProvider')
          ..add('clientId', clientId)
          ..add('clientSecret', clientSecret)
          ..add('name', name)
          ..add('type', type)
          ..add('location', location))
        .toString();
  }
}

class GoogleAuthProviderBuilder
    implements
        Builder<GoogleAuthProvider, GoogleAuthProviderBuilder>,
        AuthProviderBuilder {
  _$GoogleAuthProvider? _$v;

  SecretBuilder? _clientId;
  SecretBuilder get clientId => _$this._clientId ??= new SecretBuilder();
  set clientId(covariant SecretBuilder? clientId) =>
      _$this._clientId = clientId;

  SecretBuilder? _clientSecret;
  SecretBuilder get clientSecret =>
      _$this._clientSecret ??= new SecretBuilder();
  set clientSecret(covariant SecretBuilder? clientSecret) =>
      _$this._clientSecret = clientSecret;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  AuthProviderType? _type;
  AuthProviderType? get type => _$this._type;
  set type(covariant AuthProviderType? type) => _$this._type = type;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(covariant FileSpan? location) => _$this._location = location;

  GoogleAuthProviderBuilder();

  GoogleAuthProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientId = $v.clientId.toBuilder();
      _clientSecret = $v.clientSecret.toBuilder();
      _name = $v.name;
      _type = $v.type;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant GoogleAuthProvider other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GoogleAuthProvider;
  }

  @override
  void update(void Function(GoogleAuthProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GoogleAuthProvider build() => _build();

  _$GoogleAuthProvider _build() {
    GoogleAuthProvider._finalize(this);
    _$GoogleAuthProvider _$result;
    try {
      _$result = _$v ??
          new _$GoogleAuthProvider._(
              clientId: clientId.build(),
              clientSecret: clientSecret.build(),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GoogleAuthProvider', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'GoogleAuthProvider', 'type'),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'GoogleAuthProvider', 'location'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clientId';
        clientId.build();
        _$failedField = 'clientSecret';
        clientSecret.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GoogleAuthProvider', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$AppleAuthProvider extends AppleAuthProvider {
  @override
  final Secret clientId;
  @override
  final Secret teamId;
  @override
  final Secret keyId;
  @override
  final Secret privateKey;
  @override
  final String name;
  @override
  final AuthProviderType type;
  @override
  final FileSpan location;

  factory _$AppleAuthProvider(
          [void Function(AppleAuthProviderBuilder)? updates]) =>
      (new AppleAuthProviderBuilder()..update(updates))._build();

  _$AppleAuthProvider._(
      {required this.clientId,
      required this.teamId,
      required this.keyId,
      required this.privateKey,
      required this.name,
      required this.type,
      required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        clientId, r'AppleAuthProvider', 'clientId');
    BuiltValueNullFieldError.checkNotNull(
        teamId, r'AppleAuthProvider', 'teamId');
    BuiltValueNullFieldError.checkNotNull(keyId, r'AppleAuthProvider', 'keyId');
    BuiltValueNullFieldError.checkNotNull(
        privateKey, r'AppleAuthProvider', 'privateKey');
    BuiltValueNullFieldError.checkNotNull(name, r'AppleAuthProvider', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'AppleAuthProvider', 'type');
    BuiltValueNullFieldError.checkNotNull(
        location, r'AppleAuthProvider', 'location');
  }

  @override
  AppleAuthProvider rebuild(void Function(AppleAuthProviderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppleAuthProviderBuilder toBuilder() =>
      new AppleAuthProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppleAuthProvider &&
        clientId == other.clientId &&
        teamId == other.teamId &&
        keyId == other.keyId &&
        privateKey == other.privateKey &&
        name == other.name &&
        type == other.type &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clientId.hashCode);
    _$hash = $jc(_$hash, teamId.hashCode);
    _$hash = $jc(_$hash, keyId.hashCode);
    _$hash = $jc(_$hash, privateKey.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppleAuthProvider')
          ..add('clientId', clientId)
          ..add('teamId', teamId)
          ..add('keyId', keyId)
          ..add('privateKey', privateKey)
          ..add('name', name)
          ..add('type', type)
          ..add('location', location))
        .toString();
  }
}

class AppleAuthProviderBuilder
    implements
        Builder<AppleAuthProvider, AppleAuthProviderBuilder>,
        AuthProviderBuilder {
  _$AppleAuthProvider? _$v;

  SecretBuilder? _clientId;
  SecretBuilder get clientId => _$this._clientId ??= new SecretBuilder();
  set clientId(covariant SecretBuilder? clientId) =>
      _$this._clientId = clientId;

  SecretBuilder? _teamId;
  SecretBuilder get teamId => _$this._teamId ??= new SecretBuilder();
  set teamId(covariant SecretBuilder? teamId) => _$this._teamId = teamId;

  SecretBuilder? _keyId;
  SecretBuilder get keyId => _$this._keyId ??= new SecretBuilder();
  set keyId(covariant SecretBuilder? keyId) => _$this._keyId = keyId;

  SecretBuilder? _privateKey;
  SecretBuilder get privateKey => _$this._privateKey ??= new SecretBuilder();
  set privateKey(covariant SecretBuilder? privateKey) =>
      _$this._privateKey = privateKey;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  AuthProviderType? _type;
  AuthProviderType? get type => _$this._type;
  set type(covariant AuthProviderType? type) => _$this._type = type;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(covariant FileSpan? location) => _$this._location = location;

  AppleAuthProviderBuilder();

  AppleAuthProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientId = $v.clientId.toBuilder();
      _teamId = $v.teamId.toBuilder();
      _keyId = $v.keyId.toBuilder();
      _privateKey = $v.privateKey.toBuilder();
      _name = $v.name;
      _type = $v.type;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AppleAuthProvider other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppleAuthProvider;
  }

  @override
  void update(void Function(AppleAuthProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppleAuthProvider build() => _build();

  _$AppleAuthProvider _build() {
    AppleAuthProvider._finalize(this);
    _$AppleAuthProvider _$result;
    try {
      _$result = _$v ??
          new _$AppleAuthProvider._(
              clientId: clientId.build(),
              teamId: teamId.build(),
              keyId: keyId.build(),
              privateKey: privateKey.build(),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'AppleAuthProvider', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'AppleAuthProvider', 'type'),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'AppleAuthProvider', 'location'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clientId';
        clientId.build();
        _$failedField = 'teamId';
        teamId.build();
        _$failedField = 'keyId';
        keyId.build();
        _$failedField = 'privateKey';
        privateKey.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AppleAuthProvider', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GitHubAuthProvider extends GitHubAuthProvider {
  @override
  final Secret clientId;
  @override
  final Secret clientSecret;
  @override
  final String name;
  @override
  final AuthProviderType type;
  @override
  final FileSpan location;

  factory _$GitHubAuthProvider(
          [void Function(GitHubAuthProviderBuilder)? updates]) =>
      (new GitHubAuthProviderBuilder()..update(updates))._build();

  _$GitHubAuthProvider._(
      {required this.clientId,
      required this.clientSecret,
      required this.name,
      required this.type,
      required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        clientId, r'GitHubAuthProvider', 'clientId');
    BuiltValueNullFieldError.checkNotNull(
        clientSecret, r'GitHubAuthProvider', 'clientSecret');
    BuiltValueNullFieldError.checkNotNull(name, r'GitHubAuthProvider', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'GitHubAuthProvider', 'type');
    BuiltValueNullFieldError.checkNotNull(
        location, r'GitHubAuthProvider', 'location');
  }

  @override
  GitHubAuthProvider rebuild(
          void Function(GitHubAuthProviderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GitHubAuthProviderBuilder toBuilder() =>
      new GitHubAuthProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GitHubAuthProvider &&
        clientId == other.clientId &&
        clientSecret == other.clientSecret &&
        name == other.name &&
        type == other.type &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clientId.hashCode);
    _$hash = $jc(_$hash, clientSecret.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GitHubAuthProvider')
          ..add('clientId', clientId)
          ..add('clientSecret', clientSecret)
          ..add('name', name)
          ..add('type', type)
          ..add('location', location))
        .toString();
  }
}

class GitHubAuthProviderBuilder
    implements
        Builder<GitHubAuthProvider, GitHubAuthProviderBuilder>,
        AuthProviderBuilder {
  _$GitHubAuthProvider? _$v;

  SecretBuilder? _clientId;
  SecretBuilder get clientId => _$this._clientId ??= new SecretBuilder();
  set clientId(covariant SecretBuilder? clientId) =>
      _$this._clientId = clientId;

  SecretBuilder? _clientSecret;
  SecretBuilder get clientSecret =>
      _$this._clientSecret ??= new SecretBuilder();
  set clientSecret(covariant SecretBuilder? clientSecret) =>
      _$this._clientSecret = clientSecret;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  AuthProviderType? _type;
  AuthProviderType? get type => _$this._type;
  set type(covariant AuthProviderType? type) => _$this._type = type;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(covariant FileSpan? location) => _$this._location = location;

  GitHubAuthProviderBuilder();

  GitHubAuthProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientId = $v.clientId.toBuilder();
      _clientSecret = $v.clientSecret.toBuilder();
      _name = $v.name;
      _type = $v.type;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant GitHubAuthProvider other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GitHubAuthProvider;
  }

  @override
  void update(void Function(GitHubAuthProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GitHubAuthProvider build() => _build();

  _$GitHubAuthProvider _build() {
    GitHubAuthProvider._finalize(this);
    _$GitHubAuthProvider _$result;
    try {
      _$result = _$v ??
          new _$GitHubAuthProvider._(
              clientId: clientId.build(),
              clientSecret: clientSecret.build(),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GitHubAuthProvider', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'GitHubAuthProvider', 'type'),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'GitHubAuthProvider', 'location'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clientId';
        clientId.build();
        _$failedField = 'clientSecret';
        clientSecret.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GitHubAuthProvider', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FirebaseExternalAuthProvider extends FirebaseExternalAuthProvider {
  @override
  final Variable projectId;
  @override
  final String name;
  @override
  final AuthProviderType type;
  @override
  final FileSpan location;

  factory _$FirebaseExternalAuthProvider(
          [void Function(FirebaseExternalAuthProviderBuilder)? updates]) =>
      (new FirebaseExternalAuthProviderBuilder()..update(updates))._build();

  _$FirebaseExternalAuthProvider._(
      {required this.projectId,
      required this.name,
      required this.type,
      required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        projectId, r'FirebaseExternalAuthProvider', 'projectId');
    BuiltValueNullFieldError.checkNotNull(
        name, r'FirebaseExternalAuthProvider', 'name');
    BuiltValueNullFieldError.checkNotNull(
        type, r'FirebaseExternalAuthProvider', 'type');
    BuiltValueNullFieldError.checkNotNull(
        location, r'FirebaseExternalAuthProvider', 'location');
  }

  @override
  FirebaseExternalAuthProvider rebuild(
          void Function(FirebaseExternalAuthProviderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FirebaseExternalAuthProviderBuilder toBuilder() =>
      new FirebaseExternalAuthProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FirebaseExternalAuthProvider &&
        projectId == other.projectId &&
        name == other.name &&
        type == other.type &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, projectId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FirebaseExternalAuthProvider')
          ..add('projectId', projectId)
          ..add('name', name)
          ..add('type', type)
          ..add('location', location))
        .toString();
  }
}

class FirebaseExternalAuthProviderBuilder
    implements
        Builder<FirebaseExternalAuthProvider,
            FirebaseExternalAuthProviderBuilder>,
        ExternalAuthProviderBuilder {
  _$FirebaseExternalAuthProvider? _$v;

  VariableBuilder? _projectId;
  VariableBuilder get projectId => _$this._projectId ??= new VariableBuilder();
  set projectId(covariant VariableBuilder? projectId) =>
      _$this._projectId = projectId;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  AuthProviderType? _type;
  AuthProviderType? get type => _$this._type;
  set type(covariant AuthProviderType? type) => _$this._type = type;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(covariant FileSpan? location) => _$this._location = location;

  FirebaseExternalAuthProviderBuilder();

  FirebaseExternalAuthProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _projectId = $v.projectId.toBuilder();
      _name = $v.name;
      _type = $v.type;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FirebaseExternalAuthProvider other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FirebaseExternalAuthProvider;
  }

  @override
  void update(void Function(FirebaseExternalAuthProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FirebaseExternalAuthProvider build() => _build();

  _$FirebaseExternalAuthProvider _build() {
    FirebaseExternalAuthProvider._finalize(this);
    _$FirebaseExternalAuthProvider _$result;
    try {
      _$result = _$v ??
          new _$FirebaseExternalAuthProvider._(
              projectId: projectId.build(),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'FirebaseExternalAuthProvider', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'FirebaseExternalAuthProvider', 'type'),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'FirebaseExternalAuthProvider', 'location'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'projectId';
        projectId.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FirebaseExternalAuthProvider', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SupabaseExternalAuthProvider extends SupabaseExternalAuthProvider {
  @override
  final Variable projectUrl;
  @override
  final Secret? jwtSecret;
  @override
  final String name;
  @override
  final AuthProviderType type;
  @override
  final FileSpan location;

  factory _$SupabaseExternalAuthProvider(
          [void Function(SupabaseExternalAuthProviderBuilder)? updates]) =>
      (new SupabaseExternalAuthProviderBuilder()..update(updates))._build();

  _$SupabaseExternalAuthProvider._(
      {required this.projectUrl,
      this.jwtSecret,
      required this.name,
      required this.type,
      required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        projectUrl, r'SupabaseExternalAuthProvider', 'projectUrl');
    BuiltValueNullFieldError.checkNotNull(
        name, r'SupabaseExternalAuthProvider', 'name');
    BuiltValueNullFieldError.checkNotNull(
        type, r'SupabaseExternalAuthProvider', 'type');
    BuiltValueNullFieldError.checkNotNull(
        location, r'SupabaseExternalAuthProvider', 'location');
  }

  @override
  SupabaseExternalAuthProvider rebuild(
          void Function(SupabaseExternalAuthProviderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupabaseExternalAuthProviderBuilder toBuilder() =>
      new SupabaseExternalAuthProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SupabaseExternalAuthProvider &&
        projectUrl == other.projectUrl &&
        jwtSecret == other.jwtSecret &&
        name == other.name &&
        type == other.type &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, projectUrl.hashCode);
    _$hash = $jc(_$hash, jwtSecret.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SupabaseExternalAuthProvider')
          ..add('projectUrl', projectUrl)
          ..add('jwtSecret', jwtSecret)
          ..add('name', name)
          ..add('type', type)
          ..add('location', location))
        .toString();
  }
}

class SupabaseExternalAuthProviderBuilder
    implements
        Builder<SupabaseExternalAuthProvider,
            SupabaseExternalAuthProviderBuilder>,
        ExternalAuthProviderBuilder {
  _$SupabaseExternalAuthProvider? _$v;

  VariableBuilder? _projectUrl;
  VariableBuilder get projectUrl =>
      _$this._projectUrl ??= new VariableBuilder();
  set projectUrl(covariant VariableBuilder? projectUrl) =>
      _$this._projectUrl = projectUrl;

  SecretBuilder? _jwtSecret;
  SecretBuilder get jwtSecret => _$this._jwtSecret ??= new SecretBuilder();
  set jwtSecret(covariant SecretBuilder? jwtSecret) =>
      _$this._jwtSecret = jwtSecret;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  AuthProviderType? _type;
  AuthProviderType? get type => _$this._type;
  set type(covariant AuthProviderType? type) => _$this._type = type;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(covariant FileSpan? location) => _$this._location = location;

  SupabaseExternalAuthProviderBuilder();

  SupabaseExternalAuthProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _projectUrl = $v.projectUrl.toBuilder();
      _jwtSecret = $v.jwtSecret?.toBuilder();
      _name = $v.name;
      _type = $v.type;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SupabaseExternalAuthProvider other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SupabaseExternalAuthProvider;
  }

  @override
  void update(void Function(SupabaseExternalAuthProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SupabaseExternalAuthProvider build() => _build();

  _$SupabaseExternalAuthProvider _build() {
    SupabaseExternalAuthProvider._finalize(this);
    _$SupabaseExternalAuthProvider _$result;
    try {
      _$result = _$v ??
          new _$SupabaseExternalAuthProvider._(
              projectUrl: projectUrl.build(),
              jwtSecret: _jwtSecret?.build(),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'SupabaseExternalAuthProvider', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'SupabaseExternalAuthProvider', 'type'),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'SupabaseExternalAuthProvider', 'location'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'projectUrl';
        projectUrl.build();
        _$failedField = 'jwtSecret';
        _jwtSecret?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SupabaseExternalAuthProvider', _$failedField, e.toString());
      }
      rethrow;
    }
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

class _$DriftDatabaseSchema extends DriftDatabaseSchema {
  @override
  final TypeReference declaration;
  @override
  final FileSpan location;

  factory _$DriftDatabaseSchema(
          [void Function(DriftDatabaseSchemaBuilder)? updates]) =>
      (new DriftDatabaseSchemaBuilder()..update(updates))._build();

  _$DriftDatabaseSchema._({required this.declaration, required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        declaration, r'DriftDatabaseSchema', 'declaration');
    BuiltValueNullFieldError.checkNotNull(
        location, r'DriftDatabaseSchema', 'location');
  }

  @override
  DriftDatabaseSchema rebuild(
          void Function(DriftDatabaseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DriftDatabaseSchemaBuilder toBuilder() =>
      new DriftDatabaseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DriftDatabaseSchema &&
        declaration == other.declaration &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, declaration.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DriftDatabaseSchema')
          ..add('declaration', declaration)
          ..add('location', location))
        .toString();
  }
}

class DriftDatabaseSchemaBuilder
    implements Builder<DriftDatabaseSchema, DriftDatabaseSchemaBuilder> {
  _$DriftDatabaseSchema? _$v;

  TypeReferenceBuilder? _declaration;
  TypeReferenceBuilder get declaration =>
      _$this._declaration ??= new TypeReferenceBuilder();
  set declaration(TypeReferenceBuilder? declaration) =>
      _$this._declaration = declaration;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(FileSpan? location) => _$this._location = location;

  DriftDatabaseSchemaBuilder();

  DriftDatabaseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _declaration = $v.declaration.toBuilder();
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DriftDatabaseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DriftDatabaseSchema;
  }

  @override
  void update(void Function(DriftDatabaseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DriftDatabaseSchema build() => _build();

  _$DriftDatabaseSchema _build() {
    _$DriftDatabaseSchema _$result;
    try {
      _$result = _$v ??
          new _$DriftDatabaseSchema._(
              declaration: declaration.build(),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'DriftDatabaseSchema', 'location'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'declaration';
        declaration.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DriftDatabaseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Database extends Database {
  @override
  final String name;
  @override
  final String dartName;
  @override
  final BuiltList<String> docs;
  @override
  final DatabaseSchema schema;
  @override
  final DatabaseConfig config;
  @override
  final FileSpan location;

  factory _$Database([void Function(DatabaseBuilder)? updates]) =>
      (new DatabaseBuilder()..update(updates))._build();

  _$Database._(
      {required this.name,
      required this.dartName,
      required this.docs,
      required this.schema,
      required this.config,
      required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Database', 'name');
    BuiltValueNullFieldError.checkNotNull(dartName, r'Database', 'dartName');
    BuiltValueNullFieldError.checkNotNull(docs, r'Database', 'docs');
    BuiltValueNullFieldError.checkNotNull(schema, r'Database', 'schema');
    BuiltValueNullFieldError.checkNotNull(config, r'Database', 'config');
    BuiltValueNullFieldError.checkNotNull(location, r'Database', 'location');
  }

  @override
  Database rebuild(void Function(DatabaseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DatabaseBuilder toBuilder() => new DatabaseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Database &&
        name == other.name &&
        dartName == other.dartName &&
        docs == other.docs &&
        schema == other.schema &&
        config == other.config &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, dartName.hashCode);
    _$hash = $jc(_$hash, docs.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jc(_$hash, config.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Database')
          ..add('name', name)
          ..add('dartName', dartName)
          ..add('docs', docs)
          ..add('schema', schema)
          ..add('config', config)
          ..add('location', location))
        .toString();
  }
}

class DatabaseBuilder implements Builder<Database, DatabaseBuilder> {
  _$Database? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _dartName;
  String? get dartName => _$this._dartName;
  set dartName(String? dartName) => _$this._dartName = dartName;

  ListBuilder<String>? _docs;
  ListBuilder<String> get docs => _$this._docs ??= new ListBuilder<String>();
  set docs(ListBuilder<String>? docs) => _$this._docs = docs;

  DatabaseSchema? _schema;
  DatabaseSchema? get schema => _$this._schema;
  set schema(DatabaseSchema? schema) => _$this._schema = schema;

  DatabaseConfig? _config;
  DatabaseConfig? get config => _$this._config;
  set config(DatabaseConfig? config) => _$this._config = config;

  FileSpan? _location;
  FileSpan? get location => _$this._location;
  set location(FileSpan? location) => _$this._location = location;

  DatabaseBuilder();

  DatabaseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _dartName = $v.dartName;
      _docs = $v.docs.toBuilder();
      _schema = $v.schema;
      _config = $v.config;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Database other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Database;
  }

  @override
  void update(void Function(DatabaseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Database build() => _build();

  _$Database _build() {
    _$Database _$result;
    try {
      _$result = _$v ??
          new _$Database._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'Database', 'name'),
              dartName: BuiltValueNullFieldError.checkNotNull(
                  dartName, r'Database', 'dartName'),
              docs: docs.build(),
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, r'Database', 'schema'),
              config: BuiltValueNullFieldError.checkNotNull(
                  config, r'Database', 'config'),
              location: BuiltValueNullFieldError.checkNotNull(
                  location, r'Database', 'location'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'docs';
        docs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Database', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CelestDatabaseConfig extends CelestDatabaseConfig {
  @override
  final Variable hostname;
  @override
  final Secret token;

  factory _$CelestDatabaseConfig(
          [void Function(CelestDatabaseConfigBuilder)? updates]) =>
      (new CelestDatabaseConfigBuilder()..update(updates))._build();

  _$CelestDatabaseConfig._({required this.hostname, required this.token})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        hostname, r'CelestDatabaseConfig', 'hostname');
    BuiltValueNullFieldError.checkNotNull(
        token, r'CelestDatabaseConfig', 'token');
  }

  @override
  CelestDatabaseConfig rebuild(
          void Function(CelestDatabaseConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CelestDatabaseConfigBuilder toBuilder() =>
      new CelestDatabaseConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CelestDatabaseConfig &&
        hostname == other.hostname &&
        token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, hostname.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CelestDatabaseConfig')
          ..add('hostname', hostname)
          ..add('token', token))
        .toString();
  }
}

class CelestDatabaseConfigBuilder
    implements Builder<CelestDatabaseConfig, CelestDatabaseConfigBuilder> {
  _$CelestDatabaseConfig? _$v;

  VariableBuilder? _hostname;
  VariableBuilder get hostname => _$this._hostname ??= new VariableBuilder();
  set hostname(VariableBuilder? hostname) => _$this._hostname = hostname;

  SecretBuilder? _token;
  SecretBuilder get token => _$this._token ??= new SecretBuilder();
  set token(SecretBuilder? token) => _$this._token = token;

  CelestDatabaseConfigBuilder();

  CelestDatabaseConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hostname = $v.hostname.toBuilder();
      _token = $v.token.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CelestDatabaseConfig other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CelestDatabaseConfig;
  }

  @override
  void update(void Function(CelestDatabaseConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CelestDatabaseConfig build() => _build();

  _$CelestDatabaseConfig _build() {
    _$CelestDatabaseConfig _$result;
    try {
      _$result = _$v ??
          new _$CelestDatabaseConfig._(
              hostname: hostname.build(), token: token.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hostname';
        hostname.build();
        _$failedField = 'token';
        token.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CelestDatabaseConfig', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
