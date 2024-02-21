import 'package:celest_backend/exceptions/exceptions.dart';

void throwsCustomError() {
  throw CustomError('message');
}

void throwsBaseError() {
  throw BaseError('message');
}

void throwsCustomException() {
  throw CustomException('message');
}

void throwsBaseException() {
  throw BaseException('message');
}
