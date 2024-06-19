// ignore_for_file: unused_import, flutter_style_todos

import 'package:celest_cli/src/context.dart';
import 'package:test/test.dart';

import '../common.dart';
import 'common/common.dart';
import 'features/bugs/add_remove_fields.dart';
import 'features/create/create_project_in_dart_app.dart';
import 'features/create/create_project_in_dart_app_no_deps.dart';
import 'features/create/create_project_in_flutter_app.dart';
import 'features/create/create_project_isolated.dart';
import 'features/hello_project.dart';
import 'features/hot_reload/hot_reload_add_auth.dart';
import 'features/hot_reload/hot_reload_add_model_after_error.dart';
import 'features/package_support/supports_supabase.dart';
import 'targets/installed_target.dart';
import 'targets/local_target.dart';

void main() {
  final targets = <TestTarget>[
    LocalTarget(),
    InstalledTarget(),
  ];

  final tests = <E2ETest Function(TestTarget)>[
    // Example projects
    HelloProjectTest.new,

    // Project creation
    CreateProjectInFlutterAppTest.new,
    CreateProjectInDartAppTest.new,
    CreateProjectInDartAppNoDepsTest.new,
    CreateProjectIsolatedTest.new,

    // Hot reload
    AddRemoveFieldsTest.new,
    HotReloadAddAuthTest.new,
    HotReloadNonExistentModel.new,

    // Package support
    SupportsSupabase.new,
  ];

  for (final target in targets) {
    group(target.name, tags: ['e2e', ...target.tags], () {
      setUpAll(() async {
        await initTests();
        await target.setUpAll();
        addTearDown(target.tearDownAll);
      });

      for (final t in tests.map((create) => create(target))) {
        test(t.name, tags: t.tags, skip: t.skip, () async {
          try {
            await t.setUp();
            await t.run();
          } on Object {
            print('LOGS');
            print('--------------------------------');
            print(t.logFile.readAsStringSync());
            print('--------------------------------');
            print('Full logs written to: ${t.logFile.path}');
            rethrow;
          } finally {
            await t.tearDown();
          }
        });
      }
    });
  }
}
