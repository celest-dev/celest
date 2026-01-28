import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';
import 'package:source_span/source_span.dart';

part 'ast.g.dart';

sealed class AstNode {
  FileSpan get location;

  R accept<R>(AstVisitor<R> visitor);
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg);
}

class Region extends EnumClass {
  const Region._(super.name);
  static const Region northAmerica = _$northAmerica;
  static const Region europe = _$europe;
  static const Region asiaPacific = _$asiaPacific;

  static BuiltSet<Region> get values => _$RegionValues;
  static Region valueOf(String name) => _$RegionValueOf(name);

  static Serializer<Region> get serializer => _$regionSerializer;
}

abstract class Project implements Built<Project, ProjectBuilder>, AstNode {
  factory Project({
    required String name,
    required String environment,
    String? displayName,
    Region? primaryRegion,
    String? productionUrl,
    required Reference reference,
    required FileSpan location,
    Map<String, Api> apis = const {},
    List<Variable> variables = const [],
    List<Secret> secrets = const [],
    Auth? auth,
    Map<String, Database> databases = const {},
    required SdkConfiguration sdkConfig,
  }) {
    return _$Project._(
      name: name,
      environment: environment,
      displayName: displayName,
      primaryRegion: primaryRegion,
      productionUrl: productionUrl,
      reference: reference,
      location: location,
      apis: apis.build(),
      variables: variables.build(),
      secrets: secrets.build(),
      auth: auth,
      databases: databases.build(),
      sdkConfig: sdkConfig,
    );
  }

  factory Project.build([void Function(ProjectBuilder) updates]) = _$Project;

  Project._();

  String get name;
  String get environment;
  String? get displayName;
  Region? get primaryRegion;
  String? get productionUrl;
  Reference get reference;
  BuiltMap<String, Api> get apis;
  BuiltList<Variable> get variables;
  BuiltList<Secret> get secrets;
  Auth? get auth;
  BuiltMap<String, Database> get databases;

  SdkConfiguration get sdkConfig;

