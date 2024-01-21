// Cloud functions are top-level Dart functions defined in the `functions/`
// folder of your Celest project.

/// Says hello to a person called [name].
Future<String> sayHello(String name) async {
  // Logging is handled automatically when you print to the console.
  print('Saying hello to $name');

  return 'Hello, $name!';
}
