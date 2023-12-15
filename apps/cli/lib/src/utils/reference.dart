import 'package:analyzer/dart/element/type.dart' as ast;
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:code_builder/code_builder.dart';

extension ReferenceHelper on Reference {
  bool get isFunctionContext =>
      symbol == 'FunctionContext' &&
      (url?.startsWith('package:celest') ?? false);

  TypeReference get toTypeReference => switch (this) {
        final TypeReference type => type,
        final RecordType recordType => TypeReference(
            (t) => t
              ..symbol =
                  (typeHelper.fromReference(recordType) as ast.RecordType)
                      .symbol
              ..url =
                  (typeHelper.fromReference(recordType) as ast.RecordType).url
              ..isNullable = recordType.isNullable,
          ),
        _ => TypeReference(
            (t) => t
              ..symbol = symbol
              ..url = url,
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

  TypeReference withNullability(bool isNullable) {
    return toTypeReference.rebuild((t) => t.isNullable = isNullable);
  }

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

  Expression wrapWithInlineNullCheck(Expression check) {
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
    this.operator, {
    this.addSpace = true,
    this.isConst = false,
  });

  @override
  final Expression left;
  @override
  final Expression right;
  @override
  final String operator;
  @override
  final bool addSpace;
  @override
  final bool isConst;

  @override
  R accept<R>(ExpressionVisitor<R> visitor, [R? context]) =>
      visitor.visitBinaryExpression(this, context);
}
