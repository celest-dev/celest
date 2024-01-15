part of 'resolved_ast.dart';

abstract class Policy implements Built<Policy, PolicyBuilder> {
  factory Policy({
    required Iterable<PolicyStatement> statements,
  }) {
    return _$Policy._(
      statements: statements.toBuiltSet(),
    );
  }

  factory Policy.build([void Function(PolicyBuilder) updates]) = _$Policy;

  factory Policy.fromJson(Map<String, Object?> json) =>
      serializers.deserializeWith(Policy.serializer, json)!;

  Policy._();

  BuiltSet<PolicyStatement> get statements;

  Map<String, Object?> toJson() =>
      serializers.serializeWith(Policy.serializer, this)
          as Map<String, Object?>;

  static Serializer<Policy> get serializer => _$policySerializer;
}

abstract class PolicyStatement
    implements Built<PolicyStatement, PolicyStatementBuilder> {
  factory PolicyStatement({
    required Node grantee,
    required Iterable<CelestAction> actions,
  }) {
    return _$PolicyStatement._(
      grantee: grantee.id,
      actions: actions.toBuiltSet(),
    );
  }

  factory PolicyStatement.build([
    void Function(PolicyStatementBuilder) updates,
  ]) = _$PolicyStatement;

  factory PolicyStatement.fromJson(Map<String, Object?> json) =>
      serializers.deserializeWith(PolicyStatement.serializer, json)!;

  PolicyStatement._();

  NodeId get grantee;
  BuiltSet<CelestAction> get actions;

  Map<String, Object?> toJson() =>
      serializers.serializeWith(PolicyStatement.serializer, this)
          as Map<String, Object?>;

  static Serializer<PolicyStatement> get serializer =>
      _$policyStatementSerializer;
}

abstract class Role with Entity implements Built<Role, RoleBuilder>, Node {
  factory Role({
    required String name,
  }) {
    return _$Role._(
      name: name,
    );
  }

  factory Role.build([void Function(RoleBuilder) updates]) = _$Role;

  factory Role.fromJson(Map<String, Object?> json) =>
      serializers.deserializeWith(Role.serializer, json)!;

  Role._();

  static final authenticated = Role(name: r'$authenticated');
  static final public = Role(name: r'$public');

  @override
  NodeId get id => NodeId('Celest::Role', name);

  String get name;

  Map<String, Object?> toJson() =>
      serializers.serializeWith(Role.serializer, this) as Map<String, Object?>;

  static Serializer<Role> get serializer => _$roleSerializer;
}
