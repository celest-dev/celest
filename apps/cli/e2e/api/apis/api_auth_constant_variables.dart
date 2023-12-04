@anonymous
library;

import 'package:celest/api.dart' as api;

// Annotations can be constructor invocations or variables.
const anonymous = api.anonymous();
const authenticated = api.authenticated();

@authenticated
String sayHelloAuthenticated() => 'Hello, World!';
String sayHello() => 'Hello, World!';
