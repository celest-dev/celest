import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cedar/cedar.dart' as cedar;
// ignore: implementation_imports
import 'package:cedar/src/proto/cedar/v3/policy.pb.dart' as cedarpb;
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_ast/src/proto/cedar/v3/policy.pb.dart' as pb;
import 'package:celest_ast/src/proto/celest/ast/v1/resolved_ast.pb.dart' as pb;
import 'package:code_builder/code_builder.dart';

part 'resolved_ast.g.dart';

sealed class Node {
  R accept<R>(ResolvedAstVisitor<R> visitor);
  R acceptWithArg<R, A>(ResolvedAstVisitorWithArg<R, A> visitor, A arg);
}

abstract class ResolvedProject
    implements Built<ResolvedProject, ResolvedProjectBuilder>, Node {
  factory ResolvedProject({
    required String projectId,
    required String environmentId,
    Map<String, ResolvedApi> apis = const {},
    List<ResolvedVariable> variables = const [],
    List<ResolvedSecret> secrets = const [],
    ResolvedAuth? auth,
    required SdkConfiguration sdkConfig,
  }) {
    return _$ResolvedProject._(
      projectId: projectId,
      environmentId: environmentId,
      apis: apis.build(),
      variables: variables.build(),
      secrets: secrets.build(),
      auth: auth,
      sdkConfig: sdkConfig,
    );
  }

  factory ResolvedProject.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ResolvedProject.serializer, json)!;

  factory ResolvedProject.build([
    void Function(ResolvedProjectBuilder) updates,
  ]) = _$ResolvedProject;

  factory ResolvedProject.fromProto(pb.ResolvedProject proto) {
    return ResolvedProject(
      projectId: proto.projectId,
      environmentId: proto.environmentId,
      apis: proto.apis.map(
        (key, value) => MapEntry(key, ResolvedApi.fromProto(value)),
      ),
      variables: proto.variables.map(ResolvedVariable.fromProto).toList(),
      secrets: proto.secrets.map(ResolvedSecret.fromProto).toList(),
      auth: proto.hasAuth() ? ResolvedAuth.fromProto(proto.auth) : null,
      sdkConfig: SdkConfiguration.fromProto(proto.sdkConfig),
    );
  }

  ResolvedProject._();

  String get projectId;
  String get environmentId;
  BuiltMap<String, ResolvedApi> get apis;
  BuiltList<ResolvedVariable> get variables;
  BuiltList<ResolvedSecret> get secrets;
  ResolvedAuth? get auth;

  SdkConfiguration get sdkConfig;

  @override
  R accept<R>(ResolvedAstVisitor<R> visitor) => visitor.visitProject(this);

  @override
  R acceptWithArg<R, A>(ResolvedAstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitProject(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ResolvedProject.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ResolvedProject> get serializer =>
      _$resolvedProjectSerializer;

  pb.ResolvedProject toProto() {
    return pb.ResolvedProject(
      projectId: projectId,
      environmentId: environmentId,
      apis: apis.map((key, value) => MapEntry(key, value.toProto())).toMap(),
      variables: variables.map((e) => e.toProto()),
      secrets: secrets.map((e) => e.toProto()),
      auth: auth?.toProto(),
      sdkConfig: sdkConfig.toProto(),
    );
  }
}

abstract class ResolvedApi
    implements Built<ResolvedApi, ResolvedApiBuilder>, Node {
  factory ResolvedApi({
    required String apiId,
    required Map<String, ResolvedCloudFunction> functions,
    cedar.PolicySet? policySet,
  }) {
    return _$ResolvedApi._(
      apiId: apiId,
      functions: functions.build(),
      policySet: policySet,
    );
  }

  factory ResolvedApi.build([void Function(ResolvedApiBuilder) updates]) =
      _$ResolvedApi;

  factory ResolvedApi.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ResolvedApi.serializer, json)!;

  factory ResolvedApi.fromProto(pb.ResolvedApi proto) {
    return ResolvedApi(
      apiId: proto.apiId,
      functions: proto.functions.map(
        (key, value) => MapEntry(key, ResolvedCloudFunction.fromProto(value)),
      ),
      policySet: proto.hasPolicySet()
          ? cedar.PolicySet.fromProto(
              cedarpb.PolicySet.fromBuffer(proto.policySet.writeToBuffer()))
          : null,
    );
  }

  ResolvedApi._();

  String get apiId;
  BuiltMap<String, ResolvedCloudFunction> get functions;
  cedar.PolicySet? get policySet;

  @override
  R accept<R>(ResolvedAstVisitor<R> visitor) => visitor.visitApi(this);

  @override
  R acceptWithArg<R, A>(ResolvedAstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitApi(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ResolvedApi.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ResolvedApi> get serializer => _$resolvedApiSerializer;

  pb.ResolvedApi toProto() {
    return pb.ResolvedApi(
      apiId: apiId,
      functions:
          functions.map((key, value) => MapEntry(key, value.toProto())).toMap(),
      policySet: switch (policySet) {
        final policySet? =>
          pb.PolicySet.fromBuffer(policySet.toProto().writeToBuffer()),
        _ => null,
      },
    );
  }
}

abstract class ResolvedCloudFunction
    implements
        Built<ResolvedCloudFunction, ResolvedCloudFunctionBuilder>,
        Node {
  factory ResolvedCloudFunction({
    required String functionId,
    required String apiId,
    required ResolvedHttpConfig httpConfig,
    required ResolvedStreamConfig? streamConfig,
    required Iterable<String> variables,
    required Iterable<String> secrets,
    cedar.PolicySet? policySet,
  }) {
    return _$ResolvedCloudFunction._(
      functionId: functionId,
      httpConfig: httpConfig,
      streamConfig: streamConfig,
      apiId: apiId,
      variables: variables.toBuiltSet(),
      secrets: secrets.toBuiltSet(),
      policySet: policySet,
    );
  }

  factory ResolvedCloudFunction.build([
    void Function(ResolvedCloudFunctionBuilder) updates,
  ]) = _$ResolvedCloudFunction;

  factory ResolvedCloudFunction.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ResolvedCloudFunction.serializer, json)!;

  factory ResolvedCloudFunction.fromProto(pb.ResolvedFunction proto) {
    return ResolvedCloudFunction(
      functionId: proto.functionId,
      apiId: proto.parentId,
      httpConfig: ResolvedHttpConfig.fromProto(proto.httpConfig),
      streamConfig: proto.hasStreamConfig()
          ? ResolvedStreamConfig.fromProto(proto.streamConfig)
          : null,
      variables: proto.variables.toBuiltSet(),
      secrets: proto.secrets.toBuiltSet(),
      policySet: proto.hasPolicySet()
          ? cedar.PolicySet.fromProto(
              cedarpb.PolicySet.fromBuffer(proto.policySet.writeToBuffer()))
          : null,
    );
  }

  ResolvedCloudFunction._();

  String get functionId;
  String get apiId;
  ResolvedHttpConfig get httpConfig;
  ResolvedStreamConfig? get streamConfig;
  BuiltSet<String> get variables;
  BuiltSet<String> get secrets;
  cedar.PolicySet? get policySet;

  @override
  R accept<R>(ResolvedAstVisitor<R> visitor) => visitor.visitFunction(this);

  @override
  R acceptWithArg<R, A>(ResolvedAstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitFunction(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ResolvedCloudFunction.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ResolvedCloudFunction> get serializer =>
      _$resolvedCloudFunctionSerializer;

  pb.ResolvedFunction toProto() {
    return pb.ResolvedFunction(
      functionId: functionId,
      parentId: apiId,
      httpConfig: httpConfig.toProto(),
      streamConfig: streamConfig?.toProto(),
      variables: variables,
      secrets: secrets,
      policySet: switch (policySet) {
        final policySet? =>
          pb.PolicySet.fromBuffer(policySet.toProto().writeToBuffer()),
        _ => null,
      },
    );
  }
}

abstract class ResolvedHttpConfig
    implements Built<ResolvedHttpConfig, ResolvedHttpConfigBuilder> {
  factory ResolvedHttpConfig({
    required String method,
    required ResolvedHttpRoute route,
    required int status,
    required Map<TypeReference, int> statusMappings,
  }) {
    return _$ResolvedHttpConfig._(
      method: method,
      route: route,
      status: status,
      statusMappings: statusMappings.build(),
    );
  }

  factory ResolvedHttpConfig.build([
    void Function(ResolvedHttpConfigBuilder) updates,
  ]) = _$ResolvedHttpConfig;

  factory ResolvedHttpConfig.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ResolvedHttpConfig.serializer, json)!;
  }

  factory ResolvedHttpConfig.fromProto(pb.ResolvedHttpConfig proto) {
    return ResolvedHttpConfig(
      method: proto.method,
      route: ResolvedHttpRoute.fromProto(proto.route),
      status: proto.status,
      statusMappings: {
        for (final entry in proto.statusMappings.entries)
          _TypeReference.fromUriString(entry.key): entry.value,
      },
    );
  }

  ResolvedHttpConfig._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _defaults(ResolvedHttpConfigBuilder b) {
    b
      ..method ??= 'POST'
      ..status ??= 200;
  }

  String get method;
  ResolvedHttpRoute get route;
  int get status;
  BuiltMap<TypeReference, int> get statusMappings;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ResolvedHttpConfig.serializer, this)
        as Map<String, dynamic>;
  }

  static Serializer<ResolvedHttpConfig> get serializer =>
      _$resolvedHttpConfigSerializer;

  pb.ResolvedHttpConfig toProto() {
    return pb.ResolvedHttpConfig(
      method: method,
      route: route.toProto(),
      status: status,
      statusMappings: {
        for (final entry in statusMappings.entries)
          entry.key.uriString: entry.value,
      },
    );
  }
}

