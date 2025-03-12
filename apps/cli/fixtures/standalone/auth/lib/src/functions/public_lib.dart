@public
library;

import 'package:celest/celest.dart';

@cloud
Future<String> sayHello({
  @principal User? user,
}) async {
  final name = user == null ? 'anonymous' : 'user';
  return 'Hello, $name!';
}

@cloud
Stream<String> streamHello({
  @principal User? user,
}) async* {
  final name = user == null ? 'anonymous' : 'user';
  yield 'Hello, $name!';
}
