import 'package:celest/celest.dart';

class CustomBadRequestException with CloudException, BadRequestException {
  CustomBadRequestException(this.message);

  @override
  JsonValue? get details => null;

  @override
  final String message;
}

class ForbiddenException with CloudException, BadRequestException {
  ForbiddenException(this.message);

  @override
  JsonValue? get details => null;

  @override
  final String message;
}

class NotFoundException implements Exception {}

class AnotherNotFoundException implements NotFoundException {}

class BadGatewayError extends InternalServerError {
  BadGatewayError(super.message);
}
