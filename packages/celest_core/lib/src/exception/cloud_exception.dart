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
  const factory CloudException.badRequest({
    String? message,
    int? code,
    JsonValue? details,
  }) = BadRequestException.of;

  /// {@macro celest_core.exception.unauthorized_exception}
  const factory CloudException.unauthorized({
    String? message,
    int? code,
    JsonValue? details,
  }) = UnauthorizedException.of;

  /// {@macro celest_core.exception.internal_server_error}
  factory CloudException.internalServerError({
    String? message,
    int? code,
    JsonValue? details,
  }) = InternalServerError.of;

  /// {@macro celest_core.exception.cancelled_exception}
  const factory CloudException.cancelled({
    String? message,
    int? code,
    JsonValue? details,
  }) = CancelledException.of;

  /// {@macro celest_core.exception.unknown_error}
  factory CloudException.unknownError({
    String? message,
    int? code,
    JsonValue? details,
  }) = UnknownError.of;

  /// {@macro celest_core.exception.not_found_exception}
  const factory CloudException.notFound({
    String? message,
    int? code,
    JsonValue? details,
  }) = NotFoundException.of;

  /// {@macro celest_core.exception.already_exists_exception}
  const factory CloudException.alreadyExists({
    String? message,
    int? code,
    JsonValue? details,
  }) = AlreadyExistsException.of;

  /// {@macro celest_core.exception.permission_denied_exception}
  const factory CloudException.permissionDenied({
    String? message,
    int? code,
    JsonValue? details,
  }) = PermissionDeniedException.of;

  /// {@macro celest_core.exception.resource_exhausted_exception}
  const factory CloudException.resourceExhausted({
    String? message,
    int? code,
    JsonValue? details,
  }) = ResourceExhaustedException.of;

  /// {@macro celest_core.exception.failed_precondition_exception}
  const factory CloudException.failedPrecondition({
    String? message,
    int? code,
    JsonValue? details,
  }) = FailedPreconditionException.of;

  /// {@macro celest_core.exception.aborted_exception}
  const factory CloudException.aborted({
    String? message,
    int? code,
    JsonValue? details,
  }) = AbortedException.of;

  /// {@macro celest_core.exception.out_of_range_exception}
  const factory CloudException.outOfRange({
    String? message,
    int? code,
    JsonValue? details,
  }) = OutOfRangeException.of;

  /// {@macro celest_core.exception.unimplemented_error}
  factory CloudException.unimplemented({
    String? message,
    int? code,
    JsonValue? details,
  }) = UnimplementedError.of;

  /// {@macro celest_core.exception.unavailable_error}
  factory CloudException.unavailable({
    String? message,
    int? code,
    JsonValue? details,
  }) = UnavailableError.of;

  /// {@macro celest_core.exception.data_loss_error}
  factory CloudException.dataLoss({
    String? message,
    int? code,
    JsonValue? details,
  }) = DataLossError.of;

  /// {@macro celest_core.exception.deadline_exceeded_error}
  factory CloudException.deadlineExceeded({
    String? message,
    int? code,
    JsonValue? details,
  }) = DeadlineExceededError.of;

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
      StatusCode.aborted => AbortedException.of(
          message: message,
          details: details,
          code: code,
        ),
      StatusCode.alreadyExists => AlreadyExistsException.of(
          message: message,
          details: details,
          code: code,
        ),
      StatusCode.cancelled => CancelledException.of(
          message: message,
          details: details,
          code: code,
        ),
      StatusCode.dataLoss => DataLossError.of(
          message: message,
          details: details,
          code: code,
        ),
      StatusCode.deadlineExceeded => DeadlineExceededError.of(
          message: message,
          details: details,
          code: code,
        ),
      StatusCode.failedPrecondition => FailedPreconditionException.of(
          message: message,
          details: details,
          code: code,
        ),
      StatusCode.internal => InternalServerError.of(
          message: message,
          details: details,
          code: code,
        ),
      StatusCode.invalidArgument => BadRequestException.of(
          message: message,
          details: details,
          code: code,
        ),
      StatusCode.notFound => NotFoundException.of(
          message: message,
          details: details,
          code: code,
        ),
      StatusCode.outOfRange => OutOfRangeException.of(
          message: message,
          details: details,
          code: code,
        ),
      StatusCode.permissionDenied => PermissionDeniedException.of(
          message: message,
          details: details,
          code: code,
        ),
      StatusCode.resourceExhausted => ResourceExhaustedException.of(
          message: message,
          details: details,
          code: code,
        ),
      StatusCode.unauthenticated => UnauthorizedException.of(
          message: message,
          details: details,
          code: code,
        ),
      StatusCode.unavailable => UnavailableError.of(
          message: message,
          details: details,
          code: code,
        ),
      StatusCode.unimplemented => UnimplementedError.of(
          message: message,
          details: details,
          code: code,
        ),
      _ => UnknownError.of(
          message: message,
          details: details,
          code: code,
        ),
    };
  }

  /// Creates a [CloudException] from the given JSON body.
  factory CloudException.fromJson(
    Map<String, Object?> json, {
    int? code,
  }) {
    return switch (json) {
      {
        '@status': {
          'code': final int code,
          'message': final String? message,
          'details': final JsonValue? details,
        },
      } ||
      {
        'code': final int code,
        'message': final String? message,
        'details': final JsonValue? details,
      } =>
        CloudException.http(
          code: code,
          message: message,
          details: details,
        ),
      _ => CloudException.http(
          code: code,
          message: json['message'] as String?,
          details: json as JsonMap,
        ),
    };
  }

  /// Creates a [CloudException] from the given HTTP [response].
  factory CloudException.fromHttpResponse(http.Response response) {
    try {
      final json = JsonUtf8.decodeMap(response.bodyBytes);
      return CloudException.fromJson(json);
    } on Object {
      return CloudException.http(
        code: response.statusCode,
        message: response.body,
      );
    }
  }

  /// Creates a [CloudException] from the given HTTP response parameters.
  factory CloudException.http({
    int? code,
    String? message,
    JsonValue? details,
  }) {
    return switch (code) {
      HttpStatus.badRequest ||
      StatusCode.invalidArgument =>
        BadRequestException.of(
          message: message,
          details: details,
          code: code,
        ),
      HttpStatus.unauthorized ||
      StatusCode.unauthenticated =>
        UnauthorizedException.of(
          message: message,
          details: details,
          code: code,
        ),
      HttpStatus.notFound || StatusCode.notFound => NotFoundException.of(
          message: message,
          details: details,
          code: code,
        ),
      HttpStatus.conflict ||
      StatusCode.alreadyExists =>
        AlreadyExistsException.of(
          message: message,
          details: details,
          code: code,
        ),
      HttpStatus.forbidden ||
      StatusCode.permissionDenied =>
        PermissionDeniedException.of(
          message: message,
          details: details,
          code: code,
        ),
      HttpStatus.tooManyRequests ||
      StatusCode.resourceExhausted =>
        ResourceExhaustedException.of(
          message: message,
          details: details,
          code: code,
        ),
      HttpStatus.preconditionFailed ||
      StatusCode.failedPrecondition =>
        FailedPreconditionException.of(
          message: message,
          details: details,
          code: code,
        ),
      HttpStatus.conflict || StatusCode.aborted => AbortedException.of(
          message: message,
          details: details,
          code: code,
        ),
      HttpStatus.requestedRangeNotSatisfiable ||
      StatusCode.outOfRange =>
        OutOfRangeException.of(
          message: message,
          details: details,
          code: code,
        ),
      HttpStatus.notImplemented ||
      StatusCode.unimplemented =>
        UnimplementedError.of(
          message: message,
          details: details,
          code: code,
        ),
      HttpStatus.internalServerError ||
      StatusCode.internal =>
        InternalServerError.of(
          message: message,
          details: details,
          code: code,
        ),
      HttpStatus.serviceUnavailable ||
      StatusCode.unavailable =>
        UnavailableError.of(
          message: message,
          details: details,
          code: code,
        ),
      _ => UnknownError.of(
          message: message,
          details: details,
          code: code,
        ),
    };
  }

  const CloudException.of();

  /// The type identifier of the exception.
  ///
  /// For example, `celest.core.v1.NotFoundException`.
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get type;

  /// The code associated with the exception.
  int get code;

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
  const CancelledException([String? message, JsonValue? details, int? code])
      : this.of(message: message, details: details, code: code);

  const CancelledException.of({
    String? message,
    int? code,
    this.details,
  })  : code = code ?? HttpStatus.clientClosedRequest,
        message = message ?? 'Cancelled';

  @override
  String get type => 'celest.core.v1.CancelledException';

  @override
  final int code;

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
  UnknownError([String? message, JsonValue? details, int? code])
      : this.of(message: message, details: details, code: code);

  UnknownError.of({
    String? message,
    int? code,
    this.details,
  })  : code = code ?? HttpStatus.internalServerError,
        message = message ?? 'Unknown error';

  @override
  String get type => 'celest.core.v1.UnknownError';

  @override
  final int code;

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
  const factory BadRequestException([
    String? message,
    JsonValue? details,
    int? code,
  ]) = _BadRequestException;

  const factory BadRequestException.of({
    String? message,
    int? code,
    JsonValue? details,
  }) = _BadRequestException.of;

  @protected
  const BadRequestException.base({
    String? message,
    int? code,
    this.details,
  })  : message = message ?? 'Bad request',
        code = code ?? HttpStatus.badRequest,
        super.of();

  @override
  String get type => 'celest.core.v1.BadRequestException';

  @override
  final int code;

  @override
  final String message;

  @override
  final JsonValue? details;
}

