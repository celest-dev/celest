import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:celest_cli/ast/serializers.dart';
import 'package:celest_cli/ast/visitor.dart';
import 'package:celest_cli/src/context.dart';
import 'package:code_builder/code_builder.dart';

part 'ast.g.dart';

sealed class Node {}

abstract class Project implements Built<Project, ProjectBuilder>, Node {
  factory Project({
    required String name,
    required Reference reference,
    required SourceLocation location,
    List<String> environmentNames = const [],
    required Environment baseEnvironment,
    Map<String, Environment> environmentOverrides = const {},
  }) {
    return _$Project._(
      name: name,
      reference: reference,
      location: location,
      environmentNames: environmentNames.build(),
      baseEnvironment: baseEnvironment,
      environmentOverrides: environmentOverrides.build(),
    );
  }

  factory Project.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(Project.serializer, json)!;

  factory Project.build([void Function(ProjectBuilder) updates]) = _$Project;

  Project._();

  String get name;
  Reference get reference;
  SourceLocation get location;
  BuiltList<String> get environmentNames;
  Environment get baseEnvironment;
  BuiltMap<String, Environment> get environmentOverrides;

  static final _environments = Expando<BuiltMap<String, Environment>>();
  BuiltMap<String, Environment> get environments {
    return _environments[this] ??= BuiltMap.build((builder) {
      for (final environment in environmentNames) {
        final overrides = environmentOverrides[environment];
        builder[environment] = baseEnvironment.rebuild((env) {
          env.name = environment;
          env.apis.updateAllValues((apiName, api) {
            final apiOverride = overrides?.apis[apiName];
            return api.rebuild((b) {
              b.environmentName = environment;
              if (apiOverride == null) {
                return;
              }
              b.metadata.addAll(apiOverride.metadata);
              for (final function in apiOverride.functions.values) {
                b.functions[function.name] = function;
              }
            });
          });
        });
      }
    });
  }

  R accept<R>(AstVisitor<R> visitor) => visitor.visitProject(this);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(Project.serializer, this)
          as Map<String, dynamic>;

  static Serializer<Project> get serializer => _$projectSerializer;
}

abstract class Environment
    implements Built<Environment, EnvironmentBuilder>, Node {
  factory Environment({
    String? name,
    Map<String, Api> apis = const {},
    List<EnvironmentVariable> envVars = const [],
  }) {
    return _$Environment._(
      name: name,
      apis: apis.build(),
      envVars: envVars.build(),
    );
  }

  factory Environment.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(Environment.serializer, json)!;

  factory Environment.build([void Function(EnvironmentBuilder) updates]) =
      _$Environment;

  Environment._();

  String? get name;
  BuiltMap<String, Api> get apis;
  BuiltList<EnvironmentVariable> get envVars;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(Environment.serializer, this)
          as Map<String, dynamic>;

  static Serializer<Environment> get serializer => _$environmentSerializer;
}

abstract class Api implements Built<Api, ApiBuilder> {
  factory Api({
    required String name,
    required String environmentName,
    required Map<String, CloudFunction> functions,
    List<ApiMetadata> metadata = const [],
  }) {
    return _$Api._(
      name: name,
      environmentName: environmentName,
      metadata: metadata.build(),
      functions: functions.build(),
    );
  }

  factory Api.build([void Function(ApiBuilder) updates]) = _$Api;

  factory Api.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(Api.serializer, json)!;

  Api._();

  String get name;
  String get environmentName;
  BuiltList<ApiMetadata> get metadata;
  BuiltMap<String, CloudFunction> get functions;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(Api.serializer, this) as Map<String, dynamic>;

  static Serializer<Api> get serializer => _$apiSerializer;
}

sealed class ApiMetadata implements Node {}

sealed class ApiAuth implements ApiMetadata {}

abstract class ApiAnonymous
    implements Built<ApiAnonymous, ApiAnonymousBuilder>, ApiAuth {
  factory ApiAnonymous({
    required SourceLocation location,
  }) = _$ApiAnonymous._;

  factory ApiAnonymous.build([void Function(ApiAnonymousBuilder) updates]) =
      _$ApiAnonymous;

  factory ApiAnonymous.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ApiAnonymous.serializer, json)!;

  ApiAnonymous._();

  SourceLocation get location;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ApiAnonymous.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ApiAnonymous> get serializer => _$apiAnonymousSerializer;
}

abstract class ApiAuthenticated
    implements Built<ApiAuthenticated, ApiAuthenticatedBuilder>, ApiAuth {
  factory ApiAuthenticated({
    required SourceLocation location,
  }) = _$ApiAuthenticated._;

  factory ApiAuthenticated.build([
    void Function(ApiAuthenticatedBuilder) updates,
  ]) = _$ApiAuthenticated;

  factory ApiAuthenticated.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ApiAuthenticated.serializer, json)!;

  ApiAuthenticated._();

  SourceLocation get location;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ApiAuthenticated.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ApiAuthenticated> get serializer =>
      _$apiAuthenticatedSerializer;
}

