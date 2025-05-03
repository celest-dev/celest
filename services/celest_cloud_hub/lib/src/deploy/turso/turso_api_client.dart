import 'dart:math';

import 'package:celest_cloud_hub/src/context.dart';
import 'package:celest_cloud_hub/src/deploy/turso/models.dart';
import 'package:celest_cloud_hub/src/deploy/turso/turso.dart';

/// A wrapper over the Turso API client which allows handling
/// cases where we don't have an auth token (like in testing).
final class TursoApiClient {
  TursoApiClient({String? authToken, required this.orgSlug})
    : _turso = switch (authToken) {
        final token? => Turso(apiToken: token, client: context.httpClient),
        _ => null,
      };

  final Turso? _turso;
  final String orgSlug;

  Future<Database> createDatabase({
    required String name,
    required String group,
    required String sizeLimit,
  }) async {
    final turso = _turso;
    if (turso == null) {
      return Database(dbId: '', name: name, hostname: '');
    }
    return turso.databases.createDatabase(
      orgSlug,
      name: name,
      group: group,
      sizeLimit: sizeLimit,
    );
  }

  Future<Database> getDatabase({required String databaseName}) async {
    final turso = _turso;
    if (turso == null) {
      return Database(dbId: '', name: databaseName, hostname: '');
    }
    return turso.databases.getDatabase(orgSlug, databaseName);
  }

  Future<List<Database>> listDatabases() async {
    final turso = _turso;
    if (turso == null) {
      return [];
    }
    return turso.databases.listDatabases(orgSlug);
  }

  Future<void> deleteDatabase({required String databaseName}) async {
    final turso = _turso;
    if (turso == null) {
      return;
    }
    return turso.databases.deleteDatabase(orgSlug, databaseName);
  }

  Future<String> createDatabaseToken({required String databaseName}) async {
    final turso = _turso;
    if (turso == null) {
      return 'token_${Random().nextInt(10000)}';
    }
    return turso.databases.createDatabaseToken(orgSlug, databaseName);
  }
}
