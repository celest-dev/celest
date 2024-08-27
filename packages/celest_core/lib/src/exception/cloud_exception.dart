import 'dart:core' as core show UnimplementedError;
import 'dart:core' hide UnimplementedError;

import 'package:celest_core/_internal.dart';
import 'package:celest_core/celest_core.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:http/http.dart' as http;

/// An exception thrown by a Cloud Widget.
abstract mixin class CloudException implements CelestException {
  /// {@macro celest_core.exception.bad_request_exception}
  const factory CloudException.badRequest(String? message, {Object? details}) =
      BadRequestException;

  /// {@macro celest_core.exception.unauthorized_exception}
  const factory CloudException.unauthorized(String? message,
      {Object? details}) = UnauthorizedException;

  /// {@macro celest_core.exception.internal_server_error}
  factory CloudException.internalServerError(String? message,
      {Object? details}) = InternalServerError;

  /// {@macro celest_core.exception.cancelled_exception}
  const factory CloudException.cancelled(String? message, {Object? details}) =
      CancelledException;

  /// {@macro celest_core.exception.unknown_error}
  factory CloudException.unknownError(String? message, {Object? details}) =
      UnknownError;

  /// {@macro celest_core.exception.not_found_exception}
  const factory CloudException.notFound(String? message, {Object? details}) =
      NotFoundException;

  /// {@macro celest_core.exception.already_exists_exception}
  const factory CloudException.alreadyExists(String? message,
      {Object? details}) = AlreadyExistsException;

  /// {@macro celest_core.exception.permission_denied_exception}
  const factory CloudException.permissionDenied(String? message,
      {Object? details}) = PermissionDeniedException;

  /// {@macro celest_core.exception.resource_exhausted_exception}
  const factory CloudException.resourceExhausted(String? message,
      {Object? details}) = ResourceExhaustedException;

  /// {@macro celest_core.exception.failed_precondition_exception}
  const factory CloudException.failedPrecondition(String? message,
      {Object? details}) = FailedPreconditionException;

  /// {@macro celest_core.exception.aborted_exception}
  const factory CloudException.aborted(String? message, {Object? details}) =
      AbortedException;

  /// {@macro celest_core.exception.out_of_range_exception}
  const factory CloudException.outOfRange(String? message, {Object? details}) =
      OutOfRangeException;

  /// {@macro celest_core.exception.unimplemented_error}
  factory CloudException.unimplemented(String? message, {Object? details}) =
      UnimplementedError;

  /// {@macro celest_core.exception.unavailable_error}
  factory CloudException.unavailable(String? message, {Object? details}) =
      UnavailableError;

  /// {@macro celest_core.exception.data_loss_error}
  factory CloudException.dataLoss(String? message, {Object? details}) =
      DataLossError;

  /// {@macro celest_core.exception.deadline_exceeded_error}
  factory CloudException.deadlineExceeded(String? message, {Object? details}) =
      DeadlineExceededError;

  /// Creates a [CloudException] from the given gRPC [error].
  factory CloudException.fromGrpcError(GrpcError error) {
    return CloudException.grpc(
      code: error.code,
      message: error.message,
      details: error.details,
    );
  }

  /// Creates a [CloudException] from the given gRPC status parameters.
  factory CloudException.grpc({
    required int code,
    String? message,
    Object? details,
  }) {
    return switch (code) {
      StatusCode.aborted => AbortedException(
          message,
          details: details,
        ),
      StatusCode.alreadyExists => AlreadyExistsException(
          message,
          details: details,
        ),
      StatusCode.cancelled => CancelledException(
          message,
          details: details,
        ),
      StatusCode.dataLoss => DataLossError(
          message,
          details: details,
        ),
      StatusCode.deadlineExceeded => DeadlineExceededError(
          message,
          details: details,
        ),
      StatusCode.failedPrecondition => FailedPreconditionException(
          message,
          details: details,
        ),
      StatusCode.internal => InternalServerError(
          message,
          details: details,
        ),
      StatusCode.invalidArgument => BadRequestException(
          message,
          details: details,
        ),
      StatusCode.notFound => NotFoundException(
          message,
          details: details,
        ),
      StatusCode.outOfRange => OutOfRangeException(
          message,
          details: details,
        ),
      StatusCode.permissionDenied => PermissionDeniedException(
          message,
          details: details,
        ),
      StatusCode.resourceExhausted => ResourceExhaustedException(
          message,
          details: details,
        ),
      StatusCode.unauthenticated => UnauthorizedException(
          message,
          details: details,
        ),
      StatusCode.unavailable => UnavailableError(
          message,
          details: details,
        ),
      StatusCode.unimplemented => UnimplementedError(
          message,
          details: details,
        ),
      _ => UnknownError(
          message,
          details: details,
        ),
    };
  }

  /// Creates a [CloudException] from the given HTTP [response].
  factory CloudException.fromHttpResponse(http.Response response) {
    return CloudException.http(
      statusCode: response.statusCode,
      body: response.bodyBytes,
    );
  }

  /// Creates a [CloudException] from the given HTTP response parameters.
  factory CloudException.http({
    int? statusCode,
    Object? body,
  }) {
    Object? code;
    String? message;
    Object? details = body;
    try {
      final json = JsonUtf8.decodeAny(body);
      final error = json['error'] as Map?;
      code = error?['code'];
      message = error?['message'] as String?;
      details = error?['details'];
    } on Object {
      // OK
    }
    if (code is String) {
      return switch (code) {
        'BadRequestException' => BadRequestException(
            message,
            details: details,
          ),
        'UnauthorizedException' => UnauthorizedException(
            message,
            details: details,
          ),
        'NotFoundException' => NotFoundException(
            message,
            details: details,
          ),
        'AlreadyExistsException' => AlreadyExistsException(
            message,
            details: details,
          ),
        'PermissionDeniedException' => PermissionDeniedException(
            message,
            details: details,
          ),
        'ResourceExhaustedException' => ResourceExhaustedException(
            message,
            details: details,
          ),
        'FailedPreconditionException' => FailedPreconditionException(
            message,
            details: details,
          ),
        'AbortedException' => AbortedException(
            message,
            details: details,
          ),
        'OutOfRangeException' => OutOfRangeException(
            message,
            details: details,
          ),
        'UnimplementedError' => UnimplementedError(
            message,
            details: details,
          ),
        'InternalServerError' => InternalServerError(
            message,
            details: details,
          ),
        'UnavailableError' => UnavailableError(
            message,
            details: details,
          ),
        'DataLossError' => DataLossError(
            message,
            details: details,
          ),
        'DeadlineExceededError' => DeadlineExceededError(
            message,
            details: details,
          ),
        _ => UnknownError(
            message,
            details: details,
          ),
      };
    }
    return switch (code ?? statusCode) {
      HttpStatus.badRequest ||
      StatusCode.invalidArgument =>
        BadRequestException(
          message,
          details: details,
        ),
      HttpStatus.unauthorized ||
      StatusCode.unauthenticated =>
        UnauthorizedException(
          message,
          details: details,
        ),
      HttpStatus.notFound || StatusCode.notFound => NotFoundException(
          message,
          details: details,
        ),
      HttpStatus.conflict || StatusCode.alreadyExists => AlreadyExistsException(
          message,
          details: details,
        ),
      HttpStatus.forbidden ||
      StatusCode.permissionDenied =>
        PermissionDeniedException(
          message,
          details: details,
        ),
      HttpStatus.tooManyRequests ||
      StatusCode.resourceExhausted =>
        ResourceExhaustedException(
          message,
          details: details,
        ),
      HttpStatus.preconditionFailed ||
      StatusCode.failedPrecondition =>
        FailedPreconditionException(
          message,
          details: details,
        ),
      HttpStatus.conflict || StatusCode.aborted => AbortedException(
          message,
          details: details,
        ),
      HttpStatus.requestedRangeNotSatisfiable ||
      StatusCode.outOfRange =>
        OutOfRangeException(
          message,
          details: details,
        ),
      HttpStatus.notImplemented ||
      StatusCode.unimplemented =>
        UnimplementedError(
          message,
          details: details,
        ),
      HttpStatus.internalServerError ||
      StatusCode.internal =>
        InternalServerError(
          message,
          details: details,
        ),
      HttpStatus.serviceUnavailable ||
      StatusCode.unavailable =>
        UnavailableError(
          message,
          details: details,
        ),
      _ => UnknownError(
          message,
          details: details,
        ),
    };
  }

  /// The exception code.
  String get code;

  /// The gRPC status code associated with this exception.
  int get grpcStatus;

  /// The HTTP status code associated with this exception.
  int get httpStatus;

  /// Any details associated with the exception.
  Object? get details;

  @override
  String toString() {
    final buf = StringBuffer('$code: $message');
    if (details != null) {
      if (!message.endsWith('.')) {
        buf.write('.');
      }
      buf.write(' Details: $details');
    }
    return buf.toString();
  }
}

