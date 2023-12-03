@api.authenticated()
library;

import 'package:celest/api.dart' as api;

@api.anonymous()
String sayHello() => 'Hello, World!';
String sayHelloAuthenticated() => 'Hello, World!';
