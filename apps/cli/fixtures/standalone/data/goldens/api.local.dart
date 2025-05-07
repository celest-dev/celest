// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i6;
import 'package:celest/src/core/context.dart' as _i3;
import 'package:celest/src/runtime/data/celest_database.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/database/task_database.dart' as _i5;
import 'package:celest_backend/src/generated/cloud.celest.dart' as _i9;
import 'package:celest_backend/src/generated/data.celest.dart' as _i7;
import 'package:celest_cloud_auth/celest_cloud_auth.dart' as _i8;

import 'functions/tasks/create.dart' as _i2;

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(
    targets: {'/tasks/create': _i2.CreateTarget()},
    setup: (_i3.Context context) async {
      final database = await _i4.CelestDatabase.create(
        context,
        name: 'TaskDatabase',
        factory: _i5.TaskDatabase.new,
        hostnameVariable: const _i6.env('TASK_DATABASE_HOST'),
        tokenSecret: const _i6.secret('TASK_DATABASE_TOKEN'),
      );
      context.put(
        _i7.CelestData.database$Key,
        await database.connect(),
      );
      final $cloudAuth =
          await _i8.CelestCloudAuth.create(database: _i9.celest.data.database);
      context.router.mount(
        '/v1alpha1/auth/',
        $cloudAuth.handler,
      );
      context.put(
        _i8.CelestCloudAuth.contextKey,
        $cloudAuth,
      );
      if (context.environment == _i6.Environment.local) {
        final $studio = database.createStudio();
        context.router.mount(
          '/_admin/studio',
          $studio.call,
        );
      }
    },
  );
}
