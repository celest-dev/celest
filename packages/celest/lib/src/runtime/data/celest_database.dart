// ignore_for_file: invalid_use_of_internal_member, implementation_imports
@internal
library;

import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart' show Context;
import 'package:celest/src/runtime/data/celest_database.io.dart'
    if (dart.library.js_interop) 'package:celest/src/runtime/data/celest_database.web.dart';
import 'package:celest_db_studio/celest_db_studio.dart';
import 'package:drift/drift.dart';
import 'package:meta/meta.dart';
import 'package:sqlite3/common.dart' as sqlite3;

/// A function that creates a Drift [Database] instance.
typedef DatabaseFactory<Database extends GeneratedDatabase> = Database Function(
  QueryExecutor executor,
);

/// {@template celest.runtime.celest_database}
/// A wrapper around a Celest database.
/// {@endtemplate}
abstract base class CelestDatabase<Database extends GeneratedDatabase> {
  /// {@macro celest.runtime.celest_database}
  const CelestDatabase();

  /// {@template celest.runtime.celest_database.create}
  /// Connects to a Celest database.
  /// {@endtemplate}
  static Future<CelestDatabase<Database>>
      create<Database extends GeneratedDatabase>(
    Context context, {
    required String name,
    required DatabaseFactory<Database> factory,
    required env hostnameVariable,
    required secret tokenSecret,
    String? path,
  }) async {
    return CelestDatabaseImpl.create(
      context,
      name: name,
      factory: factory,
      hostnameVariable: hostnameVariable,
      tokenSecret: tokenSecret,
      path: path,
    );
  }

  /// {@template celest.runtime.celest_database.resolve_database_uri}
  /// Resolves the database URI for the given [name].
  ///
  /// This function attempts to determine a local path for the database file
  /// based on the package configuration.
  ///
  /// If the package configuration is not available, it falls back to using
  /// an in-memory database.
  /// {@endtemplate}
  static Future<Uri> resolveDatabaseUri(String name) async {
    return CelestDatabaseImpl.resolveDatabaseUri(name);
  }

  /// Checks the connection to the database by running a simple query.
  @protected
  Future<Database> checkConnection(Database db) async {
    await db.customSelect('SELECT 1').get();
    return db;
  }

  /// Creates a new [Database] and connects to it.
  Future<Database> connect({
    void Function(sqlite3.CommonDatabase)? setup,
    bool logStatements = false,
  });

  /// Creates a DB Studio for the database.
  CelestDbStudio createStudio();
}
