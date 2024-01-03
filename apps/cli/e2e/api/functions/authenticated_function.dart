import 'package:celest/functions.dart' as functions;

@functions.authenticated()
String sayHelloAuthenticated() => 'Hello, World!';
String sayHello() => 'Goodbye, World!';
