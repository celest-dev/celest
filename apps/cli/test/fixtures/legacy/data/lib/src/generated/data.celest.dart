// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

library;

import 'package:celest/celest.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/runtime/data/connect.dart';
import 'package:celest_backend/src/database/task_database.dart';

/// The data services for the Celest backend.
///
/// This class provides access to the databases that are configured
/// for the current [CelestEnvironment].
class CelestData {
  const CelestData();

  /// Initializes the databases attached to this project in the given [context].
  static Future<void> init(Context context) async {
    context.put(
      _databaseKey,
      await connect(
        context,
        name: 'TaskDatabase',
        factory: TaskDatabase.new,
        hostnameVariable: const env('CELEST_DATABASE_HOST'),
        tokenSecret: const secret('CELEST_DATABASE_TOKEN'),
      ),
    );
  }

  /// The `TaskDatabase` instance for this project.
  TaskDatabase get database => Context.current.expect(_databaseKey);

  /// The context key for the [database] instance.
  static ContextKey<TaskDatabase> get _databaseKey =>
      const ContextKey('TaskDatabase');
}
