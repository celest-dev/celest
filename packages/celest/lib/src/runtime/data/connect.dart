import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/core/environment.dart';
import 'package:celest/src/runtime/data/connect.io.dart'
    if (dart.library.js_interop) 'package:celest/src/runtime/data/connect.web.dart';
import 'package:drift/drift.dart';
import 'package:drift_hrana/drift_hrana.dart';

/// Checks the connection to the database by running a simple query.
Future<Database> _checkConnection<Database extends GeneratedDatabase>(
  Database db,
) async {
  await db.transaction(() async {
    await db.customSelect('SELECT 1').get();
  });
  return db;
}

/// Constructs a new [Database] and connects to it using the provided
/// [hostnameVariable] and [tokenSecret] configuration values.
Future<Database> connect<Database extends GeneratedDatabase>(
  Context context, {
  required String name,
  required Database Function(QueryExecutor) factory,
  required env hostnameVariable,
  required secret tokenSecret,
}) async {
  if (context.environment == Environment.local) {
    final executor = await inMemoryExecutor();
    return _checkConnection(factory(executor));
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
