import 'package:celest_cloud_core/celest_cloud_core.dart';
import 'package:celest_cloud_core/src/model/drift.dart';
import 'package:drift/drift.dart';

/// {@template celest_cloud_core.resource_type}
/// A resource type in Celest Cloud.
/// {@endtemplate}
final class ResourceTable<Tbl extends ResultSetImplementation<Tbl, Object?>> {
  /// {@macro celest_cloud_core.resource_type}
  ResourceTable({
    required this.table,
  });

  /// The table that this resource type represents.
  final Tbl table;

  /// Parses a filter string for this [table].
  ResourceTableFilter<Tbl> parseFilter(String filter) {
    return ResourceTableFilter(
      filter: Filter.parse(filter, table: table),
    );
  }
}

/// {@template celest_cloud_core.resource_filter}
/// A strongly-typed filter for a resource in Celest Cloud.
/// {@endtemplate}
final class ResourceTableFilter<
    Tbl extends ResultSetImplementation<Tbl, Object?>> {
  /// {@macro celest_cloud_core.resource_filter}
  ResourceTableFilter({
    required this.filter,
  });

  /// The parsed [Filter] object.
  final Filter filter;

  /// Converts the filter to a SQL WHERE clause for use in Drift.
  DriftFilter<Tbl> toDrift() => filter.toDrift<Tbl>();
}
