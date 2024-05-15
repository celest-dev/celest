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

  @override
  String toString() => 'BadRequestException: $message';
}

/// {@template celest_core.exception.unauthorized_exception}
/// An exception thrown by a Cloud Function when a request is not authorized.
/// {@endtemplate}
class UnauthorizedException implements CloudException {
  /// Creates a [UnauthorizedException] with the given [message].
  ///
  /// {@macro celest_core.exception.unauthorized_exception}
  const UnauthorizedException([this.message = 'Unauthorized']);

  @override
  final String message;

  @override
  String toString() => 'UnauthorizedException: $message';
}

/// {@macro celest_core.exception.internal_server_error}
@Deprecated('Use InternalServerError instead.')
typedef InternalServerException = InternalServerError;

/// {@template celest_core.exception.internal_server_error}
/// An exception thrown by a Cloud Function when an unrecoverable internal error
/// occurs.
/// {@endtemplate}
class InternalServerError extends Error implements CloudException {
  /// Creates a [InternalServerError] with the given [message].
  ///
  /// {@macro celest_core.exception.internal_server_error}
  InternalServerError(this.message);

  @override
  final String message;

  @override
  String toString() => 'InternalServerError: $message';
}
