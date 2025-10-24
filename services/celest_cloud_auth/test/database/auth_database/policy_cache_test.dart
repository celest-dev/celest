import 'package:cedar/cedar.dart';
import 'package:celest_cloud_auth/celest_cloud_auth.dart';
import 'package:drift/drift.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:test/test.dart';

import '../../tester.dart' show defaultProject;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  group('CloudAuthDatabaseAccessors policy cache', () {
    test('reuses cached policy set when data_version is unchanged', () async {
      final fs = const LocalFileSystem();
      final Directory directory = await fs.systemTempDirectory.createTemp(
        'celest_policy_cache_test_',
      );
      addTearDown(() async {
        if (await directory.exists()) {
          await directory.delete(recursive: true);
        }
      });

      final db = CloudAuthDatabase.localDir(directory, project: defaultProject);
      addTearDown(db.close);

      final first = await db.cloudAuth.effectivePolicySet;
      final second = await db.cloudAuth.effectivePolicySet;

      expect(identical(first, second), isTrue);
    });

    test('reloads policies after external updates via data_version', () async {
      final fs = const LocalFileSystem();
      final Directory directory = await fs.systemTempDirectory.createTemp(
        'celest_policy_cache_test_',
      );
      addTearDown(() async {
        if (await directory.exists()) {
          await directory.delete(recursive: true);
        }
      });

      final dbA = CloudAuthDatabase.localDir(
        directory,
        project: defaultProject,
      );
      final dbB = CloudAuthDatabase.localDir(
        directory,
        project: defaultProject,
      );
      addTearDown(() async {
        await dbA.close();
        await dbB.close();
      });

      final initial = await dbA.cloudAuth.effectivePolicySet;
      final initialPolicyIds = initial.policies.keys.toSet();
      const newLinkId = 'policy.cache.test';

      final policyResource = EntityUid.of(
        'Celest::Function',
        'policy-cache-test',
      );
      await dbB.cloudAuth.createEntity(
        Entity(
          uid: policyResource,
          parents: [EntityUid.of('Celest::Api', 'test')],
        ),
      );

      final newLink = TemplateLink(
        templateId: 'cloud.functions.authenticated',
        newId: newLinkId,
        values: {SlotId.resource: policyResource},
      );

      await dbB.cloudAuth.upsertPolicySet(PolicySet(templateLinks: [newLink]));

      final updated = await dbA.cloudAuth.effectivePolicySet;
      expect(identical(initial, updated), isFalse);
      final updatedPolicyIds = updated.policies.keys.toSet();
      final newPolicyIds = updatedPolicyIds.difference(initialPolicyIds);
      expect(newPolicyIds, hasLength(1));

      final cached = await dbA.cloudAuth.effectivePolicySet;
      expect(identical(updated, cached), isTrue);
    });
  });
}
