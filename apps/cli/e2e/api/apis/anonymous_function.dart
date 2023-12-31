@api.authenticated()
library;

import 'package:celest/api.dart' as api;

@api.public()
String sayHello() => 'Hello, World!';
String sayHelloAuthenticated() => 'Hello, World!';
