/// Tests that asserts are enabled when running the local API.
bool assertsEnabled() {
  var assertsEnabled = false;
  assert(() {
    assertsEnabled = true;
    return true;
  }());
  return assertsEnabled;
}