final class _BadRequestException extends BadRequestException {
  const _BadRequestException([String? message, JsonValue? details, int? code])
      : super.base(message: message);

  const _BadRequestException.of({
    super.message,
    super.code,
    super.details,
  }) : super.base();
}

/// {@template celest_core.exception.unauthorized_exception}
/// An exception thrown by a Cloud Function when a request is not authorized.
/// {@endtemplate}
@httpError(HttpStatus.unauthorized)
class UnauthorizedException with CloudException {
  /// Creates a [UnauthorizedException] with the given [message].
  ///
  /// {@macro celest_core.exception.unauthorized_exception}
  const UnauthorizedException([String? message, JsonValue? details, int? code])
      : this.of(message: message, details: details, code: code);

  const UnauthorizedException.of({
    String? message,
    int? code,
    this.details,
  })  : code = code ?? HttpStatus.unauthorized,
        message = message ?? 'Unauthorized';

  @override
  String get type => 'celest.core.v1.UnauthorizedException';

  @override
  final int code;

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
  const NotFoundException([String? message, JsonValue? details, int? code])
      : this.of(message: message, details: details, code: code);

  const NotFoundException.of({
    String? message,
    int? code,
    this.details,
  })  : code = code ?? HttpStatus.notFound,
        message = message ?? 'Not found';

