// Cloud functions are top-level Dart functions defined in the `functions/`
// folder of your Celest project.

import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions/demo.dart';
import 'package:celest_backend/models/demo.dart';

/// Says hello to a [person].
@cloud
Future<String> sayHello({required Person person}) async {
  if (person.name.isEmpty) {
    throw BadNameException('Name cannot be empty');
  }
  return 'Hello, ${person.name}!';
}
