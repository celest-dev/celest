import 'package:test/test.dart';

import 'common/common.dart';
import 'features/create_project.dart';
import 'features/hello_project.dart';
import 'targets/installed_target.dart';
import 'targets/installer_target.dart';
import 'targets/local_target.dart';

void main() {
  final targets = <TestTarget>[
    LocalTarget(),
    InstalledTarget(),
    InstallerTarget(),
  ];

  final tests = <Test Function(TestTarget)>[
    CreateProjectTest.new,
    HelloProjectTest.new,
  ];

  for (final target in targets) {
    group(target.name, tags: ['e2e', ...target.tags], () {
      setUpAll(() async {
        await target.setUpAll();
        addTearDown(target.tearDownAll);
      });

      for (final t in tests.map((create) => create(target))) {
        test(t.name, tags: t.tags, () async {
          await t.setUp();
          addTearDown(t.tearDown);
          await t.run();
        });
      }
    });
  }
}
