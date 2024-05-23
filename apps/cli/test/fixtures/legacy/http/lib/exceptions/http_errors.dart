import 'package:celest/celest.dart';

class CustomBadRequestException extends BadRequestException {
  CustomBadRequestException(super.message);
}

class ForbiddenException extends BadRequestException {
  ForbiddenException(super.message);
}

class NotFoundException implements Exception {}

class AnotherNotFoundException implements NotFoundException {}

class BadGatewayError extends InternalServerError {
  BadGatewayError(super.message);
}
