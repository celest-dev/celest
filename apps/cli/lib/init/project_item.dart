import 'dart:convert';

import 'package:celest_cli/init/pub/project_dependency.dart';
import 'package:celest_cli/init/pub/pub_action.dart';
import 'package:celest_cli/init/pub/pub_environment.dart';
import 'package:celest_cli/init/pub/pubspec.dart';
import 'package:celest_cli/src/context.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:stream_transform/stream_transform.dart';

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

final class ProjectDependencyUpdater extends ProjectItem {
  const ProjectDependencyUpdater(this.appRoot);

  static final _logger = Logger('ProjectDependencyUpdater');

  final String? appRoot;

  @override
  Future<void> create(String projectRoot) async {
    _logger.fine('Updating project dependencies...');
    final pubspecFile = fileSystem.file(p.join(projectRoot, 'pubspec.yaml'));
    final pubspecYaml = await pubspecFile.readAsString();
    final pubspec = Pubspec.parse(pubspecYaml);
    final currentSdkVersion = pubspec.environment?['sdk'];
    final requiredSdkVersion = PubEnvironment.dartSdkConstraint;
    if (ProjectDependency.celest.upToDate(pubspec) &&
        ProjectDependency.celestCore.upToDate(pubspec) &&
        currentSdkVersion == requiredSdkVersion) {
      _logger.fine('Project dependencies are up to date.');
    } else {
      _logger.fine('Updating project dependencies to latest versions...');
      final updatedPubspec = pubspec.copyWith(
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
      await pubspecFile
          .writeAsString(updatedPubspec.toYaml(source: pubspecYaml));
    }
    _logger.fine('Running pub upgrade in "$projectRoot"...');
    // TODO(dnys1): Improve logic here so that we don't run pub upgrade if
    // the dependencies in the lockfile are already up to date.
    await Future.wait(eagerError: true, [
      runPub(
        action: PubAction.upgrade,
        workingDirectory: projectRoot,
      ),
      if (appRoot != null)
        runPub(
          exe: 'flutter',
          action: PubAction.upgrade,
          workingDirectory: appRoot!,
        ),
    ]);
    _logger.fine('Project dependencies updated');
  }
}

sealed class ProjectFile extends ProjectItem {
  const ProjectFile();

  const factory ProjectFile.gitIgnore() = _GitIgnore;

  const factory ProjectFile.analysisOptions() = _AnalysisOptions;

  const factory ProjectFile.pubspec(String projectName) = _Pubspec;

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
''',
    );
  }
}

final class _Pubspec extends ProjectFile {
  const _Pubspec(this.projectName);

  final String projectName;

  @override
  String get relativePath => 'pubspec.yaml';

  @override
  Future<void> create(String projectRoot) async {
    final file = fileSystem.file(p.join(projectRoot, relativePath));
    await file.create(recursive: true);
    final pubspec = Pubspec(
      'celest_backend',
      description: 'The Celest backend for $projectName.',
      publishTo: 'none',
      environment: {
        'sdk': PubEnvironment.dartSdkConstraint,
      },
      dependencies: ProjectDependency.dependencies,
      devDependencies: ProjectDependency.devDependencies,
    );
    await file.writeAsString(pubspec.toYaml());
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
