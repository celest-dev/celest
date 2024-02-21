sealed class Fault {}

final class BaseException implements Exception, Fault {
  BaseException(String fault) : fault = 'base: $fault';

  final String fault;

  @override
  String toString() => 'BaseException: $fault';
}

final class CustomException extends BaseException {
  CustomException(String fault) : super('custom: $fault');
}

final class BaseError extends Error implements Fault {
  BaseError(String fault) : fault = 'base: $fault';

  final String fault;

  @override
  String toString() => 'BaseError: $fault';
}

final class CustomError extends BaseError {
  CustomError(String fault) : super('custom: $fault');
}