/// {@template celest_core.exception.cancelled_exception}
/// An exception thrown by a Cloud Function when a request is cancelled.
/// {@endtemplate}
class CancelledException with CloudException {
  /// Creates a [CancelledException] with the given [message].
  ///
  /// {@macro celest_core.exception.cancelled_exception}
  const CancelledException(String? message, {this.details})
      : message = message ?? 'Cancelled';

  @override
  final String message;

  @override
  String get code => 'CancelledException';

  @override
  int get grpcStatus => StatusCode.cancelled;

  @override
  int get httpStatus => HttpStatus.clientClosedRequest;

  @override
  final Object? details;
}

/// {@template celest_core.exception.unknown_error}
/// An exception thrown by a Cloud Function when an unknown error occurs.
/// {@endtemplate}
class UnknownError extends Error with CloudException {
  /// Creates a [UnknownError] with the given [message].
  ///
  /// {@macro celest_core.exception.unknown_error}
  UnknownError(String? message, {this.details})
      : message = message ?? 'Unknown error';

  @override
  final String message;

  @override
  String get code => 'UnknownError';

  @override
  int get grpcStatus => StatusCode.unknown;

  @override
  int get httpStatus => HttpStatus.internalServerError;

  @override
  final Object? details;
}

/// {@template celest_core.exception.bad_request_exception}
/// An exception thrown by a Cloud Function when a request contains invalid
/// data or otherwise lead to a recoverable exception.
/// {@endtemplate}
abstract mixin class BadRequestException implements CloudException {
  /// Creates a [BadRequestException] with the given [message].
  ///
  /// {@macro celest_core.exception.bad_request_exception}
  const factory BadRequestException(String? message, {Object? details}) =
      _BadRequestException;

  @override
  String get code => 'BadRequestException';

  @override
  int get grpcStatus => StatusCode.invalidArgument;

  @override
  int get httpStatus => HttpStatus.badRequest;
}

