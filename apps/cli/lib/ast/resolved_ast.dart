import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:celest_cli/ast/actions.dart';
import 'package:celest_cli/ast/serializers.dart';

part 'authz.dart';
part 'resolved_ast.g.dart';

sealed class Node {
  /// A unique identifier for the node.
  NodeId get id;
}

/// A marker trait for [Node]s which participant in authorization.
abstract mixin class Entity implements Node {
  const Entity();
}

abstract class NodeId implements Built<NodeId, NodeIdBuilder> {
  factory NodeId(String type, String id) {
    return _$NodeId._(
      type: type,
      id: id,
    );
  }

  factory NodeId.build([void Function(NodeIdBuilder) updates]) = _$NodeId;

  factory NodeId.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(NodeId.serializer, json)!;

  NodeId._();

  String get type;
  String get id;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(NodeId.serializer, this)
          as Map<String, dynamic>;

  static Serializer<NodeId> get serializer => _$nodeIdSerializer;
}

abstract class ResolvedProject
    implements Built<ResolvedProject, ResolvedProjectBuilder>, Node {
  factory ResolvedProject({
    required String name,
    Map<String, ResolvedApi> apis = const {},
    List<ResolvedEnvironmentVariable> envVars = const [],
  }) {
    return _$ResolvedProject._(
      name: name,
      apis: apis.build(),
      envVars: envVars.build(),
    );
  }

  factory ResolvedProject.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ResolvedProject.serializer, json)!;

  factory ResolvedProject.build([
    void Function(ResolvedProjectBuilder) updates,
  ]) = _$ResolvedProject;

  ResolvedProject._();

  @override
  NodeId get id => NodeId('Celest::Project', name);

  String get name;
  BuiltMap<String, ResolvedApi> get apis;
  BuiltList<ResolvedEnvironmentVariable> get envVars;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ResolvedProject.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ResolvedProject> get serializer =>
      _$resolvedProjectSerializer;
}

abstract class ResolvedApi
    with Entity
    implements Built<ResolvedApi, ResolvedApiBuilder>, Node {
  factory ResolvedApi({
    required String name,
    required Map<String, ResolvedCloudFunction> functions,
    Policy? policy,
  }) {
    return _$ResolvedApi._(
      name: name,
      functions: functions.build(),
      policy: policy,
    );
  }

  factory ResolvedApi.build([void Function(ResolvedApiBuilder) updates]) =
      _$ResolvedApi;

  factory ResolvedApi.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ResolvedApi.serializer, json)!;

  ResolvedApi._();

  @override
  NodeId get id => NodeId('Celest::Api', name);

  String get name;
  BuiltMap<String, ResolvedCloudFunction> get functions;
  Policy? get policy;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ResolvedApi.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ResolvedApi> get serializer => _$resolvedApiSerializer;
}

abstract class ResolvedCloudFunction
    with Entity
    implements
        Built<ResolvedCloudFunction, ResolvedCloudFunctionBuilder>,
        Node {
  factory ResolvedCloudFunction({
    required String name,
    required String apiName,
    required Iterable<String> envVars,
    Policy? policy,
  }) {
    return _$ResolvedCloudFunction._(
      name: name,
      apiName: apiName,
      envVars: envVars.toBuiltSet(),
      policy: policy,
    );
  }

  factory ResolvedCloudFunction.build([
    void Function(ResolvedCloudFunctionBuilder) updates,
  ]) = _$ResolvedCloudFunction;

  factory ResolvedCloudFunction.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(ResolvedCloudFunction.serializer, json)!;

  ResolvedCloudFunction._();

  @override
  NodeId get id => NodeId('Celest::CloudFunction', '$apiName.$name');

  String get name;
  String get apiName;
  BuiltSet<String> get envVars;
  Policy? get policy;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ResolvedCloudFunction.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ResolvedCloudFunction> get serializer =>
      _$resolvedCloudFunctionSerializer;
}

abstract class ResolvedEnvironmentVariable
    implements
        Built<ResolvedEnvironmentVariable, ResolvedEnvironmentVariableBuilder>,
        Node {
  factory ResolvedEnvironmentVariable({
    required String name,
    required String value,
  }) = _$ResolvedEnvironmentVariable._;

  factory ResolvedEnvironmentVariable.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(
        ResolvedEnvironmentVariable.serializer,
        json,
      )!;

  ResolvedEnvironmentVariable._();

  @override
  NodeId get id => NodeId('Celest::EnvironmentVariable', name);

  /// The name of the variable in the environment, e.g. `MY_ENV`.
  String get name;
  String get value;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ResolvedEnvironmentVariable.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ResolvedEnvironmentVariable> get serializer =>
      _$resolvedEnvironmentVariableSerializer;
}
