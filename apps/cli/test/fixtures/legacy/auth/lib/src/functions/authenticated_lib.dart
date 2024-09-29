@authenticated
library;

import 'package:celest/celest.dart';
import 'package:celest_core/celest_core.dart';

@cloud
Future<String> sayHello({
  @principal required User user,
}) async {
  return 'Hello, user!';
}

@cloud
Stream<String> streamHello({
  @principal required User user,
}) async* {
  yield 'Hello, user!';
}
