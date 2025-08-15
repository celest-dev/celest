import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/env/env_manager.dart';
import 'package:celest_cli/src/project/project_paths.dart';
import 'package:checks/checks.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('EnvManager', () {
    setUpAll(initTests);

    test('overlay', () async {
      final projectDir = fileSystem.systemTempDirectory.createTempSync(
        'project',
      );
      projectDir.childFile('.env').writeAsStringSync('''
PROJECT_ID=test
PROJECT_NAME="Test Project"
''');
      projectDir.childFile('.env.local').writeAsStringSync('''
PROJECT_ID=local
''');
      projectPaths = ProjectPaths(projectDir.path);
      final localManager = await EnvManager().environment('local');
      final prodManager = await EnvManager().environment('production');

      await check(
        localManager.valueFor('PROJECT_ID'),
      ).completes((it) => it.equals('local'));
      await check(
        localManager.valueFor('PROJECT_NAME'),
      ).completes((it) => it.equals('Test Project'));

      await check(
        prodManager.valueFor('PROJECT_ID'),
      ).completes((it) => it.equals('test'));
      await check(
        prodManager.valueFor('PROJECT_NAME'),
      ).completes((it) => it.equals('Test Project'));
    });

    test('updates', () async {
      final projectDir = fileSystem.systemTempDirectory.createTempSync(
        'project',
      );
      final envFile = projectDir.childFile('.env');
      envFile.writeAsStringSync('''
PROJECT_ID=test
PROJECT_NAME="Test Project"
''');
      final lastModified = envFile.lastModifiedSync();
      projectPaths = ProjectPaths(projectDir.path);
      final localManager = await EnvManager().environment('local');

      await check(
        localManager.valueFor('PROJECT_ID'),
      ).completes((it) => it.equals('test'));
      await check(
        localManager.valueFor('PROJECT_NAME'),
      ).completes((it) => it.equals('Test Project'));

      // TODO(dnys1): Use `package:clock` or fake_async instead.
      await Future<void>.delayed(const Duration(seconds: 1));
      envFile.writeAsStringSync('''
PROJECT_ID=local
PROJECT_NAME="Local Project"
''');
      check(envFile.lastModifiedSync()).isGreaterThan(lastModified);

      await check(
        localManager.valueFor('PROJECT_ID'),
      ).completes((it) => it.equals('local'));
      await check(
        localManager.valueFor('PROJECT_NAME'),
      ).completes((it) => it.equals('Local Project'));
    });
  });
}
