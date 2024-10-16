import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/core/environment.dart';
import 'package:celest/src/runtime/data/connect.io.dart'
    if (dart.library.js_interop) 'package:celest/src/runtime/data/connect.web.dart';
import 'package:drift/drift.dart';
import 'package:drift_hrana/drift_hrana.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('Celest.Data');

/// Checks the connection to the database by running a simple query.
Future<Database> _checkConnection<Database extends GeneratedDatabase>(
  Database db,
) async {
  await db.customSelect('SELECT 1').get();
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
  if (host == null) {
    throw StateError(
      'Missing database hostname $name. '
      'Set the `$hostnameVariable` value in the environment or Celest '
      'configuration file to connect.',
    );
  }
  final hostUri = Uri.tryParse(host) ?? Uri(scheme: 'libsql', host: host);
  if (token == null) {
    _logger.fine(
      'Missing database token for $name. Expecting a secret named '
      '`$tokenSecret` in the environment or Celest configuration file.',
    );
    _logger.fine('Connecting to $hostUri without a token.');
  }
  final connector = HranaDatabase(hostUri, jwtToken: token);
  return _checkConnection(factory(connector));
}
