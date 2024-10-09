import 'package:analyzer/dart/element/type.dart' as ast;
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:code_builder/code_builder.dart';

extension ReferenceHelper on Reference {
  bool get isPackageCelest => switch (url) {
        final url? => url.startsWith('package:celest') &&
            !url.startsWith('package:celest_backend'),
        _ => false,
      };
  bool get isFunctionContext =>
      symbol == 'FunctionContext' &&
      (url?.startsWith('package:celest') ?? false);

  bool get isDynamic => symbol == 'dynamic' && url == 'dart:core';
  bool get isDartCoreObject => symbol == 'Object' && url == 'dart:core';

  TypeReference get toTypeReference => switch (this) {
        final TypeReference type => type,
        final RecordType recordType => TypeReference((t) {
            final dartType =
                typeHelper.fromReference(recordType) as ast.RecordType;
            t
              ..symbol = dartType.symbol
              ..url = dartType.sourceUri?.toString()
              ..isNullable = recordType.isNullable;
          }),
        final FunctionType functionType => TypeReference((t) {
            final dartType =
                typeHelper.fromReference(functionType) as ast.FunctionType;
            t
              ..symbol = dartType.getDisplayString(withNullability: true)
              ..url = dartType.sourceUri?.toString()
              ..isNullable = functionType.isNullable;
          }),
        _ => TypeReference(
            (t) {
              assert(symbol != null);
              t
                ..symbol = symbol
                ..url = url;
            },
          ),
      };

  /// Returns a nullable version of `this`.
  TypeReference get nullable {
    return toTypeReference.rebuild((t) => t.isNullable = true);
  }

  /// Returns a non-nullable version of `this`.
  TypeReference get nonNullable {
    return toTypeReference.rebuild((t) => t.isNullable = false);
  }

  Reference get noBound {
    return switch (this) {
      final TypeReference type => type.rebuild(
          (t) => t
            ..bound = null
            ..types.map((t) => t.toTypeReference.noBound),
        ),
      _ => this,
    };
  }

  Reference withNullability(bool isNullable) => switch (this) {
        final RecordType recordType =>
          recordType.rebuild((t) => t..isNullable = isNullable),
        final FunctionType functionType =>
          functionType.rebuild((t) => t..isNullable = isNullable),
        final TypeReference type => type.rebuild((t) {
            if (symbol != 'dynamic') t.isNullable = isNullable;
          }),
        _ => toTypeReference.rebuild((t) => t..isNullable = isNullable),
      };

  bool get isNullableOrFalse => switch (this) {
        TypeReference(:final isNullable) => isNullable ?? false,
        RecordType(:final isNullable) => isNullable ?? false,
        _ => false,
      };

  /// Constructs a `built_value` FullType reference for this.
  Expression fullType([Iterable<Reference>? parameters]) {
    final typeRef = toTypeReference;
    final ctor = typeRef.isNullable ?? false
        ? (Iterable<Expression> args) =>
            DartTypes.builtValue.fullType.constInstanceNamed('nullable', args)
        : DartTypes.builtValue.fullType.constInstance;
    if (typeRef.types.isEmpty && (parameters == null || parameters.isEmpty)) {
      return ctor([typeRef.nonNullable]);
    }
    return ctor([
      typeRef.rebuild((t) => t.types.clear()).nonNullable,
      literalList(
        parameters?.map((param) => param.fullType()) ??
            typeRef.types.map((t) => t.fullType()),
      ),
    ]);
  }

  /// A unique, readable name for this type which can be used in generated code
  /// and over the wire.
  ///
  /// We try to follow protobuf versioning guidelines and use the package name,
  /// organization name, and the version to give types unique names which are
  /// easy to interpret and do not expose implementation details.
  String? externalUri(String projectName) {
    assert(symbol != null, 'Symbol is null for $this');
    if (url == null) {
      // Would only be an anonymous record type.
      return null;
    }
    final sourceUri = Uri.parse(url!);
    final externalPackageId = switch (sourceUri) {
      Uri(scheme: 'dart') => 'dart.${sourceUri.pathSegments.single}',
      // TODO(dnys1): Include organization name
      // TODO(dnys1): Include version tag
      Uri(scheme: 'package', pathSegments: ['celest_backend', ...]) ||
      Uri(pathSegments: []) =>
        '$projectName.v1',
      Uri(scheme: 'package', pathSegments: [final package, ...])
          when isPackageCelest =>
        '${package.split('_').join('.')}.v1',
      // TODO(dnys1): Should this include the package's major version?
      Uri(scheme: 'package', :final pathSegments) => pathSegments.first,
      _ => unreachable('Unexpected source URI: $sourceUri'),
    };
    return '$externalPackageId.$symbol';
  }
}

