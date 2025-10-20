import 'package:celest_cli/src/context.dart';
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
import 'package:meta/meta.dart';
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
        :final needsDartFix,
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
          needsDartFix: false,
        ) =>
          'success',
        ProjectMigrationSuccess(needsAnalyzerMigration: true) ||
        ProjectMigrationSuccess(needsDartFix: true) => 'partial',
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

  @protected
  Future<void> createFile(String path, String contents) async {
    final file = fileSystem.file(path);
    await file.create(recursive: true);
    await file.writeAsString(contents);
  }
}

sealed class ProjectFile extends ProjectMigration {
  const ProjectFile(super.projectRoot);

  const factory ProjectFile.gitIgnore(String projectRoot) = _GitIgnore;

  const factory ProjectFile.analysisOptions(String projectRoot) =
      _AnalysisOptions;

  const factory ProjectFile.pubspec(
    String projectRoot, {
    required String projectName,
    required String projectDisplayName,
    ParentProject? parentProject,
    List<ProjectDependency> additionalDependencies,
  }) = PubspecFile;

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
    await createFile(p.join(projectRoot, relativePath), '''
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
    await createFile(p.join(projectRoot, relativePath), '''
include: package:lints/recommended.yaml

analyzer:
  errors:
    depend_on_referenced_packages: ignore
''');
    return const ProjectMigrationSuccess();
  }
}

final class PubspecFile extends ProjectFile {
  const PubspecFile(
    super.projectRoot, {
    required this.projectName,
    required this.projectDisplayName,
    this.parentProject,
    this.additionalDependencies = const [],
  });

  final String projectName;
  final String projectDisplayName;
  final ParentProject? parentProject;
  final List<ProjectDependency> additionalDependencies;

  static final logger = Logger('PubspecFile');

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
        -1 =>
          pubspecYaml.nodes['environment']?.span.end.offset ??
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
      description: 'The Celest backend for $projectDisplayName.',
      publishTo: 'none',
      environment: {'sdk': PubEnvironment.dartSdkConstraint},
      dependencies: {
        ...ProjectDependency.backendDependencies,
        ...{
          for (final dependency in additionalDependencies)
            dependency.name: dependency,
        },
      }.toPub(),
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
    final file = fileSystem
        .directory(projectPaths.clientRoot)
        .childFile('pubspec.yaml');
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
