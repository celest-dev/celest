// Cloud functions are top-level Dart functions defined in the `functions/`
// folder of your Celest project.

import 'package:celest/celest.dart';

/// Says hello to a [person].
@cloud
Future<String> sayHello({required Person person}) async {
  if (person.name.isEmpty) {
    // Throw a custom exception and catch it on the frontend.
    throw BadNameException('Name cannot be empty');
  }

  // Logging is handled automatically when you print to the console.
  print('Saying hello to ${person.name}');

  return 'Hello, ${person.name}!';
}

/// A person who can be greeted.
class Person {
  const Person({required this.name});

  final String name;
}

/// Thrown when a [Person] has an invalid name.
class BadNameException implements Exception {
  const BadNameException(this.message);

  final String message;

  @override
  String toString() => 'BadNameException: $message';
}
