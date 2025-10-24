// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i7;
import 'package:celest/src/core/context.dart' as _i3;
import 'package:celest/src/runtime/data/celest_database.dart' as _i5;
import 'package:celest/src/runtime/data/database_registry.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/database/log_database.dart' as _i9;
import 'package:celest_backend/src/database/task_database.dart' as _i6;
import 'package:celest_backend/src/generated/data.celest.dart' as _i8;
import 'package:celest_cloud_auth/celest_cloud_auth.dart' as _i10;

import 'functions/tasks/create.dart' as _i2;

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(
    targets: {'/tasks/create': _i2.CreateTarget()},
    setup: (_i3.Context context) async {
      final $databases = _i4.CelestDatabaseRegistry();
      context.put(_i4.CelestDatabaseRegistry.contextKey, $databases);
      final _databaseCelestDatabase = await _i5.CelestDatabase.create(
        context,
        name: 'TaskDatabase',
        factory: _i6.TaskDatabase.new,
        hostnameVariable: const _i7.env('TASK_DATABASE_HOST'),
        tokenSecret: const _i7.secret('TASK_DATABASE_TOKEN'),
      );
      final database = await _databaseCelestDatabase.connect();
      context.put(_i8.CelestData.database$Key, database);
      $databases.register(
        databaseId: 'TaskDatabase',
        dartName: 'database',
        displayName: 'TaskDatabase',
        database: _databaseCelestDatabase,
        connection: database,
      );
      if (context.environment == _i7.Environment.local) {
        final $studio = _databaseCelestDatabase.createStudio(
          pageTitle: 'TaskDatabase',
        );
        context.router.mount('/_admin/studio/task-database', $studio.call);
        context.router.mount('/_admin/studio', $studio.call);
      }
      final _logsDatabaseCelestDatabase = await _i5.CelestDatabase.create(
        context,
        name: 'LogDatabase',
        factory: _i9.LogDatabase.new,
        hostnameVariable: const _i7.env('LOG_DATABASE_HOST'),
        tokenSecret: const _i7.secret('LOG_DATABASE_TOKEN'),
      );
      final logsDatabase = await _logsDatabaseCelestDatabase.connect();
      context.put(_i8.CelestData.logsDatabase$Key, logsDatabase);
      $databases.register(
        databaseId: 'LogDatabase',
        dartName: 'logsDatabase',
        displayName: 'LogDatabase',
        database: _logsDatabaseCelestDatabase,
        connection: logsDatabase,
      );
      if (context.environment == _i7.Environment.local) {
        final $studio = _logsDatabaseCelestDatabase.createStudio(
          pageTitle: 'LogDatabase',
        );
        context.router.mount('/_admin/studio/log-database', $studio.call);
      }
      final $cloudAuth = await _i10.CelestCloudAuth.create(database: database);
      context.router.mount('/v1alpha1/auth/', $cloudAuth.handler);
      context.put(_i10.CelestCloudAuth.contextKey, $cloudAuth);
    },
  );
}
