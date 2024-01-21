import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:celest_cli/ast/serializers.dart';
import 'package:celest_cli/ast/visitor.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_span/source_span.dart';

export 'package:source_span/source_span.dart' show FileSpan;

export 'deployed_ast.dart';

part 'ast.g.dart';

@BuiltValue(instantiable: false)
sealed class AstNode {
  FileSpan get location;
}

abstract class Project implements Built<Project, ProjectBuilder>, AstNode {
  factory Project({
    required String name,
    required Reference reference,
    required FileSpan location,
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
  BuiltMap<String, Api> get apis;
  BuiltList<EnvironmentVariable> get envVars;

  @override
  FileSpan get location;

  R accept<R>(AstVisitor<R> visitor) => visitor.visitProject(this);

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
  }) {
    return _$Api._(
      name: name,
      location: location,
      metadata: metadata.build(),
      functions: functions.build(),
      docs: docs.build(),
    );
  }

  factory Api.build([void Function(ApiBuilder) updates]) = _$Api;

  factory Api.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(Api.serializer, json)!;

  Api._();

  String get name;
  BuiltList<ApiMetadata> get metadata;
  BuiltMap<String, CloudFunction> get functions;
  BuiltList<String> get docs;

  @override
  FileSpan get location;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(Api.serializer, this) as Map<String, dynamic>;

  static Serializer<Api> get serializer => _$apiSerializer;
}

sealed class ApiMetadata implements AstNode {}

sealed class ApiAuth implements ApiMetadata {}

abstract class ApiPublic
    implements Built<ApiPublic, ApiPublicBuilder>, ApiAuth {
  factory ApiPublic({
    required FileSpan location,
  }) = _$ApiPublic._;

  factory ApiPublic.build([void Function(ApiPublicBuilder) updates]) =
      _$ApiPublic;

  factory ApiPublic.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ApiPublic.serializer, json)!;

  ApiPublic._();

  @override
  FileSpan get location;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ApiPublic.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ApiPublic> get serializer => _$apiPublicSerializer;
}

abstract class ApiAuthenticated
    implements Built<ApiAuthenticated, ApiAuthenticatedBuilder>, ApiAuth {
  factory ApiAuthenticated({
    required FileSpan location,
  }) = _$ApiAuthenticated._;

  factory ApiAuthenticated.build([
    void Function(ApiAuthenticatedBuilder) updates,
  ]) = _$ApiAuthenticated;

  factory ApiAuthenticated.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ApiAuthenticated.serializer, json)!;

  ApiAuthenticated._();

  @override
  FileSpan get location;

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
    required FileSpan location,
  }) = _$ApiMiddleware._;

  factory ApiMiddleware.build([
    void Function(ApiMiddlewareBuilder) updates,
  ]) = _$ApiMiddleware;

  factory ApiMiddleware.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ApiMiddleware.serializer, json)!;

  ApiMiddleware._();

  Reference get type;

  @override
  FileSpan get location;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ApiMiddleware.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ApiMiddleware> get serializer => _$apiMiddlewareSerializer;
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
    List<Expression> annotations = const [],
    Expression? defaultTo,
  }) {
    return _$CloudFunctionParameter._(
      name: name,
      type: type,
      required: required,
      named: named,
      location: location,
      references: references,
      annotations: annotations.build(),
      defaultTo: defaultTo,
    );
  }

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
  NodeReference? get references;
  BuiltList<Expression> get annotations;
  Expression? get defaultTo;

  @override
  FileSpan get location;

  /// Whether to include this parameter in the generated client.
  bool get includeInClient {
    if (type.isFunctionContext) return false;
    if (references != null) return false;
    return true;
  }

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(CloudFunctionParameter.serializer, this)
          as Map<String, dynamic>;

  static Serializer<CloudFunctionParameter> get serializer =>
      _$cloudFunctionParameterSerializer;
}

abstract class CloudFunction
    implements
        Built<CloudFunction, CloudFunctionBuilder>,
        AstNode,
        Comparable<CloudFunction> {
  factory CloudFunction({
    required String name,
    required String apiName,
    required List<CloudFunctionParameter> parameters,
    required Reference returnType,
    required Reference flattenedReturnType,
    required List<Reference> exceptionTypes,
    List<ApiMetadata> metadata = const [],
    required FileSpan location,
    List<Expression> annotations = const [],
    List<String> docs = const [],
  }) {
    return _$CloudFunction._(
      name: name,
      apiName: apiName,
      parameters: parameters.build(),
      returnType: returnType,
      flattenedReturnType: flattenedReturnType,
      metadata: metadata.build(),
      exceptionTypes: exceptionTypes.build(),
      location: location,
      annotations: annotations.build(),
      docs: docs.build(),
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
  BuiltList<Reference> get exceptionTypes;
  BuiltList<Expression> get annotations;
  BuiltList<String> get docs;

  @override
  FileSpan get location;

  @override
  int compareTo(CloudFunction other) {
    final apiCompare = apiName.compareTo(other.apiName);
    if (apiCompare != 0) {
      return apiCompare;
    }
    return location.start.offset.compareTo(other.location.start.offset);
  }

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(CloudFunction.serializer, this)
          as Map<String, dynamic>;

  static Serializer<CloudFunction> get serializer => _$cloudFunctionSerializer;
}

abstract class EnvironmentVariable
    implements Built<EnvironmentVariable, EnvironmentVariableBuilder>, AstNode {
  factory EnvironmentVariable(
    String envName, {
    required FileSpan location,
  }) =>
      _$EnvironmentVariable._(envName: envName, location: location);

  factory EnvironmentVariable.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(EnvironmentVariable.serializer, json)!;

  EnvironmentVariable._();

  /// The name of the variable in the environment, e.g. `MY_ENV`.
  String get envName;

  @override
  FileSpan get location;

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
