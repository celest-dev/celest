// ignore_for_file: unused_import

import 'dart:io';

import 'package:celest_cli/src/context.dart';
import 'package:test/test.dart';

import '../common.dart';
import 'common/common.dart';
import 'targets/installed_target.dart';
import 'targets/local_aot_target.dart';
import 'targets/local_target.dart';
import 'tests/bugs/add_remove_fields.dart';
import 'tests/commands/auth/login_command.dart';
import 'tests/commands/create/create_project_in_dart_app.dart';
import 'tests/commands/create/create_project_in_dart_app_no_deps.dart';
import 'tests/commands/create/create_project_in_flutter_app.dart';
import 'tests/commands/create/create_project_isolated.dart';
import 'tests/commands/init/init_project_name.dart';
import 'tests/commands/init/templates/data_project.dart';
import 'tests/commands/init/templates/hello_project.dart';
import 'tests/commands/start/hot_reload/hot_reload_add_auth.dart';
import 'tests/commands/start/hot_reload/hot_reload_add_model_after_error.dart';
import 'tests/commands/start/start_child_process.dart';
import 'tests/commands/start/start_flutter_child_process.dart';
import 'tests/package_support/supports_supabase.dart';

void main() {
  final targets = <TestTarget>[
    LocalTarget(),
    // LocalAotTarget(),
    InstalledTarget(),
  ];

  final tests = <E2ETest Function(TestTarget)>[
    // Project templates
    HelloProjectTest.new,
    DataProjectTest.new,

    // Init options
    InitProjectNameTest.new,

    // Project creation
    CreateProjectInFlutterAppTest.new,
    CreateProjectInDartAppTest.new,
    CreateProjectInDartAppNoDepsTest.new,
    CreateProjectIsolatedTest.new,

    // Start options
    StartChildProcessTest.new,
    StartFlutterChildProcessTest.new,

    // Auth commands
    LoginCommandTest.new,

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
            await t.logFile.writeAsString(
              '',
              mode: FileMode.append,
              flush: true,
            );

            print('LOGS');
            print('--------------------------------');
            print(await t.logFile.readAsString());
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
