// ignore_for_file: omit_local_variable_types

import 'package:celest_core/celest_core.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:petitparser/petitparser.dart';

final class OrderByField {
  const OrderByField(
    this.path, {
    this.mode = OrderingMode.asc,
  });

  final List<String> path;
  final OrderingMode mode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is OrderByField &&
            runtimeType == other.runtimeType &&
            path.equals(other.path) &&
            mode == other.mode;
  }

  @override
  int get hashCode => Object.hashAll([mode, ...path]);

  @override
  String toString() {
    return '${path.join('.')} ${mode.name.toUpperCase()}';
  }
}

extension type const OrderByClause(List<OrderByField> fields)
    implements List<OrderByField> {
  factory OrderByClause.parse(String orderBy) {
    final result = switch (_parser.parse(orderBy)) {
      Success(:final value) => value,
      final Failure failure => throw FormatException(
          failure.message,
          orderBy,
          failure.position,
        ),
    };
    return OrderByClause(result);
  }

  Iterable<OrderingTerm>
      toOrderingTerms<Tbl extends ResultSetImplementation<Tbl, Object?>>(
    Tbl table,
  ) sync* {
    for (final field in fields) {
      if (field.path.length > 1) {
        throw BadRequestException(
          'Cannot order by "${field.path.join('.')}": '
          'Currently only single field ordering is supported.',
        );
      }
      final orderByCol = table.columnsByName[field.path.first];
      if (orderByCol == null) {
        throw BadRequestException(
          'Cannot order by "${field.path.join('.')}": '
          'Column not found.',
        );
      }
      yield OrderingTerm(expression: orderByCol, mode: field.mode);
    }
  }
}

/// Implements a subset of the orderBy spec used by GCP.
///
/// https://cloud.google.com/monitoring/api/v3/sorting-and-filtering#sort-order_syntax
final Parser<List<OrderByField>> _parser = () {
  // IDENTIFIER
  final Parser<String> identifier =
      (letter() & word().star()).flatten('IDENTIFIER');

  // FIELD_NAME
  final fieldName = [
    identifier.plusSeparated(char('.')).map((el) => el.elements),
    identifier.map((it) => [it]),
  ].toChoiceParser().labeled('FIELD_NAME');

  // FIELD_REFERENCE
  final fieldReference = fieldName.labeled('FIELD_REFERENCE');

  // ORDERED_FIELD
  final ascendingField =
      fieldReference.map((name) => OrderByField(name, mode: OrderingMode.asc));
  final descendingField = fieldReference
      .skip(before: char('-'))
      .map((name) => OrderByField(name, mode: OrderingMode.desc));
  final orderedField = [descendingField, ascendingField]
      .toChoiceParser()
      .labeled('ORDERED_FIELD');

  // ORDERED_FIELD_LIST
  final orderedFieldList = orderedField
      .plusSeparated(char(',').trim())
      .labeled('ORDERED_FIELD_LIST');

  // ORDER_BY_SPEC
  return orderedFieldList
      .map((res) => res.elements)
      .end()
      .labeled('ORDER_BY_SPEC');
}();