  @override
  FileSpan get location;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitProject(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitProject(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(Project.serializer, this)
          as Map<String, dynamic>;

  static Serializer<Project> get serializer => _$projectSerializer;
}

abstract class Api implements Built<Api, ApiBuilder>, AstNode {
  factory Api({
    required String name,
    required FileSpan location,
    required Map<String, CloudFunction> functions,
    List<ApiMetadata> metadata = const [],
    List<String> docs = const [],
    required Iterable<Reference> exceptionTypes,
  }) {
    return _$Api._(
      name: name,
      location: location,
      metadata: metadata.build(),
      functions: functions.build(),
      docs: docs.build(),
      exceptionTypes: BuiltSet(exceptionTypes),
    );
  }

  factory Api.build([void Function(ApiBuilder) updates]) = _$Api;

  Api._();

  String get name;

  /// Ordered list of metadata applied to the API.
  BuiltList<ApiMetadata> get metadata;
  BuiltMap<String, CloudFunction> get functions;
  BuiltList<String> get docs;

  /// The set of exception types that are available to be thrown by the API.
  ///
  /// This includes all exception types found in any imports of the library.
  BuiltSet<Reference> get exceptionTypes;

  @override
  FileSpan get location;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitApi(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitApi(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(Api.serializer, this) as Map<String, dynamic>;

  static Serializer<Api> get serializer => _$apiSerializer;
}

sealed class ApiMetadata implements AstNode {}

sealed class ApiAuth implements ApiMetadata {}

abstract class ApiPublic
    implements Built<ApiPublic, ApiPublicBuilder>, ApiAuth {
  factory ApiPublic({required FileSpan location}) = _$ApiPublic._;

  factory ApiPublic.build([void Function(ApiPublicBuilder) updates]) =
      _$ApiPublic;

  ApiPublic._();

  @override
  FileSpan get location;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitApiPublic(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitApiPublic(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ApiPublic.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ApiPublic> get serializer => _$apiPublicSerializer;
}

abstract class ApiAuthenticated
    implements Built<ApiAuthenticated, ApiAuthenticatedBuilder>, ApiAuth {
  factory ApiAuthenticated({required FileSpan location}) = _$ApiAuthenticated._;

  factory ApiAuthenticated.build([
    void Function(ApiAuthenticatedBuilder) updates,
  ]) = _$ApiAuthenticated;

  ApiAuthenticated._();

  @override
  FileSpan get location;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitApiAuthenticated(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitApiAuthenticated(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ApiAuthenticated.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ApiAuthenticated> get serializer =>
      _$apiAuthenticatedSerializer;
}

abstract class ApiMiddleware
    implements Built<ApiMiddleware, ApiMiddlewareBuilder>, ApiMetadata {
  factory ApiMiddleware({required Reference type, required FileSpan location}) =
      _$ApiMiddleware._;

  factory ApiMiddleware.build([void Function(ApiMiddlewareBuilder) updates]) =
      _$ApiMiddleware;

  ApiMiddleware._();

  Reference get type;

  @override
  FileSpan get location;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitApiMiddleware(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitApiMiddleware(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ApiMiddleware.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ApiMiddleware> get serializer => _$apiMiddlewareSerializer;
}

sealed class ApiHttpMetadata implements ApiMetadata {}

abstract class ApiHttpConfig
    implements Built<ApiHttpConfig, ApiHttpConfigBuilder>, ApiHttpMetadata {
  factory ApiHttpConfig({
    required String method,
    required int statusCode,
    required FileSpan location,
  }) = _$ApiHttpConfig._;

  factory ApiHttpConfig.build([void Function(ApiHttpConfigBuilder) updates]) =
      _$ApiHttpConfig;

  ApiHttpConfig._();

  String get method;
  int get statusCode;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitApiHttpMetadata(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitApiHttpMetadata(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ApiHttpConfig.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ApiHttpConfig> get serializer => _$apiHttpConfigSerializer;
}

abstract class ApiHttpError
    implements Built<ApiHttpError, ApiHttpErrorBuilder>, ApiHttpMetadata {
  factory ApiHttpError({
    required TypeReference type,
    required int statusCode,
    required FileSpan location,
  }) = _$ApiHttpError._;

  factory ApiHttpError.build([void Function(ApiHttpErrorBuilder) updates]) =
      _$ApiHttpError;

  ApiHttpError._();

  // Type reference since this should only ever be an interface type.
  TypeReference get type;
  int get statusCode;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitApiHttpMetadata(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitApiHttpMetadata(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ApiHttpError.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ApiHttpError> get serializer => _$apiHttpErrorSerializer;
}

abstract class CloudFunctionParameter
    implements
        Built<CloudFunctionParameter, CloudFunctionParameterBuilder>,
        AstNode {
  factory CloudFunctionParameter({
    required String name,
    required Reference type,
    required bool required,
    required bool named,
    required FileSpan location,
    required NodeReference? references,
    List<DartValue> annotations = const [],
    List<Expression> annotationExpressions = const [],
    DartValue? defaultTo,
    Expression? defaultToExpression,
  }) {
    return _$CloudFunctionParameter._(
      name: name,
      type: type,
      required: required,
      named: named,
      location: location,
      references: references,
      annotations: annotations.build(),
      annotationExpressions: annotationExpressions.build(),
      defaultTo: defaultTo,
      defaultToExpression: defaultToExpression,
    );
  }

  factory CloudFunctionParameter.build([
    void Function(CloudFunctionParameterBuilder) updates,
  ]) = _$CloudFunctionParameter;

  CloudFunctionParameter._();

  String get name;
  Reference get type;
  bool get required;
  bool get named;
  NodeReference? get references;

  @BuiltValueField(serialize: false)
  BuiltList<Expression> get annotationExpressions;
  BuiltList<DartValue> get annotations;

  @BuiltValueField(serialize: false)
  Expression? get defaultToExpression;
  DartValue? get defaultTo;

  @override
  FileSpan get location;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitParameter(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitParameter(this, arg);

  bool get isContextKey => references?.type == NodeType.userContext;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(CloudFunctionParameter.serializer, this)
          as Map<String, dynamic>;

  static Serializer<CloudFunctionParameter> get serializer =>
      _$cloudFunctionParameterSerializer;
}

class StreamType extends EnumClass {
  const StreamType._(super.name);

  static const StreamType unidirectionalServer = _$unidirectionalServer;
  static const StreamType unidirectionalClient = _$unidirectionalClient;
  static const StreamType bidirectional = _$bidirectional;

  bool get clientStreaming =>
      this == unidirectionalClient || this == bidirectional;
  bool get serverStreaming =>
      this == unidirectionalServer || this == bidirectional;

  static BuiltSet<StreamType> get values => _$StreamTypeValues;
  static StreamType valueOf(String name) => _$StreamTypeValueOf(name);

  String serialize() {
    return serializers.serializeWith(StreamType.serializer, this) as String;
  }

  static StreamType deserialize(String string) {
    return serializers.deserializeWith(StreamType.serializer, string)
        as StreamType;
  }

  static Serializer<StreamType> get serializer => _$streamTypeSerializer;
}

abstract class CloudFunction
    implements
        Built<CloudFunction, CloudFunctionBuilder>,
        AstNode,
        Comparable<CloudFunction> {
  factory CloudFunction({
    required String name,
    required String apiName,
    required List<Reference> typeParameters,
    required List<CloudFunctionParameter> parameters,
    required Reference returnType,
    required Reference flattenedReturnType,
    required StreamType? streamType,
    List<ApiMetadata> metadata = const [],
    required FileSpan location,
    List<DartValue> annotations = const [],
    List<Expression> annotationExpressions = const [],
    List<String> docs = const [],
  }) {
    return _$CloudFunction._(
      name: name,
      apiName: apiName,
      typeParameters: typeParameters.build(),
      parameters: parameters.build(),
      returnType: returnType,
      flattenedReturnType: flattenedReturnType,
      streamType: streamType,
      metadata: metadata.build(),
      location: location,
      annotations: annotations.build(),
      annotationExpressions: annotationExpressions.build(),
      docs: docs.build(),
    );
  }

  factory CloudFunction.build([void Function(CloudFunctionBuilder) updates]) =
      _$CloudFunction;

  CloudFunction._();

  String get name;
  String get route => '/${apiName.paramCase}/${name.paramCase}';
  String get apiName;
  BuiltList<Reference> get typeParameters;
  BuiltList<CloudFunctionParameter> get parameters;
  Reference get returnType;
  Reference get flattenedReturnType;
  StreamType? get streamType;
  BuiltList<ApiMetadata> get metadata;

  @BuiltValueField(serialize: false)
  BuiltList<Expression> get annotationExpressions;
  BuiltList<DartValue> get annotations;

  BuiltList<String> get docs;

  @override
  FileSpan get location;

  @override
  int compareTo(CloudFunction other) {
    final int apiCompare = apiName.compareTo(other.apiName);
    if (apiCompare != 0) {
      return apiCompare;
    }
    return location.start.offset.compareTo(other.location.start.offset);
  }

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitFunction(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitFunction(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(CloudFunction.serializer, this)
          as Map<String, dynamic>;

  static Serializer<CloudFunction> get serializer => _$cloudFunctionSerializer;
}

/// {@template celest_ast.configuration_value}
/// A configuration value that can be used to configure a Celest backend.
/// {@endtemplate}
sealed class ConfigurationVariable implements AstNode {
  /// The name of the variable in the environment, e.g. `MY_ENV`.
  String get name;

  /// The name of the variable as defined in the project's code, e.g. `myEnv`.
  String? get dartName;

  /// Documentation comments attached to the variable declaration, if any.
  BuiltList<String> get docs;
}

/// {@template celest_ast.environment_variable}
/// A reference to an environment variable within a Celest backend.
/// {@endtemplate}
///
/// Environment variables can be used to provide environment-specific
/// configuration to your backend. They allow you to keep configuration values
/// separate from your codebase, improving flexibility when running in different
/// environments.
abstract class Variable
    implements Built<Variable, VariableBuilder>, ConfigurationVariable {
  /// {@macro celest_ast.environment_variable}
  factory Variable(
    String name, {
    String? dartName,
    String? value,
    Iterable<String> docs = const [],
    required FileSpan location,
  }) => _$Variable._(
    name: name,
    dartName: dartName,
    value: value,
    docs: docs.toBuiltList(),
    location: location,
  );

  Variable._();

  /// Static environment variables will have their values hardcoded.
  ///
  /// Otherwise, the value will be resolved from the environment as part of
  /// project resolution.
  String? get value;

  @override
  FileSpan get location;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitVariable(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitVariable(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(Variable.serializer, this)
          as Map<String, dynamic>;

  static Serializer<Variable> get serializer => _$variableSerializer;
}

abstract class Secret
    implements Built<Secret, SecretBuilder>, ConfigurationVariable {
  factory Secret(
    String name, {
    String? dartName,
    Iterable<String> docs = const [],
    required FileSpan location,
  }) => _$Secret._(
    name: name,
    dartName: dartName,
    docs: docs.toBuiltList(),
    location: location,
  );

  Secret._();

  @override
  FileSpan get location;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitSecret(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitSecret(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(Secret.serializer, this)
          as Map<String, dynamic>;

  static Serializer<Secret> get serializer => _$secretSerializer;
}

abstract class Auth implements Built<Auth, AuthBuilder>, AstNode {
  factory Auth({
    required List<AuthProvider> providers,
    Iterable<ExternalAuthProvider> externalProviders = const [],
    required FileSpan location,
  }) {
    return _$Auth._(
      providers: providers.build(),
      externalProviders: externalProviders.toBuiltList(),
      location: location,
    );
  }
  factory Auth.build([void Function(AuthBuilder) updates]) = _$Auth;
  Auth._();

  BuiltList<AuthProvider> get providers;
  BuiltList<ExternalAuthProvider> get externalProviders;

  @override
  FileSpan get location;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitAuth(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitAuth(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(Auth.serializer, this) as Map<String, dynamic>;

  static Serializer<Auth> get serializer => _$authSerializer;
}

class AuthProviderType extends EnumClass {
  const AuthProviderType._(super.name);

  @BuiltValueEnumConst(wireName: 'EMAIL_OTP')
  static const AuthProviderType emailOtp = _$emailOtp;

  @BuiltValueEnumConst(wireName: 'SMS_OTP')
  static const AuthProviderType smsOtp = _$smsOtp;

  @BuiltValueEnumConst(wireName: 'GOOGLE')
  static const AuthProviderType google = _$google;

  @BuiltValueEnumConst(wireName: 'GITHUB')
  static const AuthProviderType gitHub = _$gitHub;

  @BuiltValueEnumConst(wireName: 'APPLE')
  static const AuthProviderType apple = _$apple;

  @BuiltValueEnumConst(wireName: 'FIREBASE')
  static const AuthProviderType firebase = _$firebase;

  @BuiltValueEnumConst(wireName: 'SUPABASE')
  static const AuthProviderType supabase = _$supabase;

  static BuiltSet<AuthProviderType> get values => _$AuthProviderTypeValues;
  static AuthProviderType valueOf(String name) =>
      _$AuthProviderTypeValueOf(name);

  String serialize() {
    return serializers.serializeWith(AuthProviderType.serializer, this)
        as String;
  }

  static AuthProviderType deserialize(String string) {
    return serializers.deserializeWith(AuthProviderType.serializer, string)!;
  }

  static Serializer<AuthProviderType> get serializer =>
      _$authProviderTypeSerializer;
}

@BuiltValue(instantiable: false)
sealed class AuthProvider implements AstNode {
  String get name;
  AuthProviderType get type;

  AuthProvider rebuild(void Function(AuthProviderBuilder) updates);
  AuthProviderBuilder toBuilder();
}

extension AuthProviderBuilderBuilder on AuthProviderBuilder {
  AuthProvider build() {
    final builder = this;
    return switch (builder) {
      EmailAuthProviderBuilder() => builder.build(),
      SmsAuthProviderBuilder() => builder.build(),
      GoogleAuthProviderBuilder() => builder.build(),
      AppleAuthProviderBuilder() => builder.build(),
      GitHubAuthProviderBuilder() => builder.build(),
      _ => throw ArgumentError('Unknown builder: $builder'),
    };
  }
}

@BuiltValue(instantiable: false)
sealed class ExternalAuthProvider implements AstNode {
  String get name;
  AuthProviderType get type;

  ExternalAuthProvider rebuild(
    void Function(ExternalAuthProviderBuilder) updates,
  );
  ExternalAuthProviderBuilder toBuilder();
}

extension ExternalAuthProviderBuilderBuilder on ExternalAuthProviderBuilder {
  ExternalAuthProvider build() {
    final builder = this;
    return switch (builder) {
      FirebaseExternalAuthProviderBuilder() => builder.build(),
      SupabaseExternalAuthProviderBuilder() => builder.build(),
      _ => throw ArgumentError('Unknown builder: $builder'),
    };
  }
}

abstract class EmailAuthProvider
    implements
        AuthProvider,
        Built<EmailAuthProvider, EmailAuthProviderBuilder> {
  factory EmailAuthProvider({String? name, required FileSpan location}) {
    return _$EmailAuthProvider._(
      name: name ?? $type.name,
      type: $type,
      location: location,
    );
  }
  factory EmailAuthProvider.build([
    void Function(EmailAuthProviderBuilder) updates,
  ]) = _$EmailAuthProvider;
  EmailAuthProvider._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(EmailAuthProviderBuilder builder) {
    builder.name ??= $type.name;
    builder.type = $type;
  }

  static const AuthProviderType $type = AuthProviderType.emailOtp;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitAuthProvider(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitAuthProvider(this, arg);

  static Serializer<EmailAuthProvider> get serializer =>
      _$emailAuthProviderSerializer;
}

abstract class SmsAuthProvider
    implements AuthProvider, Built<SmsAuthProvider, SmsAuthProviderBuilder> {
  factory SmsAuthProvider({String? name, required FileSpan location}) {
    return _$SmsAuthProvider._(
      name: name ?? $type.name,
      type: $type,
      location: location,
    );
  }

  factory SmsAuthProvider.build([
    void Function(SmsAuthProviderBuilder) updates,
  ]) = _$SmsAuthProvider;
  SmsAuthProvider._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(SmsAuthProviderBuilder builder) {
    builder.name ??= $type.name;
    builder.type = $type;
  }

  static const AuthProviderType $type = AuthProviderType.smsOtp;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitAuthProvider(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitAuthProvider(this, arg);

  static Serializer<SmsAuthProvider> get serializer =>
      _$smsAuthProviderSerializer;
}

abstract class GoogleAuthProvider
    implements
        AuthProvider,
        Built<GoogleAuthProvider, GoogleAuthProviderBuilder> {
  factory GoogleAuthProvider({
    String? name,
    required FileSpan location,
    required Secret clientId,
    required Secret clientSecret,
  }) {
    return _$GoogleAuthProvider._(
      name: name ?? $type.name,
      type: $type,
      location: location,
      clientId: clientId,
      clientSecret: clientSecret,
    );
  }

  factory GoogleAuthProvider.build([
    void Function(GoogleAuthProviderBuilder) updates,
  ]) = _$GoogleAuthProvider;
  GoogleAuthProvider._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(GoogleAuthProviderBuilder builder) {
    builder.name ??= $type.name;
    builder.type = $type;
  }

  static const AuthProviderType $type = AuthProviderType.google;

  Secret get clientId;
  Secret get clientSecret;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitAuthProvider(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitAuthProvider(this, arg);

  static Serializer<GoogleAuthProvider> get serializer =>
      _$googleAuthProviderSerializer;
}

abstract class AppleAuthProvider
    implements
        AuthProvider,
        Built<AppleAuthProvider, AppleAuthProviderBuilder> {
  factory AppleAuthProvider({
    String? name,
    required FileSpan location,
    required Secret clientId,
    required Secret teamId,
    required Secret keyId,
    required Secret privateKey,
  }) {
    return _$AppleAuthProvider._(
      name: name ?? $type.name,
      type: $type,
      location: location,
      clientId: clientId,
      teamId: teamId,
      keyId: keyId,
      privateKey: privateKey,
    );
  }

  factory AppleAuthProvider.build([
    void Function(AppleAuthProviderBuilder) updates,
  ]) = _$AppleAuthProvider;
  AppleAuthProvider._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(AppleAuthProviderBuilder builder) {
    builder.name ??= $type.name;
    builder.type = $type;
  }

  static const AuthProviderType $type = AuthProviderType.apple;

  Secret get clientId;
  Secret get teamId;
  Secret get keyId;
  Secret get privateKey;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitAuthProvider(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitAuthProvider(this, arg);

  static Serializer<AppleAuthProvider> get serializer =>
      _$appleAuthProviderSerializer;
}

abstract class GitHubAuthProvider
    implements
        AuthProvider,
        Built<GitHubAuthProvider, GitHubAuthProviderBuilder> {
  factory GitHubAuthProvider({
    String? name,
    required FileSpan location,
    required Secret clientId,
    required Secret clientSecret,
  }) {
    return _$GitHubAuthProvider._(
      name: name ?? $type.name,
      type: $type,
      location: location,
      clientId: clientId,
      clientSecret: clientSecret,
    );
  }

  factory GitHubAuthProvider.build([
    void Function(GitHubAuthProviderBuilder) updates,
  ]) = _$GitHubAuthProvider;
  GitHubAuthProvider._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(GitHubAuthProviderBuilder builder) {
    builder.name ??= $type.name;
    builder.type = $type;
  }

  static const AuthProviderType $type = AuthProviderType.gitHub;

  Secret get clientId;
  Secret get clientSecret;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitAuthProvider(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitAuthProvider(this, arg);

  static Serializer<GitHubAuthProvider> get serializer =>
      _$gitHubAuthProviderSerializer;
}

abstract class FirebaseExternalAuthProvider
    implements
        ExternalAuthProvider,
        Built<
          FirebaseExternalAuthProvider,
          FirebaseExternalAuthProviderBuilder
        > {
  factory FirebaseExternalAuthProvider({
    String? name,
    required FileSpan location,
    required Variable projectId,
  }) {
    return _$FirebaseExternalAuthProvider._(
      name: name ?? $type.name,
      type: $type,
      location: location,
      projectId: projectId,
    );
  }

  factory FirebaseExternalAuthProvider.build([
    void Function(FirebaseExternalAuthProviderBuilder) updates,
  ]) = _$FirebaseExternalAuthProvider;
  FirebaseExternalAuthProvider._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(FirebaseExternalAuthProviderBuilder builder) {
    builder.name ??= $type.name;
    builder.type = $type;
  }

  static const AuthProviderType $type = AuthProviderType.firebase;

  Variable get projectId;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitExternalAuthProvider(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitExternalAuthProvider(this, arg);

  static Serializer<FirebaseExternalAuthProvider> get serializer =>
      _$firebaseExternalAuthProviderSerializer;
}

abstract class SupabaseExternalAuthProvider
    implements
        ExternalAuthProvider,
        Built<
          SupabaseExternalAuthProvider,
          SupabaseExternalAuthProviderBuilder
        > {
  factory SupabaseExternalAuthProvider({
    String? name,
    required FileSpan location,
    required Variable projectUrl,
    Secret? jwtSecret,
  }) {
    return _$SupabaseExternalAuthProvider._(
      name: name ?? $type.name,
      type: $type,
      location: location,
      projectUrl: projectUrl,
      jwtSecret: jwtSecret,
    );
  }

  factory SupabaseExternalAuthProvider.build([
    void Function(SupabaseExternalAuthProviderBuilder) updates,
  ]) = _$SupabaseExternalAuthProvider;
  SupabaseExternalAuthProvider._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(SupabaseExternalAuthProviderBuilder builder) {
    builder.name ??= $type.name;
    builder.type = $type;
  }

  static const AuthProviderType $type = AuthProviderType.supabase;

  Variable get projectUrl;
  Secret? get jwtSecret;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitExternalAuthProvider(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitExternalAuthProvider(this, arg);

  static Serializer<SupabaseExternalAuthProvider> get serializer =>
      _$supabaseExternalAuthProviderSerializer;
}

class NodeType extends EnumClass {
  const NodeType._(super.name);

  static const NodeType project = _$project;
  static const NodeType api = _$api;
  static const NodeType apiPublic = _$apiPublic;
  static const NodeType apiAuthenticated = _$apiAuthenticated;
  static const NodeType apiMiddleware = _$apiMiddleware;
  static const NodeType cloudFunction = _$cloudFunction;
  static const NodeType cloudFunctionParameter = _$cloudFunctionParameter;
  static const NodeType variable = _$variable;
  static const NodeType secret = _$secret;
  static const NodeType userContext = _$userContext;
  static const NodeType httpHeader = _$httpHeader;
  static const NodeType httpQuery = _$httpQuery;
  static const NodeType httpLabel = _$httpLabel;

  static BuiltSet<NodeType> get values => _$values;
  static NodeType valueOf(String name) => _$valueOf(name);

  static Serializer<NodeType> get serializer => _$nodeTypeSerializer;
}

abstract class NodeReference
    implements Built<NodeReference, NodeReferenceBuilder> {
  factory NodeReference({required String name, required NodeType type}) {
    return _$NodeReference._(name: name, type: type);
  }

  factory NodeReference.build([void Function(NodeReferenceBuilder) updates]) =
      _$NodeReference;

  factory NodeReference.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(NodeReference.serializer, json)!;

  NodeReference._();

  String get name;
  NodeType get type;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(NodeReference.serializer, this)
          as Map<String, dynamic>;

  static Serializer<NodeReference> get serializer => _$nodeReferenceSerializer;
}

sealed class DatabaseSchema implements AstNode {
  /// The type of database schema.
  DatabaseSchemaType get type;

  /// The version of the schema.
  int get version;

  /// The Dart type declaring the database schema.
  TypeReference get declaration;
}

class DatabaseSchemaType extends EnumClass {
  const DatabaseSchemaType._(super.name);

  static const DatabaseSchemaType drift = _$drift;

  static BuiltSet<DatabaseSchemaType> get values => _$DatabaseSchemaTypeValues;
  static DatabaseSchemaType valueOf(String name) =>
      _$DatabaseSchemaTypeValueOf(name);

  static Serializer<DatabaseSchemaType> get serializer =>
      _$databaseSchemaTypeSerializer;
}

abstract class DriftDatabaseSchema
    implements
        Built<DriftDatabaseSchema, DriftDatabaseSchemaBuilder>,
        DatabaseSchema {
  factory DriftDatabaseSchema({
    required TypeReference declaration,
    required int version,
    required FileSpan location,
  }) {
    return _$DriftDatabaseSchema._(
      declaration: declaration,
      version: version,
      location: location,
    );
  }

  factory DriftDatabaseSchema.build([
    void Function(DriftDatabaseSchemaBuilder) updates,
  ]) = _$DriftDatabaseSchema;

  DriftDatabaseSchema._();

  @override
  DatabaseSchemaType get type => DatabaseSchemaType.drift;

  /// The Drift type of the database schema.
  ///
  /// Must be a subtype of `GeneratedDatabase`.
  @override
  TypeReference get declaration;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitDatabaseSchema(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitDatabaseSchema(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(DriftDatabaseSchema.serializer, this)
          as Map<String, dynamic>;

  static Serializer<DriftDatabaseSchema> get serializer =>
      _$driftDatabaseSchemaSerializer;
}

class DatabaseProviderType extends EnumClass {
  const DatabaseProviderType._(super.name);

  @BuiltValueEnumConst(wireName: 'CELEST')
  static const DatabaseProviderType celest = _$celest;

  static BuiltSet<DatabaseProviderType> get values => _$databaseProviderType;
  static DatabaseProviderType valueOf(String name) =>
      _$databaseProviderTypeValueOf(name);
}

abstract class Database implements Built<Database, DatabaseBuilder>, AstNode {
  factory Database({
    required String name,
    required String dartName,
    Iterable<String> docs = const [],
    required DatabaseSchema schema,
    required DatabaseConfig config,
    required FileSpan location,
  }) {
    return _$Database._(
      name: name,
      dartName: dartName,
      docs: docs.toBuiltList(),
      schema: schema,
      config: config,
      location: location,
    );
  }

  factory Database.build([void Function(DatabaseBuilder) updates]) = _$Database;

  Database._();

  /// The name of the database.
  ///
  /// Defaults to the name of the schema type.
  String get name;

  /// The name of the Dart variable declaring the database.
  String get dartName;

  /// Documentation comments attached to the database declaration, if any.
  BuiltList<String> get docs;

  /// The schema definition of the database.
  DatabaseSchema get schema;

  /// The configuration for the database host.
  DatabaseConfig get config;

  @override
  FileSpan get location;

  @override
  R accept<R>(AstVisitor<R> visitor) => visitor.visitDatabase(this);

  @override
  R acceptWithArg<R, A>(AstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitDatabase(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(Database.serializer, this)
          as Map<String, dynamic>;

  static Serializer<Database> get serializer => _$databaseSerializer;
}

sealed class DatabaseConfig {
  DatabaseProviderType get provider;
}

// Holds the hostname and token for a Celest database.
abstract class CelestDatabaseConfig
    implements
        DatabaseConfig,
        Built<CelestDatabaseConfig, CelestDatabaseConfigBuilder> {
  factory CelestDatabaseConfig({
    required Variable hostname,
    required Secret token,
  }) {
    return _$CelestDatabaseConfig._(hostname: hostname, token: token);
  }

  factory CelestDatabaseConfig.build([
    void Function(CelestDatabaseConfigBuilder) updates,
  ]) = _$CelestDatabaseConfig;

  CelestDatabaseConfig._();

  @override
  DatabaseProviderType get provider => DatabaseProviderType.celest;

  Variable get hostname;
  Secret get token;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(CelestDatabaseConfig.serializer, this)
          as Map<String, dynamic>;

  static Serializer<CelestDatabaseConfig> get serializer =>
      _$celestDatabaseConfigSerializer;
}