Expression mapIf(Expression condition, Expression key) =>
    _MapIfExpression(condition: condition, key: key);

final class _MapIfExpression extends Expression {
  _MapIfExpression({
    required this.condition,
    required this.key,
  });

  final Expression condition;
  final Expression key;

  @override
  R accept<R>(covariant ExpressionVisitor<R> visitor, [R? context]) {
    return visitor.visitCodeExpression(
      CodeExpression(
        Block.of([
          const Code('if ('),
          condition.code,
          const Code(') '),
          key.code,
        ]),
      ),
      context,
    );
  }
}

Expression nullCheckBind(
  String variableName,
  Expression expression, {
  bool isNullable = true,
}) =>
    NullCheckCaseExpression(
      variableName: variableName,
      caseClause: expression,
      isNullable: isNullable,
    );

// Creates a `value case final variable?` expression.
final class NullCheckCaseExpression extends Expression {
  NullCheckCaseExpression({
    required this.caseClause,
    required this.variableName,
    this.isNullable = true,
  });

  final Expression caseClause;
  final String variableName;
  final bool isNullable;

  @override
  R accept<R>(covariant ExpressionVisitor<R> visitor, [R? context]) {
    return visitor.visitCodeExpression(
      CodeExpression(
        Block.of([
          caseClause.code,
          const Code(' case final '),
          Code(variableName),
          if (isNullable) const Code('?'),
        ]),
      ),
      context,
    );
  }
}

extension ExpressionUtil on Expression {
  /// The property getter, given [isNullable].
  Expression nullableProperty(String name, bool isNullable) {
    if (isNullable) {
      return nullSafeProperty(name);
    } else {
      return property(name);
    }
  }

  Expression nullSafeIndex(
    Expression index, {
    bool isNullable = true,
  }) =>
      _BinaryExpression(
        // ignore: invalid_use_of_visible_for_overriding_member
        expression,
        CodeExpression(
          Block.of([
            const Code('['),
            index.code,
            const Code(']'),
          ]),
        ),
        isNullable ? '?' : '',
      );

  Expression wrapWithInlineNullCheck(
    Expression check, [
    bool isNullable = true,
  ]) {
    if (!isNullable) return this;
    return check.equalTo(literalNull).conditional(literalNull, nullChecked);
  }

  Code wrapWithBlockNullCheck(Expression check, bool isNullable) {
    return isNullable
        ? nullChecked.wrapWithBlockIf(check, isNullable)
        : wrapWithBlockIf(check, isNullable);
  }

  Code wrapWithBlockIf(Expression check, [bool performCheck = true]) {
    return Block.of([
      if (performCheck) ...[
        const Code('if ('),
        check.code,
        const Code(') {'),
      ],
      statement,
      if (performCheck) const Code('}'),
    ]);
  }

  /// Strips the `const` keyword from this expression.
  ///
  // TODO(dnys1): File a ticket with `code_builder` since this is only used to
  /// workaround limitation with const constructors in annotations.
  Expression get stripConst {
    if (this case final InvokeExpression invoke) {
      return InvokeExpression.newOf(
        invoke.target,
        invoke.positionalArguments,
        invoke.namedArguments,
        invoke.typeArguments,
        invoke.name,
      );
    }
    return this;
  }
}

extension CodeHelpers on Code {
  Code wrapWithBlockIf(Expression check, [bool performCheck = true]) {
    return Block.of([
      if (performCheck) ...[
        const Code('if ('),
        check.code,
        const Code(') {'),
      ],
      this,
      if (performCheck) const Code('}'),
    ]);
  }
}

final class _BinaryExpression extends Expression implements BinaryExpression {
  const _BinaryExpression(
    this.left,
    this.right,
    this.operator,
  );

  @override
  final Expression left;
  @override
  final Expression right;
  @override
  final String operator;
  @override
  bool get addSpace => true;
  @override
  bool get isConst => false;

  @override
  R accept<R>(ExpressionVisitor<R> visitor, [R? context]) =>
      visitor.visitBinaryExpression(this, context);
}
