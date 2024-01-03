@public
library;

import 'package:celest/functions.dart' as functions;

// Annotations can be constructor invocations or variables.
const public = functions.public();
const authenticated = functions.authenticated();

@authenticated
String sayHelloAuthenticated() => 'Hello, World!';
String sayHello() => 'Hello, World!';
