@functions.public()
library;

import 'package:celest/functions.dart' as functions;

@functions.authenticated()
String sayHelloAuthenticated() => 'Hello, World!';
String sayHello() => 'Hello, World!';
