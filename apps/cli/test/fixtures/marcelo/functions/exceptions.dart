// ignore_for_file: deprecated_member_use_from_same_package

import 'package:_common/src/models/errors_and_exceptions.dart';
import 'package:celest_core/celest_core.dart';

void throwsUserException({
  JsonValue? cause,
}) {
  throw UserException('message', cause: cause);
}

void throwsAppError({
  String message = 'message',
  JsonValue? error,
}) {
  throw AppError(message, error);
}

// void throwsAppException() {
//   throw AppException('message');
// }

// void throwsNotYetImplementedError() {
//   throw NotYetImplementedError('message');
// }

// void throwsInterruptControlFlowException() {
//   throw InterruptControlFlowException();
// }

// void throwsValidateError() {
//   throw ValidateError('message');
// }

// void throwsUserException_ShowInConsole() {
//   throw UserException_ShowInConsole('message');
// }

void callsThrowsUserException({
  JsonValue? cause,
}) {
  throwsUserException(cause: cause);
}
