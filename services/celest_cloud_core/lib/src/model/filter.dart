// ignore_for_file: omit_local_variable_types, non_constant_identifier_names

import 'dart:convert';

import 'package:celest_cloud_core/src/model/drift.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:meta/meta.dart';
import 'package:petitparser/petitparser.dart';

/// {@template celest_cloud_core.model.filter}
/// A filter expression that implements a subset of the Google API
/// [filter syntax](https://google.aip.dev/assets/misc/ebnf-filtering.txt).
///
/// This implementation supports:
/// - ✅ Logical operators (AND, OR, NOT)
/// - ✅ Comparison operators (=, !=, <, <=, >, >=, :)
/// - ❌ Function calls
/// - ✅ Nested expressions
/// - ❌ Field paths
/// {@endtemplate}
@immutable
sealed class Filter {
  const Filter();

  /// Parses a filter expression string into a [Filter] instance.
  factory Filter.parse(
    String filter, {
    AnyDriftTable? table,
  }) {
    final parser = _parserCache[table] ??= _createParser(table: table);
    final result = parser.parse(filter);
    switch (result) {
      case Success(:final value):
        return value;
      case Failure(:final message, :final position):
        throw FormatException(message, filter, position);
    }
  }

  /// The parser for filter expressions.
  static Parser<Filter> _createParser({
    AnyDriftTable? table,
  }) {
    final tableMapper = _TableMapper(table);

    // Basic tokens
    final WS = whitespace();
    final LPAREN = char('(');
    final RPAREN = char(')');
    final EQUALS = char('=');
    final NOT_EQUALS = string('!=');
    final LESS_THAN = char('<');
    final LESS_EQUALS = string('<=');
    final GREATER_THAN = char('>');
    final GREATER_EQUALS = string('>=');
    final HAS = char(':');
    final MINUS = char('-');
    final QUOTE = char('"');

    // keyword
    //  : NOT
    //  | AND
    //  | OR
    //  ;
    final NOT = string('NOT');
    final AND = string('AND');
    final OR = string('OR');
    // final keyword = [NOT, AND, OR].toChoiceParser();

    // TEXT
    //
    // A free-form set of characters without whitespace (WS)
    // or . (DOT) within it.
    final TEXT = pattern('a-zA-Z0-9_.').plus().flatten().labeled('TEXT');

    // STRING
    //
    // A quoted string which may or may not contain a special
    // wildcard `*` character at the beginning or end of the string to
    // indicate a prefix or suffix-based search within a restriction.
    final STRING = pattern('^"')
        .star()
        .flatten()
        .skip(before: QUOTE, after: QUOTE)
        .labeled('STRING');

    // Value may either be a TEXT or STRING.
    //
    // TEXT is a free-form set of characters without whitespace (WS)
    // or . (DOT) within it. The text may represent a variable, string,
    // number, boolean, or alternative literal value and must be handled
    // in a manner consistent with the service's intention.
    //
    // STRING is a quoted string which may or may not contain a special
    // wildcard `*` character at the beginning or end of the string to
    // indicate a prefix or suffix-based search within a restriction.
    //
    // value
    //  : TEXT
    //  | STRING
    //  ;
    final value = [STRING, TEXT].toChoiceParser().labeled('value');

    // Fields may be either a value or a keyword.
    //
    // field
    //  : value
    //  | keyword
    //  ;
    // final field = value.labeled('field');

    // Names may either be TEXT or a keyword.
    //
    // name
    //  : TEXT
    //  | keyword
    //  ;
    // final name = TEXT;

    // Member expressions are either value or DOT qualified field references.
    //
    // Example: `expr.type_map.1.type`
    //
    // member
    //  : value {DOT field}
    //  ;
    final member = value.labeled('member'); // No support for dot access

    // Comparable may either be a member or function.
    //
    // comparable
    //  : member
    //  | function
    //  ;
    final comparable =
        member.labeled('comparable'); // No support for functions.

    // comparator
    //  : LESS_EQUALS      # <=
    //  | LESS_THAN        # <
    //  | GREATER_EQUALS   # >=
    //  | GREATER_THAN     # >
    //  | NOT_EQUALS       # !=
    //  | EQUALS           # =
    //  | HAS              # :
    //  ;
    final comparator = [
      LESS_EQUALS.map((_) => FilterComparator.lessEquals),
      LESS_THAN.map((_) => FilterComparator.lessThan),
      GREATER_EQUALS.map((_) => FilterComparator.greaterEquals),
      GREATER_THAN.map((_) => FilterComparator.greaterThan),
      NOT_EQUALS.map((_) => FilterComparator.notEquals),
      EQUALS.map((_) => FilterComparator.equals),
      HAS.map((_) => FilterComparator.has),
    ].toChoiceParser().labeled('comparator');

    final expression = undefined<Filter>();

    // composite
    //  : LPAREN expression RPAREN
    //  ;
    final composite =
        expression.skip(before: LPAREN, after: RPAREN).labeled('composite');

    // arg
    //  : comparable
    //  | composite
    //  ;
    final arg = comparable.labeled('arg');

    // Restrictions express a relationship between a comparable value and a
    // single argument. When the restriction only specifies a comparable
    // without an operator, this is a global restriction.
    //
    // Note, restrictions are not whitespace sensitive.
    //
    // Examples:
    // * equality         : `package=com.google`
    // * inequality       : `msg != 'hello'`
    // * greater than     : `1 > 0`
    // * greater or equal : `2.5 >= 2.4`
    // * less than        : `yesterday < request.time`
    // * less or equal    : `experiment.rollout <= cohort(request.user)`
    // * has              : `map:key`
    // * global           : `prod`
    //
    // In addition to the global, equality, and ordering operators, filters
    // also support the has (`:`) operator. The has operator is unique in
    // that it can test for presence or value based on the proto3 type of
    // the `comparable` value. The has operator is useful for validating the
    // structure and contents of complex values.
    //
    // restriction
    //  : comparable [comparator arg]
    //  ;
    final restriction = seq3(
      comparable,
      comparator.trim(),
      arg,
    )
        .map(
          (restriction) => tableMapper.parseRestriction(
            restriction.$1,
            restriction.$2,
            restriction.$3,
          ),
        )
        .labeled('restriction');

    // Simple expressions may either be a restriction or a nested (composite)
    // expression.
    //
    // simple
    //  : restriction
    //  | composite
    //  ;
    final simple = [restriction, composite].toChoiceParser().labeled('simple');

    // Terms may either be unary or simple expressions.
    //
    // Unary expressions negate the simple expression, either mathematically `-`
    // or logically `NOT`. The negation styles may be used interchangeably.
    //
    // Note, the `NOT` is case-sensitive and must be followed by at least one
    // whitespace (WS).
    //
    // Examples:
    // * logical not     : `NOT (a OR b)`
    // * alternative not : `-file:".java"`
    // * negation        : `-30`
    //
    // term
    //  : [(NOT WS | MINUS)] simple
    //  ;
    final term = seq2(
      [NOT.skip(after: WS), MINUS].toChoiceParser().optional(),
      simple,
    ).map((term) {
      final simple = term.$2;
      if (term.$1 != null) {
        return FilterNot(operand: simple);
      }
      return simple;
    }).labeled('term');

    // Factors may either be a disjunction (OR) of terms or a simple term.
    //
    // Note, the OR is case-sensitive.
    //
    // Example: `a < 10 OR a >= 100`
    //
    // factor
    //  : term {WS OR WS term}
    //  ;
    final factor = term.plusSeparated(OR.trim()).map((terms) {
      if (terms.elements.length == 1) {
        return terms.elements.first;
      }
      return FilterOr(terms: terms.elements);
    }).labeled('factor');

    // Sequence is composed of one or more whitespace (WS) separated factors.
    //
    // A sequence expresses a logical relationship between 'factors' where
    // the ranking of a filter result may be scored according to the number
    // factors that match and other such criteria as the proximity of factors
    // to each other within a document.
    //
    // When filters are used with exact match semantics rather than fuzzy
    // match semantics, a sequence is equivalent to AND.
    //
    // Example: `New York Giants OR Yankees`
    //
    // The expression `New York (Giants OR Yankees)` is equivalent to the
    // example.
    //
    // sequence
    //  : factor {WS factor}
    //  ;
    // final sequence = factor.plusSeparated(WS);

    // Expressions may either be a conjunction (AND) of sequences or a simple
    // sequence.
    //
    // Note, the AND is case-sensitive.
    //
    // Example: `a b AND c AND d`
    //
    // The expression `(a b) AND c AND d` is equivalent to the example.
    //
    // expression
    //  : sequence {WS AND WS sequence}
    //  ;
    expression.set(
      factor.plusSeparated(AND.trim()).map((factors) {
        if (factors.elements.length == 1) {
          return factors.elements.first;
        }
        return FilterAnd(factors: factors.elements);
      }).labeled('expression'),
    );

    return expression.end();
  }

