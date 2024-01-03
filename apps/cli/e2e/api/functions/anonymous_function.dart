@functions.authenticated()
library;

import 'package:celest/functions.dart' as functions;

@functions.public()
String sayHello() => 'Hello, World!';
String sayHelloAuthenticated() => 'Hello, World!';
