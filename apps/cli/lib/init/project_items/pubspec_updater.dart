import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/init/project_item.dart';
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

final class PubspecUpdater extends ProjectItem {
  PubspecUpdater(this.parentProject, this.projectName);

  static final _logger = Logger('PubspecUpdater');

  final ParentProject? parentProject;
  final String? projectName;
  late final String projectRoot;

  late final File pubspecFile;
  late Pubspec pubspec;
  late String pubspecYaml;

  // TODO(dnys1): Update project names when we can update all Dart code which
  /// currently references `celest_backend`.
  Future<void> _updateProjectName() async {
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
  Future<Version?> _updateDependencies() async {
    final currentSdkVersion = pubspec.environment?['sdk'];
    final requiredSdkVersion = PubEnvironment.dartSdkConstraint;
    if (ProjectDependency.celest.upToDate(pubspec) &&
        currentSdkVersion == requiredSdkVersion &&
        !pubspec.dependencies.containsKey('celest_core')) {
      _logger.fine('Project dependencies are up to date.');
      return null;
    }
    final fromVersion = switch (
            (pubspec.dependencies['celest'] as HostedDependency?)?.version) {
          final Version version => version,
          final VersionRange range => range.min,
          _ => null,
        } ??
        Version.none;
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

  @override
  Future<bool> create(String projectRoot) async {
    _logger.fine('Updating project pubspec...');
    this.projectRoot = projectRoot;
    pubspecFile = fileSystem.file(p.join(projectRoot, 'pubspec.yaml'));
    pubspecYaml = await pubspecFile.readAsString();
    pubspec = Pubspec.parse(pubspecYaml);
    // await _updateProjectName();
    final fromVersion = await _updateDependencies();
    _logger.fine('Project pubspec updated');
    await runPub(action: PubAction.get, workingDirectory: projectRoot);
    return fromVersion != null && fromVersion < Version(0, 4, 0);
  }
}
