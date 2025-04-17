part of 'project_template.dart';

/// A simple project template -- the "Hello World" of Celest.
final class HelloProject extends ProjectTemplate {
  HelloProject(super.projectRoot, this.projectName, this.projectDisplayName);

  @override
  String get name => 'core.template.hello';

  @override
  bool get needsMigration => true;

  final String projectName;
  final String projectDisplayName;

  @override
  Future<ProjectMigrationResult> create() async {
    await Future.wait([
      createFile(projectPaths.projectDart, '''
import 'package:celest/celest.dart';

const project = Project(
  name: '${projectName.paramCase}',
  displayName: '$projectDisplayName',
);
'''),
      createFile(p.join(projectPaths.apisDir, 'greeting.dart'), r'''
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
'''),
      createFile(
        p.join(projectRoot, 'test', 'functions', 'greeting_test.dart'),
        '''
import 'package:celest_backend/src/functions/greeting.dart';
import 'package:test/test.dart';

void main() {
  group('greeting', () {
    test('sayHello', () async {
      expect(await sayHello(person: Person(name: 'Celest')), 'Hello, Celest!');
    });
    test('sayHello (empty name)', () async {
      expect(
        sayHello(person: Person(name: '')),
        throwsA(isA<BadNameException>()),
      );
    });
  });
}
''',
      ),

      // Generated
      createFile(
        p.join(projectPaths.generatedDir, 'README.md'),
        generated_README,
      ),
    ]);
    return const ProjectMigrationSuccess();
  }
}
