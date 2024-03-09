import 'package:celest/celest.dart';

@authenticated
Future<void> sayHelloAuthenticated() async {
  print('Hello, world!');
}

@public
Future<void> sayHelloPublic() async {
  print('Hello, world!');
}

Future<void> sayHello() async {
  print('Hello, world!');
}
