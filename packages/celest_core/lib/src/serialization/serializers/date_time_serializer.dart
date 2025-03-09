import 'package:celest_core/src/serialization/serializer.dart';

/// A [Serializer] for [DateTime] objects.
final class DateTimeSerializer extends Serializer<DateTime> {
  /// Creates a [Serializer] for [DateTime] objects.
  const DateTimeSerializer();

  @override
  DateTime deserialize(Object? value) {
    return DateTime.parse(assertWireType(value));
  }

  @override
  String serialize(DateTime value) {
    return value.toIso8601String();
  }
}
