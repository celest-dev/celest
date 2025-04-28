import 'package:celest_cloud_core/celest_cloud_core.dart';
import 'package:checks/checks.dart';
import 'package:drift/drift.dart';
import 'package:test/test.dart';

void main() {
  group('OrderBy', () {
    test('parses simple order by', () {
      final orderBy = OrderByClause.parse('name');
      check(orderBy).deepEquals(
        const OrderByClause([
          OrderByField(['name'], mode: OrderingMode.asc)
        ]),
      );
    });

    test('parses descending order by', () {
      final orderBy = OrderByClause.parse('-age');
      check(orderBy).deepEquals(
        const OrderByClause([
          OrderByField(['age'], mode: OrderingMode.desc)
        ]),
      );
    });

    test('parses multiple order by fields', () {
      final orderBy = OrderByClause.parse('name, -age');
      check(orderBy).deepEquals(
        const OrderByClause([
          OrderByField(['name'], mode: OrderingMode.asc),
          OrderByField(['age'], mode: OrderingMode.desc)
        ]),
      );
    });

    test('parses nested order by fields', () {
      final orderBy = OrderByClause.parse('user.name, -user.age');
      check(orderBy).deepEquals(
        const OrderByClause([
          OrderByField(['user', 'name'], mode: OrderingMode.asc),
          OrderByField(['user', 'age'], mode: OrderingMode.desc)
        ]),
      );
    });

    test('parses order by no spaces', () {
      final orderBy = OrderByClause.parse('name,-age');
      check(orderBy).deepEquals(
        const OrderByClause([
          OrderByField(['name'], mode: OrderingMode.asc),
          OrderByField(['age'], mode: OrderingMode.desc)
        ]),
      );
    });

    test('throws on invalid order by', () {
      check(() => OrderByClause.parse('name, -')).throws<FormatException>();
    });

    test('throws on excess whitespace', () {
      check(() => OrderByClause.parse(' name , -age '))
          .throws<FormatException>();
    });
  });
}
