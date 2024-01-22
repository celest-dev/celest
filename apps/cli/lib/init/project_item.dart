import 'package:celest_cli/init/pub/project_dependency.dart';
import 'package:celest_cli/init/pub/pub_environment.dart';
import 'package:celest_cli/init/pub/pubspec.dart';
import 'package:celest_cli/src/context.dart';
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

  const factory ProjectFile.pubspec(String projectName) = _Pubspec;

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
''',
    );
  }
}

final class _Pubspec extends ProjectFile {
  const _Pubspec(this.projectName);

  final String projectName;

  @override
  String get relativePath => 'pubspec.yaml';

  @override
  Future<void> create(String projectRoot) async {
    final file = fileSystem.file(p.join(projectRoot, relativePath));
    await file.create(recursive: true);
    final pubspec = Pubspec(
      'celest_backend',
      description: 'The Celest backend for $projectName.',
      publishTo: 'none',
      environment: {
        'sdk': PubEnvironment.dartSdkConstraint,
      },
      dependencies: ProjectDependency.dependencies,
      devDependencies: ProjectDependency.devDependencies,
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

/// Says hello to a person called [name].
Future<String> sayHello(String name) async {
  // Logging is handled automatically when you print to the console.
  print('Saying hello to $name');

  return 'Hello, $name!';
}
''',
      ),
      _createFile(
        p.join(projectRoot, 'test', 'functions', 'greeting_test.dart'),
        '''
import 'package:test/test.dart';

import '../../functions/greeting.dart';

void main() {
  group('greeting', () {
    test('sayHello', () async {
      expect(await sayHello('Celest'), 'Hello, Celest!');
    });
  });
}
''',
      ),
      _createFile(
        p.join(projectRoot, 'lib', 'models.dart'),
        '''
// By convention, any custom types used within an API request/response must be
// defined in this file or exported from this file.
''',
      ),
      _createFile(
        p.join(projectRoot, 'lib', 'exceptions.dart'),
        '''
// By convention, any custom exception types thrown by an API must be defined
// in this file or exported from this file.
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