abstract class ResolvedStreamConfig
    implements Built<ResolvedStreamConfig, ResolvedStreamConfigBuilder> {
  factory ResolvedStreamConfig({
    required StreamType? type,
  }) {
    return _$ResolvedStreamConfig._(
      type: type,
    );
  }

  factory ResolvedStreamConfig.build([
    void Function(ResolvedStreamConfigBuilder) updates,
  ]) = _$ResolvedStreamConfig;

  factory ResolvedStreamConfig.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ResolvedStreamConfig.serializer, json)!;
  }

  factory ResolvedStreamConfig.fromProto(pb.ResolvedStreamConfig proto) {
    return ResolvedStreamConfig(
      type: switch (proto.type) {
        pb.ResolvedStreamConfig_Type.BIDIRECTIONAL => StreamType.bidirectional,
        pb.ResolvedStreamConfig_Type.UNIDIRECTIONAL_CLIENT =>
          StreamType.unidirectionalClient,
        pb.ResolvedStreamConfig_Type.UNIDIRECTIONAL_SERVER =>
          StreamType.unidirectionalServer,
        pb.ResolvedStreamConfig_Type.STREAM_CONFIG_TYPE_UNSPECIFIED => null,
        _ => throw ArgumentError.value(
            proto.type,
            'proto.type',
            'Invalid type',
          ),
      },
    );
  }

  ResolvedStreamConfig._();

  StreamType? get type;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ResolvedStreamConfig.serializer, this)
        as Map<String, dynamic>;
  }

  static Serializer<ResolvedStreamConfig> get serializer =>
      _$resolvedStreamConfigSerializer;

  pb.ResolvedStreamConfig toProto() {
    return pb.ResolvedStreamConfig(
      type: switch (type) {
        StreamType.bidirectional => pb.ResolvedStreamConfig_Type.BIDIRECTIONAL,
        StreamType.unidirectionalClient =>
          pb.ResolvedStreamConfig_Type.UNIDIRECTIONAL_CLIENT,
        StreamType.unidirectionalServer =>
          pb.ResolvedStreamConfig_Type.UNIDIRECTIONAL_SERVER,
        null => pb.ResolvedStreamConfig_Type.STREAM_CONFIG_TYPE_UNSPECIFIED,
        _ => throw ArgumentError.value(
            type,
            'type',
            'Invalid type',
          ),
      },
    );
  }
}