abstract class ApiMiddleware
    implements Built<ApiMiddleware, ApiMiddlewareBuilder>, ApiMetadata {
  factory ApiMiddleware({
    required Reference type,
    required SourceLocation location,
  }) = _$ApiMiddleware._;

  factory ApiMiddleware.build([
    void Function(ApiMiddlewareBuilder) updates,
  ]) = _$ApiMiddleware;

  factory ApiMiddleware.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ApiMiddleware.serializer, json)!;

  ApiMiddleware._();

  Reference get type;
  SourceLocation get location;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ApiMiddleware.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ApiMiddleware> get serializer => _$apiMiddlewareSerializer;
}

abstract class CloudFunctionParameter
    implements
        Built<CloudFunctionParameter, CloudFunctionParameterBuilder>,
        Node {
  factory CloudFunctionParameter({
    required String name,
    required Reference type,
    required bool required,
    required bool named,
    required SourceLocation location,
  }) = _$CloudFunctionParameter._;

  factory CloudFunctionParameter.build([
    void Function(CloudFunctionParameterBuilder) updates,
  ]) = _$CloudFunctionParameter;

  factory CloudFunctionParameter.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(CloudFunctionParameter.serializer, json)!;

  CloudFunctionParameter._();

  String get name;
  Reference get type;
  bool get required;
  bool get named;
  SourceLocation get location;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(CloudFunctionParameter.serializer, this)
          as Map<String, dynamic>;

  static Serializer<CloudFunctionParameter> get serializer =>
      _$cloudFunctionParameterSerializer;
}

abstract class CloudFunction
    implements Built<CloudFunction, CloudFunctionBuilder>, Node {
  factory CloudFunction({
    required String name,
    required String apiName,
    required List<CloudFunctionParameter> parameters,
    required Reference returnType,
    required Reference flattenedReturnType,
    List<ApiMetadata> metadata = const [],
    required SourceLocation location,
  }) {
    return _$CloudFunction._(
      name: name,
      apiName: apiName,
      parameters: parameters.build(),
      returnType: returnType,
      flattenedReturnType: flattenedReturnType,
      metadata: metadata.build(),
      location: location,
    );
  }

  factory CloudFunction.build([void Function(CloudFunctionBuilder) updates]) =
      _$CloudFunction;

  factory CloudFunction.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(CloudFunction.serializer, json)!;

  CloudFunction._();

  String get name;
  String get apiName;
  BuiltList<CloudFunctionParameter> get parameters;
  Reference get returnType;
  Reference get flattenedReturnType;
  BuiltList<ApiMetadata> get metadata;
  SourceLocation get location;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(CloudFunction.serializer, this)
          as Map<String, dynamic>;

  static Serializer<CloudFunction> get serializer => _$cloudFunctionSerializer;
}

abstract class EnvironmentVariable
    implements Built<EnvironmentVariable, EnvironmentVariableBuilder>, Node {
  factory EnvironmentVariable({
    required String dartName,
    required String envName,
    required SourceLocation location,
  }) = _$EnvironmentVariable._;

  factory EnvironmentVariable.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(EnvironmentVariable.serializer, json)!;

  EnvironmentVariable._();

  /// The name of the variable in Dart, e.g. `myEnv`.
  String get dartName;

  /// The name of the variable in the environment, e.g. `MY_ENV`.
  String get envName;
  SourceLocation get location;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(EnvironmentVariable.serializer, this)
          as Map<String, dynamic>;

  static Serializer<EnvironmentVariable> get serializer =>
      _$environmentVariableSerializer;
}

abstract class SourceLocation
    implements Built<SourceLocation, SourceLocationBuilder> {
  factory SourceLocation({
    required Object /* String | Uri */ uri,
    required int line,
    required int column,
  }) {
    return _$SourceLocation._(
      uri: switch (uri) {
        String() => projectPaths.normalizeUri(p.toUri(uri)),
        Uri() => projectPaths.normalizeUri(uri),
        _ => throw ArgumentError.value(
            uri,
            'uri',
            'Must be a String or Uri.',
          ),
      },
      line: line,
      column: column,
    );
  }

  factory SourceLocation.build([void Function(SourceLocationBuilder) updates]) =
      _$SourceLocation;

  factory SourceLocation.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(SourceLocation.serializer, json)!;

  SourceLocation._();

  /// The path to the source file, relative to the project root.
  Uri get uri;
  int get line;
  int get column;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(SourceLocation.serializer, this)
          as Map<String, dynamic>;

  static Serializer<SourceLocation> get serializer =>
      _$sourceLocationSerializer;
}
