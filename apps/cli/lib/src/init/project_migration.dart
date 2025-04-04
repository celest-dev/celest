import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/init/migrations/add_generated_folder.dart';
import 'package:celest_cli/src/project/celest_project.dart';
import 'package:celest_cli/src/pub/project_dependency.dart';
import 'package:celest_cli/src/pub/pub_action.dart';
import 'package:celest_cli/src/pub/pub_environment.dart';
import 'package:celest_cli/src/pub/pubspec.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/path.dart';
import 'package:celest_cli/src/utils/recase.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

sealed class ProjectMigrationResult {
  const ProjectMigrationResult();

  bool get needsAnalyzerMigration => false;
  bool get needsDartFix => false;

  ProjectMigrationResult operator &(ProjectMigrationResult other);
}

final class ProjectMigrationSuccess extends ProjectMigrationResult {
  const ProjectMigrationSuccess({
    this.needsAnalyzerMigration = false,
    this.needsDartFix = false,
  });

  @override
  final bool needsAnalyzerMigration;

  @override
  final bool needsDartFix;

  @override
  ProjectMigrationResult operator &(ProjectMigrationResult other) {
    return switch (other) {
      ProjectMigrationSkipped() => this,
      ProjectMigrationSuccess(
        :final needsAnalyzerMigration,
        :final needsDartFix
      ) =>
        ProjectMigrationSuccess(
          needsAnalyzerMigration:
              this.needsAnalyzerMigration || needsAnalyzerMigration,
          needsDartFix: this.needsDartFix || needsDartFix,
        ),
    };
  }

  @override
  String toString() =>
      'ProjectMigrationSuccess(needsAnalyzerMigration: $needsAnalyzerMigration)';
}

final class ProjectMigrationSkipped extends ProjectMigrationResult {
  const ProjectMigrationSkipped();

  @override
  ProjectMigrationResult operator &(ProjectMigrationResult other) => other;

  @override
  String toString() => 'ProjectMigrationSkipped()';
}

final class ProjectMigrationReport {
  ProjectMigrationReport();

  final Map<String, ProjectMigrationResult> migrations = {};

  ProjectMigrationResult get result {
    return migrations.values.fold(
      const ProjectMigrationSkipped(),
      (result, migration) => result & migration,
    );
  }

  @override
  String toString() {
    final buffer = StringBuffer('ProjectMigrationReport(\n');
    for (final entry in migrations.entries) {
      final value = switch (entry.value) {
        ProjectMigrationSuccess(
          needsAnalyzerMigration: false,
          needsDartFix: false
        ) =>
          'success',
        ProjectMigrationSuccess(needsAnalyzerMigration: true) ||
        ProjectMigrationSuccess(needsDartFix: true) =>
          'partial',
        ProjectMigrationSkipped() => 'skipped',
      };
      buffer.writeln('  ${entry.key}: $value,');
    }
    buffer.write(')');
    return buffer.toString();
  }
}

abstract class ProjectMigration {
  const ProjectMigration(this.projectRoot);

  String get name;
  bool get needsMigration;

  final String projectRoot;
  Directory get projectDir => fileSystem.directory(projectRoot);

  /// Creates the item in the given [projectRoot].
  Future<ProjectMigrationResult> create();
}

sealed class ProjectFile extends ProjectMigration {
  const ProjectFile(super.projectRoot);

  const factory ProjectFile.gitIgnore(String projectRoot) = _GitIgnore;

  const factory ProjectFile.analysisOptions(String projectRoot) =
      _AnalysisOptions;

  const factory ProjectFile.pubspec(
    String projectRoot,
    String projectName,
    ParentProject? parentProject,
  ) = PubspecFile;

  factory ProjectFile.client(String projectRoot, String projectName) =
      ProjectClient;

  @override
  String get name => 'core.project.file["$relativePath"]';

  /// The relative path of the item from the project root.
  String get relativePath;

  @override
  bool get needsMigration {
    final entity = relativePath.endsWith('/')
        ? projectDir.childDirectory
        : projectDir.childFile;
    return !entity(relativePath).existsSync();
  }
}

final class _GitIgnore extends ProjectFile {
  const _GitIgnore(super.projectRoot);

  @override
  String get relativePath => '.gitignore';

  @override
  bool get needsMigration => true;

  @override
  Future<ProjectMigrationResult> create() async {
    await _createFile(p.join(projectRoot, relativePath), '''
# Dart
.dart_tool/
pubspec.lock

# Celest
build/
.env
.env.*
''');
    return const ProjectMigrationSuccess();
  }
}

final class _AnalysisOptions extends ProjectFile {
  const _AnalysisOptions(super.projectRoot);

  @override
  String get relativePath => 'analysis_options.yaml';

  @override
  Future<ProjectMigrationResult> create() async {
    await _createFile(p.join(projectRoot, relativePath), '''
include: package:lints/recommended.yaml

analyzer:
  errors:
    depend_on_referenced_packages: ignore
''');
    return const ProjectMigrationSuccess();
  }
}

