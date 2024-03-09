import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cedar/src/ast/cedar_node.dart';

part 'cedar_entity_id.g.dart';

abstract class CedarEntityId
    implements Built<CedarEntityId, CedarEntityIdBuilder>, CedarNode {
  factory CedarEntityId(String type, String id) =>
      _$CedarEntityId._(type: type, id: id);

  factory CedarEntityId.build([
    void Function(CedarEntityIdBuilder) updates,
  ]) = _$CedarEntityId;

  factory CedarEntityId.fromJson(Map<String, Object?> json) {
    switch (json) {
      case {'type': final String type, 'id': final String id} ||
            {'__entity': {'type': final String type, 'id': final String id}}:
        return CedarEntityId(type, id);
      default:
        throw FormatException('Invalid entity ID JSON: $json');
    }
  }

  const CedarEntityId._();

  String get type;
  String get id;

  /// Returns a normalized version of this entity ID.
  ///
  /// Cedar prohibits whitespace in entity IDs, so this method removes all
  /// whitespace from the [type] and [id].
  ///
  /// See [RFC 9](https://github.com/cedar-policy/rfcs/blob/main/text/0009-disallow-whitespace-in-entityuid.md)
  /// for more information.
  CedarEntityId get normalized => CedarEntityId(
        type,
        String.fromCharCodes(
          id.runes.expand((char) {
            return switch (char) {
              0 => '\\0'.codeUnits,
              0x9 => '\\t'.codeUnits,
              0xa => '\\n'.codeUnits,
              0xd => '\\r'.codeUnits,
              0x22 => '\\"'.codeUnits,
              0x27 => "\\'".codeUnits,
              < 0x20 ||
              0x7f || // Delete
              0x96 || // Non-breaking space
              > 0xffff =>
                '\\u{${char.toRadixString(16)}}'.codeUnits,
              _ => [char],
            };
          }),
        ),
      );

  @override
  String toString() => '$type::"$id"';

  @override
  Map<String, Object?> toJson() => {
        'type': type,
        'id': id,
      };

  static Serializer<CedarEntityId> get serializer => _$cedarEntityIdSerializer;
}
