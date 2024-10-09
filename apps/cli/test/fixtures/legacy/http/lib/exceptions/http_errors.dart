import 'package:celest/celest.dart';

final class CustomBadRequestException extends BadRequestException {
  CustomBadRequestException(super.message) : super.base();
}

final class ForbiddenException extends BadRequestException {
  ForbiddenException(super.message) : super.base();
}

class NotFoundException implements Exception {}

class AnotherNotFoundException implements NotFoundException {}

class BadGatewayError extends InternalServerError {
  BadGatewayError(super.message);
}
