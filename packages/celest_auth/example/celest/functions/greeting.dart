// Cloud functions are top-level Dart functions defined in the `functions/`
// folder of your Celest project.

import 'package:celest/celest.dart';

/// Says hello to the authenticated [user].
@authenticated
Future<String> sayHello({
  @Context.user required User user,
}) async {
  if (!user.emailVerified) {
    throw UnauthorizedException('Email not verified');
  }

  print('Saying hello to user: $user');

  if (user.displayName case final name?) {
    return 'Hello, $name!';
  }
  return 'Hello!';
}