  static final Map<AnyDriftTable?, Parser<Filter>> _parserCache = {};

  /// Converts this filter to a [DriftFilter] function.
  DriftFilter<Tbl> toDrift<Tbl extends ResultSetImplementation<Tbl, Object?>>();

  /// Returns a string representation of this filter.
  @override
  String toString();
}

/// A value in a filter expression.
@immutable
sealed class FilterValue {
  /// Converts this value to a Drift expression.
  Expression<Object> toDrift();
}

/// A reference to a field in the filter expression.
final class FilterField<T extends Object> implements FilterValue {
  /// Creates a new [FilterField] with the given [name].
  const FilterField(this.name, [this.column]);

  /// The name of this field.
  final String name;

  /// The column associated with this field, if any.
  final GeneratedColumn<T>? column;

  @override
  Expression<Object> toDrift() => column ?? Variable(name);

  @override
  bool operator ==(Object other) {
    return other is FilterField && name == other.name;
  }

  @override
  int get hashCode => Object.hash(FilterField, name);

  @override
  String toString() => name;
}

/// A literal value in the filter expression.
final class FilterLiteral<T extends Object> implements FilterValue {
  /// Creates a new [FilterLiteral] with the given [value].
  const FilterLiteral(this.value);

  /// The value of this literal.
  final T value;

