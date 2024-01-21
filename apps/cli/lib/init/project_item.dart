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

//     final middleware = fileSystem.file(
//       p.join(projectPaths.apisDir, 'middleware.dart'),
//     );
//     await middleware.create(recursive: true);
//     await middleware.writeAsString(r'''
// import 'package:celest/celest.dart';

// // An example middleware showing how to log all requests made to a function.
// //
// // Applying this middleware to a function will log the request to the console
// // before passing it on to the function.
// //
// // Applying this middleware to a library will log all requests made to all
// // functions in that library.
// //
// // This middleware is applied to the `sayHello` function in `greeting.dart`.

// /// Logs requests to the function.
// class logRequests implements Middleware {
//   /// Logs requests to the function.
//   const logRequests();

//   @override
//   Handler handle(Handler next) {
//     return Handler((request) {
//       print('Request: $request');
//       return next(request);
//     });
//   }
// }
// ''');

    final greetingApi = fileSystem.file(
      p.join(projectPaths.apisDir, 'greeting.dart'),
    );
    await greetingApi.create(recursive: true);
    await greetingApi.writeAsString(r'''
// Cloud functions are just top-level Dart functions defined in the 
// `functions/` folder of your Celest project.

/// Says hello to a person called [name].
Future<String> sayHello(String name) async {
  // Logging is handled automatically when you print to the console.
  print('Saying hello to $name');

  return 'Hello, $name!';
}
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
