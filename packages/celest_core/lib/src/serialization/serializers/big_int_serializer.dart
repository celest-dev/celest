import 'package:celest_core/src/serialization/serializer.dart';

/// A [Serializer] for [BigInt] objects.
final class BigIntSerializer extends Serializer<BigInt> {
  /// Creates a [Serializer] for [BigInt] objects.
  const BigIntSerializer();

  @override
  BigInt deserialize(Object? value) {
    return BigInt.parse(assertWireType(value));
  }

  @override
  String serialize(BigInt value) {
    return value.toString();
  }
}
