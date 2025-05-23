// ignore_for_file: invalid_use_of_internal_member, implementation_imports
library;

import 'dart:io';
import 'dart:isolate';

import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/core/environment.dart';
import 'package:celest_db_studio/celest_db_studio.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_hrana/drift_hrana.dart';
import 'package:hrana/src/rpc_client.dart' as hrana;
import 'package:hrana/src/rpc_http_client.dart' as hrana;
import 'package:logging/logging.dart';
import 'package:sqlite3/common.dart' as sqlite3;

/// A function that creates a Drift [Database] instance.
typedef DatabaseFactory<Database extends GeneratedDatabase> =
    Database Function(QueryExecutor executor);

final Logger _logger = Logger('CelestDatabase');

/// {@template celest.runtime.celest_database}
/// A wrapper around a Celest database.
/// {@endtemplate}
sealed class CelestDatabase<Database extends GeneratedDatabase> {
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
    Uri? uri;
    final String? host = context.get(hostnameVariable);
    if (path != null) {
      uri = Uri.file(path);
    } else if (host != null) {
      uri = Uri.tryParse(host);
    } else {
      if (context.environment == Environment.local) {
        uri = await resolveDatabaseUri(name);
      } else {
        throw StateError(
          'Missing database hostname for $name. '
          'Set the `$hostnameVariable` value in the environment or Celest '
          'configuration file to connect.',
        );
      }
    }
    if (uri == null) {
      throw StateError(
        'Invalid or empty host URI set for $hostnameVariable: $host',
      );
    }

    switch (uri) {
      case Uri(scheme: 'file', path: '/:memory:'):
        return InMemoryDatabase(factory);
      case Uri(scheme: 'file'):
        return FileDatabase(path: uri.toFilePath(), factory: factory);
      case Uri(scheme: 'ws' || 'wss' || 'http' || 'https' || 'libsql'):
        final String? token = context.get(tokenSecret);
        if (token == null) {
          if (context.environment != Environment.local) {
            _logger.warning(
              'Missing database token for $name. It\'s recommended to configure '
              '`$tokenSecret` in the environment or Celest configuration file.',
            );
          }
          _logger.config('Connecting to $uri without a token.');
        }
        final hrana.HranaHttpClient client = await hrana
            .HranaHttpClient.connect(
          uri.replace(
            scheme: switch (uri.scheme) {
              'wss' || 'libsql' || 'https' => 'https',
              'ws' || 'http' => 'http',
              _ => uri.scheme,
            },
          ),
          jwtToken: token,
          httpClient: context.httpClient,
        );
        return LibsqlDatabase(
          uri: uri,
          token: token,
          factory: factory,
          client: client,
        );
      default:
        throw StateError(
          'Invalid host URI set for $hostnameVariable: $host. '
          "Expected a scheme of 'file', 'ws', 'wss', 'http', 'https', or 'libsql'.",
        );
    }
  }

  /// Resolves the database URI for the given [name].
  ///
  /// This function attempts to determine a local path for the database file
  /// based on the package configuration.
  ///
  /// If the package configuration is not available, it falls back to using
  /// an in-memory database.
  static Future<Uri> resolveDatabaseUri(String name) async {
    Uri? packageConfig;
    try {
      packageConfig = await Isolate.packageConfig;
    } on Object {
      // Not available in all environments.
    }
    if (packageConfig == null) {
      // TODO(dnys1): Get this working with flutter_tester
      _logger.warning(
        'Failed to determine package config path. '
        'Falling back to in-memory database.',
      );
      return Uri.parse('file::memory:');
    }
    return packageConfig.resolve('./celest/$name.db');
  }

  /// Checks the connection to the database by running a simple query.
  Future<Database> _checkConnection(Database db) async {
    await db.customSelect('SELECT 1').get();
    return db;
  }

  /// Creates a new [Database] and connects to it.
  Future<Database> connect({
    void Function(sqlite3.CommonDatabase)? setup,
    bool logStatements = false,
  });

  /// Creates a DB Studio handler for the database.
  CelestDbStudio createStudio();
}

/// {@template celest.runtime.in_memory_database}
/// A database that is stored in memory.
///
/// This is useful for testing and development purposes when a persistent
/// database is not required or is unavailable.
/// {@endtemplate}
final class InMemoryDatabase<Database extends GeneratedDatabase>
    extends CelestDatabase<Database> {
  /// {@macro celest.runtime.in_memory_database}
  const InMemoryDatabase(this._factory);

  final DatabaseFactory<Database> _factory;

  @override
  Future<Database> connect({
    void Function(sqlite3.CommonDatabase)? setup,
    bool logStatements = false,
  }) {
    final executor = NativeDatabase.memory(
      setup: setup,
      logStatements: logStatements,
    );
    return _checkConnection(_factory(executor));
  }

  @override
  CelestDbStudio createStudio() {
    return CelestDbStudio.from(driver: NativeDriver.memory());
  }
}

/// {@template celest.runtime.file_database}
/// A database that is stored in a file.
///
/// This is useful for testing and development purposes.
/// {@endtemplate}
final class FileDatabase<Database extends GeneratedDatabase>
    extends CelestDatabase<Database> {
  /// {@macro celest.runtime.file_database}
  const FileDatabase({
    required this.path,
    required DatabaseFactory<Database> factory,
  }) : _factory = factory;

  /// The path to the database file.
  final String path;

  final DatabaseFactory<Database> _factory;

  @override
  Future<Database> connect({
    void Function(sqlite3.CommonDatabase)? setup,
    bool logStatements = false,
  }) {
    _logger.config('Opening database at $path');
    final databaseFile = File(path);
    if (!databaseFile.existsSync()) {
      _logger.info('Database does not exist. Creating new database.');
    }
    final executor = NativeDatabase(
      databaseFile,
      cachePreparedStatements: true,
      enableMigrations: true,
      setup: setup,
      logStatements: logStatements,
    );
    return _checkConnection(_factory(executor));
  }

  @override
  CelestDbStudio createStudio() {
    return CelestDbStudio.from(driver: NativeDriver.file(path));
  }
}

/// {@template celest.runtime.libsql_database}
/// A LibSQL/Turso database.
/// {@endtemplate}
final class LibsqlDatabase<Database extends GeneratedDatabase>
    extends CelestDatabase<Database> {
  /// {@macro celest.runtime.libsql_database}
  const LibsqlDatabase({
    required this.uri,
    this.token,
    required DatabaseFactory<Database> factory,
    required hrana.HranaClient client,
  }) : _factory = factory,
       _client = client;

  /// The URI of the database.
  final Uri uri;

  /// The JWT token for authentication.
  final String? token;

  final DatabaseFactory<Database> _factory;
  final hrana.HranaClient _client;

  @override
  Future<Database> connect({
    void Function(sqlite3.CommonDatabase)? setup,
    bool logStatements = false,
  }) {
    final executor = HranaDatabase(uri, jwtToken: token);
    return _checkConnection(_factory(executor));
  }

  @override
  CelestDbStudio createStudio() {
    final driver = HranaDriver(_client);
    return CelestDbStudio.from(driver: driver);
  }
}
