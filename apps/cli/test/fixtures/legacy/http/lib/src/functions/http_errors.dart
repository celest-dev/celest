import 'package:celest/celest.dart' hide NotFoundException;
import 'package:celest/http.dart';
import 'package:celest_backend/exceptions/http_errors.dart';
import 'package:celest_backend/models/http_errors.dart';

@cloud
@httpError(HttpStatus.forbidden, ForbiddenException)
@httpError(HttpStatus.preconditionFailed, CustomBadRequestException)
@httpError(HttpStatus.unauthorized, UnauthorizedException)
@httpError(HttpStatus.notFound, NotFoundException, InternalServerError)
Future<void> httpErrors(ExceptionType type) async {
  switch (type) {
    // Should return 400 even when not overridden.
    case ExceptionType.badRequest:
      throw BadRequestException('');

    // Should return 412
    case ExceptionType.customBadRequest:
      throw CustomBadRequestException(message: '');

    // Should return 401
    case ExceptionType.unauthorized:
      throw UnauthorizedException('');

    // Should return 403
    case ExceptionType.forbidden:
      throw ForbiddenException(message: '');

    // Should return 404
    case ExceptionType.notFound:
      throw NotFoundException();

    // Should return 404 since it subtypes NotFoundException
    case ExceptionType.anotherNotFound:
      throw AnotherNotFoundException();

    // Should return 404
    case ExceptionType.internalServerError:
      throw InternalServerError('');

    // Should return 404 since it subtypes InternalServerError
    case ExceptionType.badGateway:
      throw BadGatewayError('');
  }
}
