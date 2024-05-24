import 'package:celest_cli/init/project_items/add_generated_folder.dart';
import 'package:celest_cli/pub/project_dependency.dart';
import 'package:celest_cli/pub/pub_action.dart';
import 'package:celest_cli/pub/pub_environment.dart';
import 'package:celest_cli/pub/pubspec.dart';
import 'package:celest_cli/src/context.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:yaml_edit/yaml_edit.dart';

abstract class ProjectItem {
  const ProjectItem();

  /// Creates the item in the given [projectRoot].
  Future<void> create(String projectRoot);
}

sealed class ProjectFile extends ProjectItem {
  const ProjectFile();

  const factory ProjectFile.gitIgnore() = _GitIgnore;

  const factory ProjectFile.analysisOptions() = _AnalysisOptions;

  const factory ProjectFile.pubspec(String projectName, String appRoot) =
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
pubspec.lock

# Celest
**/.env
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

analyzer:
  errors:
    depend_on_referenced_packages: ignore
''',
    );
  }
}

final class _Pubspec extends ProjectFile {
  const _Pubspec(this.projectName, this.appRoot);

  final String projectName;
  final String appRoot;

  @override
  String get relativePath => 'pubspec.yaml';

  /// Ensures app has dependency on celest project
  Future<void> _updateAppPubspec() async {
    final appPubspecFile = fileSystem.file(
      p.join(projectPaths.appRoot, 'pubspec.yaml'),
    );
    const projectPubspecName = 'celest_backend';
    // final projectPubspecName = 'api_${projectName.snakeCase}';
    final appPubspecYaml = await appPubspecFile.readAsString();
    if (!Pubspec.parse(appPubspecYaml)
        .dependencies
        .containsKey(projectPubspecName)) {
      final updatedPubspec = YamlEditor(appPubspecYaml)
        ..update(
          ['dependencies', projectPubspecName],
          {'path': 'celest/'},
        );
      await appPubspecFile.writeAsString(updatedPubspec.toString());
      try {
        await runPub(
          exe: 'flutter',
          action: PubAction.get,
          workingDirectory: projectPaths.appRoot,
        );
      } on Exception catch (e, st) {
        performance.captureError(e, stackTrace: st);
      }
    }
  }

  @override
  Future<void> create(String projectRoot) async {
    final file = fileSystem.file(p.join(projectRoot, relativePath));
    await file.create(recursive: true);

    var celestLocalPath = platform.environment['CELEST_LOCAL_PATH'];
    if (celestLocalPath != null) {
      celestLocalPath = p.canonicalize(p.normalize(celestLocalPath));
      if (fileSystem.directory(celestLocalPath).existsSync()) {
        logger.finest('Using local Celest at $celestLocalPath');
      } else {
        logger.warning(
          'CELEST_LOCAL_PATH is set to $celestLocalPath, but the directory '
          'does not exist. Ignoring.',
        );
        celestLocalPath = null;
      }
    }
    final pubspec = Pubspec(
      'celest_backend',
      // 'api_${projectName.snakeCase}',
      description: 'The Celest backend for $projectName.',
      publishTo: 'none',
      environment: {
        'sdk': PubEnvironment.dartSdkConstraint,
      },
      dependencies: ProjectDependency.dependencies,
      devDependencies: ProjectDependency.devDependencies,
      dependencyOverrides: switch (celestLocalPath) {
        null => null,
        final localPath => {
            'celest': PathDependency('$localPath/packages/celest'),
            'celest_core': PathDependency('$localPath/packages/celest_core'),
            'celest_auth': PathDependency('$localPath/packages/celest_auth'),
          },
      },
    );
    await file.writeAsString(pubspec.toYaml());
    await _updateAppPubspec();
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
    await Future.wait([
      _createFile(
        projectPaths.projectDart,
        '''
import 'package:celest/celest.dart';

const project = Project(
  name: '$projectName',
);
''',
      ),
      _createFile(
        p.join(projectPaths.apisDir, 'greeting.dart'),
        r'''
// Cloud functions are top-level Dart functions defined in the `functions/`
// folder of your Celest project.

import 'package:celest_backend/exceptions/bad_name_exception.dart';
import 'package:celest_backend/models/person.dart';

/// Says hello to a [person].
Future<String> sayHello({required Person person}) async {
  if (person.name.isEmpty) {
    // Throw a custom exception defined in the `lib/exceptions/` and catch
    // it on the frontend.
    throw BadNameException('Name cannot be empty');
  }

  // Logging is handled automatically when you print to the console.
  print('Saying hello to ${person.name}');

  return 'Hello, ${person.name}!';
}
''',
      ),
      _createFile(
        p.join(projectRoot, 'test', 'functions', 'greeting_test.dart'),
        '''
import 'package:celest_backend/exceptions/bad_name_exception.dart';
import 'package:celest_backend/models/person.dart';
import 'package:test/test.dart';

import '../../functions/greeting.dart';

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
      _createFile(
        p.join(projectRoot, 'lib', 'models', 'person.dart'),
        '''
// By convention, any custom types used within an API request/response must be
// defined in the `models/` folder.

class Person {
  const Person({required this.name});

  final String name;
}
''',
      ),
      _createFile(
        p.join(projectRoot, 'lib', 'exceptions', 'bad_name_exception.dart'),
        r'''
// By convention, any custom exception types thrown by an API must be defined
// in this file or exported from this file.

class BadNameException implements Exception {
  const BadNameException(this.message);

  final String message;

  @override
  String toString() => 'BadNameException: $message';
}
''',
      ),

      // Generated
      _createFile(
        p.join(projectPaths.generatedDir, 'README.md'),
        generated_README,
      ),
//       _createFile(p.join(projectPaths.generatedDir, 'backend.dart'), '''
// // Generated by Celest CLI. Do not modify.

// abstract class CelestBackend {}
// '''),
//       _createFile(p.join(projectPaths.generatedDir, 'api.dart'), '''
// // Generated by Celest CLI. Do not modify.

// abstract class CelestApi {
//   late CelestBackend celest;
// }
// '''),
    ]);
  }
}

Future<void> _createFile(String path, String contents) async {
  final file = fileSystem.file(path);
  await file.create(recursive: true);
  await file.writeAsString(contents);
}