abstract class ResolvedHttpRoute
    implements Built<ResolvedHttpRoute, ResolvedHttpRouteBuilder> {
  factory ResolvedHttpRoute({
    required String path,
  }) {
    return _$ResolvedHttpRoute._(
      path: path,
    );
  }

  factory ResolvedHttpRoute.build([
    void Function(ResolvedHttpRouteBuilder) updates,
  ]) = _$ResolvedHttpRoute;

  factory ResolvedHttpRoute.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ResolvedHttpRoute.serializer, json)!;
  }

  factory ResolvedHttpRoute.fromProto(pb.ResolvedHttpRoute proto) {
    return ResolvedHttpRoute(
      path: proto.path,
    );
  }

  ResolvedHttpRoute._();

  String get path;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ResolvedHttpRoute.serializer, this)
        as Map<String, dynamic>;
  }

  pb.ResolvedHttpRoute toProto() {
    return pb.ResolvedHttpRoute(
      path: path,
    );
  }

  static Serializer<ResolvedHttpRoute> get serializer =>
      _$resolvedHttpRouteSerializer;
}

extension _TypeReference on TypeReference {
  static TypeReference fromUriString(String uriString) {
    return switch (uriString.split('#')) {
      [final url, final symbol] => TypeReference((b) => b
        ..url = url
        ..symbol = symbol),
      [final symbol] => TypeReference((b) => b..symbol = symbol),
      _ =>
        throw ArgumentError.value(uriString, 'uriString', 'Invalid URI string'),
    };
  }