  @override
  Expression<T> toDrift() => Constant(value);

  @override
  bool operator ==(Object other) {
    return other is FilterLiteral && value == other.value;
  }

  @override
  int get hashCode => Object.hash(FilterLiteral, value);

  @override
  String toString() => value is String ? '"$value"' : '$value';
}

/// A filter that represents a logical AND operation.
@immutable
final class FilterAnd extends Filter {
  /// Creates a new [FilterAnd] with the given [factors].
  const FilterAnd({required this.factors});

  /// The factors of this AND operation.
  final List<Filter> factors;

  @override
  DriftFilter<Tbl>
      toDrift<Tbl extends ResultSetImplementation<Tbl, Object?>>() {
    return (tbl) {
      var expression = factors.first.toDrift<Tbl>()(tbl);
      for (final factor in factors.skip(1)) {
        expression = expression & factor.toDrift<Tbl>()(tbl);
      }
      return expression;
    };
  }

  @override
  String toString() => factors.join(' AND ');

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is FilterAnd && factors.equals(other.factors);
  }

  @override
  int get hashCode => Object.hashAll(factors);
}

/// A filter that represents a logical OR operation.
@immutable
final class FilterOr extends Filter {
  /// Creates a new [FilterOr] with the given [terms].
  const FilterOr({required this.terms});

  /// The terms of this OR operation.
  final List<Filter> terms;

  @override
  DriftFilter<Tbl>
      toDrift<Tbl extends ResultSetImplementation<Tbl, Object?>>() {
    return (tbl) {
      var expression = terms.first.toDrift<Tbl>()(tbl);
      for (final factor in terms.skip(1)) {
        expression = expression | factor.toDrift<Tbl>()(tbl);
      }
      return expression;
    };
  }

  @override
  String toString() => terms.join(' OR ');

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is FilterOr && terms.equals(other.terms);
  }

  @override
  int get hashCode => Object.hashAll(terms);
}

/// A filter that represents a logical NOT operation.
@immutable
final class FilterNot extends Filter {
  /// Creates a new [FilterNot] with the given [operand].
  const FilterNot({required this.operand});

  /// The operand of this NOT operation.
  final Filter operand;

  @override
  DriftFilter<Tbl>
      toDrift<Tbl extends ResultSetImplementation<Tbl, Object?>>() {
    return (tbl) {
      return operand.toDrift<Tbl>()(tbl).not();
    };
  }

  @override
  String toString() => '(NOT $operand)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is FilterNot && operand == other.operand;
  }

  @override
  int get hashCode => operand.hashCode;
}

