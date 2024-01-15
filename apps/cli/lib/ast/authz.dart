import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:celest/celest.dart' as celest;
import 'package:celest_cli/ast/serializers.dart';

part 'authz.g.dart';

abstract class Policy implements Built<Policy, PolicyBuilder> {
  factory Policy({
    required celest.Entity grantor,
    required Iterable<PolicyStatement> statements,
  }) {
    return _$Policy._(
      grantor: grantor.id,
      statements: statements.toBuiltSet(),
    );
  }

  factory Policy.build([void Function(PolicyBuilder) updates]) = _$Policy;

  factory Policy.fromJson(Map<String, Object?> json) =>
      serializers.deserializeWith(Policy.serializer, json)!;

  Policy._();

  String get grantor;
  BuiltSet<PolicyStatement> get statements;

  Map<String, Object?> toJson() =>
      serializers.serializeWith(Policy.serializer, this)
          as Map<String, Object?>;

  static Serializer<Policy> get serializer => _$policySerializer;
}

abstract class PolicyStatement
    implements Built<PolicyStatement, PolicyStatementBuilder> {
  factory PolicyStatement({
    required celest.Node grantee,
    required Iterable<celest.CelestAction> actions,
  }) {
    return _$PolicyStatement._(
      grantee: grantee.id,
      actions: actions.map((action) => action.toString()).toBuiltSet(),
    );
  }

  factory PolicyStatement.build([
    void Function(PolicyStatementBuilder) updates,
  ]) = _$PolicyStatement;

  factory PolicyStatement.fromJson(Map<String, Object?> json) =>
      serializers.deserializeWith(PolicyStatement.serializer, json)!;

  PolicyStatement._();

  String get grantee;
  BuiltSet<String> get actions;

  Map<String, Object?> toJson() =>
      serializers.serializeWith(PolicyStatement.serializer, this)
          as Map<String, Object?>;

  static Serializer<PolicyStatement> get serializer =>
      _$policyStatementSerializer;
}
