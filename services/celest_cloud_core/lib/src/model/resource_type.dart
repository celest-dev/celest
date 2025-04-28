import 'package:cedar/cedar.dart';

/// A resource type in Celest Cloud.
enum ResourceType {
  /// A Celest operation.
  operation(
    patternType: 'operations',
    entityType: EntityTypeName('Celest::Operation'),
  ),

  /// A Celest user.
  user(
    patternType: 'users',
    entityType: EntityTypeName('Celest::User'),
  ),

  /// A Celest session.
  session(
    patternType: 'sessions',
    entityType: EntityTypeName('Celest::Session'),
  ),

  /// A Celest project.
  project(
    patternType: 'projects',
    patternParentType: organization,
    entityType: EntityTypeName('Celest::Project'),
  ),

  /// A Celest organization.
  organization(
    patternType: 'organizations',
    entityType: EntityTypeName('Celest::Organization'),
  ),

  /// A Celest environment.
  projectEnvironment(
    patternType: 'environments',
    patternParentType: project,
    entityType: EntityTypeName('Celest::Project::Environment'),
  );

  const ResourceType({
    required this.patternType,
    this.patternParentType,
    required this.entityType,
  });

  /// The resource type for the given pattern type.
  factory ResourceType.fromPatternType(String patternType) {
    return ResourceType.values.firstWhere(
      (type) => type.patternType == patternType,
      orElse: () =>
          throw FormatException('Invalid resource type: $patternType'),
    );
  }

  /// The resource type for the given Cedar entity type.
  factory ResourceType.fromEntityType(EntityTypeName entityType) {
    return ResourceType.values.firstWhere(
      (type) => type.entityType == entityType,
      orElse: () => throw FormatException('Invalid resource type: $entityType'),
    );
  }

  /// The pattern type for this resource.
  final String patternType;

  /// The parent resource type in patterns.
  final ResourceType? patternParentType;

  /// The Cedar entity type for this resource.
  final EntityTypeName entityType;

  /// Creates a new [EntityUid] for this resource type and the given [id].
  EntityUid uid(String id) {
    return EntityUid(entityType, EntityId(id));
  }
}
