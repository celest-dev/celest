// ignore_for_file: deprecated_member_use_from_same_package

import 'package:_common/src/models/errors_and_exceptions.dart';
import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions/overrides.dart' as override;

@cloud
void throwsUserException({
  JsonValue? cause,
}) {
  throw UserException('message', cause: cause);
}

@cloud
void callsThrowsUserException({
  JsonValue? cause,
}) {
  throwsUserException(cause: cause);
}

@cloud
void throwsAppError({
  String message = 'message',
  JsonValue? error,
}) {
  throw AppError(message, error);
}

@cloud
void throwsAppException() {
  throw override.AppException(AppException('message', 'error'));
}

@cloud
void throwsNotYetImplementedError() {
  throw NotYetImplementedError('message');
}

@cloud
void throwsValidateError() {
  throw ValidateError('message');
}

@cloud
void throwsUserException_ShowInConsole({
  String message = 'message',
  JsonValue? cause,
}) {
  throw UserException_ShowInConsole(message, cause: cause);
}
