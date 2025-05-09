import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/runtime/data/celest_database.dart';
import 'package:drift/drift.dart';
import 'package:sqlite3/common.dart' as sqlite3;

/// Constructs a new [Database] and connects to it using the provided
/// [hostnameVariable] and [tokenSecret] configuration values.
@Deprecated('Use CelestDatabase.connect instead')
Future<Database> connect<Database extends GeneratedDatabase>(
  Context context, {
  required String name,
  required Database Function(QueryExecutor) factory,
  required env hostnameVariable,
  required secret tokenSecret,
  void Function(sqlite3.CommonDatabase)? setup,
  String? path,
  bool logStatements = false,
}) async {
  final CelestDatabase<Database> celestDb = await CelestDatabase.create(
    context,
    name: name,
    factory: factory,
    hostnameVariable: hostnameVariable,
    tokenSecret: tokenSecret,
    path: path,
  );
  return celestDb.connect(setup: setup, logStatements: logStatements);
}
