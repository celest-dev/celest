/// A library with methods that do not through but call methods that do throw.
library;

import 'throwing.dart';

void callsThrowsCustomError() {
  throwsCustomError();
}

void callsThrowsBaseError() {
  throwsBaseError();
}

void callsThrowsCustomException() {
  throwsCustomException();
}

void callsThrowsBaseException() {
  throwsBaseException();
}
