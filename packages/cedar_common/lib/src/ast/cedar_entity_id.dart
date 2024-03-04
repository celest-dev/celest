import 'package:cedar_common/src/ast/cedar_node.dart';

final class CedarEntityId implements CedarNode {
  const CedarEntityId(this.type, this.id);

  factory CedarEntityId.fromJson(Map<String, Object?> json) {
    switch (json) {
      case {'type': final String type, 'id': final String id} ||
            {'__entity': {'type': final String type, 'id': final String id}}:
        return CedarEntityId(type, id);
      default:
        throw FormatException('Invalid entity ID JSON: $json');
    }
  }

  final String type;
  final String id;

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
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CedarEntityId && type == other.type && id == other.id;

  @override
  int get hashCode => Object.hash(type, id);

  @override
  String toString() => '$type::"$id"';

  @override
  Map<String, Object?> toJson() => {
        'type': type,
        'id': id,
      };
}
