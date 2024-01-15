import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:celest_cli/ast/authz.dart';
import 'package:celest_cli/ast/serializers.dart';

part 'resolved_ast.g.dart';

@BuiltValue(instantiable: false)
sealed class ResolvedNode {}

abstract class ResolvedProject
    implements Built<ResolvedProject, ResolvedProjectBuilder>, ResolvedNode {
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
    implements Built<ResolvedApi, ResolvedApiBuilder>, ResolvedNode {
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

  String get name;
  BuiltMap<String, ResolvedCloudFunction> get functions;
  Policy? get policy;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ResolvedApi.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ResolvedApi> get serializer => _$resolvedApiSerializer;
}

abstract class ResolvedCloudFunction
    implements
        Built<ResolvedCloudFunction, ResolvedCloudFunctionBuilder>,
        ResolvedNode {
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
        ResolvedNode {
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

  /// The name of the variable in the environment, e.g. `MY_ENV`.
  String get name;
  String get value;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(ResolvedEnvironmentVariable.serializer, this)
          as Map<String, dynamic>;

  static Serializer<ResolvedEnvironmentVariable> get serializer =>
      _$resolvedEnvironmentVariableSerializer;
}
