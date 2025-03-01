import 'package:celest/celest.dart';

/// Tests that asserts are enabled when running the local API.
@cloud
bool assertsEnabled() {
  var assertsEnabled = false;
  assert(() {
    assertsEnabled = true;
    return true;
  }());
  return assertsEnabled;
}
