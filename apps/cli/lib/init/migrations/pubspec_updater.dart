import 'package:celest_cli/init/project_migration.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/pub/project_dependency.dart';
import 'package:celest_cli/pub/pub_action.dart';
import 'package:celest_cli/pub/pub_environment.dart';
import 'package:celest_cli/pub/pubspec.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/recase.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:yaml_edit/yaml_edit.dart' hide SourceEdit;

final class PubspecUpdater extends ProjectMigration {
  const PubspecUpdater(super.projectRoot, this.parentProject, this.projectName);

  static final _logger = Logger('PubspecUpdater');

  final ParentProject? parentProject;
  final String projectName;

  @override
  String get name => 'core.project.pubspec';

  @override
  bool get needsMigration => true;

  // TODO(dnys1): Update project names when we can update all Dart code which
  /// currently references `celest_backend`.
  // ignore: unused_element
  Future<void> _updateProjectName({
    required Pubspec pubspec,
    required String pubspecYaml,
    required File pubspecFile,
  }) async {
    if (pubspec.name.startsWith('api_')) {
      _logger.fine('Project name is already in the correct format.');
      return;
    }
    final oldPubspecName = pubspec.name;
    final pubspecName = 'api_${projectName.snakeCase}';
    _logger.fine('Updating project name...');
    pubspec = pubspec.copyWith(name: pubspecName);
    pubspecYaml = pubspec.toYaml(source: pubspecYaml);
    await pubspecFile.writeAsString(pubspecYaml);

    if (parentProject?.path case final appRoot?) {
      final appRootPubspec = fileSystem.file(p.join(appRoot, 'pubspec.yaml'));
      final appEditor = YamlEditor(await appRootPubspec.readAsString());
      appEditor
        ..remove(['dependencies', oldPubspecName])
        ..update(['dependencies', pubspecName], {'path': 'celest/'});
    }
  }

  /// Returns the version updated from.
  Future<Version?> _updateBackendDependencies({
    required Pubspec pubspec,
    required String pubspecYaml,
    required File pubspecFile,
  }) async {
    final currentSdkVersion = pubspec.environment['sdk'];
    final requiredSdkVersion = PubEnvironment.dartSdkConstraint;
    if (ProjectDependency.backendDependencies.upToDate(pubspec) &&
        currentSdkVersion == requiredSdkVersion) {
      _logger.fine('Project dependencies are up to date.');
      return null;
    }
    final fromVersion = switch (pubspec.dependencies['celest']) {
      final HostedDependency hosted => switch (hosted.version) {
        final Version version => version,
        final VersionRange range => range.min,
        _ => Version.none,
      },
      _ => Version.none,
    };
    _logger.fine('Updating project dependencies to latest versions...');
    pubspec = pubspec.copyWith(
      environment: {'sdk': PubEnvironment.dartSdkConstraint},
      dependencies: {
        ...pubspec.dependencies,
        ...ProjectDependency.backendDependencies.toPub(),
      },
      devDependencies: {
        ...pubspec.devDependencies,
        ...ProjectDependency.devDependencies.toPub(),
      },
      dependencyOverrides: {
        ...pubspec.dependencyOverrides,
        ...?ProjectDependency.localDependencyOverrides(
          projectRoot: projectRoot,
        ),
      },
    );
    pubspecYaml = pubspec.toYaml(source: pubspecYaml);
    await pubspecFile.writeAsString(pubspecYaml);
    return fromVersion;
  }

