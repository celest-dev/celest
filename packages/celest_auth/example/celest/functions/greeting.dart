// Cloud functions are top-level Dart functions defined in the `functions/`
// folder of your Celest project.

import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions/bad_name_exception.dart';
import 'package:celest_backend/models/person.dart';

/// Says hello to the authenticated [user].
// @authenticated
@authenticated
Future<String> sayHello({
  required Person person,
  // @Context.user() required User user,
}) async {
  if (person.name.isEmpty) {
    // Throw a custom exception defined in the `lib/exceptions/` and catch
    // it on the frontend.
    throw BadNameException('Name cannot be empty');
  }

  // Logging is handled automatically when you print to the console.
  print('Saying hello to ${person.name}');

  return 'Hello, ${person.name}!';
}