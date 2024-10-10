import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:celest_ast/celest_ast.dart';

part 'deployed_ast.g.dart';

sealed class DeployedProject {
  factory DeployedProject.fromJson(Map<String, dynamic> json) {
    return switch (json[r'$type']) {
      'LocalDeployedProject' => LocalDeployedProject.fromJson(json),
      'RemoteDeployedProject' => RemoteDeployedProject.fromJson(json),
      final unknown => throw ArgumentError('Unknown type: $unknown'),
    };
  }

  BuiltMap<String, DeployedApi> get apis;

  Map<String, dynamic> toJson();
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
          name: name,
          functions: {
            for (final function in api.functions.values)
              function.functionId: DeployedFunction(
                name: function.functionId,
                uri: Uri.http(
                  'localhost:$port',
                  function.httpConfig.route.path,
                ),
              ),
          },
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

  @override
  Map<String, dynamic> toJson() => {
        r'$type': 'LocalDeployedProject',
        ...(serializers.serializeWith(LocalDeployedProject.serializer, this)
            as Map<String, dynamic>),
      };

  static Serializer<LocalDeployedProject> get serializer =>
      _$localDeployedProjectSerializer;
}

abstract class RemoteDeployedProject
    implements
        Built<RemoteDeployedProject, RemoteDeployedProjectBuilder>,
        DeployedProject {
  factory RemoteDeployedProject({
    required Uri baseUri,
    Map<String, DeployedApi> apis = const {},
  }) {
    return _$RemoteDeployedProject._(
      baseUri: baseUri,
      apis: apis.build(),
    );
  }

  factory RemoteDeployedProject.from({
    required ResolvedProject projectAst,
    required Uri baseUri,
  }) {
    return RemoteDeployedProject.build((project) {
      project.baseUri = baseUri;
      projectAst.apis.forEach((name, api) {
        project.apis[name] = DeployedApi(
          name: name,
          functions: {
            for (final function in api.functions.values)
              function.functionId: DeployedFunction(
                name: function.functionId,
                uri: baseUri.resolve(function.httpConfig.route.path),
              ),
          },
        );
      });
    });
  }

  factory RemoteDeployedProject.fromJson(Map<String, Object?> json) =>
      serializers.deserializeWith(RemoteDeployedProject.serializer, json)!;

  factory RemoteDeployedProject.build([
    void Function(RemoteDeployedProjectBuilder) updates,
  ]) = _$RemoteDeployedProject;

  const RemoteDeployedProject._();

  Uri get baseUri;

  @override
  BuiltMap<String, DeployedApi> get apis;

  @override
  Map<String, dynamic> toJson() => {
        r'$type': 'RemoteDeployedProject',
        ...(serializers.serializeWith(RemoteDeployedProject.serializer, this)
            as Map<String, dynamic>),
      };

  static Serializer<RemoteDeployedProject> get serializer =>
      _$remoteDeployedProjectSerializer;
}

abstract class DeployedApi implements Built<DeployedApi, DeployedApiBuilder> {
  factory DeployedApi({
    required String name,
    required Map<String, DeployedFunction> functions,
  }) {
    return _$DeployedApi._(
      name: name,
      functions: functions.build(),
    );
  }

  factory DeployedApi.fromJson(Map<String, Object?> json) =>
      serializers.deserializeWith(DeployedApi.serializer, json)!;

  factory DeployedApi.build([
    void Function(DeployedApiBuilder) updates,
  ]) = _$DeployedApi;

  const DeployedApi._();

  String get name;
  BuiltMap<String, DeployedFunction> get functions;

  static Serializer<DeployedApi> get serializer => _$deployedApiSerializer;
}

abstract class DeployedFunction
    implements Built<DeployedFunction, DeployedFunctionBuilder> {
  factory DeployedFunction({
    required String name,
    required Uri uri,
  }) {
    return _$DeployedFunction._(
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

  String get name;
  Uri get uri;

  static Serializer<DeployedFunction> get serializer =>
      _$deployedFunctionSerializer;
}