  String get uriString {
    return switch (this) {
      TypeReference(:final url?, :final symbol) => '$url#$symbol',
      _ => symbol,
    };
  }
}

sealed class ResolvedConfigurationVariable implements Node {
  String get name;
  String get value;
}

abstract class ResolvedVariable
    implements
        Built<ResolvedVariable, ResolvedVariableBuilder>,
        ResolvedConfigurationVariable {
  factory ResolvedVariable({
    required String name,
    required String value,
  }) = _$ResolvedVariable._;

  factory ResolvedVariable.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(
        ResolvedVariable.serializer,
        json,
      )!;

  factory ResolvedVariable.fromProto(
    pb.ResolvedVariable proto,
  ) {
    return ResolvedVariable(
      name: proto.name,
      value: proto.value,
    );
  }

  ResolvedVariable._();

  /// The name of the variable in the environment, e.g. `MY_ENV`.
  @override
  String get name;
  @override
  String get value;

  @override
  R accept<R>(ResolvedAstVisitor<R> visitor) => visitor.visitVariable(this);

  @override
  R acceptWithArg<R, A>(ResolvedAstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitVariable(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ResolvedVariable.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ResolvedVariable> get serializer =>
      _$resolvedVariableSerializer;

  pb.ResolvedVariable toProto() {
    return pb.ResolvedVariable(
      name: name,
      value: value,
    );
  }
}

abstract class ResolvedSecret
    implements
        Built<ResolvedSecret, ResolvedSecretBuilder>,
        ResolvedConfigurationVariable {
  factory ResolvedSecret({
    required String name,
    required String value,
  }) = _$ResolvedSecret._;

  factory ResolvedSecret.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(
        ResolvedSecret.serializer,
        json,
      )!;

  factory ResolvedSecret.fromProto(
    pb.ResolvedSecret proto,
  ) {
    return ResolvedSecret(
      name: proto.name,
      value: proto.value,
    );
  }

  ResolvedSecret._();

  /// The name of the secret in the environment, e.g. `MY_ENV`.
  @override
  String get name;
  @override
  String get value;

  @override
  R accept<R>(ResolvedAstVisitor<R> visitor) => visitor.visitSecret(this);

  @override
  R acceptWithArg<R, A>(ResolvedAstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitSecret(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ResolvedSecret.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ResolvedSecret> get serializer =>
      _$resolvedSecretSerializer;

  pb.ResolvedSecret toProto() {
    return pb.ResolvedSecret(
      name: name,
      value: value,
    );
  }
}

abstract class ResolvedAuth
    implements Built<ResolvedAuth, ResolvedAuthBuilder>, Node {
  factory ResolvedAuth({
    Iterable<ResolvedAuthProvider> providers = const [],
    Iterable<ResolvedExternalAuthProvider> externalProviders = const [],
  }) {
    return _$ResolvedAuth._(
      providers: providers.toBuiltList(),
      externalProviders: externalProviders.toBuiltList(),
    );
  }

  factory ResolvedAuth.build([void Function(ResolvedAuthBuilder) updates]) =
      _$ResolvedAuth;

  factory ResolvedAuth.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ResolvedAuth.serializer, json)!;
  }

  factory ResolvedAuth.fromProto(pb.ResolvedAuth proto) {
    return ResolvedAuth(
      providers: proto.providers.map(ResolvedAuthProvider.fromProto),
      externalProviders:
          proto.externalProviders.map(ResolvedExternalAuthProvider.fromProto),
    );
  }

  ResolvedAuth._();

  BuiltList<ResolvedAuthProvider> get providers;
  BuiltList<ResolvedExternalAuthProvider> get externalProviders;

  @override
  R accept<R>(ResolvedAstVisitor<R> visitor) => visitor.visitAuth(this);

  @override
  R acceptWithArg<R, A>(ResolvedAstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitAuth(this, arg);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ResolvedAuth.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ResolvedAuth> get serializer => _$resolvedAuthSerializer;

  pb.ResolvedAuth toProto() {
    return pb.ResolvedAuth(
      providers: providers.map((e) => e.toProto()),
      externalProviders: externalProviders.map((e) => e.toProto()),
    );
  }
}

@BuiltValue(instantiable: false)
sealed class ResolvedAuthProvider implements Node {
  static ResolvedAuthProvider fromProto(pb.ResolvedAuthProvider proto) {
    return switch (proto.type) {
      pb.ResolvedAuthProvider_Type.EMAIL_OTP =>
        ResolvedEmailAuthProvider.fromProto(proto),
      pb.ResolvedAuthProvider_Type.SMS_OTP =>
        ResolvedSmsAuthProvider.fromProto(proto),
      pb.ResolvedAuthProvider_Type.GOOGLE =>
        ResolvedGoogleAuthProvider.fromProto(proto),
      pb.ResolvedAuthProvider_Type.APPLE =>
        ResolvedAppleAuthProvider.fromProto(proto),
      pb.ResolvedAuthProvider_Type.GITHUB =>
        ResolvedGitHubAuthProvider.fromProto(proto),
      _ => throw ArgumentError.value(proto.type, 'proto.type', 'Invalid type'),
    };
  }

  String get authProviderId;
  AuthProviderType get type;

  ResolvedAuthProvider rebuild(
    void Function(ResolvedAuthProviderBuilder) updates,
  );
  ResolvedAuthProviderBuilder toBuilder();

  pb.ResolvedAuthProvider toProto();
}

@BuiltValue(instantiable: false)
sealed class ResolvedExternalAuthProvider implements Node {
  static ResolvedExternalAuthProvider fromProto(
      pb.ResolvedExternalAuthProvider proto) {
    return switch (proto.type) {
      pb.ResolvedExternalAuthProvider_Type.FIREBASE =>
        ResolvedFirebaseExternalAuthProvider.fromProto(proto),
      pb.ResolvedExternalAuthProvider_Type.SUPABASE =>
        ResolvedSupabaseExternalAuthProvider.fromProto(proto),
      final unknown => throw ArgumentError.value(
          unknown.name,
          'proto.type',
          'Invalid type',
        ),
    };
  }

  String get authProviderId;
  AuthProviderType get type;

  ResolvedExternalAuthProvider rebuild(
    void Function(ResolvedExternalAuthProviderBuilder) updates,
  );
  ResolvedExternalAuthProviderBuilder toBuilder();

  pb.ResolvedExternalAuthProvider toProto();
}

abstract class ResolvedEmailAuthProvider
    implements
        ResolvedAuthProvider,
        Built<ResolvedEmailAuthProvider, ResolvedEmailAuthProviderBuilder> {
  factory ResolvedEmailAuthProvider({
    required String authProviderId,
  }) {
    return _$ResolvedEmailAuthProvider._(
      authProviderId: authProviderId,
      type: $type,
    );
  }
  factory ResolvedEmailAuthProvider.build(
          [void Function(ResolvedEmailAuthProviderBuilder) updates]) =
      _$ResolvedEmailAuthProvider;

  factory ResolvedEmailAuthProvider.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ResolvedEmailAuthProvider.serializer, json)!;

  factory ResolvedEmailAuthProvider.fromProto(pb.ResolvedAuthProvider proto) {
    return ResolvedEmailAuthProvider(
      authProviderId: proto.authProviderId,
    );
  }

  ResolvedEmailAuthProvider._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(ResolvedEmailAuthProviderBuilder builder) {
    builder.type = $type;
  }

  static const AuthProviderType $type = AuthProviderType.emailOtp;

  @override
  R accept<R>(ResolvedAstVisitor<R> visitor) => visitor.visitAuthProvider(this);

  @override
  R acceptWithArg<R, A>(ResolvedAstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitAuthProvider(this, arg);

  @override
  pb.ResolvedAuthProvider toProto() {
    return pb.ResolvedAuthProvider(
      authProviderId: authProviderId,
      type: pb.ResolvedAuthProvider_Type.EMAIL_OTP,
      emailOtp: pb.ResolvedEmailOtpProviderConfig(),
    );
  }

  static Serializer<ResolvedEmailAuthProvider> get serializer =>
      _$resolvedEmailAuthProviderSerializer;
}

abstract class ResolvedSmsAuthProvider
    implements
        ResolvedAuthProvider,
        Built<ResolvedSmsAuthProvider, ResolvedSmsAuthProviderBuilder> {
  factory ResolvedSmsAuthProvider({
    required String authProviderId,
  }) {
    return _$ResolvedSmsAuthProvider._(
      authProviderId: authProviderId,
      type: $type,
    );
  }

  factory ResolvedSmsAuthProvider.build(
          [void Function(ResolvedSmsAuthProviderBuilder) updates]) =
      _$ResolvedSmsAuthProvider;

  factory ResolvedSmsAuthProvider.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ResolvedSmsAuthProvider.serializer, json)!;

  factory ResolvedSmsAuthProvider.fromProto(pb.ResolvedAuthProvider proto) {
    return ResolvedSmsAuthProvider(
      authProviderId: proto.authProviderId,
    );
  }

  ResolvedSmsAuthProvider._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(ResolvedSmsAuthProviderBuilder builder) {
    builder.type = $type;
  }

  static const AuthProviderType $type = AuthProviderType.smsOtp;

  @override
  R accept<R>(ResolvedAstVisitor<R> visitor) => visitor.visitAuthProvider(this);

  @override
  R acceptWithArg<R, A>(ResolvedAstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitAuthProvider(this, arg);

  @override
  pb.ResolvedAuthProvider toProto() {
    return pb.ResolvedAuthProvider(
      authProviderId: authProviderId,
      type: pb.ResolvedAuthProvider_Type.SMS_OTP,
      smsOtp: pb.ResolvedSmsOtpProviderConfig(),
    );
  }

  static Serializer<ResolvedSmsAuthProvider> get serializer =>
      _$resolvedSmsAuthProviderSerializer;
}

abstract class ResolvedGoogleAuthProvider
    implements
        ResolvedAuthProvider,
        Built<ResolvedGoogleAuthProvider, ResolvedGoogleAuthProviderBuilder> {
  factory ResolvedGoogleAuthProvider({
    required String authProviderId,
    required ResolvedSecret clientId,
    required ResolvedSecret clientSecret,
  }) {
    return _$ResolvedGoogleAuthProvider._(
      authProviderId: authProviderId,
      type: $type,
      clientId: clientId,
      clientSecret: clientSecret,
    );
  }

  factory ResolvedGoogleAuthProvider.build(
          [void Function(ResolvedGoogleAuthProviderBuilder) updates]) =
      _$ResolvedGoogleAuthProvider;

  factory ResolvedGoogleAuthProvider.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ResolvedGoogleAuthProvider.serializer, json)!;

  factory ResolvedGoogleAuthProvider.fromProto(pb.ResolvedAuthProvider proto) {
    return ResolvedGoogleAuthProvider(
      authProviderId: proto.authProviderId,
      clientId: ResolvedSecret.fromProto(proto.google.clientId),
      clientSecret: ResolvedSecret.fromProto(proto.google.clientSecret),
    );
  }

  ResolvedGoogleAuthProvider._();

  static const AuthProviderType $type = AuthProviderType.google;

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(ResolvedGoogleAuthProviderBuilder builder) {
    builder.type = $type;
  }

  ResolvedSecret get clientId;
  ResolvedSecret get clientSecret;

  @override
  R accept<R>(ResolvedAstVisitor<R> visitor) => visitor.visitAuthProvider(this);

  @override
  R acceptWithArg<R, A>(ResolvedAstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitAuthProvider(this, arg);

  @override
  pb.ResolvedAuthProvider toProto() {
    return pb.ResolvedAuthProvider(
      authProviderId: authProviderId,
      type: pb.ResolvedAuthProvider_Type.GOOGLE,
      google: pb.ResolvedGoogleOAuthProviderConfig(
        clientId: clientId.toProto(),
        clientSecret: clientSecret.toProto(),
      ),
    );
  }

  static Serializer<ResolvedGoogleAuthProvider> get serializer =>
      _$resolvedGoogleAuthProviderSerializer;
}

abstract class ResolvedAppleAuthProvider
    implements
        ResolvedAuthProvider,
        Built<ResolvedAppleAuthProvider, ResolvedAppleAuthProviderBuilder> {
  factory ResolvedAppleAuthProvider({
    required String authProviderId,
    required ResolvedSecret clientId,
    required ResolvedSecret teamId,
    required ResolvedSecret keyId,
    required ResolvedSecret privateKey,
  }) {
    return _$ResolvedAppleAuthProvider._(
      authProviderId: authProviderId,
      type: $type,
      clientId: clientId,
      teamId: teamId,
      keyId: keyId,
      privateKey: privateKey,
    );
  }

  factory ResolvedAppleAuthProvider.build(
          [void Function(ResolvedAppleAuthProviderBuilder) updates]) =
      _$ResolvedAppleAuthProvider;

  factory ResolvedAppleAuthProvider.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ResolvedAppleAuthProvider.serializer, json)!;

  factory ResolvedAppleAuthProvider.fromProto(pb.ResolvedAuthProvider proto) {
    return ResolvedAppleAuthProvider(
      authProviderId: proto.authProviderId,
      clientId: ResolvedSecret.fromProto(proto.apple.clientId),
      teamId: ResolvedSecret.fromProto(proto.apple.teamId),
      keyId: ResolvedSecret.fromProto(proto.apple.keyId),
      privateKey: ResolvedSecret.fromProto(proto.apple.privateKey),
    );
  }

  ResolvedAppleAuthProvider._();

  static const AuthProviderType $type = AuthProviderType.apple;

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(ResolvedAppleAuthProviderBuilder builder) {
    builder.type = $type;
  }

  ResolvedSecret get clientId;
  ResolvedSecret get teamId;
  ResolvedSecret get keyId;
  ResolvedSecret get privateKey;

  @override
  R accept<R>(ResolvedAstVisitor<R> visitor) => visitor.visitAuthProvider(this);

  @override
  R acceptWithArg<R, A>(ResolvedAstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitAuthProvider(this, arg);

  @override
  pb.ResolvedAuthProvider toProto() {
    return pb.ResolvedAuthProvider(
      authProviderId: authProviderId,
      type: pb.ResolvedAuthProvider_Type.APPLE,
      apple: pb.ResolvedAppleOAuthProviderConfig(
        clientId: clientId.toProto(),
        teamId: teamId.toProto(),
        keyId: keyId.toProto(),
        privateKey: privateKey.toProto(),
      ),
    );
  }

  static Serializer<ResolvedAppleAuthProvider> get serializer =>
      _$resolvedAppleAuthProviderSerializer;
}

abstract class ResolvedGitHubAuthProvider
    implements
        ResolvedAuthProvider,
        Built<ResolvedGitHubAuthProvider, ResolvedGitHubAuthProviderBuilder> {
  factory ResolvedGitHubAuthProvider({
    required String authProviderId,
    required ResolvedSecret clientId,
    required ResolvedSecret clientSecret,
  }) {
    return _$ResolvedGitHubAuthProvider._(
      authProviderId: authProviderId,
      type: $type,
      clientId: clientId,
      clientSecret: clientSecret,
    );
  }

  factory ResolvedGitHubAuthProvider.build(
          [void Function(ResolvedGitHubAuthProviderBuilder) updates]) =
      _$ResolvedGitHubAuthProvider;

  factory ResolvedGitHubAuthProvider.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ResolvedGitHubAuthProvider.serializer, json)!;

  factory ResolvedGitHubAuthProvider.fromProto(pb.ResolvedAuthProvider proto) {
    return ResolvedGitHubAuthProvider(
      authProviderId: proto.authProviderId,
      clientId: ResolvedSecret.fromProto(proto.github.clientId),
      clientSecret: ResolvedSecret.fromProto(proto.github.clientSecret),
    );
  }

  ResolvedGitHubAuthProvider._();

  static const AuthProviderType $type = AuthProviderType.gitHub;

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(ResolvedGitHubAuthProviderBuilder builder) {
    builder.type = $type;
  }

  ResolvedSecret get clientId;
  ResolvedSecret get clientSecret;

  @override
  R accept<R>(ResolvedAstVisitor<R> visitor) => visitor.visitAuthProvider(this);

  @override
  R acceptWithArg<R, A>(ResolvedAstVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitAuthProvider(this, arg);

  @override
  pb.ResolvedAuthProvider toProto() {
    return pb.ResolvedAuthProvider(
      authProviderId: authProviderId,
      type: pb.ResolvedAuthProvider_Type.GITHUB,
      github: pb.ResolvedGitHubOAuthProviderConfig(
        clientId: clientId.toProto(),
        clientSecret: clientSecret.toProto(),
      ),
    );
  }

  static Serializer<ResolvedGitHubAuthProvider> get serializer =>
      _$resolvedGitHubAuthProviderSerializer;
}

abstract class ResolvedFirebaseExternalAuthProvider
    implements
        ResolvedExternalAuthProvider,
        Built<ResolvedFirebaseExternalAuthProvider,
            ResolvedFirebaseExternalAuthProviderBuilder> {
  factory ResolvedFirebaseExternalAuthProvider({
    required String authProviderId,
    required ResolvedVariable projectId,
  }) {
    return _$ResolvedFirebaseExternalAuthProvider._(
      authProviderId: authProviderId,
      type: $type,
      projectId: projectId,
    );
  }

  factory ResolvedFirebaseExternalAuthProvider.build(
      [void Function(ResolvedFirebaseExternalAuthProviderBuilder)
          updates]) = _$ResolvedFirebaseExternalAuthProvider;

  factory ResolvedFirebaseExternalAuthProvider.fromJson(
      Map<String, dynamic> json) {
    return serializers.deserializeWith(
        ResolvedFirebaseExternalAuthProvider.serializer, json)!;
  }

  factory ResolvedFirebaseExternalAuthProvider.fromProto(
    pb.ResolvedExternalAuthProvider proto,
  ) {
    return ResolvedFirebaseExternalAuthProvider(
      authProviderId: proto.authProviderId,
      projectId: ResolvedVariable.fromProto(
        proto.firebase.projectId,
      ),
    );
  }

  ResolvedFirebaseExternalAuthProvider._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(ResolvedFirebaseExternalAuthProviderBuilder builder) {
    builder.type = $type;
  }

  static const AuthProviderType $type = AuthProviderType.firebase;

  ResolvedVariable get projectId;

  @override
  R accept<R>(ResolvedAstVisitor<R> visitor) {
    return visitor.visitExternalAuthProvider(this);
  }

  @override
  R acceptWithArg<R, A>(ResolvedAstVisitorWithArg<R, A> visitor, A arg) {
    return visitor.visitExternalAuthProvider(this, arg);
  }

  @override
  pb.ResolvedExternalAuthProvider toProto() {
    return pb.ResolvedExternalAuthProvider(
      authProviderId: authProviderId,
      type: pb.ResolvedExternalAuthProvider_Type.FIREBASE,
      firebase: pb.ResolvedFirebaseExternalAuthProviderConfig(
        projectId: projectId.toProto(),
      ),
    );
  }

  static Serializer<ResolvedFirebaseExternalAuthProvider> get serializer =>
      _$resolvedFirebaseExternalAuthProviderSerializer;
}

abstract class ResolvedSupabaseExternalAuthProvider
    implements
        ResolvedExternalAuthProvider,
        Built<ResolvedSupabaseExternalAuthProvider,
            ResolvedSupabaseExternalAuthProviderBuilder> {
  factory ResolvedSupabaseExternalAuthProvider({
    required String authProviderId,
    required ResolvedVariable projectUrl,
    required ResolvedSecret? jwtSecret,
  }) {
    return _$ResolvedSupabaseExternalAuthProvider._(
      authProviderId: authProviderId,
      type: $type,
      projectUrl: projectUrl,
      jwtSecret: jwtSecret,
    );
  }

  factory ResolvedSupabaseExternalAuthProvider.build(
      [void Function(ResolvedSupabaseExternalAuthProviderBuilder)
          updates]) = _$ResolvedSupabaseExternalAuthProvider;

  factory ResolvedSupabaseExternalAuthProvider.fromJson(
      Map<String, dynamic> json) {
    return serializers.deserializeWith(
        ResolvedSupabaseExternalAuthProvider.serializer, json)!;
  }

  factory ResolvedSupabaseExternalAuthProvider.fromProto(
    pb.ResolvedExternalAuthProvider proto,
  ) {
    return ResolvedSupabaseExternalAuthProvider(
      authProviderId: proto.authProviderId,
      projectUrl: ResolvedVariable.fromProto(
        proto.supabase.projectUrl,
      ),
      jwtSecret: proto.supabase.hasJwtSecret()
          ? ResolvedSecret.fromProto(proto.supabase.jwtSecret)
          : null,
    );
  }

  ResolvedSupabaseExternalAuthProvider._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(ResolvedSupabaseExternalAuthProviderBuilder builder) {
    builder.type = $type;
  }

  static const AuthProviderType $type = AuthProviderType.supabase;

  ResolvedVariable get projectUrl;
  ResolvedSecret? get jwtSecret;

  @override
  R accept<R>(ResolvedAstVisitor<R> visitor) {
    return visitor.visitExternalAuthProvider(this);
  }

  @override
  R acceptWithArg<R, A>(ResolvedAstVisitorWithArg<R, A> visitor, A arg) {
    return visitor.visitExternalAuthProvider(this, arg);
  }

  @override
  pb.ResolvedExternalAuthProvider toProto() {
    return pb.ResolvedExternalAuthProvider(
      authProviderId: authProviderId,
      type: pb.ResolvedExternalAuthProvider_Type.SUPABASE,
      supabase: pb.ResolvedSupabaseExternalAuthProviderConfig(
        projectUrl: projectUrl.toProto(),
        jwtSecret: jwtSecret?.toProto(),
      ),
    );
  }

  static Serializer<ResolvedSupabaseExternalAuthProvider> get serializer =>
      _$resolvedSupabaseExternalAuthProviderSerializer;
}
