/// Common types and functions, used for testing APIs which reference other
/// packages.
library;

final class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  @override
  String toString() => 'CustomException: $message';
}

final class CommonException implements Exception {
  final String message;

  CommonException(this.message);

  @override
  String toString() => 'CommonException: $message';
}

void throwsCustomException() {
  throw CustomException('message');
}

void throwsCommonException() {
  throw CommonException('message');
}
