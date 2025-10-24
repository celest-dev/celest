@TestOn('vm')
@Tags(['e2e'])
library;

import 'package:celest/src/runtime/data/celest_database.dart';
import 'package:celest/src/runtime/data/database_registry.dart';
import 'package:drift/src/runtime/api/runtime_api.dart';
import 'package:test/test.dart';

import 'test_database.dart';

void main() {
  late CelestDatabaseRegistry registry;
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  setUp(() {
    registry = CelestDatabaseRegistry();
  });

  Future<(CelestDatabase<TestDatabase>, TestDatabase)> createDatabase(
    String id,
  ) async {
    const celestDb = InMemoryDatabase<TestDatabase>(TestDatabase.new);
    final TestDatabase connection = await celestDb.connect();
    addTearDown(connection.close);
    return (celestDb, connection);
  }

  test('registers and looks up databases', () async {
    final (
      CelestDatabase<TestDatabase> primaryCelest,
      TestDatabase primaryConnection,
    ) = await createDatabase('primary');
    final CelestDatabaseHandle handle = registry.register(
      databaseId: 'primary',
      dartName: 'primary',
      displayName: 'Primary',
      database: primaryCelest,
      connection: primaryConnection,
    );

    expect(registry.byId('primary'), same(handle));
    expect(registry.byDartName('primary'), same(handle));
    expect(registry.byName('primary'), same(primaryConnection));
    expect(registry.maybeByName('primary'), same(primaryConnection));

    final List<GeneratedDatabase> connections = registry.list();
    expect(connections, contains(primaryConnection));
    expect(() => connections.add(primaryConnection), throwsUnsupportedError);
  });

  test('resolveForAuth prefers cloudAuth database', () async {
    final (
      CelestDatabase<TestDatabase> primaryCelest,
      TestDatabase primaryConnection,
    ) = await createDatabase('primary');
    registry.register(
      databaseId: 'primary',
      dartName: 'primary',
      displayName: 'Primary',
      database: primaryCelest,
      connection: primaryConnection,
    );

    final (
      CelestDatabase<TestDatabase> authCelest,
      TestDatabase authConnection,
    ) = await createDatabase('CloudAuthDatabase');
    final CelestDatabaseHandle authHandle = registry.register(
      databaseId: 'CloudAuthDatabase',
      dartName: 'cloudAuth',
      displayName: 'Cloud Auth',
      database: authCelest,
      connection: authConnection,
    );

    expect(registry.resolveForAuth(), same(authHandle));
    expect(registry.resolveForAuth(dartName: 'primary'), isNot(authHandle));
  });

  test('resolveForAuth throws when registry empty', () {
    expect(() => registry.resolveForAuth(), throwsStateError);
  });

  test('prevents duplicate registrations', () async {
    final (
      CelestDatabase<TestDatabase> celestDb,
      TestDatabase connection,
    ) = await createDatabase('primary');
    registry.register(
      databaseId: 'primary',
      dartName: 'primary',
      displayName: 'Primary',
      database: celestDb,
      connection: connection,
    );

    final (
      CelestDatabase<TestDatabase> duplicateCelest,
      TestDatabase duplicateConnection,
    ) = await createDatabase('primary');
    expect(
      () => registry.register(
        databaseId: 'primary',
        dartName: 'secondary',
        displayName: 'Duplicate',
        database: duplicateCelest,
        connection: duplicateConnection,
      ),
      throwsStateError,
    );
  });
}
