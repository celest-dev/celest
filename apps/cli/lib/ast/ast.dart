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
    Map<String, Api> apis = const {},
    List<EnvironmentVariable> envVars = const [],
  }) {
    return _$Project._(
      name: name,
      reference: reference,
      location: location,
      apis: apis.build(),
      envVars: envVars.build(),
    );
  }

  factory Project.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(Project.serializer, json)!;

  factory Project.build([void Function(ProjectBuilder) updates]) = _$Project;

  Project._();

  String get name;
  Reference get reference;
  SourceLocation get location;
  BuiltMap<String, Api> get apis;
  BuiltList<EnvironmentVariable> get envVars;

  R accept<R>(AstVisitor<R> visitor) => visitor.visitProject(this);

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(Project.serializer, this)
          as Map<String, dynamic>;

  static Serializer<Project> get serializer => _$projectSerializer;
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

sealed class ApiAuth implements ApiMetadata {}

abstract class ApiPublic
    implements Built<ApiPublic, ApiPublicBuilder>, ApiAuth {
  factory ApiPublic({
    required SourceLocation location,
  }) = _$ApiPublic._;

  factory ApiPublic.build([void Function(ApiPublicBuilder) updates]) =
      _$ApiPublic;

  factory ApiPublic.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ApiPublic.serializer, json)!;

  ApiPublic._();

  SourceLocation get location;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ApiPublic.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ApiPublic> get serializer => _$apiPublicSerializer;
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
    required NodeReference? references,
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
  NodeReference? get references;

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
  factory EnvironmentVariable(String envName) =>
      _$EnvironmentVariable._(envName: envName);

  factory EnvironmentVariable.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(EnvironmentVariable.serializer, json)!;

  EnvironmentVariable._();

  /// The name of the variable in the environment, e.g. `MY_ENV`.
  String get envName;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(EnvironmentVariable.serializer, this)
          as Map<String, dynamic>;

  static Serializer<EnvironmentVariable> get serializer =>
      _$environmentVariableSerializer;
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
  static const NodeType environmentVariable = _$environmentVariable;

  static BuiltSet<NodeType> get values => _$values;
  static NodeType valueOf(String name) => _$valueOf(name);

  static Serializer<NodeType> get serializer => _$nodeTypeSerializer;
}

abstract class NodeReference
    implements Built<NodeReference, NodeReferenceBuilder> {
  factory NodeReference({
    required String name,
    required NodeType type,
  }) {
    return _$NodeReference._(
      name: name,
      type: type,
    );
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
