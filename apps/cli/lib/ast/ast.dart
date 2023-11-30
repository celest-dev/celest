import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:celest_cli/ast/serializers.dart';
import 'package:celest_cli/ast/visitor.dart';
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
          if (overrides == null) {
            return;
          }
          for (final apiOverride in overrides.apis.values) {
            env.apis.updateValue(
              apiOverride.name,
              (api) => api.rebuild((b) {
                b.metadata.addAll(apiOverride.metadata);
                for (final function in apiOverride.functions.values) {
                  b.functions[function.name] = function;
                }
              }),
              ifAbsent: () => apiOverride,
            );
          }
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
  }) {
    return _$Environment._(
      name: name,
      apis: apis.build(),
    );
  }

  factory Environment.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(Environment.serializer, json)!;

  factory Environment.build([void Function(EnvironmentBuilder) updates]) =
      _$Environment;

  Environment._();

  String? get name;
  BuiltMap<String, Api> get apis;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(Environment.serializer, this)
          as Map<String, dynamic>;

  static Serializer<Environment> get serializer => _$environmentSerializer;
}

abstract class Api implements Built<Api, ApiBuilder> {
  factory Api({
    required String name,
    required Map<String, CloudFunction> functions,
    List<ApiMetadata> metadata = const [],
  }) {
    return _$Api._(
      name: name,
      metadata: metadata.build(),
      functions: functions.build(),
    );
  }

  factory Api.build([void Function(ApiBuilder) updates]) = _$Api;

  factory Api.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(Api.serializer, json)!;

  Api._();

  String get name;
  BuiltList<ApiMetadata> get metadata;
  BuiltMap<String, CloudFunction> get functions;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(Api.serializer, this) as Map<String, dynamic>;

  static Serializer<Api> get serializer => _$apiSerializer;
}

sealed class ApiMetadata implements Node {}

abstract class ApiMetadataAuthenticated
    implements
        Built<ApiMetadataAuthenticated, ApiMetadataAuthenticatedBuilder>,
        ApiMetadata {
  factory ApiMetadataAuthenticated({
    required SourceLocation location,
  }) = _$ApiMetadataAuthenticated._;

  factory ApiMetadataAuthenticated.build([
    void Function(ApiMetadataAuthenticatedBuilder) updates,
  ]) = _$ApiMetadataAuthenticated;

  factory ApiMetadataAuthenticated.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ApiMetadataAuthenticated.serializer, json)!;

  ApiMetadataAuthenticated._();

  SourceLocation get location;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ApiMetadataAuthenticated.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ApiMetadataAuthenticated> get serializer =>
      _$apiMetadataAuthenticatedSerializer;
}

abstract class ApiMetadataMiddleware
    implements
        Built<ApiMetadataMiddleware, ApiMetadataMiddlewareBuilder>,
        ApiMetadata {
  factory ApiMetadataMiddleware({
    required Reference type,
    required SourceLocation location,
  }) = _$ApiMetadataMiddleware._;

  factory ApiMetadataMiddleware.build([
    void Function(ApiMetadataMiddlewareBuilder) updates,
  ]) = _$ApiMetadataMiddleware;

  factory ApiMetadataMiddleware.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ApiMetadataMiddleware.serializer, json)!;

  ApiMetadataMiddleware._();

  Reference get type;
  SourceLocation get location;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ApiMetadataMiddleware.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ApiMetadataMiddleware> get serializer =>
      _$apiMetadataMiddlewareSerializer;
}

abstract class Parameter implements Built<Parameter, ParameterBuilder>, Node {
  factory Parameter({
    required String name,
    required Reference type,
    required bool required,
    required bool named,
    required SourceLocation location,
  }) = _$Parameter._;

  factory Parameter.build([void Function(ParameterBuilder) updates]) =
      _$Parameter;

  factory Parameter.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(Parameter.serializer, json)!;

  Parameter._();

  String get name;
  Reference get type;
  bool get required;
  bool get named;
  SourceLocation get location;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(Parameter.serializer, this)
          as Map<String, dynamic>;

  static Serializer<Parameter> get serializer => _$parameterSerializer;
}

abstract class CloudFunction
    implements Built<CloudFunction, CloudFunctionBuilder>, Node {
  factory CloudFunction({
    required String name,
    required List<Parameter> parameters,
    required Reference returnType,
    required Reference flattenedReturnType,
    List<ApiMetadata> metadata = const [],
    required SourceLocation location,
  }) {
    return _$CloudFunction._(
      name: name,
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
  BuiltList<Parameter> get parameters;
  Reference get returnType;
  Reference get flattenedReturnType;
  BuiltList<ApiMetadata> get metadata;
  SourceLocation get location;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(CloudFunction.serializer, this)
          as Map<String, dynamic>;

  static Serializer<CloudFunction> get serializer => _$cloudFunctionSerializer;
}

abstract class SourceLocation
    implements Built<SourceLocation, SourceLocationBuilder> {
  factory SourceLocation({
    required String path,
    required int line,
    required int column,
  }) = _$SourceLocation._;

  factory SourceLocation.build([void Function(SourceLocationBuilder) updates]) =
      _$SourceLocation;

  factory SourceLocation.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(SourceLocation.serializer, json)!;

  SourceLocation._();

  /// The path to the source file, relative to the project root.
  String get path;
  int get line;
  int get column;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(SourceLocation.serializer, this)
          as Map<String, dynamic>;

  static Serializer<SourceLocation> get serializer =>
      _$sourceLocationSerializer;
}
