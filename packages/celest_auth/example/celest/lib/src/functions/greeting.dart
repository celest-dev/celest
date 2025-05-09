// Cloud functions are top-level Dart functions defined in the `functions/`
// folder of your Celest project.

import 'package:celest/celest.dart';

/// Says hello to the authenticated [user].
@cloud
@authenticated
Future<String> sayHello({@principal required User user}) async {
  if (user.primaryEmail == null) {
    throw UnauthorizedException('Email not verified');
  }

  print('Saying hello to user: $user');

  if (user.givenName case final name?) {
    return 'Hello, $name!';
  }
  return 'Hello!';
}
