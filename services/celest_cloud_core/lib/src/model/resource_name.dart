import 'package:cedar/ast.dart';
import 'package:celest_cloud_core/src/model/resource_type.dart';

typedef _ResourceNameInfo = ({
  ResourceType type,
  EntityUid uid,
  List<EntityUid> parents,
});

/// A resource name in Celest Cloud.
///
/// Example: `organizations/123/projects/456/environments/789`
extension type ResourceName(_ResourceNameInfo _info) {
  /// Parses a resource name string into a [ResourceName] object.
  factory ResourceName.parse(String name) {
    final segments = name.split('/').reversed.toList();
    if (segments.length < 2 || segments.length % 2 != 0) {
      throw ArgumentError('Invalid resource name: $name');
    }

    (ResourceType, String)? uid;
    final parents = <EntityUid>[];
    for (var i = 0; i < segments.length; i += 2) {
      final type = segments[i + 1];
      final id = segments[i];
      if (type.isEmpty || id.isEmpty) {
        throw ArgumentError('Invalid resource name: $name');
      }
      final resourceType = ResourceType.fromPatternType(type);
      if (uid == null) {
        uid = (resourceType, id);
      } else {
        parents.add(resourceType.uid(id));
      }
    }

    final (resourceType, id) = uid!;
    return ResourceName((
      type: resourceType,
      uid: resourceType.uid(id),
      parents: parents,
    ));
  }

  /// A map of resource pattern types to their Cedar entity types.
  static const Map<String, EntityTypeName> entityTypes = {
    'operations': EntityTypeName('Celest::Operation'),
    'users': EntityTypeName('Celest::User'),
    'sessions': EntityTypeName('Celest::Session'),
    'projects': EntityTypeName('Celest::Project'),
    'organizations': EntityTypeName('Celest::Organization'),
    'environments': EntityTypeName('Celest::Project::Environment'),
  };

  /// The resource type for this resource.
  ResourceType get type => _info.type;

  /// The unique identifier for this resource.
  EntityUid get uid => _info.uid;

  /// The list of parent resources for this resource.
  List<EntityUid> get parents => _info.parents;
}
