import 'package:celest_cli/init/project_item.dart';
import 'package:celest_cli/init/pub/project_dependency.dart';
import 'package:celest_cli/init/pub/pub_environment.dart';
import 'package:celest_cli/src/context.dart';
import 'package:file/file.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';

import '../analyzer/celest_analyzer_test.dart';

const _projectName = 'test_project';

String _pubspecYaml({
  VersionConstraint? sdk,
  VersionConstraint? celest,
  VersionConstraint? celestCore,
}) {
  final sdkConstraint = sdk ?? PubEnvironment.dartSdkConstraint;
  final celestConstraint =
      celest ?? ProjectDependency.celest.pubDependency.version;
  final celestCoreConstraint =
      celestCore ?? ProjectDependency.celestCore.pubDependency.version;

  return '''
name: $_projectName

environment:
  sdk: $sdkConstraint

dependencies:
  celest: $celestConstraint
  celest_core: $celestCoreConstraint
''';
}

void main() {
  group('ProjectDependencyUpdater', () {
    late Directory tempDir;

    setUpAll(() async {
      tempDir = await fileSystem.systemTempDirectory.createTemp('celest_test_');
    });

    tearDownAll(() async {
      try {
        await tempDir.delete(recursive: true);
      } on Object {
        // OK, may fail on Windows in CI.
      }
    });

    test('up-to-date', () async {
      final pubspecYaml = _pubspecYaml();
      await newProject(
        name: _projectName,
        pubspecYaml: pubspecYaml,
        parentDirectory: tempDir.path,
      );

      const updater = ProjectDependencyUpdater(null);
      await updater.create(projectPaths.projectRoot);

      final updatedPubspec =
          await fileSystem.file(projectPaths.pubspecYaml).readAsString();
      expect(updatedPubspec, equalsIgnoringWhitespace(pubspecYaml));
    });

    test('out-of-date sdk', () async {
      final pubspecYaml = _pubspecYaml(
        sdk: VersionConstraint.parse('^3.2.0'),
      );
      await newProject(
        name: _projectName,
        pubspecYaml: pubspecYaml,
        parentDirectory: tempDir.path,
      );

      const updater = ProjectDependencyUpdater(null);
      await updater.create(projectPaths.projectRoot);

      final updatedPubspec =
          await fileSystem.file(projectPaths.pubspecYaml).readAsString();
      expect(
        updatedPubspec,
        equalsIgnoringWhitespace(_pubspecYaml()),
      );
    });

    test('out-of-date celest+celest_core', () async {
      final pubspecYaml = _pubspecYaml(
        celest: VersionConstraint.parse('^0.1.0'),
        celestCore: VersionConstraint.parse('^0.1.0'),
      );
      await newProject(
        name: _projectName,
        pubspecYaml: pubspecYaml,
        parentDirectory: tempDir.path,
      );

      const updater = ProjectDependencyUpdater(null);
      await updater.create(projectPaths.projectRoot);

      final updatedPubspec =
          await fileSystem.file(projectPaths.pubspecYaml).readAsString();
      expect(
        updatedPubspec,
        equalsIgnoringWhitespace(_pubspecYaml()),
      );
    });

    test('out-of-date celest', () async {
      final pubspecYaml = _pubspecYaml(
        celest: VersionConstraint.parse('^0.1.0'),
      );
      await newProject(
        name: _projectName,
        pubspecYaml: pubspecYaml,
        parentDirectory: tempDir.path,
      );

      const updater = ProjectDependencyUpdater(null);
      await updater.create(projectPaths.projectRoot);

      final updatedPubspec =
          await fileSystem.file(projectPaths.pubspecYaml).readAsString();
      expect(
        updatedPubspec,
        equalsIgnoringWhitespace(_pubspecYaml()),
      );
    });

    test('out-of-date celest_core', () async {
      final pubspecYaml = _pubspecYaml(
        celestCore: VersionConstraint.parse('^0.1.0'),
      );
      await newProject(
        name: _projectName,
        pubspecYaml: pubspecYaml,
        parentDirectory: tempDir.path,
      );

      const updater = ProjectDependencyUpdater(null);
      await updater.create(projectPaths.projectRoot);

      final updatedPubspec =
          await fileSystem.file(projectPaths.pubspecYaml).readAsString();
      expect(
        updatedPubspec,
        equalsIgnoringWhitespace(_pubspecYaml()),
      );
    });
  });
}
