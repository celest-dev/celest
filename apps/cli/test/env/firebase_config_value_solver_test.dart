import 'dart:convert';

import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/database/cache/cache_database.dart';
import 'package:celest_cli/database/project/project_database.dart';
import 'package:celest_cli/env/firebase_config_value_solver.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/src/context.dart';
import 'package:checks/checks.dart';
import 'package:file/memory.dart';
import 'package:native_storage/native_storage.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:test/test.dart';

import '../common.dart';

Future<List<FirebaseProject>> _resolveProjectTest({
  String environmentId = 'production',
  Map<String, String>? projectAliases, // alias -> project ID
  String? globalProjectPointer,
  Map<String, Object?>? firebaseJson,
}) async {
  fileSystem = MemoryFileSystem.test(
    style: switch (platform.operatingSystem) {
      'windows' => FileSystemStyle.windows,
      _ => FileSystemStyle.posix,
    },
  );
  final appDir = fileSystem.systemTempDirectory.createTempSync('app_');
  if (firebaseJson != null) {
    appDir
        .childFile('firebase.json')
        .writeAsStringSync(jsonEncode(firebaseJson));
  }
  if (projectAliases != null) {
    appDir
        .childFile('.firebaserc')
        .writeAsStringSync(jsonEncode({'projects': projectAliases}));
  }
  if (globalProjectPointer != null) {
    final configPath = fileSystem.path.join(
      (platform.environment['HOME'] ?? platform.environment['USERPROFILE'])!,
      '.config',
      'configstore',
      'firebase-tools.json',
    );
    fileSystem.file(configPath)
      ..parent.createSync(recursive: true)
      ..writeAsStringSync(
        jsonEncode({
          'activeProjects': {appDir.path: globalProjectPointer},
        }),
      );
  }

  final celestDir = appDir.childDirectory('celest')..createSync();
  celestDir.childFile('pubspec.yaml').writeAsStringSync('''
name: celest_backend
''');

  final projectDb = ProjectDatabase.memory();
  final cacheDb = await CacheDatabase.memory();
  await init(
    projectRoot: celestDir.path,
    parentProject: ParentProject(
      name: 'app',
      path: appDir.path,
      pubspec: Pubspec('app'),
      pubspecYaml: '',
      type: SdkType.flutter,
    ),
    projectDb: projectDb,
    cacheDb: cacheDb,
  );
  final resolver = FirebaseConfigValueSolver(
    projectName: 'test',
    environmentId: environmentId,
    projectDb: projectDb,
  );

  return await resolver.searchLocalEnvironment() ?? const [];
}

void main() {
  initTests();

  group('FirebaseConfigValueSolver', () {
    setUp(() {
      secureStorage = NativeMemoryStorage();
    });

    test('no configuration', () async {
      final projects = await _resolveProjectTest();
      check(projects).isEmpty();
    });

    group('resolves flutterfire config', () {
      test('single project', () async {
        const projectId = 'firebase-test';
        final projects = await _resolveProjectTest(
          firebaseJson: {
            'flutter': {
              'platforms': {
                'android': {
                  'default': {'projectId': projectId},
                },
                'dart': {
                  'lib/firebase_options.dart': {'projectId': projectId},
                },
              },
            },
          },
        );
        check(projects).single.hasProjectId(projectId);
      });

      test('multiple projects', () async {
        const devProjectId = 'firebase-test-dev';
        const prodProjectId = 'firebase-test-prod';
        final projects = await _resolveProjectTest(
          firebaseJson: {
            'flutter': {
              'platforms': {
                'android': {
                  'default': {'projectId': devProjectId},
                },
                'dart': {
                  'lib/firebase_options_dev.dart': {'projectId': devProjectId},
                  'lib/firebase_options_prod.dart': {
                    'projectId': prodProjectId,
                  },
                },
              },
            },
          },
        );
        check(projects).unorderedMatches([
          (it) =>
              it.equals((active: false, projectId: devProjectId, alias: null)),
          (it) =>
              it.equals((active: false, projectId: prodProjectId, alias: null)),
        ]);
      });
    });

    group('global config', () {
      test('single project', () async {
        const projectId = 'firebase-test';
        final projects = await _resolveProjectTest(
          globalProjectPointer: projectId,
        );
        check(projects).single.hasProjectId(projectId);
      });

      test('multiple projects (projectId pointer)', () async {
        const devProjectId = 'firebase-test-dev';
        const prodProjectId = 'firebase-test-prod';
        final projects = await _resolveProjectTest(
          globalProjectPointer: devProjectId,
          projectAliases: {'dev': devProjectId, 'prod': prodProjectId},
        );
        check(projects).unorderedMatches([
          (it) =>
              it.equals((active: true, projectId: devProjectId, alias: 'dev')),
          (it) => it.equals((
            active: false,
            projectId: prodProjectId,
            alias: 'prod',
          )),
        ]);
      });

      test('multiple projects (alias pointer)', () async {
        const devProjectId = 'firebase-test-dev';
        const prodProjectId = 'firebase-test-prod';
        final projects = await _resolveProjectTest(
          globalProjectPointer: 'prod',
          projectAliases: {'dev': devProjectId, 'prod': prodProjectId},
        );
        check(projects).unorderedMatches([
          (it) =>
              it.equals((active: false, projectId: devProjectId, alias: 'dev')),
          (it) => it.equals((
            active: true,
            projectId: prodProjectId,
            alias: 'prod',
          )),
        ]);
      });
    });

    test('multiple projects (alias matches environment ID)', () async {
      const devProjectId = 'firebase-test-dev';
      const prodProjectId = 'firebase-test-prod';
      final projects = await _resolveProjectTest(
        environmentId: 'prod',
        globalProjectPointer: 'prod',
        projectAliases: {'dev': devProjectId, 'prod': prodProjectId},
      );

      // When there is an alias matching the environment ID, we always use that.
      check(projects).unorderedMatches([
        (it) =>
            it.equals((active: true, projectId: prodProjectId, alias: 'prod')),
      ]);
    });
  });
}

extension on Subject<FirebaseProject> {
  void hasProjectId(String projectId) =>
      has((it) => it.projectId, 'projectId').equals(projectId);
}
