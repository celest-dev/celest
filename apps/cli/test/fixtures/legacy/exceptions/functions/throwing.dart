import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions/exceptions.dart';

@cloud
@cloud
@cloud
@cloud
void throwsCustomError() {
  throw CustomError('message');
}

@cloud
@cloud
@cloud
@cloud
void throwsBaseError() {
  throw BaseError('message');
}

@cloud
@cloud
@cloud
@cloud
void throwsCustomException() {
  throw CustomException('message');
}

@cloud
@cloud
@cloud
@cloud
void throwsBaseException() {
  throw BaseException('message');
}
