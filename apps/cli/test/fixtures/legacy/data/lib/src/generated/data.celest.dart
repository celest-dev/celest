// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

library;

import 'package:celest/celest.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest_backend/src/database/task_database.dart';
import 'package:drift/native.dart';
import 'package:drift/src/runtime/api/runtime_api.dart';
import 'package:drift/src/runtime/executor/executor.dart';
import 'package:drift_hrana/drift_hrana.dart';

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
      await _connect(
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

/// Checks the connection to the database by running a simple query.
Future<Database> _checkConnection<Database extends GeneratedDatabase>(
    Database db) async {
  await db.transaction(() async {
    await db.customSelect('SELECT 1').get();
  });
  return db;
}

/// Constructs a new [Database] and connects to it using the provided
/// [hostnameVariable] and [tokenSecret] configuration values.
Future<Database> _connect<Database extends GeneratedDatabase>(
  Context context, {
  required String name,
  required Database Function(QueryExecutor) factory,
  required env hostnameVariable,
  required secret tokenSecret,
}) async {
  if (context.environment == Environment.local) {
    return _checkConnection(factory(NativeDatabase.memory()));
  }
  final host = context.get(hostnameVariable);
  final token = context.get(tokenSecret);
  if (host == null || token == null) {
    throw StateError(
      'Missing database hostname or token for $name. '
      'Please set the `$hostnameVariable` and `$tokenSecret` values '
      'in the environment or Celest configuration file.',
    );
  }
  final connector = HranaDatabase(
    Uri(scheme: 'libsql', host: host),
    jwtToken: token,
  );
  return _checkConnection(factory(connector));
}
