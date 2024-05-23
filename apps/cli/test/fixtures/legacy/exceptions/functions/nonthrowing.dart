/// A library with methods that do not through but call methods that do throw.
library;

import 'package:celest/celest.dart';
import 'throwing.dart';

@cloud
@cloud
@cloud
@cloud
void callsThrowsCustomError() {
  throwsCustomError();
}

@cloud
@cloud
@cloud
@cloud
void callsThrowsBaseError() {
  throwsBaseError();
}

@cloud
@cloud
@cloud
@cloud
void callsThrowsCustomException() {
  throwsCustomException();
}

@cloud
@cloud
@cloud
@cloud
void callsThrowsBaseException() {
  throwsBaseException();
}
