/// Tests that types thrown from external packages can be detected via
/// recursive imports and serialized correctly.
library;

import 'package:_common/_common.dart' as common;
import 'package:celest/celest.dart';

@cloud
void callsThrowsCommonException() {
  common.throwsCommonException();
}

@cloud
void callsThrowsCustomException() {
  common.throwsCustomException();
}
