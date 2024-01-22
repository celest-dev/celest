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
