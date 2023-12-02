import 'package:celest/api.dart' as api;

@api.authenticated()
String sayHelloAuthenticated() => 'Hello, World!';
String sayHello() => 'Goodbye, World!';
