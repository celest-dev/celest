import 'package:celest_core/src/serialization/serializer.dart';

/// A [Serializer] for [StackTrace] objects.
final class StackTraceSerializer extends Serializer<StackTrace> {
  /// Creates a [Serializer] for [StackTrace] objects.
  const StackTraceSerializer();

  @override
  StackTrace deserialize(Object? value) {
    // TODO(dnys1): Support Chain, Trace, and Frame formats.
    return StackTrace.fromString(assertWireType(value));
  }

  @override
  String serialize(StackTrace value) {
    return value.toString();
  }
}
