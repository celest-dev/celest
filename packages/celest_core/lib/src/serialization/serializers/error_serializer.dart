import 'dart:async';

import 'package:celest_core/src/serialization/serializer.dart';

/// {@template celest.core.error_serializer}
/// A serializer for generic [Error] types.
/// {@endtemplate}
final class ErrorSerializer extends Serializer<Error> {
  /// {@macro celest.core.error_serializer}
  const ErrorSerializer();

  // NOTE: Errors generally contain information that is not
  // pertinent to the frontend. Returning an empty string
  // protects against leaking sensitive information and
  // dealing with the headache of trying to serialize these
  // objects.

  @override
  Error deserialize(Object? value) {
    return AsyncError('', StackTrace.empty);
  }

  @override
  String serialize(Error value) {
    return '';
  }
}
