import 'dart:core' as core show UnimplementedError;
import 'dart:core' hide UnimplementedError;

// Do not import the barrel files since we need to resolve this
// library early on in the CLI.
//
// Keep imports minimal in this file.
import 'package:celest_core/src/exception/celest_exception.dart';
import 'package:celest_core/src/http/http_error.dart';
import 'package:celest_core/src/http/http_status.dart';
import 'package:celest_core/src/serialization/json_value.dart';
import 'package:celest_core/src/util/json.dart';
import 'package:grpc/grpc_or_grpcweb.dart' show StatusCode, GrpcError;
import 'package:http/http.dart' as http show Response;
import 'package:json_annotation/json_annotation.dart' show JsonKey;
import 'package:meta/meta.dart';

/// An exception thrown by a Cloud Widget.
abstract mixin class CloudException implements CelestException {
  /// {@macro celest_core.exception.bad_request_exception}
  const factory CloudException.badRequest(
    String? message, {
    JsonValue? details,
  }) = BadRequestException;

  /// {@macro celest_core.exception.unauthorized_exception}
  const factory CloudException.unauthorized(
    String? message, {
    JsonValue? details,
  }) = UnauthorizedException;

  /// {@macro celest_core.exception.internal_server_error}
  factory CloudException.internalServerError(
    String? message, {
    JsonValue? details,
  }) = InternalServerError;

  /// {@macro celest_core.exception.cancelled_exception}
  const factory CloudException.cancelled(
    String? message, {
    JsonValue? details,
  }) = CancelledException;

  /// {@macro celest_core.exception.unknown_error}
  factory CloudException.unknownError(String? message, {JsonValue? details}) =
      UnknownError;

  /// {@macro celest_core.exception.not_found_exception}
  const factory CloudException.notFound(String? message, {JsonValue? details}) =
      NotFoundException;

  /// {@macro celest_core.exception.already_exists_exception}
  const factory CloudException.alreadyExists(
    String? message, {
    JsonValue? details,
  }) = AlreadyExistsException;

  /// {@macro celest_core.exception.permission_denied_exception}
  const factory CloudException.permissionDenied(
    String? message, {
    JsonValue? details,
  }) = PermissionDeniedException;

  /// {@macro celest_core.exception.resource_exhausted_exception}
  const factory CloudException.resourceExhausted(
    String? message, {
    JsonValue? details,
  }) = ResourceExhaustedException;

  /// {@macro celest_core.exception.failed_precondition_exception}
  const factory CloudException.failedPrecondition(
    String? message, {
    JsonValue? details,
  }) = FailedPreconditionException;

  /// {@macro celest_core.exception.aborted_exception}
  const factory CloudException.aborted(String? message, {JsonValue? details}) =
      AbortedException;

  /// {@macro celest_core.exception.out_of_range_exception}
  const factory CloudException.outOfRange(
    String? message, {
    JsonValue? details,
  }) = OutOfRangeException;

  /// {@macro celest_core.exception.unimplemented_error}
  factory CloudException.unimplemented([String? message]) = UnimplementedError;

  /// {@macro celest_core.exception.unavailable_error}
  factory CloudException.unavailable(String? message, {JsonValue? details}) =
      UnavailableError;

  /// {@macro celest_core.exception.data_loss_error}
  factory CloudException.dataLoss(String? message, {JsonValue? details}) =
      DataLossError;

  /// {@macro celest_core.exception.deadline_exceeded_error}
  factory CloudException.deadlineExceeded(
    String? message, {
    JsonValue? details,
  }) = DeadlineExceededError;

  /// Creates a [CloudException] from the given gRPC [error].
  factory CloudException.fromGrpcError(GrpcError error) {
    return CloudException.grpc(
      code: error.code,
      message: error.message,
      details: error.details
          ?.map((det) => det.writeToJsonMap() as JsonValue)
          .toList() as JsonList?,
    );
  }

  /// Creates a [CloudException] from the given gRPC status parameters.
  factory CloudException.grpc({
    required int code,
    String? message,
    JsonValue? details,
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
      StatusCode.unimplemented => UnimplementedError(message),
      _ => UnknownError(
          message,
          details: details,
        ),
    };
  }

  /// Creates a [CloudException] from the given JSON body.
  factory CloudException.fromJson(Map<String, Object?> json) {
    return switch (json) {
      {
        '@error': {
          'code': final String code,
          'status': final num status,
        },
        'message': final String message,
      } =>
        CloudException.http(
          status: status.toInt(),
          code: code,
          message: message,
          details: json['details'] as JsonValue?,
        ),
      _ => CloudException.http(
          message: json['message'] as String?,
          details: json['details'] as JsonValue?,
        ),
    };
  }

  /// Creates a [CloudException] from the given HTTP [response].
  factory CloudException.fromHttpResponse(http.Response response) {
    try {
      final json = JsonUtf8.decodeMap(response.bodyBytes);
      return CloudException.fromJson(json);
    } on Object {
      // OK
    }
    return CloudException.http(
      status: response.statusCode,
      message: response.body,
    );
  }

  /// Creates a [CloudException] from the given HTTP response parameters.
  factory CloudException.http({
    int? status,
    Object? code,
    String? message,
    JsonValue? details,
  }) {
    if (code is String) {
      return switch (code) {
        'celest.core.v1.BadRequestException' => BadRequestException(
            message,
            details: details,
          ),
        'celest.core.v1.UnauthorizedException' => UnauthorizedException(
            message,
            details: details,
          ),
        'celest.core.v1.NotFoundException' => NotFoundException(
            message,
            details: details,
          ),
        'celest.core.v1.AlreadyExistsException' => AlreadyExistsException(
            message,
            details: details,
          ),
        'celest.core.v1.PermissionDeniedException' => PermissionDeniedException(
            message,
            details: details,
          ),
        'celest.core.v1.ResourceExhaustedException' =>
          ResourceExhaustedException(
            message,
            details: details,
          ),
        'celest.core.v1.FailedPreconditionException' =>
          FailedPreconditionException(
            message,
            details: details,
          ),
        'celest.core.v1.AbortedException' => AbortedException(
            message,
            details: details,
          ),
        'celest.core.v1.OutOfRangeException' => OutOfRangeException(
            message,
            details: details,
          ),
        'celest.core.v1.UnimplementedError' => UnimplementedError(message),
        'celest.core.v1.InternalServerError' => InternalServerError(
            message,
            details: details,
          ),
        'celest.core.v1.UnavailableError' => UnavailableError(
            message,
            details: details,
          ),
        'celest.core.v1.DataLossError' => DataLossError(
            message,
            details: details,
          ),
        'celest.core.v1.DeadlineExceededError' => DeadlineExceededError(
            message,
            details: details,
          ),
        _ => UnknownError(
            message,
            details: details,
          ),
      };
    }
    return switch (code ?? status) {
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
        UnimplementedError(message),
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

  const CloudException._();

  /// The code identifying the exception.
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get code;

  /// The HTTP status associated with the exception.
  @JsonKey(includeFromJson: false, includeToJson: false)
  HttpStatus get httpStatus;

  @override
  String get message;

  /// Any details associated with the exception.
  JsonValue? get details;

  @override
  String toString() {
    final buf = StringBuffer('$runtimeType: $message');
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
@httpError(HttpStatus.clientClosedRequest)
class CancelledException with CloudException {
  /// Creates a [CancelledException] with the given [message].
  ///
  /// {@macro celest_core.exception.cancelled_exception}
  const CancelledException(String? message, {this.details})
      : message = message ?? 'Cancelled';

  @override
  String get code => 'celest.core.v1.CancelledException';

  @override
  HttpStatus get httpStatus => HttpStatus.clientClosedRequest;

  @override
  final String message;

  @override
  final JsonValue? details;
}

/// {@template celest_core.exception.unknown_error}
/// An exception thrown by a Cloud Function when an unknown error occurs.
/// {@endtemplate}
@httpError(HttpStatus.internalServerError)
class UnknownError extends Error with CloudException {
  /// Creates a [UnknownError] with the given [message].
  ///
  /// {@macro celest_core.exception.unknown_error}
  UnknownError(String? message, {this.details})
      : message = message ?? 'Unknown error';

  @override
  String get code => 'celest.core.v1.UnknownError';

  @override
  HttpStatus get httpStatus => HttpStatus.internalServerError;

  @override
  final String message;

  @override
  final JsonValue? details;
}

/// {@template celest_core.exception.bad_request_exception}
/// An exception thrown by a Cloud Function when a request contains invalid
/// data or otherwise lead to a recoverable exception.
/// {@endtemplate}
@httpError(HttpStatus.badRequest)
abstract base class BadRequestException extends CloudException {
  /// Creates a [BadRequestException] with the given [message].
  ///
  /// {@macro celest_core.exception.bad_request_exception}
  const factory BadRequestException(String? message, {JsonValue? details}) =
      _BadRequestException;

  @protected
  const BadRequestException.base(
    this.message, {
    this.details,
  }) : super._();

  @override
  String get code => 'celest.core.v1.BadRequestException';

  @override
  HttpStatus get httpStatus => HttpStatus.badRequest;

  @override
  final String message;

  @override
  final JsonValue? details;
}

final class _BadRequestException extends BadRequestException {
  const _BadRequestException(String? message, {super.details})
      : super.base(message ?? 'Bad request');
}

/// {@template celest_core.exception.unauthorized_exception}
/// An exception thrown by a Cloud Function when a request is not authorized.
/// {@endtemplate}
@httpError(HttpStatus.unauthorized)
class UnauthorizedException with CloudException {
  /// Creates a [UnauthorizedException] with the given [message].
  ///
  /// {@macro celest_core.exception.unauthorized_exception}
  const UnauthorizedException(String? message, {this.details})
      : message = message ?? 'Unauthorized';

  @override
  String get code => 'celest.core.v1.UnauthorizedException';

  @override
  HttpStatus get httpStatus => HttpStatus.unauthorized;

  @override
  final String message;

  @override
  final JsonValue? details;
}

/// {@template celest_core.exception.not_found_exception}
/// An exception thrown by a Cloud Function when a requested resource is not
/// found.
/// {@endtemplate}
@httpError(HttpStatus.notFound)
class NotFoundException with CloudException {
  /// Creates a [NotFoundException] with the given [message].
  ///
  /// {@macro celest_core.exception.not_found_exception}
  const NotFoundException(String? message, {this.details})
      : message = message ?? 'Not found';

  @override
  String get code => 'celest.core.v1.NotFoundException';

  @override
  HttpStatus get httpStatus => HttpStatus.notFound;

  @override
  final String message;

  @override
  final JsonValue? details;
}

/// {@template celest_core.exception.already_exists_exception}
/// An exception thrown by a Cloud Function when a resource already exists.
/// {@endtemplate}
@httpError(HttpStatus.conflict)
class AlreadyExistsException with CloudException {
  /// Creates a [AlreadyExistsException] with the given [message].
  ///
  /// {@macro celest_core.exception.already_exists_exception}
  const AlreadyExistsException(String? message, {this.details})
      : message = message ?? 'Already exists';

  @override
  String get code => 'celest.core.v1.AlreadyExistsException';

  @override
  HttpStatus get httpStatus => HttpStatus.conflict;

  @override
  final String message;

  @override
  final JsonValue? details;
}

/// {@template celest_core.exception.permission_denied_exception}
/// An exception thrown by a Cloud Function when a request is not authorized due
/// to insufficient permissions.
/// {@endtemplate}
@httpError(HttpStatus.forbidden)
class PermissionDeniedException with CloudException {
  /// Creates a [PermissionDeniedException] with the given [message].
  ///
  /// {@macro celest_core.exception.permission_denied_exception}
  const PermissionDeniedException(String? message, {this.details})
      : message = message ?? 'Permission denied';

  @override
  String get code => 'celest.core.v1.PermissionDeniedException';

  @override
  HttpStatus get httpStatus => HttpStatus.forbidden;

  @override
  final String message;

  @override
  final JsonValue? details;
}

/// {@template celest_core.exception.resource_exhausted_exception}
/// An exception thrown by a Cloud Function when a resource has been exhausted.
/// {@endtemplate}
@httpError(HttpStatus.tooManyRequests)
class ResourceExhaustedException with CloudException {
  /// Creates a [ResourceExhaustedException] with the given [message].
  ///
  /// {@macro celest_core.exception.resource_exhausted_exception}
  const ResourceExhaustedException(String? message, {this.details})
      : message = message ?? 'Resource exhausted';

  @override
  String get code => 'celest.core.v1.ResourceExhaustedException';

  @override
  HttpStatus get httpStatus => HttpStatus.tooManyRequests;

  @override
  final String message;

  @override
  final JsonValue? details;
}

/// {@template celest_core.exception.failed_precondition_exception}
/// An exception thrown by a Cloud Function when a request is not authorized due
/// to a failed precondition.
/// {@endtemplate}
@httpError(HttpStatus.preconditionFailed)
class FailedPreconditionException with CloudException {
  /// Creates a [FailedPreconditionException] with the given [message].
  ///
  /// {@macro celest_core.exception.failed_precondition_exception}
  const FailedPreconditionException(String? message, {this.details})
      : message = message ?? 'Failed precondition';

  @override
  String get code => 'celest.core.v1.FailedPreconditionException';

  @override
  HttpStatus get httpStatus => HttpStatus.preconditionFailed;

  @override
  final String message;

  @override
  final JsonValue? details;
}

/// {@template celest_core.exception.aborted_exception}
/// An exception thrown by a Cloud Function when a request is aborted.
/// {@endtemplate}
@httpError(HttpStatus.conflict)
class AbortedException with CloudException {
  /// Creates a [AbortedException] with the given [message].
  ///
  /// {@macro celest_core.exception.aborted_exception}
  const AbortedException(String? message, {this.details})
      : message = message ?? 'Aborted';

  @override
  String get code => 'celest.core.v1.AbortedException';

  @override
  HttpStatus get httpStatus => HttpStatus.conflict;

  @override
  final String message;

  @override
  final JsonValue? details;
}

/// {@template celest_core.exception.out_of_range_exception}
/// An exception thrown by a Cloud Function when a request is out of range.
/// {@endtemplate}
@httpError(HttpStatus.requestedRangeNotSatisfiable)
class OutOfRangeException with CloudException {
  /// Creates a [OutOfRangeException] with the given [message].
  ///
  /// {@macro celest_core.exception.out_of_range_exception}
  const OutOfRangeException(String? message, {this.details})
      : message = message ?? 'Out of range';

  @override
  String get code => 'celest.core.v1.OutOfRangeException';

  @override
  HttpStatus get httpStatus => HttpStatus.requestedRangeNotSatisfiable;

  @override
  final String message;

  @override
  final JsonValue? details;
}

/// {@template celest_core.exception.unimplemented_error}
/// An exception thrown by a Cloud Function when a request is not implemented.
/// {@endtemplate}
@httpError(HttpStatus.notImplemented)
class UnimplementedError extends core.UnimplementedError with CloudException {
  /// Creates a [UnimplementedError] with the given [message].
  ///
  /// {@macro celest_core.exception.unimplemented_error}
  UnimplementedError([String? message]) : super(message ?? 'Unimplemented');

  @override
  String get code => 'celest.core.v1.UnimplementedError';

  @override
  HttpStatus get httpStatus => HttpStatus.notImplemented;

  @override
  String get message => super.message!;

  @override
  JsonValue? get details => null;
}

/// {@template celest_core.exception.internal_server_error}
/// An exception thrown by a Cloud Function when an unrecoverable internal error
/// occurs.
/// {@endtemplate}
@httpError(HttpStatus.internalServerError)
class InternalServerError extends Error with CloudException {
  /// Creates a [InternalServerError] with the given [message].
  ///
  /// {@macro celest_core.exception.internal_server_error}
  InternalServerError(String? message, {this.details})
      : message = message ?? 'Internal error';

  @override
  String get code => 'celest.core.v1.InternalServerError';

  @override
  HttpStatus get httpStatus => HttpStatus.internalServerError;

  @override
  final String message;

  @override
  final JsonValue? details;
}

/// {@template celest_core.exception.unavailable_error}
/// An exception thrown by a Cloud Function when a resource is unavailable.
/// {@endtemplate}
@httpError(HttpStatus.serviceUnavailable)
class UnavailableError extends Error with CloudException {
  /// Creates a [UnavailableError] with the given [message].
  ///
  /// {@macro celest_core.exception.unavailable_error}
  UnavailableError(String? message, {this.details})
      : message = message ?? 'Unavailable';

  @override
  String get code => 'celest.core.v1.UnavailableError';

  @override
  HttpStatus get httpStatus => HttpStatus.serviceUnavailable;

  @override
  final String message;

  @override
  final JsonValue? details;
}

/// {@template celest_core.exception.data_loss_error}
/// Unrecoverable data loss or corruption.
/// {@endtemplate}
@httpError(HttpStatus.internalServerError)
class DataLossError extends Error with CloudException {
  /// Creates a [DataLossError] with the given [message].
  ///
  /// {@macro celest_core.exception.data_loss_error}
  DataLossError(String? message, {this.details})
      : message = message ?? 'Unrecoverable data loss';

  @override
  String get code => 'celest.core.v1.DataLossError';

  @override
  HttpStatus get httpStatus => HttpStatus.internalServerError;

  @override
  final String message;

  @override
  final JsonValue? details;
}

/// {@template celest_core.exception.deadline_exceeded_error}
/// An exception thrown by a Cloud Function when a request deadline is exceeded.
/// {@endtemplate}
@httpError(HttpStatus.gatewayTimeout)
class DeadlineExceededError extends Error with CloudException {
  /// Creates a [DeadlineExceededError] with the given [message].
  ///
  /// {@macro celest_core.exception.deadline_exceeded_error}
  DeadlineExceededError(String? message, {this.details})
      : message = message ?? 'Deadline exceeded';

  @override
  String get code => 'celest.core.v1.DeadlineExceededError';

  @override
  HttpStatus get httpStatus => HttpStatus.gatewayTimeout;

  @override
  final String message;

  @override
  final JsonValue? details;
}
