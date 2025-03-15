import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/init/migrations/pubspec_updater.dart';
import 'package:celest_cli/src/init/project_migration.dart';
import 'package:celest_cli/src/project/celest_project.dart';
import 'package:celest_cli/src/pub/project_dependency.dart';
import 'package:celest_cli/src/pub/pub_environment.dart';
import 'package:file/file.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:test/test.dart';

import '../analyzer/celest_analyzer_test.dart';

const _projectName = 'celest_backend';

String _pubspecYaml({
  String name = _projectName,
  VersionConstraint? sdk,
  VersionConstraint? celest,
  VersionConstraint? celestCore,
}) {
  final sdkConstraint = sdk ?? PubEnvironment.dartSdkConstraint;
  final celestConstraint =
      celest ?? ProjectDependency.celest.pubDependency.version;

  return '''
name: $name

environment:
  sdk: $sdkConstraint

dependencies:
  celest: $celestConstraint
''';
}

void main() {
  group('ProjectDependencyUpdater', skip: true, () {
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

    test('up-to-date constraints', () async {
      final pubspecYaml = _pubspecYaml();
      await newProject(
        name: _projectName,
        pubspecYaml: pubspecYaml,
        parentDirectory: tempDir.path,
      );

      final updater = PubspecUpdater(
        projectPaths.projectRoot,
        null,
        _projectName,
      );
      await updater.create();

      final updatedPubspec =
          await fileSystem.file(projectPaths.pubspecYaml).readAsString();
      expect(updatedPubspec, equalsIgnoringWhitespace(pubspecYaml));
    });

    test('out-of-date sdk', () async {
      final pubspecYaml = _pubspecYaml(sdk: VersionConstraint.parse('^3.2.0'));
      await newProject(
        name: _projectName,
        pubspecYaml: pubspecYaml,
        parentDirectory: tempDir.path,
      );

      final updater = PubspecUpdater(
        projectPaths.projectRoot,
        null,
        _projectName,
      );
      await updater.create();

      final updatedPubspec =
          await fileSystem.file(projectPaths.pubspecYaml).readAsString();
      expect(updatedPubspec, equalsIgnoringWhitespace(_pubspecYaml()));
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

      final updater = PubspecUpdater(
        projectPaths.projectRoot,
        null,
        _projectName,
      );
      await updater.create();

      final updatedPubspec =
          await fileSystem.file(projectPaths.pubspecYaml).readAsString();
      expect(
        updatedPubspec,
        equalsIgnoringWhitespace(_pubspecYaml()),
        reason: 'Updates celest constraint + removes celest_core',
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

      final updater = PubspecUpdater(
        projectPaths.projectRoot,
        null,
        _projectName,
      );
      await updater.create();

      final updatedPubspec =
          await fileSystem.file(projectPaths.pubspecYaml).readAsString();
      expect(
        updatedPubspec,
        equalsIgnoringWhitespace(_pubspecYaml()),
        reason: 'Updates celest constraint',
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

      final updater = PubspecUpdater(
        projectPaths.projectRoot,
        null,
        _projectName,
      );
      await updater.create();

      final updatedPubspec =
          await fileSystem.file(projectPaths.pubspecYaml).readAsString();
      expect(
        updatedPubspec,
        equalsIgnoringWhitespace(_pubspecYaml()),
        reason: 'Adds celest constraint + removes celest_core',
      );
    });
  });

  group('PubspecFile', () {
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

    test('barebones dart project', () async {
      const pubspecYaml = '''
name: barebones
description: A sample command-line application.
version: 1.0.0
# repository: https://github.com/my_org/my_repo

environment:
  sdk: ^3.4.1
''';

      await tempDir.childFile('pubspec.yaml').writeAsString(pubspecYaml);
      await PubspecFile(
        p.join(tempDir.path, 'celest'),
        'barebones',
        ParentProject(
          name: 'barebones',
          path: tempDir.path,
          pubspec: Pubspec.parse(pubspecYaml),
          pubspecYaml: pubspecYaml,
          type: SdkType.dart,
        ),
      ).create();

      final updatedPubspecYaml =
          await tempDir.childFile('pubspec.yaml').readAsString();
      expect(
        updatedPubspecYaml,
        equalsIgnoringWhitespace('''
name: barebones
description: A sample command-line application.
version: 1.0.0
# repository: https://github.com/my_org/my_repo

environment:
  sdk: ^3.4.1

dependencies:
  barebones_client:
    path: celest/client/
'''),
      );

      final updatedPubspec = Pubspec.parse(updatedPubspecYaml);
      expect(updatedPubspec.dependencies, contains('barebones_client'));
    });

    test('empty dart project', () async {
      const pubspecYaml = '''
name: empty
description: A sample command-line application.
version: 1.0.0
# repository: https://github.com/my_org/my_repo

environment:
  sdk: ^3.4.1

# Add regular dependencies here.
dependencies:
  # path: ^1.8.0

dev_dependencies:
  lints: ^3.0.0
  test: ^1.24.0
''';

      await tempDir.childFile('pubspec.yaml').writeAsString(pubspecYaml);
      await PubspecFile(
        p.join(tempDir.path, 'celest'),
        'empty',
        ParentProject(
          name: 'empty',
          path: tempDir.path,
          pubspec: Pubspec.parse(pubspecYaml),
          pubspecYaml: pubspecYaml,
          type: SdkType.dart,
        ),
      ).create();

      final updatedPubspecYaml =
          await tempDir.childFile('pubspec.yaml').readAsString();
      expect(
        updatedPubspecYaml,
        equalsIgnoringWhitespace('''
name: empty
description: A sample command-line application.
version: 1.0.0
# repository: https://github.com/my_org/my_repo

environment:
  sdk: ^3.4.1

# Add regular dependencies here.
dependencies:
  empty_client:
    path: celest/client/

dev_dependencies:
  lints: ^3.0.0
  test: ^1.24.0
'''),
      );

      final updatedPubspec = Pubspec.parse(updatedPubspecYaml);
      expect(updatedPubspec.dependencies, contains('empty_client'));
    });

    test('existing dart project', () async {
      const pubspecYaml = '''
name: existing
description: A sample command-line application.
version: 1.0.0
# repository: https://github.com/my_org/my_repo

environment:
  sdk: ^3.4.1

dependencies:
  path: ^1.8.0

dev_dependencies:
  lints: ^3.0.0
  test: ^1.24.0
''';

      await tempDir.childFile('pubspec.yaml').writeAsString(pubspecYaml);
      await PubspecFile(
        p.join(tempDir.path, 'celest'),
        'existing',
        ParentProject(
          name: 'existing',
          path: tempDir.path,
          pubspec: Pubspec.parse(pubspecYaml),
          pubspecYaml: pubspecYaml,
          type: SdkType.dart,
        ),
      ).create();

      final updatedPubspecYaml =
          await tempDir.childFile('pubspec.yaml').readAsString();
      expect(
        updatedPubspecYaml,
        equalsIgnoringWhitespace('''
name: existing
description: A sample command-line application.
version: 1.0.0
# repository: https://github.com/my_org/my_repo

environment:
  sdk: ^3.4.1

dependencies:
  existing_client:
    path: celest/client/
  path: ^1.8.0

dev_dependencies:
  lints: ^3.0.0
  test: ^1.24.0
'''),
      );

      final updatedPubspec = Pubspec.parse(updatedPubspecYaml);
      expect(updatedPubspec.dependencies, contains('existing_client'));
    });

    test('existing celest project', () async {
      const pubspecYaml = '''
name: existing
description: A sample command-line application.
version: 1.0.0
# repository: https://github.com/my_org/my_repo

environment:
  sdk: ^3.4.1

dependencies:
  existing_client:
    path: celest/client/
  path: ^1.8.0

dev_dependencies:
  lints: ^3.0.0
  test: ^1.24.0
''';

      await tempDir.childFile('pubspec.yaml').writeAsString(pubspecYaml);
      await PubspecFile(
        p.join(tempDir.path, 'celest'),
        'existing',
        ParentProject(
          name: 'existing',
          path: tempDir.path,
          pubspec: Pubspec.parse(pubspecYaml),
          pubspecYaml: pubspecYaml,
          type: SdkType.dart,
        ),
      ).create();

      final updatedPubspecYaml =
          await tempDir.childFile('pubspec.yaml').readAsString();
      expect(
        updatedPubspecYaml,
        equalsIgnoringWhitespace('''
name: existing
description: A sample command-line application.
version: 1.0.0
# repository: https://github.com/my_org/my_repo

environment:
  sdk: ^3.4.1

dependencies:
  existing_client:
    path: celest/client/
  path: ^1.8.0

dev_dependencies:
  lints: ^3.0.0
  test: ^1.24.0
'''),
      );

      final updatedPubspec = Pubspec.parse(updatedPubspecYaml);
      expect(updatedPubspec.dependencies, contains('existing_client'));
    });
  });
}
