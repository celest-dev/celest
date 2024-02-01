import 'package:celest_cli/src/context.dart';
import 'package:test/test.dart';

import '../common.dart';
import 'common/common.dart';
import 'features/add_remove_fields.dart';
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
    // TODO(dnys1): Get watcher working on Windows so that SIGUSR1 is not
    // needed.
    if (!platform.isWindows) AddRemoveFieldsTest.new,
  ];

  for (final target in targets) {
    group(target.name, tags: ['e2e', ...target.tags], () {
      setUpAll(() async {
        await initTests();
        await target.setUpAll();
        addTearDown(target.tearDownAll);
      });

      for (final t in tests.map((create) => create(target))) {
        test(t.name, tags: t.tags, () async {
          try {
            await t.setUp();
            await t.run();
          } on Object {
            print('LOGS');
            print('--------------------------------');
            print(t.logFile.readAsStringSync());
            print('--------------------------------');
            rethrow;
          } finally {
            await t.tearDown();
          }
        });
      }
    });
  }
}
