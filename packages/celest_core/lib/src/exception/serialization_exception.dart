import 'package:celest_core/celest_core.dart';

/// {@template celest_core.exceptions.serialization_exception}
/// Thrown when a error occurs during serialization.
///
/// Typically, this is thrown when a [Serializer] is unable to serialize or
/// deserialize a value.
/// {@endtemplate}
final class SerializationException extends FormatException
    implements BadRequestException, CelestException {
  /// Creates a [SerializationException] with the given [message].
  ///
  /// {@macro celest_core_exceptions_serialization_exception}
  const SerializationException(super.message);

  @override
  String toString() => 'SerializationException: $message';
}
