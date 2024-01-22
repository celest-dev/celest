import 'package:celest_backend/exceptions.dart';
import 'package:celest_backend/models.dart';

void throwsException({
  required SupportedExceptionType type,
}) {
  switch (type) {
    case SupportedExceptionType.Exception:
      throw Exception('Something bad happened');
    case SupportedExceptionType.FormatException:
      throw FormatException('Bad format');
  }
}

void throwsError({
  required SupportedErrorType type,
}) {
  switch (type) {
    case SupportedErrorType.Error:
      throw Error();
    case SupportedErrorType.ArgumentError:
      throw ArgumentError('Bad argument', 'someArg');
  }
}

void throwsCustomException() {
  throw CustomException();
}

void throwsCustomExceptionToFromJson() {
  throw CustomExceptionToFromJson();
}

void throwsCustomError() {
  throw CustomError();
}

void throwsCustomErrorToFromJson() {
  throw CustomErrorToFromJson();
}

void throwsCustomErrorWithStackTrace() {
  throw CustomErrorWithStackTrace();
}
