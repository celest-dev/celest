import 'package:celest_core/src/serialization/serializer.dart';

/// A [Serializer] for [RegExp] objects.
final class RegExpSerializer extends Serializer<RegExp> {
  /// Creates a [Serializer] for [RegExp] objects.
  const RegExpSerializer();

  @override
  RegExp deserialize(Object? value) {
    return RegExp(assertWireType(value));
  }

  @override
  String serialize(RegExp value) {
    return value.pattern;
  }
}
