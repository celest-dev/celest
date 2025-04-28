import 'dart:convert';

import 'package:celest_cloud_core/src/model/filter.dart';
import 'package:checks/checks.dart';
import 'package:drift/drift.dart';
import 'package:drift/src/runtime/types/mapping.dart';
import 'package:test/fake.dart';
import 'package:test/test.dart';

final class TestColumn<T extends Object> extends Fake
    implements GeneratedColumn<T> {
  TestColumn(this.$name, this.driftSqlType);

  @override
  final String $name;

  @override
  // ignore: invalid_use_of_internal_member
  final BaseSqlType<T> driftSqlType;
}

final class TestTable extends Fake
    implements ResultSetImplementation<Object?, Object?> {
  TestTable(
    this.aliasedName, {
    required this.columnsByName,
  });

  @override
  final String aliasedName;

  @override
  final Map<String, GeneratedColumn<Object>> columnsByName;
}

void main() {
  final testTable = TestTable(
    'test_table',
    columnsByName: {
      'name': TestColumn<String>('name', DriftSqlType.string),
      'age': TestColumn<int>('age', DriftSqlType.int),
      'tags': TestColumn<String>('tags', DriftSqlType.string),
      'is_active': TestColumn<bool>('is_active', DriftSqlType.bool),
      'created_at': TestColumn<DateTime>('created_at', DriftSqlType.dateTime),
      'points': TestColumn<double>('points', DriftSqlType.double),
      'data': TestColumn<Uint8List>('data', DriftSqlType.blob),
    },
  );

  for (final (withTable, table) in [(false, null), (true, testTable)]) {
    group('Filter${withTable ? ' (with table)' : ''}', () {
      test('parses simple field comparison', () {
        final filter = Filter.parse('name = "John"', table: table);
        check(filter).equals(
          const FilterRestriction(
            field: FilterField('name'),
            comparator: FilterComparator.equals,
            arg: FilterLiteral('John'),
          ),
        );
      });

      test('parses numeric comparison', () {
        final filter = Filter.parse('age > 18', table: table);
        check(filter).equals(
          FilterRestriction(
            field: const FilterField('age'),
            comparator: FilterComparator.greaterThan,
            arg:
                withTable ? const FilterLiteral(18) : const FilterLiteral('18'),
          ),
        );
      });

      test('parses boolean comparison', () {
        final filter = Filter.parse('is_active = true', table: table);
        check(filter).equals(
          FilterRestriction(
            field: const FilterField('is_active'),
            comparator: FilterComparator.equals,
            arg: withTable
                ? const FilterLiteral(true)
                : const FilterLiteral('true'),
          ),
        );
      });

      test('parses datetime comparison', () {
        final now = DateTime.now();
        final filter = Filter.parse(
          'created_at > "${now.toIso8601String()}"',
          table: table,
        );
        check(filter).equals(
          FilterRestriction(
            field: const FilterField('created_at'),
            comparator: FilterComparator.greaterThan,
            arg: withTable
                ? FilterLiteral(now)
                : FilterLiteral(now.toIso8601String()),
          ),
        );
      });

      test('parses double comparison', () {
        final filter = Filter.parse('points < 100.5', table: table);
        check(filter).equals(
          FilterRestriction(
            field: const FilterField('points'),
            comparator: FilterComparator.lessThan,
            arg: withTable
                ? const FilterLiteral(100.5)
                : const FilterLiteral('100.5'),
          ),
        );
      });

      test('parses blob comparison', () {
        final data = Uint8List.fromList([1, 2, 3]);
        final filter = Filter.parse(
          'data = ${base64Encode(data)}',
          table: table,
        );
        check(filter).isA<FilterRestriction>()
          ..has((it) => it.field.name, 'field').equals('data')
          ..has((it) => it.comparator, 'comparator')
              .equals(FilterComparator.equals)
          ..has((it) => it.arg, 'arg')
              .isA<FilterLiteral>()
              .has((it) => it.value, 'value')
              .which((value) {
            if (withTable) {
              value.isA<Uint8List>().deepEquals(data);
            } else {
              value.isA<String>().equals(base64Encode(data));
            }
          });
      });

      test('parses logical AND', () {
        final filter = Filter.parse(
          'age > 18 AND name = "John"',
          table: table,
        );
        check(filter).equals(
          FilterAnd(
            factors: [
              FilterRestriction(
                field: const FilterField('age'),
                comparator: FilterComparator.greaterThan,
                arg: withTable
                    ? const FilterLiteral(18)
                    : const FilterLiteral('18'),
              ),
              const FilterRestriction(
                field: FilterField('name'),
                comparator: FilterComparator.equals,
                arg: FilterLiteral('John'),
              ),
            ],
          ),
        );
      });

      test('parses logical OR', () {
        final filter = Filter.parse(
          'age > 18 OR name = "John"',
          table: table,
        );
        check(filter).equals(
          FilterOr(
            terms: [
              FilterRestriction(
                field: const FilterField('age'),
                comparator: FilterComparator.greaterThan,
                arg: withTable
                    ? const FilterLiteral(18)
                    : const FilterLiteral('18'),
              ),
              const FilterRestriction(
                field: FilterField('name'),
                comparator: FilterComparator.equals,
                arg: FilterLiteral('John'),
              ),
            ],
          ),
        );
      });

      test('parses NOT expression', () {
        final filter = Filter.parse(
          'NOT name = "John"',
          table: table,
        );
        check(filter).equals(
          const FilterNot(
            operand: FilterRestriction(
              field: FilterField('name'),
              comparator: FilterComparator.equals,
              arg: FilterLiteral('John'),
            ),
          ),
        );
      });

      test('parses complex nested expression', () {
        final filter = Filter.parse(
          '(age > 18 AND name = "John") OR (age < 18 AND name = "Jane")',
          table: table,
        );
        check(filter).equals(
          FilterOr(
            terms: [
              FilterAnd(
                factors: [
                  FilterRestriction(
                    field: const FilterField('age'),
                    comparator: FilterComparator.greaterThan,
                    arg: withTable
                        ? const FilterLiteral(18)
                        : const FilterLiteral('18'),
                  ),
                  const FilterRestriction(
                    field: FilterField('name'),
                    comparator: FilterComparator.equals,
                    arg: FilterLiteral('John'),
                  ),
                ],
              ),
              FilterAnd(
                factors: [
                  FilterRestriction(
                    field: const FilterField('age'),
                    comparator: FilterComparator.lessThan,
                    arg: withTable
                        ? const FilterLiteral(18)
                        : const FilterLiteral('18'),
                  ),
                  const FilterRestriction(
                    field: FilterField('name'),
                    comparator: FilterComparator.equals,
                    arg: FilterLiteral('Jane'),
                  ),
                ],
              ),
            ],
          ),
        );
      });

      test('parses has operator', () {
        final filter = Filter.parse(
          'tags: "important"',
          table: table,
        );
        check(filter).equals(
          const FilterRestriction(
            field: FilterField('tags'),
            comparator: FilterComparator.has,
            arg: FilterLiteral('important'),
          ),
        );
      });

      test('parses multiple comparison operators', () {
        final filter = Filter.parse(
          'age >= 18 AND age <= 65',
          table: table,
        );
        check(filter).equals(
          FilterAnd(
            factors: [
              FilterRestriction(
                field: const FilterField('age'),
                comparator: FilterComparator.greaterEquals,
                arg: withTable
                    ? const FilterLiteral(18)
                    : const FilterLiteral('18'),
              ),
              FilterRestriction(
                field: const FilterField('age'),
                comparator: FilterComparator.lessEquals,
                arg: withTable
                    ? const FilterLiteral(65)
                    : const FilterLiteral('65'),
              ),
            ],
          ),
        );
      });

      test('parses not equals operator', () {
        final filter = Filter.parse('name != "John"', table: table);
        check(filter).equals(
          const FilterRestriction(
            field: FilterField('name'),
            comparator: FilterComparator.notEquals,
            arg: FilterLiteral('John'),
          ),
        );
      });

      test('throws FormatException for invalid syntax', () {
        check(() => Filter.parse('invalid syntax', table: table))
            .throws<FormatException>();
      });

      test('throws FormatException for incomplete expression', () {
        check(() => Filter.parse('name =', table: table))
            .throws<FormatException>();
      });

      test('throws FormatException for missing closing parenthesis', () {
        check(
          () => Filter.parse(
            '(age > 18 AND name = "John"',
            table: table,
          ),
        ).throws<FormatException>();
      });

      test('throws FormatException for invalid operator', () {
        check(() => Filter.parse('age <> 18', table: table))
            .throws<FormatException>();
      });

      if (withTable) {
        test('throws FormatException for invalid field type', () {
          check(
            () => Filter.parse(
              'invalid_field = "value"',
              table: table,
            ),
          ).throws<FormatException>();
        });
      }
    });
  }
}
