// ignore_for_file: implementation_imports

import 'dart:collection';

import 'package:celest/src/core/context.dart';
import 'package:celest/src/runtime/data/celest_database.dart';
import 'package:drift/drift.dart';

/// Stores the databases that are available within a Celest runtime instance.
final class CelestDatabaseRegistry {
  /// Creates a new, empty registry.
  CelestDatabaseRegistry();

  /// Retrieves the [CelestDatabaseRegistry] stored in the provided [context].
  static CelestDatabaseRegistry of(Context context) {
    final CelestDatabaseRegistry? registry = context.get(contextKey);
    if (registry == null) {
      throw StateError('No CelestDatabaseRegistry registered in the context.');
    }
    return registry;
  }

  /// The context key used to store the registry within a [Context].
  static const ContextKey<CelestDatabaseRegistry> contextKey =
      ContextKey<CelestDatabaseRegistry>('celest.databases');

  final Map<String, CelestDatabaseHandle> _handlesById = {};
  final Map<String, CelestDatabaseHandle> _handlesByDartName = {};
  final List<CelestDatabaseHandle> _handles = [];

  /// All registered database handles in registration order.
  UnmodifiableListView<CelestDatabaseHandle> get handles =>
      UnmodifiableListView(_handles);

  /// Registers a database connection with the registry.
  CelestDatabaseHandle register({
    required String databaseId,
    required String dartName,
    required String displayName,
    required CelestDatabase<dynamic> database,
    required GeneratedDatabase connection,
  }) {
    assert(databaseId.isNotEmpty, 'databaseId must not be empty');
    assert(dartName.isNotEmpty, 'dartName must not be empty');
    if (_handlesById.containsKey(databaseId)) {
      throw StateError('Database "$databaseId" is already registered.');
    }
    if (_handlesByDartName.containsKey(dartName)) {
      throw StateError('Database "$dartName" is already registered.');
    }

    final handle = CelestDatabaseHandle._(
      databaseId: databaseId,
      dartName: dartName,
      displayName: displayName,
      database: database,
      connection: connection,
    );
    _handlesById[databaseId] = handle;
    _handlesByDartName[dartName] = handle;
    _handles.add(handle);
    return handle;
  }

  /// Returns the database registered with the provided [databaseId], if any.
  CelestDatabaseHandle? maybeById(String databaseId) =>
      _handlesById[databaseId];

  /// Returns the database registered with the provided [databaseId].
  CelestDatabaseHandle byId(String databaseId) {
    return maybeById(databaseId) ??
        (throw StateError('No database registered with id "$databaseId".'));
  }

  /// Returns the database registered with the provided [dartName], if any.
  CelestDatabaseHandle? maybeByDartName(String dartName) =>
      _handlesByDartName[dartName];

  /// Returns the database registered with the provided [dartName].
  CelestDatabaseHandle byDartName(String dartName) {
    return maybeByDartName(dartName) ??
        (throw StateError(
          'No database registered with dart name "$dartName".',
        ));
  }

  /// Returns the database to use for Cloud Auth operations.
  CelestDatabaseHandle resolveForAuth({String? databaseId, String? dartName}) {
    if (databaseId != null) {
      return byId(databaseId);
    }
    if (dartName != null) {
      return byDartName(dartName);
    }
    if (_handles.isEmpty) {
      throw StateError(
        'No databases have been registered; Cloud Auth requires a database.',
      );
    }
    if (_handles.length == 1) {
      return _handles.first;
    }
    final CelestDatabaseHandle preferred = _handles.firstWhere(
      (handle) =>
          handle.dartName == 'cloudAuth' ||
          handle.databaseId == 'CloudAuthDatabase',
      orElse: () => _handles.first,
    );
    return preferred;
  }

  /// Returns all registered database connections.
  List<GeneratedDatabase> list() => List<GeneratedDatabase>.unmodifiable(
    _handles.map((handle) => handle.connection),
  );

  /// Returns the database connection registered under [name], if any.
  ///
  /// The lookup first checks registered Dart variable names, then identifiers.
  GeneratedDatabase? maybeByName(String name) {
    return maybeByDartName(name)?.connection ?? maybeById(name)?.connection;
  }

  /// Returns the database connection registered under [name].
  GeneratedDatabase byName(String name) {
    return maybeByName(name) ??
        (throw StateError('No database registered with name "$name".'));
  }
}

/// A registered database entry within a [CelestDatabaseRegistry].
final class CelestDatabaseHandle {
  CelestDatabaseHandle._({
    required this.databaseId,
    required this.dartName,
    required this.displayName,
    required CelestDatabase<dynamic> database,
    required GeneratedDatabase connection,
  }) : _database = database,
       _connection = connection;

  /// The identifier assigned to the database.
  final String databaseId;

  /// The Dart name used to reference the database in generated code.
  final String dartName;

  /// A human-readable display name for the database.
  final String displayName;

  final CelestDatabase<dynamic> _database;
  final GeneratedDatabase _connection;

  /// The lazily created Celest database wrapper.
  CelestDatabase<dynamic> get database => _database;

  /// The connected Drift database instance.
  GeneratedDatabase get connection => _connection;
}
