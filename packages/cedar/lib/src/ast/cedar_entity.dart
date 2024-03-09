import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cedar/src/ast/cedar_entity_id.dart';
import 'package:cedar/src/policy/json_expr.dart';

part 'cedar_entity.g.dart';

/// Dart representation of a Cedar [entity](https://docs.cedarpolicy.com/policies/syntax-entity.html).
///
/// Conforms to the entity [JSON format](https://docs.cedarpolicy.com/auth/entities-syntax.html#entities).
abstract class CedarEntity implements Built<CedarEntity, CedarEntityBuilder> {
  factory CedarEntity({
    required CedarEntityId id,
    List<CedarEntityId> parents = const [],
    Map<String, CedarValueJson> attributes = const {},
  }) {
    return _$CedarEntity._(
      id: id,
      parents: parents.build(),
      attributes: attributes.build(),
    );
  }

  factory CedarEntity.build([
    void Function(CedarEntityBuilder) updates,
  ]) = _$CedarEntity;

  factory CedarEntity.fromJson(Map<String, Object?> json) => CedarEntity(
        id: CedarEntityId.fromJson(json['uid'] as Map<String, Object?>),
        parents: (json['parents'] as List<Object?>)
            .map((e) => CedarEntityId.fromJson(e as Map<String, Object?>))
            .toList(),
        attributes: (json['attrs'] as Map<Object?, Object?>)
            .cast<String, Object?>()
            .map((key, value) => MapEntry(key, CedarValueJson.fromJson(value))),
      );

  const CedarEntity._();

  CedarEntityId get id;
  BuiltList<CedarEntityId> get parents;
  BuiltMap<String, CedarValueJson> get attributes;

  Map<String, Object?> toJson() => {
        'uid': id.toJson(),
        'parents': parents.map((e) => e.toJson()).toList(),
        'attrs': attributes
            .map((key, value) => MapEntry(key, value.toJson()))
            .asMap(),
      };

  static Serializer<CedarEntity> get serializer => _$cedarEntitySerializer;
}