final class _BadRequestException with CloudException, BadRequestException {
  const _BadRequestException(String? message, {this.details})
      : message = message ?? 'Bad request';

  @override
  final String message;

  @override
  final Object? details;
}

/// {@template celest_core.exception.unauthorized_exception}
/// An exception thrown by a Cloud Function when a request is not authorized.
/// {@endtemplate}
class UnauthorizedException with CloudException {
  /// Creates a [UnauthorizedException] with the given [message].
  ///
  /// {@macro celest_core.exception.unauthorized_exception}
  const UnauthorizedException(String? message, {this.details})
      : message = message ?? 'Unauthorized';

  @override
  final String message;

  @override
  String get code => 'UnauthorizedException';

  @override
  int get grpcStatus => StatusCode.unauthenticated;

  @override
  int get httpStatus => HttpStatus.unauthorized;

  @override
  final Object? details;
}

/// {@template celest_core.exception.not_found_exception}
/// An exception thrown by a Cloud Function when a requested resource is not
/// found.
/// {@endtemplate}
class NotFoundException with CloudException {
  /// Creates a [NotFoundException] with the given [message].
  ///
  /// {@macro celest_core.exception.not_found_exception}
  const NotFoundException(String? message, {this.details})
      : message = message ?? 'Not found';

  @override
  final String message;

