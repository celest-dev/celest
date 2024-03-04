import 'package:cedar_common/src/ast/cedar_entity_id.dart';
import 'package:cedar_common/src/ast/cedar_node.dart';
import 'package:cedar_common/src/policy/json_expr.dart';

final class CedarEntity implements CedarNode {
  const CedarEntity({
    required this.id,
    this.parents = const [],
    this.attributes = const {},
  });

  factory CedarEntity.fromJson(Map<String, Object?> json) => CedarEntity(
        id: CedarEntityId.fromJson(json['uid'] as Map<String, Object?>),
        parents: (json['parents'] as List<Object?>)
            .map((e) => CedarEntityId.fromJson(e as Map<String, Object?>))
            .toList(),
        attributes: (json['attrs'] as Map<Object?, Object?>)
            .cast<String, Object?>()
            .map((key, value) => MapEntry(key, CedarValueJson.fromJson(value))),
      );

  final CedarEntityId id;
  final List<CedarEntityId> parents;
  final Map<String, CedarValueJson> attributes;

  @override
  Map<String, Object?> toJson() => {
        'uid': id.toJson(),
        'parents': parents.map((e) => e.toJson()).toList(),
        'attrs': attributes.map((key, value) => MapEntry(key, value.toJson())),
      };
}
