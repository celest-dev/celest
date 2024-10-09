import 'package:celest_core/src/serialization/serializer.dart';

/// {@template celest.core.exception_serializer}
/// A serializer for generic [Exception] types.
/// {@endtemplate}
final class ExceptionSerializer extends Serializer<Exception> {
  /// {@macro celest.core.exception_serializer}
  const ExceptionSerializer();

  @override
  Exception deserialize(Object? value) {
    return Exception(value);
  }

  @override
  String serialize(Exception value) {
    return value.toString();
  }
}
