enum SupportedExceptionType {
  Exception,
  FormatException,
}

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

enum SupportedErrorType {
  Error,
  ArgumentError,
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

final class CustomException implements Exception {
  final String message = 'This is a custom exception';
  final Map<String, Object?> additionalInfo = {
    'hello': 'world',
  };

  @override
  String toString() => 'CustomException: $message';
}

final class CustomExceptionToFromJson extends CustomException {
  CustomExceptionToFromJson();

  CustomExceptionToFromJson.fromJson(Map<String, Object?> json) {
    json.remove('message');
    this.additionalInfo.addAll(json);
  }

  Map<String, Object?> toJson() => {
        'message': message,
        ...additionalInfo,
        'another': 'value',
      };
}

final class CustomError extends Error {
  final String message = 'This is a custom error';
  final Map<String, Object?> additionalInfo = {
    'hello': 'world',
  };

  @override
  String toString() => 'CustomError: $message';
}

final class CustomErrorToFromJson extends CustomError {
  CustomErrorToFromJson();

  CustomErrorToFromJson.fromJson(Map<String, Object?> json) {
    json.remove('message');
    this.additionalInfo.addAll(json);
  }

  Map<String, Object?> toJson() => {
        'message': message,
        ...additionalInfo,
        'another': 'value',
      };
}

final class CustomErrorWithStackTrace extends Error {
  CustomErrorWithStackTrace({
    StackTrace? stackTrace,
  }) : stackTrace = stackTrace ?? StackTrace.empty;

  @override
  final StackTrace stackTrace;

  final String message = 'This is a custom error';
  final Map<String, Object?> additionalInfo = {
    'hello': 'world',
  };

  @override
  String toString() => 'CustomError: $message';
}
