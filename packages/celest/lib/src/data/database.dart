/// {@template celest.data.database}
/// A database which is deployed to the cloud.
/// {@endtemplate}
final class Database {
  /// {@macro celest.data.database}
  const Database({required this.schema});

  /// The schema of the database.
  final Schema schema;
}

/// {@template celest.data.schema}
/// The schema of a database.
///
/// Currently, only Drift databases are supported via [Schema.drift].
/// {@endtemplate}
sealed class Schema {
  /// {@macro celest.data.schema}
  const Schema();

  /// Creates a new schema for the given Drift [databaseType].
  ///
  /// The [databaseType] must be a subclass of `DriftDatabase`.
  ///
  /// ## Example
  ///
  /// Follow the [Drift documentation](https://pub.dev/packages/drift) to create
  /// a Drift database, for example `MyDatabase`.
  ///
  /// This class does not need to be defined in your Celest backend, but must
  /// be imported in the file where you define your Celest database.
  ///
  /// ```dart
  /// import 'package:drift/drift.dart';
  ///
  /// part 'my_database.g.dart';
  ///
  /// @DriftDatabase(tables: [Users])
  /// class MyDatabase extends _$MyDatabase {
  ///  // ...
  /// }
  /// ```
  ///
  /// In your Celest backend, create a new [Schema] using the [Schema.drift]
  /// constructor to define your Celest [Database].
  ///
  /// ```dart
  /// import 'package:celest/celest.dart';
  /// import 'my_database.dart';
  ///
  /// const db = Database(
  ///  schema: Schema.drift(MyDatabase),
  /// );
  /// ```
  const factory Schema.drift(Type databaseType) = _DriftSchema;
}

final class _DriftSchema extends Schema {
  const _DriftSchema(this.databaseType);

  final Type databaseType;
}
