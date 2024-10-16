import 'dart:io';
import 'dart:isolate';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

final Logger _logger = Logger('Celest.Data');

/// A [QueryExecutor] for an in-memory database.
Future<QueryExecutor> inMemoryExecutor() async => NativeDatabase.memory();

/// A [QueryExecutor] with local persistence.
Future<QueryExecutor> localExecutor({
  required String name,
  String? path,
}) async {
  if (path == null) {
    final packageConfig = await Isolate.packageConfig;
    if (packageConfig == null) {
      _logger.warning(
        'Failed to determine package config path. '
        'Falling back to in-memory database.',
      );
      return inMemoryExecutor();
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
  );
}
