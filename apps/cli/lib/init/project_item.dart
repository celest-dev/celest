import 'dart:convert';

import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/pub/project_dependency.dart';
import 'package:celest_cli/pub/pub_action.dart';
import 'package:celest_cli/pub/pub_environment.dart';
import 'package:celest_cli/pub/pubspec.dart';
import 'package:celest_cli/src/context.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:yaml_edit/yaml_edit.dart';

sealed class ProjectItem {
  const ProjectItem();

  /// Creates the item in the given [projectRoot].
  Future<void> create(String projectRoot);
}

/// Updates the macOS entitlements plist to include the network client
/// capability.
final class MacOsEntitlements extends ProjectItem {
  const MacOsEntitlements(this.appRoot);

  final String appRoot;

  static final _logger = Logger('MacOsEntitlements');

  @override
  Future<void> create(String projectRoot) async {
    if (!platform.isMacOS) {
      return;
    }
    final macosDir = fileSystem.directory(appRoot).childDirectory('macos');
    if (!await macosDir.exists()) {
      _logger.finest('No macos directory. Skipping entitlements update.');
      return;
    }
    final entitlementFiles = await macosDir
        .list()
        .whereType<Directory>()
        .asyncExpand(
          (dir) => dir
              .list()
              .whereType<File>()
              .where((file) => p.extension(file.path) == '.entitlements'),
        )
        .toList();

    _logger.finest(() {
      final entitlementFileNames = entitlementFiles
          .map((e) => p.relative(e.path, from: macosDir.path))
          .join(', ');
      return 'Found ${entitlementFiles.length} entitlements files: '
          '$entitlementFileNames';
    });
    for (final entitlements in entitlementFiles) {
      _logger.fine('Updating entitlements file at ${entitlements.path}...');
      final add = await processManager.run(
        [
          '/usr/libexec/PlistBuddy',
          '-c',
          'Add :com.apple.security.network.client bool true',
          entitlements.path,
        ],
        stdoutEncoding: utf8,
        stderrEncoding: utf8,
      );
      if (add.exitCode != 0) {
        if (add.stderr.toString().contains('Entry Already Exists')) {
          _logger.fine('Network client entitlement already exists.');
        } else {
          performance.captureError(
            'Failed to add network client entitlement to ${entitlements.path}: '
            '${add.stdout}\n${add.stderr}',
          );
        }
        continue;
      }
    }
  }
}

final class PubspecUpdater extends ProjectItem {
  PubspecUpdater(this.appRoot, this.projectName);

  static final _logger = Logger('PubspecUpdater');

  final String? appRoot;
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

    if (appRoot case final appRoot?) {
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

  Future<void> _updateDependencies() async {
    final currentSdkVersion = pubspec.environment?['sdk'];
    final requiredSdkVersion = PubEnvironment.dartSdkConstraint;
    if (ProjectDependency.celest.upToDate(pubspec) &&
        currentSdkVersion == requiredSdkVersion &&
        !pubspec.dependencies.containsKey('celest_core')) {
      _logger.fine('Project dependencies are up to date.');
      return;
    }
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
  }

  @override
  Future<void> create(String projectRoot) async {
    _logger.fine('Updating project pubspec...');
    this.projectRoot = projectRoot;
    pubspecFile = fileSystem.file(p.join(projectRoot, 'pubspec.yaml'));
    pubspecYaml = await pubspecFile.readAsString();
    pubspec = Pubspec.parse(pubspecYaml);
    // await _updateProjectName();
    await _updateDependencies();
    _logger.fine('Project pubspec updated');
  }
}

sealed class ProjectFile extends ProjectItem {
  const ProjectFile();

  const factory ProjectFile.gitIgnore() = _GitIgnore;

  const factory ProjectFile.analysisOptions() = _AnalysisOptions;

  const factory ProjectFile.pubspec(String projectName, String appRoot) =
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

final class _Pubspec extends ProjectFile {
  const _Pubspec(this.projectName, this.appRoot);

  final String projectName;
  final String appRoot;

  @override
  String get relativePath => 'pubspec.yaml';

  /// Ensures app has dependency on celest project
  Future<void> _updateAppPubspec() async {
    final appPubspecFile = fileSystem.file(
      p.join(projectPaths.appRoot, 'pubspec.yaml'),
    );
    final projectPubspecName = 'api_${projectName.snakeCase}';
    final appPubspecYaml = await appPubspecFile.readAsString();
    if (!Pubspec.parse(appPubspecYaml)
        .dependencies
        .containsKey(projectPubspecName)) {
      final updatedPubspec = YamlEditor(appPubspecYaml)
        ..update(
          ['dependencies', projectPubspecName],
          {'path': 'celest/'},
        );
      await appPubspecFile.writeAsString(updatedPubspec.toString());
      try {
        await runPub(
          exe: 'flutter',
          action: PubAction.get,
          workingDirectory: projectPaths.appRoot,
        );
      } on Exception catch (e, st) {
        performance.captureError(e, stackTrace: st);
      }
    }
  }

  @override
  Future<void> create(String projectRoot) async {
    final file = fileSystem.file(p.join(projectRoot, relativePath));
    await file.create(recursive: true);
    final pubspec = Pubspec(
      'api_${projectName.snakeCase}',
      description: 'The Celest backend for $projectName.',
      publishTo: 'none',
      environment: {
        'sdk': PubEnvironment.dartSdkConstraint,
      },
      dependencies: ProjectDependency.dependencies,
      devDependencies: ProjectDependency.devDependencies,
    );
    await file.writeAsString(pubspec.toYaml());
    await _updateAppPubspec();
  }
}

sealed class ProjectTemplate extends ProjectItem {
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

import 'package:celest_backend/exceptions/bad_name_exception.dart';
import 'package:celest_backend/models/person.dart';

/// Says hello to a [person].
Future<String> sayHello({required Person person}) async {
  if (person.name.isEmpty) {
    // Throw a custom exception defined in the `lib/exceptions/` and catch
    // it on the frontend.
    throw BadNameException('Name cannot be empty');
  }

  // Logging is handled automatically when you print to the console.
  print('Saying hello to ${person.name}');

  return 'Hello, ${person.name}!';
}
''',
      ),
      _createFile(
        p.join(projectRoot, 'test', 'functions', 'greeting_test.dart'),
        '''
import 'package:celest_backend/exceptions/bad_name_exception.dart';
import 'package:celest_backend/models/person.dart';
import 'package:test/test.dart';

import '../../functions/greeting.dart';

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
        p.join(projectRoot, 'lib', 'models', 'person.dart'),
        '''
// By convention, any custom types used within an API request/response must be
// defined in the `models/` folder.

class Person {
  const Person({required this.name});

  final String name;
}
''',
      ),
      _createFile(
        p.join(projectRoot, 'lib', 'exceptions', 'bad_name_exception.dart'),
        r'''
// By convention, any custom exception types thrown by an API must be defined
// in this file or exported from this file.

class BadNameException implements Exception {
  const BadNameException(this.message);

  final String message;

  @override
  String toString() => 'BadNameException: $message';
}
''',
      ),
    ]);
  }
}

Future<void> _createFile(String path, String contents) async {
  final file = fileSystem.file(path);
  await file.create(recursive: true);
  await file.writeAsString(contents);
}