  @override
  String get code => 'NotFoundException';

  @override
  int get grpcStatus => StatusCode.notFound;

  @override
  int get httpStatus => HttpStatus.notFound;

  @override
  final Object? details;
}

/// {@template celest_core.exception.already_exists_exception}
/// An exception thrown by a Cloud Function when a resource already exists.
/// {@endtemplate}
class AlreadyExistsException with CloudException {
  /// Creates a [AlreadyExistsException] with the given [message].
  ///
  /// {@macro celest_core.exception.already_exists_exception}
  const AlreadyExistsException(String? message, {this.details})
      : message = message ?? 'Already exists';

  @override
  final String message;

  @override
  String get code => 'AlreadyExistsException';

  @override
  int get grpcStatus => StatusCode.alreadyExists;

  @override
  int get httpStatus => HttpStatus.conflict;

  @override
  final Object? details;
}

/// {@template celest_core.exception.permission_denied_exception}
/// An exception thrown by a Cloud Function when a request is not authorized due
/// to insufficient permissions.
/// {@endtemplate}
class PermissionDeniedException with CloudException {
  /// Creates a [PermissionDeniedException] with the given [message].
  ///
  /// {@macro celest_core.exception.permission_denied_exception}
  const PermissionDeniedException(String? message, {this.details})
      : message = message ?? 'Permission denied';

  @override
  final String message;

  @override
  String get code => 'PermissionDeniedException';

  @override
  int get grpcStatus => StatusCode.permissionDenied;

  @override
  int get httpStatus => HttpStatus.forbidden;

  @override
  final Object? details;
}

/// {@template celest_core.exception.resource_exhausted_exception}
/// An exception thrown by a Cloud Function when a resource has been exhausted.
/// {@endtemplate}
class ResourceExhaustedException with CloudException {
  /// Creates a [ResourceExhaustedException] with the given [message].
  ///
  /// {@macro celest_core.exception.resource_exhausted_exception}
  const ResourceExhaustedException(String? message, {this.details})
      : message = message ?? 'Resource exhausted';

  @override
  final String message;

  @override
  String get code => 'ResourceExhaustedException';

  @override
  int get grpcStatus => StatusCode.resourceExhausted;

  @override
  int get httpStatus => HttpStatus.tooManyRequests;

  @override
  final Object? details;
}

/// {@template celest_core.exception.failed_precondition_exception}
/// An exception thrown by a Cloud Function when a request is not authorized due
/// to a failed precondition.
/// {@endtemplate}
class FailedPreconditionException with CloudException {
  /// Creates a [FailedPreconditionException] with the given [message].
  ///
  /// {@macro celest_core.exception.failed_precondition_exception}
  const FailedPreconditionException(String? message, {this.details})
      : message = message ?? 'Failed precondition';

  @override
  final String message;

  @override
  String get code => 'FailedPreconditionException';

  @override
  int get grpcStatus => StatusCode.failedPrecondition;

  @override
  int get httpStatus => HttpStatus.preconditionFailed;

  @override
  final Object? details;
}

/// {@template celest_core.exception.aborted_exception}
/// An exception thrown by a Cloud Function when a request is aborted.
/// {@endtemplate}
class AbortedException with CloudException {
  /// Creates a [AbortedException] with the given [message].
  ///
  /// {@macro celest_core.exception.aborted_exception}
  const AbortedException(String? message, {this.details})
      : message = message ?? 'Aborted';

  @override
  final String message;

  @override
  String get code => 'AbortedException';

  @override
  int get grpcStatus => StatusCode.aborted;

  @override
  int get httpStatus => HttpStatus.conflict;

  @override
  final Object? details;
}

