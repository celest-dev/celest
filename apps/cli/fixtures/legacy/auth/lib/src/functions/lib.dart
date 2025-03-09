import 'package:celest/celest.dart';

@cloud
@authenticated
Future<String> sayHelloAuthenticated({
  @principal required User user,
}) async {
  return 'Hello, user!';
}

@cloud
@authenticated
Stream<String> streamHelloAuthenticated({
  @principal required User user,
}) async* {
  yield 'Hello, user!';
}

@cloud
@public
Future<String> sayHelloPublic({
  @principal User? user,
}) async {
  final name = user == null ? 'anonymous' : 'user';
  return 'Hello, $name!';
}

@cloud
@public
Stream<String> streamHelloPublic({
  @principal User? user,
}) async* {
  final name = user == null ? 'anonymous' : 'user';
  yield 'Hello, $name!';
}

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