final class PubspecFile extends ProjectFile {
  const PubspecFile(super.projectRoot, this.projectName, this.parentProject);

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
      final replaceStart = switch (parentProject.pubspecYaml.indexOf(
        'dependencies:',
      )) {
        // Barebones pubspec, probably created by hand.
        -1 => pubspecYaml.nodes['environment']?.span.end.offset ??
            unreachable('No environment section in pubspec'),
        // Empty dependencies section generated by `dart create`. Replace with
        // ours.
        final dependenciesStart => dependenciesStart,
      };
      final replaceEnd = switch (parentProject.pubspecYaml.indexOf(
        'dev_dependencies:',
      )) {
        -1 => null,
        final devDependenciesStart => devDependenciesStart,
      };
      updatedPubspec =
          StringBuffer(parentProject.pubspecYaml.substring(0, replaceStart))
            ..writeln()
            ..writeln('dependencies:')
            ..writeln('  $projectPubspecName:')
            ..writeln('    path: celest/client/')
            ..writeln(
              replaceEnd?.let(parentProject.pubspecYaml.substring) ?? '',
            );
    } else if (!parentProject.pubspec.dependencies.containsKey(
      projectPubspecName,
    )) {
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
  Future<ProjectMigrationResult> create() async {
    final file = fileSystem.file(p.join(projectRoot, relativePath));
    await file.create(recursive: true);

    final pubspec = Pubspec(
      'celest_backend',
      // '${projectName.snakeCase}_backend',
      description: 'The Celest backend for $projectName.',
      publishTo: 'none',
      environment: {'sdk': PubEnvironment.dartSdkConstraint},
      dependencies: ProjectDependency.backendDependencies.toPub(),
      devDependencies: ProjectDependency.devDependencies.toPub(),
      dependencyOverrides: ProjectDependency.localDependencyOverrides(
        projectRoot: projectRoot,
      ),
    );
    await file.writeAsString(pubspec.toYaml());
    await _updateAppPubspec();
    return const ProjectMigrationSuccess();
  }
}

final class ProjectClient extends ProjectFile {
  ProjectClient(super.projectRoot, this.projectName);

  final String projectName;
  final _operations = <Future<void>>[];

  static final _logger = Logger('ProjectClient');

  @override
  String get relativePath => 'client/';

  @override
  bool get needsMigration {
    final file =
        fileSystem.directory(projectPaths.clientRoot).childFile('pubspec.yaml');
    return !file.existsSync();
  }

  @override
  Future<ProjectMigrationResult> create() async {
    final clientRoot = fileSystem.directory(projectPaths.clientRoot);
    if (!clientRoot.existsSync()) {
      await clientRoot.create(recursive: true);
    }

    // pubspec.yaml
    final pubspecFile = clientRoot.childFile('pubspec.yaml');
    if (!pubspecFile.existsSync()) {
      final pubspec = Pubspec(
        '${projectName.snakeCase}_client',
        publishTo: 'none',
        description: 'The Celest client for $projectName.',
        environment: {'sdk': PubEnvironment.dartSdkConstraint},
        dependencies: {
          'celest_backend': PathDependency(
            p.url.relative(
              projectRoot.to(p.url),
              from: clientRoot.path.to(p.url),
            ),
          ),
          ...ProjectDependency.clientDependencies.toPub(),
        },
        dependencyOverrides: ProjectDependency.localDependencyOverrides(
          projectRoot: clientRoot.path,
        ),
      );
      final pubspecYaml = pubspec.toYaml();
      _logger.finest('Writing pubspec.yaml to ${pubspecFile.path}...');
      _logger.finest(pubspecYaml);
      _operations.add(
        pubspecFile.writeAsString(pubspecYaml, flush: true).then((_) {
          return runPub(
            action: PubAction.get,
            workingDirectory: clientRoot.path,
          );
        }),
      );
    }

    // Create `lib/src` in the client folder.
    _operations.add(
      clientRoot
          .childDirectory('lib')
          .childDirectory('src')
          .create(recursive: true),
    );

    await Future.wait(_operations);
    return const ProjectMigrationSuccess();
  }
}

sealed class ProjectTemplate extends ProjectMigration {
  const ProjectTemplate(super.projectRoot);

  factory ProjectTemplate.hello(String projectRoot, String projectName) =
      _HelloProject;
}

final class _HelloProject extends ProjectTemplate {
  _HelloProject(super.projectRoot, this.projectName);

  @override
  String get name => 'core.template.hello';

  @override
  bool get needsMigration => true;

  final String projectName;

  @override
  Future<ProjectMigrationResult> create() async {
    await Future.wait([
      _createFile(projectPaths.projectDart, '''
import 'package:celest/celest.dart';

const project = Project(
  name: '$projectName',
);
'''),
      _createFile(p.join(projectPaths.apisDir, 'greeting.dart'), r'''
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

      // Generated
      _createFile(
        p.join(projectPaths.generatedDir, 'README.md'),
        generated_README,
      ),

      // Client
      ProjectFile.client(projectRoot, projectName).create(),
    ]);
    return const ProjectMigrationSuccess();
  }
}

Future<void> _createFile(String path, String contents) async {
  final file = fileSystem.file(path);
  await file.create(recursive: true);
  await file.writeAsString(contents);
}
