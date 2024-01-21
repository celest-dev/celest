import 'package:celest_core/src/serialization/serializer.dart';

/// A [Serializer] for [UriData] objects.
final class UriDataSerializer extends Serializer<UriData> {
  /// Creates a [Serializer] for [UriData] objects.
  const UriDataSerializer();

  @override
  UriData deserialize(Object? value) {
    return UriData.parse(assertWireType(value));
  }

  @override
  String serialize(UriData value) {
    return value.toString();
  }
}
