import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions/exceptions.dart';
import 'package:celest_backend/models/exceptions.dart';

@cloud
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

@cloud
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

@cloud
void throwsCustomException() {
  throw CustomException();
}

@cloud
void throwsCustomExceptionToFromJson() {
  throw CustomExceptionToFromJson();
}

@cloud
void throwsCustomError() {
  throw CustomError();
}

@cloud
void throwsCustomErrorToFromJson() {
  throw CustomErrorToFromJson();
}

@cloud
void throwsCustomErrorWithStackTrace() {
  throw CustomErrorWithStackTrace();
}
