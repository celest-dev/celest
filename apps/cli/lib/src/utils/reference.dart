import 'package:celest_cli/codegen/types.dart';
import 'package:celest_cli/src/utils/dart_type.dart';
import 'package:code_builder/code_builder.dart';

extension ReferenceHelper on Reference {
  bool get isFunctionContext =>
      symbol == 'FunctionContext' &&
      (url?.startsWith('package:celest') ?? false);

  bool get isDartAsyncFuture => symbol == 'Future' && url == 'dart:async';

  bool get isDartAsyncFutureOr => symbol == 'FutureOr' && url == 'dart:async';

  bool get isDartCoreObject => symbol == 'Object' && url == 'dart:core';

  bool get isDartCoreString => symbol == 'String' && url == 'dart:core';

  bool get isDartCoreInt => symbol == 'int' && url == 'dart:core';

  bool get isDartCoreDouble => symbol == 'double' && url == 'dart:core';

  bool get isDartCoreBool => symbol == 'bool' && url == 'dart:core';

  bool get isDartCoreList => symbol == 'List' && url == 'dart:core';

  bool get isDartCoreMap => symbol == 'Map' && url == 'dart:core';

  bool get isDartCoreSet => symbol == 'Set' && url == 'dart:core';

  bool get isDartCoreIterable => symbol == 'Iterable' && url == 'dart:core';

  bool get isDartCoreNull => symbol == 'Null' && url == 'dart:core';

  bool get isDartCoreEnum => symbol == 'Enum' && url == 'dart:core';

  TypeReference get toTypeReference => switch (this) {
        final TypeReference type => type,
        _ => TypeReference(
            (t) => t
              ..symbol = symbol
              ..url = url,
          ),
      };

  TypeReference get flattened {
    // TODO(dnys1): Should take FutureOr flattening into account, e.g.
    // FutureOr<T>? => T?
    switch (this) {
      case final TypeReference type
          when type.isDartAsyncFuture || type.isDartAsyncFutureOr:
        return type.types.first.toTypeReference;
      default:
        return toTypeReference;
    }
  }

  /// Returns a nullable version of `this`.
  TypeReference get nullable {
    return toTypeReference.rebuild((t) => t.isNullable = true);
  }

  /// Returns a non-nullable version of `this`.
  TypeReference get nonNullable {
    return toTypeReference.rebuild((t) => t.isNullable = false);
  }

  bool get isNullableOrFalse => toTypeReference.isNullable ?? false;

  bool get isEnum => enumIndex[this] ?? false;

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
