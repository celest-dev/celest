import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions/exceptions.dart';

@cloud
void throwsCustomError() {
  throw CustomError('message');
}

@cloud
void throwsBaseError() {
  throw BaseError('message');
}

@cloud
void throwsCustomException() {
  throw CustomException('message');
}

@cloud
void throwsBaseException() {
  throw BaseException('message');
}
