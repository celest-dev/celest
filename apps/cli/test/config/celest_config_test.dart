import 'package:celest_cli/src/context.dart' as ctx;
import 'package:celest_cli/src/context.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('CelestConfig', () {
    setUp(initTests);

    test('migrates to local storage', () async {
      ctx.fileSystem = MemoryFileSystem.test();
      final configHome = ctx.fileSystem.systemTempDirectory.childDirectory(
        'config',
      )..createSync(recursive: true);

      final configJson = configHome.childFile('config.json');
      configJson.writeAsStringSync('{"organization_id": "org-id"}');
      await init(
        projectRoot: ctx.fileSystem.systemTempDirectory.path,
        configHome: configHome.path,
      );

      expect(await celestProject.config.settings.getOrganizationId(), 'org-id');
      expect(await configJson.exists(), isFalse);
    });
  });
}
