import 'package:celest_core/celest_core.dart';

/// An exception thrown by a Cloud Widget.
sealed class CloudException implements CelestException {}

/// {@template celest_core.exception.bad_request_exception}
/// An exception thrown by a Cloud Function when a request contains invalid
/// data or otherwise lead to a recoverable exception.
/// {@endtemplate}
class BadRequestException implements CloudException {
  /// Creates a [BadRequestException] with the given [message].
  ///
  /// {@macro celest_core_exception_bad_request_exception}
  const BadRequestException(this.message);

  @override
  final String message;
}

/// {@template celest_core.exception.internal_server_exception}
/// An exception thrown by a Cloud Function when an unrecoverable internal error
/// occurs.
/// {@endtemplate}
final class InternalServerException implements CloudException {
  /// Creates a [InternalServerException] with the given [message].
  ///
  /// {@macro celest_core_exception_internal_server_exception}
  const InternalServerException(this.message);

  @override
  final String message;
}
