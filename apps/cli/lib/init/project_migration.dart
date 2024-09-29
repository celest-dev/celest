import 'dart:convert';

import 'package:celest_cli/init/migrations/add_generated_folder.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/pub/project_dependency.dart';
import 'package:celest_cli/pub/pub_action.dart';
import 'package:celest_cli/pub/pub_environment.dart';
import 'package:celest_cli/pub/pubspec.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:logging/logging.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

abstract class ProjectMigration {
  const ProjectMigration();

  /// Creates the item in the given [projectRoot].
  Future<void> create(String projectRoot);
}

sealed class ProjectFile extends ProjectMigration {
  const ProjectFile();

  const factory ProjectFile.gitIgnore() = _GitIgnore;

  const factory ProjectFile.analysisOptions() = _AnalysisOptions;

  const factory ProjectFile.pubspec(
    String projectName,
    ParentProject? parentProject,
  ) = PubspecFile;

  factory ProjectFile.client(String projectName) = ProjectClient;

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

final class PubspecFile extends ProjectFile {
  const PubspecFile(this.projectName, this.parentProject);

  final String projectName;
  final ParentProject? parentProject;

  static final logger = Logger('PubspecUpdater');

  @override
  String get relativePath => 'pubspec.yaml';

  /// Ensures app has dependency on celest project
  Future<void> _updateAppPubspec() async {
    final parentProject = this.parentProject;
    if (parentProject == null) {
      return;
    }
    final projectPubspecName = '${projectName.snakeCase}_client';
    Object? updatedPubspec;
    if (parentProject.pubspec.dependencies.isEmpty) {
      final pubspecYaml = loadYamlNode(parentProject.pubspecYaml) as YamlMap;
      final replaceStart =
          switch (parentProject.pubspecYaml.indexOf('dependencies:')) {
        // Barebones pubspec, probably created by hand.
        -1 => pubspecYaml.nodes['environment']?.span.end.offset ??
            unreachable('No environment section in pubspec'),
        // Empty dependencies section generated by `dart create`. Replace with
        // ours.
        final dependenciesStart => dependenciesStart,
      };
      final replaceEnd =
          switch (parentProject.pubspecYaml.indexOf('dev_dependencies:')) {
        -1 => null,
        final devDependenciesStart => devDependenciesStart,
      };
      updatedPubspec = StringBuffer(
        parentProject.pubspecYaml.substring(0, replaceStart),
      )
        ..writeln()
        ..writeln('dependencies:')
        ..writeln('  $projectPubspecName:')
        ..writeln('    path: celest/client/')
        ..writeln(replaceEnd?.let(parentProject.pubspecYaml.substring) ?? '');
    } else if (!parentProject.pubspec.dependencies
        .containsKey(projectPubspecName)) {
      final existingDependency =
          parentProject.pubspec.dependencies[projectPubspecName];
      if (existingDependency
          case null || PathDependency(path: != 'celest/client/')) {
        updatedPubspec = YamlEditor(parentProject.pubspecYaml)
          ..update(
            ['dependencies', projectPubspecName],
            {'path': 'celest/client/'},
          );
      }
    }
    if (updatedPubspec != null) {
      await fileSystem
          .directory(parentProject.path)
          .childFile('pubspec.yaml')
          .writeAsString(updatedPubspec.toString());
    }
  }

  @override
  Future<void> create(String projectRoot) async {
    final file = fileSystem.file(p.join(projectRoot, relativePath));
    await file.create(recursive: true);

    // TODO(dnys1): Make this work with existing projects too
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
      // '${projectName.snakeCase}_backend',
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
            'celest_cloud': PathDependency('$localPath/packages/celest_cloud'),
            'celest_core': PathDependency('$localPath/packages/celest_core'),
            'celest_auth': PathDependency('$localPath/packages/celest_auth'),
          },
      },
    );
    await file.writeAsString(pubspec.toYaml());
    await _updateAppPubspec();
  }
}

final class ProjectClient extends ProjectFile {
  ProjectClient(this.projectName);

  final String projectName;
  final _operations = <Future<void>>[];

  static final _logger = Logger('ProjectClient');

  @override
  String get relativePath => 'client/';

  @override
  Future<void> create(String projectRoot) async {
    final clientOutputsDir = fileSystem.directory(projectPaths.clientRoot);
    if (!clientOutputsDir.existsSync()) {
      await clientOutputsDir.create(recursive: true);
    }

    // pubspec.yaml
    final pubspecFile = clientOutputsDir.childFile('pubspec.yaml');
    if (!pubspecFile.existsSync()) {
      final pubspec = Pubspec(
        '${projectName.snakeCase}_client',
        publishTo: 'none',
        description: 'The Celest client for $projectName.',
        environment: {
          'sdk': VersionConstraint.compatibleWith(minSupportedDartSdk),
        },
        dependencies: {
          'celest_backend': PathDependency('../'),
          'celest_core': ProjectDependency.celestCore.pubDependency,
          'http': ProjectDependency.http.pubDependency,
        },
      );
      final pubspecYaml = pubspec.toYaml();
      _logger.finest('Writing pubspec.yaml to ${pubspecFile.path}...');
      _logger.finest(pubspecYaml);
      _operations.add(
        pubspecFile.writeAsString(pubspecYaml, flush: true).then((_) {
          return runPub(
            action: PubAction.get,
            workingDirectory: clientOutputsDir.path,
          );
        }),
      );
    }

    // Create `lib/src` in the client folder.
    _operations.add(
      clientOutputsDir
          .childDirectory('lib')
          .childDirectory('src')
          .create(recursive: true),
    );

    await Future.wait(_operations);
  }
}

sealed class ProjectTemplate extends ProjectMigration {
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
''',
      ),
      _createFile(
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
      _createFile(
        p.join(projectRoot, '.vscode', 'settings.json'),
        jsonEncode({
          'files.exclude': {
            'lib/**': true,
          },
        }),
      ),

      // Generated
      _createFile(
        p.join(projectPaths.generatedDir, 'README.md'),
        generated_README,
      ),

      // Client
      ProjectFile.client(projectName).create(projectRoot),

      // Symlinks
      fileSystem
          .link(p.join(projectRoot, 'functions'))
          .create(projectPaths.apisDir, recursive: true),
    ]);
  }
}

Future<void> _createFile(String path, String contents) async {
  final file = fileSystem.file(path);
  await file.create(recursive: true);
  await file.writeAsString(contents);
}
