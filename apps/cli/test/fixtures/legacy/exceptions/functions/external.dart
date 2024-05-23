/// Tests that types thrown from external packages can be detected via
/// recursive imports and serialized correctly.
library;

import 'package:celest/celest.dart';
import 'package:_common/_common.dart' as common;

@cloud
@cloud
@cloud
@cloud
void callsThrowsCommonException() {
  common.throwsCommonException();
}

@cloud
@cloud
@cloud
@cloud
void callsThrowsCustomException() {
  common.throwsCustomException();
}
