import 'package:celest_core/src/exception/serialization_exception.dart';
import 'package:celest_core/src/serialization/serializer.dart';

/// A [Serializer] for [Duration] objects.
final class DurationSerializer extends Serializer<Duration> {
  /// Creates a [Serializer] for [Duration] objects.
  const DurationSerializer();

  @override
  Duration deserialize(Object? value) {
    final Map<String, Object?> serialized = Map.of(
      assertWireType<Map<String, Object?>>(value),
    );
    final int days = serialized.remove('days') as int? ?? 0;
    final int hours = serialized.remove('hours') as int? ?? 0;
    final int minutes = serialized.remove('minutes') as int? ?? 0;
    final int seconds = serialized.remove('seconds') as int? ?? 0;
    final int milliseconds = serialized.remove('milliseconds') as int? ?? 0;
    final int microseconds = serialized.remove('microseconds') as int? ?? 0;
    if (serialized.isNotEmpty) {
      throw SerializationException(
        'DurationSerialization found unexpected keys: '
        '${serialized.keys.join(', ')}',
      );
    }
    return Duration(
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      milliseconds: milliseconds,
      microseconds: microseconds,
    );
  }

  @override
  Map<String, Object?> serialize(Duration value) {
    return {'microseconds': value.inMicroseconds};
  }
}
