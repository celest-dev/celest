import 'package:celest_cli/src/context.dart' as ctx;
import 'package:celest_cli/src/context.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('CelestConfig', () {
    setUp(initTests);

    test('delete clears all storage interfaces', () async {
      ctx.fileSystem = MemoryFileSystem.test();
      await init(projectRoot: ctx.fileSystem.systemTempDirectory.path);

      expect(
        await celestProject.config.secureSettings.getOrganizationId(),
        isNull,
      );
      await celestProject.config.secureSettings.setOrganizationId('org-id');
      expect(
        await celestProject.config.secureSettings.getOrganizationId(),
        'org-id',
      );

      expect(celestProject.config.settings.pubCacheFixDigest, isNull);
      celestProject.config.settings.pubCacheFixDigest = 'digest';
      expect(celestProject.config.settings.pubCacheFixDigest, 'digest');

      await celestProject.config.delete();
      expect(
        await celestProject.config.secureSettings.getOrganizationId(),
        isNull,
      );
      expect(celestProject.config.settings.pubCacheFixDigest, isNull);
    });
  });
}
