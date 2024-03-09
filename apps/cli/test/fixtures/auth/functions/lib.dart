import 'package:celest/celest.dart';

@authenticated
Future<void> sayHelloAuthenticated({
  @Context.user required User user,
}) async {
  print('Hello, world!');
}

@public
Future<void> sayHelloPublic({
  @Context.user User? user,
}) async {
  print('Hello, world!');
}

Future<void> sayHello({
  @Context.user User? user,
}) async {
  print('Hello, world!');
}
