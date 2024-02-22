// ignore_for_file: deprecated_member_use_from_same_package

import 'package:_common/src/models/errors_and_exceptions.dart';
import 'package:celest_backend/exceptions/overrides.dart' as override;
import 'package:celest_core/celest_core.dart';

void throwsUserException({
  JsonValue? cause,
}) {
  throw UserException('message', cause: cause);
}

void callsThrowsUserException({
  JsonValue? cause,
}) {
  throwsUserException(cause: cause);
}

void throwsAppError({
  String message = 'message',
  JsonValue? error,
}) {
  throw AppError(message, error);
}

void throwsAppException() {
  throw override.AppException(AppException('message', 'error'));
}

void throwsNotYetImplementedError() {
  throw NotYetImplementedError('message');
}

void throwsValidateError() {
  throw ValidateError('message');
}

void throwsUserException_ShowInConsole({
  String message = 'message',
  JsonValue? cause,
}) {
  throw UserException_ShowInConsole(message, cause: cause);
}
