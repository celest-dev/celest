import 'package:drift/drift.dart';

/// A function that takes a table and returns a boolean expression.
typedef DriftFilter<Tbl extends ResultSetImplementation<Tbl, Object?>>
    = Expression<bool> Function(Tbl table);

/// Any Drift table type.
typedef AnyDriftTable = ResultSetImplementation<Object?, Object?>;
