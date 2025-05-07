import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/runtime/data/celest_database.dart';
import 'package:celest/src/runtime/http/middleware.dart';
import 'package:celest_db_studio/celest_db_studio.dart';
import 'package:drift/drift.dart';
import 'package:shelf/shelf.dart' show Pipeline;
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
  final celestDb = await CelestDatabase.create(
    context,
    name: name,
    factory: factory,
    hostnameVariable: hostnameVariable,
    tokenSecret: tokenSecret,
    path: path,
  );
  return celestDb.connect(
    setup: setup,
    logStatements: logStatements,
  );
}

/// Registers a [CelestDbStudio] instance with the given [context].
///
/// The [hostnameVariable] and [tokenSecret] are used to connect to the
/// database. The [basePath] is the path at which the studio will be
/// mounted.
///
/// The [middlewares], if provided, are applied to the request handler.
Future<CelestDbStudio> registerDbStudio(
  Context context, {
  required env hostnameVariable,
  required secret tokenSecret,
  required String basePath,
  List<Middleware> middlewares = const [],
}) async {
  final hostname = context.expect(hostnameVariable);
  final authToken = context.get(tokenSecret);
  final dbStudio = await CelestDbStudio.create(
    databaseUri: Uri.parse(hostname),
    authToken: authToken,
  );
  var pipeline = const Pipeline();
  for (final middleware in middlewares) {
    pipeline = pipeline.addMiddleware(middleware.call);
  }
  final handler = pipeline.addHandler(dbStudio.call);
  context.router.mount(basePath, handler);
  return dbStudio;
}
