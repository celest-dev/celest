import 'package:aws_common/aws_common.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:celest_cli/ast/resolved_ast.dart';
import 'package:celest_cli/ast/serializers.dart';

part 'deployed_ast.g.dart';

@BuiltValue(instantiable: false)
sealed class DeployedProject {
  BuiltMap<String, DeployedApi> get apis;
}

abstract class LocalDeployedProject
    implements
        Built<LocalDeployedProject, LocalDeployedProjectBuilder>,
        DeployedProject {
  factory LocalDeployedProject({
    required int port,
    Map<String, DeployedApi> apis = const {},
  }) {
    return _$LocalDeployedProject._(
      port: port,
      apis: apis.build(),
    );
  }

  factory LocalDeployedProject.from({
    required ResolvedProject projectAst,
    required int port,
  }) {
    return LocalDeployedProject.build((project) {
      project.port = port;
      projectAst.apis.forEach((name, api) {
        project.apis[name] = DeployedApi(
          id: api.id,
          name: name,
          functions: api.functions.map((name, function) {
            return MapEntry(
              name,
              DeployedFunction(
                id: function.id,
                name: function.name,
                uri: Uri.http(
                  'localhost:$port',
                  '/${api.name.paramCase}/${function.name.paramCase}',
                ),
              ),
            );
          }),
        );
      });
    });
  }

  factory LocalDeployedProject.fromJson(Map<String, Object?> json) =>
      serializers.deserializeWith(LocalDeployedProject.serializer, json)!;

  factory LocalDeployedProject.build([
    void Function(LocalDeployedProjectBuilder) updates,
  ]) = _$LocalDeployedProject;

  const LocalDeployedProject._();

  int get port;

  @override
  BuiltMap<String, DeployedApi> get apis;

  static Serializer<LocalDeployedProject> get serializer =>
      _$localDeployedProjectSerializer;
}

abstract class RemoteDeployedProject
    implements
        Built<RemoteDeployedProject, RemoteDeployedProjectBuilder>,
        DeployedProject {
  factory RemoteDeployedProject({
    required NodeId id,
    Map<String, DeployedApi> apis = const {},
  }) {
    return _$RemoteDeployedProject._(
      id: id,
      apis: apis.build(),
    );
  }

  factory RemoteDeployedProject.fromJson(Map<String, Object?> json) =>
      serializers.deserializeWith(RemoteDeployedProject.serializer, json)!;

  factory RemoteDeployedProject.build([
    void Function(RemoteDeployedProjectBuilder) updates,
  ]) = _$RemoteDeployedProject;

  const RemoteDeployedProject._();

  NodeId get id;
  @override
  BuiltMap<String, DeployedApi> get apis;

  static Serializer<RemoteDeployedProject> get serializer =>
      _$remoteDeployedProjectSerializer;
}

abstract class DeployedApi implements Built<DeployedApi, DeployedApiBuilder> {
  factory DeployedApi({
    required NodeId id,
    required String name,
    required BuiltMap<String, DeployedFunction> functions,
  }) {
    return _$DeployedApi._(
      id: id,
      name: name,
      functions: functions,
    );
  }

  factory DeployedApi.fromJson(Map<String, Object?> json) =>
      serializers.deserializeWith(DeployedApi.serializer, json)!;

  factory DeployedApi.build([
    void Function(DeployedApiBuilder) updates,
  ]) = _$DeployedApi;

  const DeployedApi._();

  NodeId get id;
  String get name;
  BuiltMap<String, DeployedFunction> get functions;

  static Serializer<DeployedApi> get serializer => _$deployedApiSerializer;
}

abstract class DeployedFunction
    implements Built<DeployedFunction, DeployedFunctionBuilder> {
  factory DeployedFunction({
    required NodeId id,
    required String name,
    required Uri uri,
  }) {
    return _$DeployedFunction._(
      id: id,
      name: name,
      uri: uri,
    );
  }

  factory DeployedFunction.fromJson(Map<String, Object?> json) =>
      serializers.deserializeWith(DeployedFunction.serializer, json)!;

  factory DeployedFunction.build([
    void Function(DeployedFunctionBuilder) updates,
  ]) = _$DeployedFunction;

  const DeployedFunction._();

  NodeId get id;
  String get name;
  Uri get uri;

  static Serializer<DeployedFunction> get serializer =>
      _$deployedFunctionSerializer;
}
