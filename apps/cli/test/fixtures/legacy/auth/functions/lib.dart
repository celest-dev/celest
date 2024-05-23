import 'package:celest/celest.dart';

@cloud
@authenticated
Future<void> sayHelloAuthenticated({
  @principal required User user,
}) async {
  print('Hello, world!');
}

@cloud
@public
Future<void> sayHelloPublic({
  @principal User? user,
}) async {
  print('Hello, world!');
}

@cloud
Future<void> sayHello({
  @principal User? user,
}) async {
  print('Hello, world!');
}
