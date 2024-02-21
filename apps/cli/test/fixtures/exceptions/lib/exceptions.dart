export 'package:_common/_common.dart';

sealed class Fault {}

final class BaseException implements Exception, Fault {
  BaseException(String message) : message = 'base: $message';

  final String message;

  @override
  String toString() => 'BaseException: $message';
}

final class CustomException extends BaseException {
  CustomException(String message) : super('custom: $message');
}

final class BaseError extends Error implements Fault {
  BaseError(String message) : message = 'base: $message';

  final String message;

  @override
  String toString() => 'BaseError: $message';
}

final class CustomError extends BaseError {
  CustomError(String message) : super('custom: $message');
}
