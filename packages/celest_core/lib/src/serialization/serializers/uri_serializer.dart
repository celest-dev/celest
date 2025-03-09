import 'package:celest_core/src/serialization/serializer.dart';

/// A [Serializer] for [Uri] objects.
final class UriSerializer extends Serializer<Uri> {
  /// Creates a [Serializer] for [Uri] objects.
  const UriSerializer();

  @override
  Uri deserialize(Object? value) {
    return Uri.parse(assertWireType(value));
  }

  @override
  String serialize(Uri value) {
    return value.toString();
  }
}
