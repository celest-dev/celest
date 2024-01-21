import 'package:celest_cli/init/pub/project_dependency.dart';
import 'package:celest_cli/init/pub/pub_environment.dart';
import 'package:celest_cli/init/pub/pubspec.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

sealed class ProjectItem {
  const ProjectItem();

  /// Creates the item in the given [projectRoot].
  Future<void> create(String projectRoot);
}

sealed class ProjectFile extends ProjectItem {
  const ProjectFile();

  const factory ProjectFile.gitIgnore() = _GitIgnore;

  const factory ProjectFile.analysisOptions() = _AnalysisOptions;

  const factory ProjectFile.pubspec(String projectName, Uri pubServer) =
      _Pubspec;

  /// The relative path of the item from the project root.
  String get relativePath;
}

final class _GitIgnore extends ProjectFile {
  const _GitIgnore();

  @override
  String get relativePath => '.gitignore';

  @override
  Future<void> create(String projectRoot) async {
    await _createFile(
      p.join(projectRoot, relativePath),
      '''
# Dart
.dart_tool/

# Celest
**/.env       # Environment variables
''',
    );
  }
}

final class _AnalysisOptions extends ProjectFile {
  const _AnalysisOptions();

  @override
  String get relativePath => 'analysis_options.yaml';

  @override
  Future<void> create(String projectRoot) async {
    await _createFile(
      p.join(projectRoot, relativePath),
      '''
include: package:lints/recommended.yaml
''',
    );
  }
}

final class _Pubspec extends ProjectFile {
  const _Pubspec(this.projectName, this.pubServer);

  final String projectName;
  final Uri pubServer;

  @override
  String get relativePath => 'pubspec.yaml';

  @override
  Future<void> create(String projectRoot) async {
    final file = fileSystem.file(p.join(projectRoot, relativePath));
    await file.create(recursive: true);
    final pubspec = Pubspec(
      '${projectName}_celest',
      description: 'The Celest backend for $projectName',
      publishTo: 'none',
      environment: {
        'sdk': PubEnvironment.dartSdkConstraint,
      },
      dependencies: ProjectDependency.dependencies(pubServer),
      dependencyOverrides: ProjectDependency.dependencyOverrides(pubServer),
      devDependencies: ProjectDependency.devDependencies(pubServer),
    );
    await file.writeAsString(pubspec.toYaml());
  }
}

sealed class ProjectTemplate extends ProjectItem {
  const ProjectTemplate();

  factory ProjectTemplate.hello(String projectName) = _HelloProject;
}

final class _HelloProject extends ProjectTemplate {
  _HelloProject(this.projectName);

  final String projectName;

  @override
  Future<void> create(String projectRoot) async {
    final greetingsTestHeader = switch (projectName.compareTo('test')) {
      >= 0 => '''
import 'package:test/test.dart';
import 'package:${projectName}_celest/exceptions.dart';
import 'package:${projectName}_celest/models.dart';
''',
      _ => '''
import 'package:${projectName}_celest/exceptions.dart';
import 'package:${projectName}_celest/models.dart';
import 'package:test/test.dart';
''',
    };
    await Future.wait([
      _createFile(
        projectPaths.projectDart,
        '''
import 'package:celest/celest.dart';

const project = Project(
  name: 'hello',
);
''',
      ),
      _createFile(
        p.join(projectPaths.apisDir, 'greeting.dart'),
        '''
// Cloud functions are top-level Dart functions defined in the `functions/` 
// folder of your Celest project.

// By convention, any custom exception types thrown by an API are defined in
// the `lib/exceptions.dart` file of your Celest project.
import 'package:${projectName}_celest/exceptions.dart';

// Likewise, any custom types used within an API's request/response are defined 
// in the `lib/models.dart` file of your Celest project.
import 'package:${projectName}_celest/models.dart';

/// Says hello to a [person].
Future<String> sayHello(Person person) async {
  // Logging is handled automatically when you print to the console.
  print('Saying hello to \$person');

  // You can throw exceptions to return an error response.
  //
  // Custom exception types are serialized automatically, just like request/
  // response types and will be thrown on the client side.
  if (person.name.isEmpty) {
    throw const BadNameException('Name cannot be empty');
  }

  return 'Hello, \${person.name}!';
}
''',
      ),
      _createFile(
        p.join(projectRoot, 'lib', 'models.dart'),
        r'''
/// A person identified by [name].
class Person {
  const Person(this.name);

  final String name;

  @override
  String toString() => 'Person(name: $name)';
}
''',
      ),
      _createFile(
        p.join(projectRoot, 'lib', 'exceptions.dart'),
        r'''
/// Thrown when a name is invalid.
class BadNameException implements Exception {
  const BadNameException(this.message);

  final String message;
}
''',
      ),
      _createFile(
        p.join(projectRoot, 'test', 'functions', 'greeting_test.dart'),
        '''
$greetingsTestHeader
import '../../functions/greeting.dart';

void main() {
  group('greeting', () {
    test('sayHello', () async {
      const person = Person('Celest');
      await expectLater(sayHello(person), completion('Hello, Celest!'));

      const noName = Person('');
      await expectLater(sayHello(noName), throwsA(isA<BadNameException>()));
    });
  });
}
''',
      ),
    ]);
  }
}

Future<void> _createFile(String path, String contents) async {
  final file = fileSystem.file(path);
  await file.create(recursive: true);
  await file.writeAsString(contents);
}
