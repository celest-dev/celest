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
  String? path,
}) async {
  final host = context.get(hostnameVariable);
  if (host == null) {
    if (context.environment == Environment.local) {
      final executor = await localExecutor(name: name, path: path);
      return _checkConnection(factory(executor));
    }
    throw StateError(
      'Missing database hostname for $name. '
      'Set the `$hostnameVariable` value in the environment or Celest '
      'configuration file to connect.',
    );
  }
  final hostUri = Uri.tryParse(host);
  if (hostUri == null) {
    throw StateError(
      'Invalid or empty host URI set for $hostnameVariable: $host',
    );
  }
  final QueryExecutor connector;
  switch (hostUri) {
    case Uri(scheme: 'file', path: '/:memory:'):
      connector = await inMemoryExecutor();
    case Uri(scheme: 'file', :final path):
      connector = await localExecutor(name: name, path: path);
    case Uri(scheme: 'ws' || 'wss' || 'http' || 'https' || 'libsql'):
      final token = context.get(tokenSecret);
      if (token == null) {
        if (context.environment != Environment.local) {
          _logger.warning(
            'Missing database token for $name. It\'s recommended to configure '
            '`$tokenSecret` in the environment or Celest configuration file.',
          );
        }
        _logger.config('Connecting to $hostUri without a token.');
      }
      connector = HranaDatabase(hostUri, jwtToken: token);
    default:
      throw StateError(
        'Invalid host URI set for $hostnameVariable: $host. '
        "Expected a scheme of 'file', 'ws', 'wss', 'http', 'https', or 'libsql'.",
      );
  }

  return _checkConnection(factory(connector));
}
