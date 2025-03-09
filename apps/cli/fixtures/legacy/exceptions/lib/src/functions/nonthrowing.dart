/// A library with methods that do not through but call methods that do throw.
library;

import 'package:celest/celest.dart';

import 'throwing.dart';

@cloud
void callsThrowsCustomError() {
  throwsCustomError();
}

@cloud
void callsThrowsBaseError() {
  throwsBaseError();
}

@cloud
void callsThrowsCustomException() {
  throwsCustomException();
}

@cloud
void callsThrowsBaseException() {
  throwsBaseException();
}
