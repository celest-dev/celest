import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/init/project_migration.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/pub/project_dependency.dart';
import 'package:celest_cli/pub/pub_action.dart';
import 'package:celest_cli/pub/pub_environment.dart';
import 'package:celest_cli/pub/pubspec.dart';
import 'package:celest_cli/src/context.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:yaml_edit/yaml_edit.dart' hide SourceEdit;

final class PubspecUpdater extends ProjectMigration {
  PubspecUpdater(this.parentProject, this.projectName);

  static final _logger = Logger('PubspecUpdater');

  final ParentProject? parentProject;
  final String? projectName;
  late final String projectRoot;

  // TODO(dnys1): Update project names when we can update all Dart code which
  /// currently references `celest_backend`.
  Future<void> _updateProjectName({
    required Pubspec pubspec,
    required String pubspecYaml,
    required File pubspecFile,
  }) async {
    if (pubspec.name.startsWith('api_')) {
      _logger.fine('Project name is already in the correct format.');
      return;
    }
    if (projectName == null) {
      // TODO(dnys1): Test and find better strategy. `projectName` should be
      // nonnull at this point.
      _logger.fine('Project name unknown. Skipping until DB is current.');
      return;
    }
    final oldPubspecName = pubspec.name;
    final pubspecName = 'api_${projectName!.snakeCase}';
    _logger.fine('Updating project name...');
    pubspec = pubspec.copyWith(name: pubspecName);
    pubspecYaml = pubspec.toYaml(source: pubspecYaml);
    await pubspecFile.writeAsString(pubspecYaml);

    if (parentProject?.path case final appRoot?) {
      final appRootPubspec = fileSystem.file(p.join(appRoot, 'pubspec.yaml'));
      final appEditor = YamlEditor(await appRootPubspec.readAsString());
      appEditor
        ..remove(['dependencies', oldPubspecName])
        ..update(
          ['dependencies', pubspecName],
          {'path': 'celest/'},
        );
    }
  }

  /// Returns the version updated from.
  Future<Version?> _updateBackendDependencies({
    required Pubspec pubspec,
    required String pubspecYaml,
    required File pubspecFile,
  }) async {
    final currentSdkVersion = pubspec.environment?['sdk'];
    final requiredSdkVersion = PubEnvironment.dartSdkConstraint;
    if (ProjectDependency.celest.upToDate(pubspec) &&
        currentSdkVersion == requiredSdkVersion &&
        !pubspec.dependencies.containsKey('celest_core')) {
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
    if (pubspec.dependencies.containsKey('celest_core')) {
      final editor = YamlEditor(pubspecYaml)
        ..remove(['dependencies', 'celest_core']);
      pubspecYaml = editor.toString();
    }
    pubspec = pubspec.copyWith(
      environment: {
        'sdk': PubEnvironment.dartSdkConstraint,
      },
      dependencies: {
        for (final entry in pubspec.dependencies.entries)
          entry.key: ProjectDependency.dependencies[entry.key] ?? entry.value,
      }..remove('celest_core'),
      devDependencies: {
        for (final entry in pubspec.devDependencies.entries)
          entry.key:
              ProjectDependency.devDependencies[entry.key] ?? entry.value,
      },
    );
    pubspecYaml = pubspec.toYaml(source: pubspecYaml);
    await pubspecFile.writeAsString(pubspecYaml);
    return fromVersion;
  }

  Future<bool> _updateClientDependencies({
    required Pubspec pubspec,
    required String pubspecYaml,
    required File pubspecFile,
  }) async {
    final currentSdkVersion = pubspec.environment?['sdk'];
    final requiredSdkVersion = PubEnvironment.dartSdkConstraint;
    if (ProjectDependency.celestCore.upToDate(pubspec) &&
        currentSdkVersion == requiredSdkVersion) {
      _logger.fine('Project dependencies are up to date.');
      return false;
    }
    _logger.fine('Updating client dependencies to latest versions...');
    pubspec = pubspec.copyWith(
      environment: {
        'sdk': PubEnvironment.dartSdkConstraint,
      },
      dependencies: {
        for (final entry in pubspec.dependencies.entries)
          entry.key: ProjectDependency.dependencies[entry.key] ?? entry.value,
      },
      devDependencies: {
        for (final entry in pubspec.devDependencies.entries)
          entry.key:
              ProjectDependency.devDependencies[entry.key] ?? entry.value,
      },
    );
    pubspecYaml = pubspec.toYaml(source: pubspecYaml);
    await pubspecFile.writeAsString(pubspecYaml);
    return true;
  }

  @override
  Future<bool> create(String projectRoot) async {
    _logger.fine('Updating project pubspec...');
    this.projectRoot = projectRoot;

    var needsMigration = false;
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
      needsMigration |= fromVersion != null && fromVersion < Version(0, 4, 0);
      if (needsMigration) {
        operations.add(
          runPub(
            action: PubAction.get,
            workingDirectory: projectRoot,
          ),
        );
      }
      _logger.fine('Backend pubspec updated');
    }

    // Update client dependencies
    final clientOutputsDir = fileSystem.directory(projectPaths.clientRoot);
    final clientPubspecFile = clientOutputsDir.childFile('pubspec.yaml');
    if (clientPubspecFile.existsSync()) {
      final clientPubspecYaml = await clientPubspecFile.readAsString();
      final clientPubspec = Pubspec.parse(clientPubspecYaml);
      final clientNeedsMigration = await _updateClientDependencies(
        pubspec: clientPubspec,
        pubspecYaml: clientPubspecYaml,
        pubspecFile: clientPubspecFile,
      );
      needsMigration |= clientNeedsMigration;
      if (clientNeedsMigration) {
        operations.add(
          runPub(
            action: PubAction.get,
            workingDirectory: clientOutputsDir.path,
          ),
        );
      }
      _logger.fine('Client pubspec updated');
    }

    return needsMigration;
  }
}
