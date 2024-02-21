/// Tests that types thrown from external packages can be detected via
/// recursive imports and serialized correctly.
library;

import 'package:_common/_common.dart' as common;

void callsThrowsCommonException() {
  common.throwsCommonException();
}

void callsThrowsCustomException() {
  common.throwsCustomException();
}

// TODO(dnys1): Test if this is removed.
// void throwsCustomException() {
//   throw common.CustomException('message');
// }
