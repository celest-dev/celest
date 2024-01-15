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
    final file = fileSystem.file(p.join(projectRoot, relativePath));
    await file.create(recursive: true);
    await file.writeAsString('''
# Dart
.dart_tool/

# Celest
**/.env       # Environment variables
''');
  }
}

final class _AnalysisOptions extends ProjectFile {
  const _AnalysisOptions();

  @override
  String get relativePath => 'analysis_options.yaml';

  @override
  Future<void> create(String projectRoot) async {
    final file = fileSystem.file(p.join(projectRoot, relativePath));
    await file.create(recursive: true);
    await file.writeAsString('''
include: package:lints/recommended.yaml
''');
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

  const factory ProjectTemplate.hello() = _HelloProject;
}

final class _HelloProject extends ProjectTemplate {
  const _HelloProject();

  @override
  Future<void> create(String projectRoot) async {
    final projectFile = fileSystem.file(projectPaths.projectDart);
    await projectFile.create(recursive: true);
    await projectFile.writeAsString('''
import 'package:celest/celest.dart';

const project = Project(
  name: 'hello',
);
''');

    final greetingApi = fileSystem.file(
      p.join(projectPaths.apisDir, 'greeting.dart'),
    );
    await greetingApi.create(recursive: true);
    await greetingApi.writeAsString(r'''
import 'package:celest/functions/middleware.dart' as middleware;

// Middleware are applied by adding annotations to your function.
//
// They allow reuse of code between functions and can be used for logging,
// authentication, authorization, and more.
@middleware.logRequests()
Future<String> sayHello(String name) async => 'Hello, $name!';
''');

    final greetingTest = fileSystem.file(
      p.join(projectRoot, 'test', 'functions', 'greeting_test.dart'),
    );
    await greetingTest.create(recursive: true);
    await greetingTest.writeAsString(r'''
import 'package:test/test.dart';

import '../../functions/greeting.dart';

void main() {
  group('greeting', () {
    test('sayHello', () async {
      expect(await sayHello('world'), 'Hello, world!');
    });
  });
}
''');
  }
}
