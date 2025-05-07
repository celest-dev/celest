import 'package:celest/src/config/config_values.dart';
import 'package:celest/src/core/context.dart';
import 'package:celest/src/runtime/data/celest_database.dart';
import 'package:drift/drift.dart' show GeneratedDatabase;

/// {@macro celest.runtime.celest_database}
abstract final class CelestDatabaseImpl<Database extends GeneratedDatabase>
    extends CelestDatabase<Database> {
  /// {@macro celest.runtime.celest_database.create}
  static Future<CelestDatabase<Database>>
      create<Database extends GeneratedDatabase>(
    Context context, {
    required String name,
    required DatabaseFactory<Database> factory,
    required env hostnameVariable,
    required secret tokenSecret,
    String? path,
  }) async {
    throw UnimplementedError(
      'CelestDatabaseImpl.create() is not implemented on Web',
    );
  }

  /// {@macro celest.runtime.celest_database.resolve_database_uri}
  static Future<Uri> resolveDatabaseUri(String name) async {
    throw UnimplementedError(
      'CelestDatabaseImpl.resolveDatabaseUri() is not implemented on Web',
    );
  }
}