  @override
  String get type => 'celest.core.v1.NotFoundException';

  @override
  final int code;

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
  const AlreadyExistsException([String? message, JsonValue? details, int? code])
      : this.of(message: message, details: details, code: code);

  const AlreadyExistsException.of({
    String? message,
    int? code,
    this.details,
  })  : code = code ?? HttpStatus.conflict,
        message = message ?? 'Already exists';

  @override
  String get type => 'celest.core.v1.AlreadyExistsException';

  @override
  final int code;

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
  const PermissionDeniedException([
    String? message,
    JsonValue? details,
    int? code,
  ]) : this.of(message: message, details: details, code: code);

  const PermissionDeniedException.of({
    String? message,
    int? code,
    this.details,
  })  : code = code ?? HttpStatus.forbidden,
        message = message ?? 'Permission denied';

  @override
  String get type => 'celest.core.v1.PermissionDeniedException';

  @override
  final int code;

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
  const ResourceExhaustedException([
    String? message,
    JsonValue? details,
    int? code,
  ]) : this.of(message: message, details: details, code: code);

  const ResourceExhaustedException.of({
    String? message,
    int? code,
    this.details,
  })  : code = code ?? HttpStatus.tooManyRequests,
        message = message ?? 'Resource exhausted';

  @override
  String get type => 'celest.core.v1.ResourceExhaustedException';