/// {@template celest_core.exception.out_of_range_exception}
/// An exception thrown by a Cloud Function when a request is out of range.
/// {@endtemplate}
class OutOfRangeException with CloudException {
  /// Creates a [OutOfRangeException] with the given [message].
  ///
  /// {@macro celest_core.exception.out_of_range_exception}
  const OutOfRangeException(String? message, {this.details})
      : message = message ?? 'Out of range';

  @override
  final String message;

  @override
  String get code => 'OutOfRangeException';

  @override
  int get grpcStatus => StatusCode.outOfRange;

  @override
  int get httpStatus => HttpStatus.requestedRangeNotSatisfiable;

  @override
  final Object? details;
}

/// {@template celest_core.exception.unimplemented_error}
/// An exception thrown by a Cloud Function when a request is not implemented.
/// {@endtemplate}
class UnimplementedError extends core.UnimplementedError with CloudException {
  /// Creates a [UnimplementedError] with the given [message].
  ///
  /// {@macro celest_core.exception.unimplemented_error}
  UnimplementedError(String? message, {this.details})
      : super(message ?? 'Unimplemented');

  @override
  String get message => super.message!;

  @override
  String get code => 'UnimplementedError';

  @override
  int get grpcStatus => StatusCode.unimplemented;

  @override
  int get httpStatus => HttpStatus.notImplemented;

  @override
  final Object? details;
}

/// {@template celest_core.exception.internal_server_error}
/// An exception thrown by a Cloud Function when an unrecoverable internal error
/// occurs.
/// {@endtemplate}
class InternalServerError extends Error with CloudException {
  /// Creates a [InternalServerError] with the given [message].
  ///
  /// {@macro celest_core.exception.internal_server_error}
  InternalServerError(String? message, {this.details})
      : message = message ?? 'Internal error';

  @override
  final String message;

  @override
  String get code => 'InternalServerError';

  @override
  int get grpcStatus => StatusCode.internal;

  @override
  int get httpStatus => HttpStatus.internalServerError;

  @override
  final Object? details;
}

/// {@template celest_core.exception.unavailable_error}
/// An exception thrown by a Cloud Function when a resource is unavailable.
/// {@endtemplate}
class UnavailableError extends Error with CloudException {
  /// Creates a [UnavailableError] with the given [message].
  ///
  /// {@macro celest_core.exception.unavailable_error}
  UnavailableError(String? message, {this.details})
      : message = message ?? 'Unavailable';

  @override
  final String message;

  @override
  String get code => 'UnavailableError';

  @override
  int get grpcStatus => StatusCode.unavailable;

  @override
  int get httpStatus => HttpStatus.serviceUnavailable;

  @override
  final Object? details;
}

/// {@template celest_core.exception.data_loss_error}
/// Unrecoverable data loss or corruption.
/// {@endtemplate}
class DataLossError extends Error with CloudException {
  /// Creates a [DataLossError] with the given [message].
  ///
  /// {@macro celest_core.exception.data_loss_error}
  DataLossError(String? message, {this.details})
      : message = message ?? 'Unrecoverable data loss';

  @override
  final String message;

  @override
  String get code => 'DataLossError';

  @override
  int get grpcStatus => StatusCode.dataLoss;

  @override
  int get httpStatus => HttpStatus.internalServerError;

  @override
  final Object? details;
}

/// {@template celest_core.exception.deadline_exceeded_error}
/// An exception thrown by a Cloud Function when a request deadline is exceeded.
/// {@endtemplate}
class DeadlineExceededError extends Error with CloudException {
  /// Creates a [DeadlineExceededError] with the given [message].
  ///
  /// {@macro celest_core.exception.deadline_exceeded_error}
  DeadlineExceededError(String? message, {this.details})
      : message = message ?? 'Deadline exceeded';

  @override
  final String message;

  @override
  String get code => 'DeadlineExceededError';

  @override
  int get grpcStatus => StatusCode.deadlineExceeded;

  @override
  int get httpStatus => HttpStatus.gatewayTimeout;

  @override
  final Object? details;
}
