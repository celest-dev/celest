import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/serialization/json_value.dart';
import 'package:celest_core/src/serialization/serializer.dart';
import 'package:json_annotation/json_annotation.dart' show JsonKey;

/// {@template celest_core.exceptions.serialization_exception}
/// Thrown when a error occurs during serialization.
///
/// Typically, this is thrown when a [Serializer] is unable to serialize or
/// deserialize a value.
/// {@endtemplate}
final class SerializationException extends BadRequestException
    implements FormatException {
  /// Creates a [SerializationException] with the given [message].
  ///
  /// {@macro celest_core_exceptions_serialization_exception}
  const SerializationException(super.message) : super.base();

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Null get source => null;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Null get offset => null;

  @override
  String toString() => 'SerializationException: $message';

  @override
  JsonValue? get details => null;
}
