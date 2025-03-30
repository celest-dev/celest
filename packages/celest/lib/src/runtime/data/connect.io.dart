import 'dart:io';
import 'dart:isolate';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/common.dart' as sqlite3;

final Logger _logger = Logger('Celest.Data');

/// A [QueryExecutor] for an in-memory database.
Future<QueryExecutor> inMemoryExecutor({
  void Function(sqlite3.CommonDatabase)? setup,
}) async {
  return NativeDatabase.memory(setup: setup);
}

/// A [QueryExecutor] with local persistence.
Future<QueryExecutor> localExecutor({
  required String name,
  void Function(sqlite3.CommonDatabase)? setup,
  String? path,
}) async {
  if (path == null) {
    Uri? packageConfig;
    try {
      packageConfig = await Isolate.packageConfig;
    } on Object {
      // Not available in all environments.
    }
    if (packageConfig == null) {
      _logger.warning(
        'Failed to determine package config path. '
        'Falling back to in-memory database.',
      );
      return inMemoryExecutor(setup: setup);
    }
    path = p.join(
      p.dirname(p.fromUri(packageConfig)),
      'celest',
      '$name.db',
    );
  }
  _logger.info('Opening database at $path');
  final databaseFile = File(path);
  if (!databaseFile.existsSync()) {
    _logger.info('Database does not exist. Creating new database.');
  }
  return NativeDatabase(
    databaseFile,
    cachePreparedStatements: true,
    enableMigrations: true,
    setup: setup,
  );
}