  @override
  final int code;

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
  const FailedPreconditionException([
    String? message,
    JsonValue? details,
    int? code,
  ]) : this.of(message: message, details: details, code: code);

  const FailedPreconditionException.of({
    String? message,
    int? code,
    this.details,
  })  : code = code ?? HttpStatus.preconditionFailed,
        message = message ?? 'Failed precondition';

  @override
  String get type => 'celest.core.v1.FailedPreconditionException';

  @override
  final int code;

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
  const AbortedException([String? message, JsonValue? details, int? code])
      : this.of(message: message, details: details, code: code);

  const AbortedException.of({
    String? message,
    int? code,
    this.details,
  })  : code = code ?? HttpStatus.conflict,
        message = message ?? 'Aborted';

  @override
  String get type => 'celest.core.v1.AbortedException';

  @override
  final int code;

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
  const OutOfRangeException([String? message, JsonValue? details, int? code])
      : this.of(message: message, details: details, code: code);

  const OutOfRangeException.of({
    String? message,
    int? code,
    this.details,
  })  : code = code ?? HttpStatus.requestedRangeNotSatisfiable,
        message = message ?? 'Out of range';

  @override
  String get type => 'celest.core.v1.OutOfRangeException';

  @override
  final int code;

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
  UnimplementedError([String? message, JsonValue? details, int? code])
      : this.of(message: message, details: details, code: code);

  UnimplementedError.of({
    String? message,
    int? code,
    this.details,
  })  : code = code ?? HttpStatus.notImplemented,
        super(message ?? 'Unimplemented');

  @override
  String get type => 'celest.core.v1.UnimplementedError';

  @override
  final int code;

  @override
  String get message => super.message!;

  @override
  final JsonValue? details;
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
  InternalServerError([String? message, JsonValue? details, int? code])
      : this.of(message: message, details: details, code: code);

  InternalServerError.of({
    String? message,
    int? code,
    this.details,
  })  : code = code ?? HttpStatus.internalServerError,
        message = message ?? 'Internal error';

  @override
  String get type => 'celest.core.v1.InternalServerError';

  @override
  final int code;

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
  UnavailableError([String? message, JsonValue? details, int? code])
      : this.of(message: message, details: details, code: code);

  UnavailableError.of({
    String? message,
    int? code,
    this.details,
  })  : code = code ?? HttpStatus.serviceUnavailable,
        message = message ?? 'Unavailable';

  @override
  String get type => 'celest.core.v1.UnavailableError';

  @override
  final int code;

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
  DataLossError([String? message, JsonValue? details, int? code])
      : this.of(message: message, details: details, code: code);

  DataLossError.of({
    String? message,
    int? code,
    this.details,
  })  : code = code ?? HttpStatus.internalServerError,
        message = message ?? 'Unrecoverable data loss';

  @override
  String get type => 'celest.core.v1.DataLossError';

  @override
  final int code;

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
  DeadlineExceededError([String? message, JsonValue? details, int? code])
      : this.of(message: message, details: details, code: code);

  DeadlineExceededError.of({
    String? message,
    int? code,
    this.details,
  })  : code = code ?? HttpStatus.gatewayTimeout,
        message = message ?? 'Deadline exceeded';

  @override
  String get type => 'celest.core.v1.DeadlineExceededError';

  @override
  final int code;

  @override
  final String message;

  @override
  final JsonValue? details;
}