  Future<bool> _updateClientDependencies({
    required Directory clientRoot,
    required Pubspec pubspec,
    required String pubspecYaml,
    required File pubspecFile,
  }) async {
    final currentSdkVersion = pubspec.environment['sdk'];
    final requiredSdkVersion = PubEnvironment.dartSdkConstraint;
    if (ProjectDependency.clientDependencies.upToDate(pubspec) &&
        currentSdkVersion == requiredSdkVersion) {
      _logger.fine('Project dependencies are up to date.');
      return false;
    }
    _logger.fine('Updating client dependencies to latest versions...');
    pubspec = pubspec.copyWith(
      environment: {'sdk': PubEnvironment.dartSdkConstraint},
      dependencies: {
        ...pubspec.dependencies,
        ...ProjectDependency.clientDependencies.toPub(),
      },
      devDependencies: {
        ...pubspec.devDependencies,
        ...ProjectDependency.devDependencies.toPub(),
      },
      dependencyOverrides: {
        ...pubspec.dependencyOverrides,
        ...?ProjectDependency.localDependencyOverrides(
          projectRoot: clientRoot.path,
        ),
      },
    );
    pubspecYaml = pubspec.toYaml(source: pubspecYaml);
    await pubspecFile.writeAsString(pubspecYaml);
    return true;
  }

  /// Ensures app has dependency on celest project
  Future<void> _updateAppPubspec() async {
    final parentProject = this.parentProject;
    if (parentProject == null) {
      return;
    }
    final projectPubspecName = '${projectName.snakeCase}_client';
    final pubspec = parentProject.pubspec;
    final missingClient = !pubspec.dependencies.containsKey(projectPubspecName);
    final legacyBackend = pubspec.dependencies.containsKey('celest_backend');
    final needsMigration = missingClient || legacyBackend;
    if (!needsMigration) {
      return;
    }
    _logger.fine('Updating app pubspec...');
    final editor = YamlEditor(parentProject.pubspecYaml);
    if (legacyBackend) {
      editor.remove(['dependencies', 'celest_backend']);
    }
    if (missingClient) {
      editor.update(
        ['dependencies', projectPubspecName],
        {'path': 'celest/client/'},
      );
    }
    await fileSystem
        .directory(parentProject.path)
        .childFile('pubspec.yaml')
        .writeAsString(editor.toString());
  }

  @override
  Future<ProjectMigrationResult> create() async {
    _logger.fine('Updating project pubspec...');

    var needsAnalyzerMigration = false;
    final operations = <Future<void>>[];

    // Update backend dependencies
    {
      final pubspecFile = fileSystem.file(p.join(projectRoot, 'pubspec.yaml'));
      final pubspecYaml = await pubspecFile.readAsString();
      final pubspec = Pubspec.parse(pubspecYaml);
      final fromVersion = await _updateBackendDependencies(
        pubspec: pubspec,
        pubspecYaml: pubspecYaml,
        pubspecFile: pubspecFile,
      );
      // await _updateProjectName();
      needsAnalyzerMigration |=
          fromVersion != null && fromVersion < Version(1, 0, 0).firstPreRelease;
      if (needsAnalyzerMigration) {
        operations.add(
          runPub(action: PubAction.get, workingDirectory: projectRoot),
        );
      }
      _logger.fine('Backend pubspec updated');
    }

    // Update client dependencies
    final clientRoot = fileSystem.directory(projectPaths.clientRoot);
    final clientPubspecFile = clientRoot.childFile('pubspec.yaml');
    if (clientPubspecFile.existsSync()) {
      final clientPubspecYaml = await clientPubspecFile.readAsString();
      final clientPubspec = Pubspec.parse(clientPubspecYaml);
      final clientNeedsMigration = await _updateClientDependencies(
        clientRoot: clientRoot,
        pubspec: clientPubspec,
        pubspecYaml: clientPubspecYaml,
        pubspecFile: clientPubspecFile,
      );
      needsAnalyzerMigration |= clientNeedsMigration;
      if (clientNeedsMigration) {
        operations.add(
          runPub(action: PubAction.get, workingDirectory: clientRoot.path),
        );
      }
      _logger.fine('Client pubspec updated');
    }

    // Update app pubspec
    await _updateAppPubspec();

    return ProjectMigrationSuccess(
      needsAnalyzerMigration: needsAnalyzerMigration,
    );
  }
}