/// A filter that represents a restriction.
@immutable
final class FilterRestriction extends Filter {
  /// Creates a new [FilterRestriction] with the given [field],
  /// [comparator], and [arg].
  const FilterRestriction({
    required this.field,
    required this.comparator,
    required this.arg,
  });

  /// The comparable value of this restriction.
  final FilterField field;

  /// The comparator of this restriction.
  final FilterComparator comparator;

  /// The argument of this restriction, if any.
  final FilterValue arg;

  @override
  DriftFilter<Tbl>
      toDrift<Tbl extends ResultSetImplementation<Tbl, Object?>>() {
    return (Tbl tbl) {
      final column = tbl.columnsByName[field.name]!;
      GeneratedColumn<Comparable<dynamic>> comparable() {
        return column as GeneratedColumn<Comparable<dynamic>>;
      }

      final value = arg.toDrift();
      Expression<Comparable<Object>> comparableValue() {
        return value as Expression<Comparable<Object>>;
      }

      return switch (comparator) {
        FilterComparator.has => column.isNotNull(),
        FilterComparator.equals => column.equalsExp(value),
        FilterComparator.notEquals => column.equalsExp(value).not(),
        FilterComparator.greaterEquals =>
          comparable().isBiggerOrEqual(comparableValue()),
        FilterComparator.greaterThan =>
          comparable().isBiggerThan(comparableValue()),
        FilterComparator.lessEquals =>
          comparable().isSmallerOrEqual(comparableValue()),
        FilterComparator.lessThan =>
          comparable().isSmallerThan(comparableValue()),
      };
    };
  }

  @override
  String toString() {
    return '$field ${comparator.symbol} $arg';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is FilterRestriction &&
            field == other.field &&
            comparator == other.comparator &&
            arg == other.arg;
  }

  @override
  int get hashCode => Object.hashAll([field, comparator, arg]);
}

/// The supported comparators in filter expressions.
enum FilterComparator {
  /// Less than or equal to (`<=`).
  lessEquals('<='),

  /// Less than (`<`).
  lessThan('<'),

  /// Greater than or equal to (`>=`).
  greaterEquals('>='),

  /// Greater than (`>`).
  greaterThan('>'),

  /// Not equal to (`!=`).
  notEquals('!='),

  /// Equal to (`=`).
  equals('='),

  /// Has (`:`).
  has(':');

  /// Creates a new [FilterComparator] with the given [symbol].
  const FilterComparator(this.symbol);

  /// Returns true if this comparator needs a Dart comparable type.
  bool get needsDartComparable {
    return switch (this) {
      equals || notEquals || has => false,
      lessEquals || lessThan || greaterEquals || greaterThan => true,
    };
  }

  /// The symbol of this comparator.
  final String symbol;
}

extension type _TableMapper(AnyDriftTable? _table) {
  FilterRestriction parseRestriction(
    String field,
    FilterComparator comparator,
    String value,
  ) {
    final table = _table;
    if (table == null) {
      return FilterRestriction(
        field: FilterField(field),
        comparator: comparator,
        arg: FilterLiteral(value),
      );
    }
    final column = table.columnsByName[field];
    if (column == null) {
      throw FormatException(
        'Invalid filter: $field is not valid for resource.',
      );
    }
    final type = column.driftSqlType;
    if (type is! DriftSqlType) {
      throw FormatException(
        'Invalid filter: $field is not a standard SQL type.',
      );
    }
    final arg = switch (type) {
      DriftSqlType.bool => FilterLiteral<bool>(bool.parse(value)),
      DriftSqlType.blob => FilterLiteral<Uint8List>(base64Decode(value)),
      DriftSqlType.dateTime => FilterLiteral<DateTime>(DateTime.parse(value)),
      DriftSqlType.double => FilterLiteral<double>(double.parse(value)),
      DriftSqlType.int => FilterLiteral<int>(int.parse(value)),
      DriftSqlType.bigInt => FilterLiteral<BigInt>(BigInt.parse(value)),
      DriftSqlType.string || DriftSqlType.any => FilterLiteral<String>(value),
    };
    if (comparator.needsDartComparable && arg.value is! Comparable) {
      throw FormatException(
        'Cannot filter on $field: Argument type is not comparable '
        '(value=${arg.value}, type=${arg.value.runtimeType}).',
      );
    }
    return FilterRestriction(
      field: FilterField(field, column),
      comparator: comparator,
      arg: arg,
    );
  }
}
