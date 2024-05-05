import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:checks/checks.dart';
import 'package:checks/context.dart';

extension OpenApiTypeCheck<T extends OpenApiType> on Subject<T> {
  void isNullable() {
    context.expect(() => const ['is nullable'], (actual) {
      if (!actual.isNullable) return Rejection();
      return null;
    });
  }

  void isNonNullable() {
    context.expect(() => const ['is non-nullable'], (actual) {
      if (actual.isNullable) return Rejection();
      return null;
    });
  }

  void isNeverType() {
    context.expect(() => const ['is Never type'], (actual) {
      if (!identical(OpenApiEmptyType.instance, actual)) return Rejection();
      return null;
    });
  }

  Subject<OpenApiIntegerType> isIntType() {
    return context
        .nest(
          () => const ['is int type'],
          Extracted.value,
          atSameLevel: true,
        )
        .isA<OpenApiIntegerType>();
  }

  Subject<OpenApiDoubleType> isDoubleType() {
    return context
        .nest(
          () => const ['is double type'],
          Extracted.value,
          atSameLevel: true,
        )
        .isA<OpenApiDoubleType>();
  }

  Subject<OpenApiNumberType> isNumType() {
    return context
        .nest(
          () => const ['is num type'],
          Extracted.value,
          atSameLevel: true,
        )
        .isA<OpenApiNumberType>();
  }

  Subject<OpenApiBooleanType> isBoolType() {
    return context
        .nest(
          () => const ['is bool type'],
          Extracted.value,
          atSameLevel: true,
        )
        .isA<OpenApiBooleanType>();
  }

  Subject<OpenApiStringType> isStringType() {
    return context
        .nest(
          () => const ['is string type'],
          Extracted.value,
          atSameLevel: true,
        )
        .isA<OpenApiStringType>();
  }

  Subject<OpenApiAnyType> isObjectType() {
    return context
        .nest(
          () => const ['is any type'],
          Extracted.value,
          atSameLevel: true,
        )
        .isA<OpenApiAnyType>();
  }

  Subject<OpenApiIterableType> isIterableType({
    void Function(Subject<OpenApiType>)? withItemType,
  }) {
    final iterable = context
        .nest(
          () => const ['is any type'],
          Extracted.value,
          atSameLevel: true,
        )
        .isA<OpenApiIterableType>();
    withItemType?.call(
      iterable.has((it) => it.itemType, 'itemType'),
    );
    return iterable;
  }
}
