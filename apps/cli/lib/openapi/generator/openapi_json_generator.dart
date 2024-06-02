import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

final class OpenApiJsonGenerator {
  OpenApiJsonGenerator();

  Expression toJson(OpenApiType type, Expression ref) {
    switch (type) {
      case OpenApiDateType(:final primitiveType):
        switch (primitiveType) {
          case OpenApiIntegerType():
            return ref.nullableProperty(
              'millisecondsSinceEpoch',
              type.isNullable,
            );
          case OpenApiStringType():
            return ref
                .nullableProperty('toIso8601String', type.isNullable)
                .call([]);
          default:
            unreachable('Unexpected datetime time: $primitiveType');
        }
      case OpenApiSingleValueType(:final value):
        return literal(value);
      case OpenApiPrimitiveType(
              typeReference: TypeReference(url: == 'dart:core'),
            ) ||
            OpenApiEnumType(
              typeReference: TypeReference(url: == 'dart:core'),
            ):
        return ref;
      case OpenApiBinaryType(): // XFile
        return ref.property('path');
      case OpenApiIterableInterface(
          typeReference: TypeReference(url: == 'dart:core'),
          :final itemType,
        ):
        final element = refer('el');
        final serializedElement = toJson(itemType, element);
        if (element == serializedElement) {
          return ref;
        }
        return ref
            .nullableProperty('map', type.isNullable)
            .call([
              Method(
                (m) => m
                  ..requiredParameters.add(
                    Parameter(
                      (p) => p..name = 'el',
                    ),
                  )
                  ..body = serializedElement.code
                  ..lambda = true,
              ).closure,
            ])
            .property('toList')
            .call([]);
      case OpenApiRecordType(:final valueType):
        final value = refer('value');
        final serializedValue = toJson(valueType, value);
        if (value == serializedValue) {
          return ref;
        }
        return ref.nullableProperty('map', type.isNullable).call([
          Method(
            (m) => m
              ..requiredParameters.add(
                Parameter(
                  (p) => p..name = 'key',
                ),
              )
              ..requiredParameters.add(
                Parameter(
                  (p) => p..name = 'value',
                ),
              )
              ..body = DartTypes.core.mapEntry.newInstance([
                refer('key'),
                serializedValue,
              ]).code
              ..lambda = true,
          ).closure,
        ]);
      // case OpenApiTypeReference(:final primitiveType?):
      //   return toJson(primitiveType, ref);
      case OpenApiEmptyType():
      case OpenApiStructType():
      case OpenApiSealedType():
      case OpenApiTypeReference():
      case OpenApiPrimitiveType():
      case OpenApiIterableInterface():
      case OpenApiEnumType():
        return ref.nullableProperty('toJson', type.isNullable).call([]);
    }
  }

  Expression fromJson(
    OpenApiType type,
    Expression ref, {
    Expression? defaultValue,
  }) {
    var fromJson = _fromJson(
      type.withNullability(false),
      ref,
    );
    if (type.isNullable) {
      fromJson = ref.equalTo(literalNull).conditional(literalNull, fromJson);
      if (defaultValue != null) {
        fromJson = fromJson.parenthesized.ifNullThen(defaultValue);
      }
    }
    return fromJson;
  }

  Expression _fromJson(OpenApiType type, Expression ref) {
    switch (type) {
      case OpenApiDateType(:final primitiveType):
        ref = ref.asA(primitiveType.typeReference);
        switch (primitiveType) {
          case OpenApiIntegerType():
            return DartTypes.core.dateTime
                .property('fromMillisecondsSinceEpoch')
                .call([ref.property('toInt').call([])]);
          case OpenApiStringType():
            return DartTypes.core.dateTime.property('parse').call([ref]);
          default:
            unreachable('Unexpected datetime time: $primitiveType');
        }
      case OpenApiIntegerType(
          typeReference: TypeReference(url: == 'dart:core')
        ):
        return ref
            .asA(DartTypes.core.num.withNullability(type.isNullable))
            .nullableProperty('toInt', type.isNullable)
            .call([]);
      case OpenApiNumberInterface(
          typeReference: TypeReference(url: == 'dart:core')
        ):
        return ref
            .asA(DartTypes.core.num.withNullability(type.isNullable))
            .nullableProperty('toDouble', type.isNullable)
            .call([]);
      case OpenApiPrimitiveType(
          typeReference:
              TypeReference(url: == 'dart:core') && final typeReference
        ):
        return ref.asA(typeReference);
      case OpenApiBinaryType(:final typeReference): // XFile
        return typeReference.newInstance([ref.asA(DartTypes.core.string)]);
      case OpenApiIterableInterface(
          typeReference: TypeReference(url: == 'dart:core'),
          :final itemType
        ):
        ref = ref.asA(
          DartTypes.core
              .list(DartTypes.core.object.nullable)
              .withNullability(type.isNullable),
        );
        final element = refer('el');
        final serializedElement = fromJson(itemType, element);
        if (element == serializedElement) {
          return ref;
        }
        final mapped = ref.nullableProperty('map', type.isNullable).call([
          Method(
            (m) => m
              ..requiredParameters.add(
                Parameter(
                  (p) => p..name = 'el',
                ),
              )
              ..body = serializedElement.code
              ..lambda = true,
          ).closure,
        ]);
        return switch (type) {
          OpenApiListType() => mapped.property('toList').call([]),
          OpenApiSetType() => mapped.property('toSet').call([]),
          OpenApiIterableType() => mapped,
        };
      case OpenApiRecordType(:final valueType):
        ref = ref
            .asA(
              DartTypes.core.map().withNullability(type.isNullable),
            )
            .nullableProperty('cast', type.isNullable)
            .call([], {}, [
          DartTypes.core.string,
          DartTypes.core.object.nullable,
        ]);
        final value = refer('value');
        final serializedValue = fromJson(valueType, value);
        if (value == serializedValue) {
          return ref;
        }
        return ref.nullableProperty('map', type.isNullable).call([
          Method(
            (m) => m
              ..requiredParameters.add(
                Parameter(
                  (p) => p..name = 'key',
                ),
              )
              ..requiredParameters.add(
                Parameter(
                  (p) => p..name = 'value',
                ),
              )
              ..body = DartTypes.core.mapEntry.newInstance([
                refer('key'),
                serializedValue,
              ]).code
              ..lambda = true,
          ).closure,
        ]);
      // case OpenApiTypeReference(:final primitiveType?):
      //   return _fromJson(primitiveType, ref);
      case OpenApiIterableInterface(:final typeReference):
        ref = ref.asA(
          DartTypes.core
              .list(DartTypes.core.object.nullable)
              .withNullability(type.isNullable),
        );
        return typeReference.property('fromJson').call([ref]);
      case OpenApiPrimitiveType(:final typeReference):
      case OpenApiEnumType(:final typeReference):
      case OpenApiStructType(:final typeReference):
      case OpenApiSealedType(:final typeReference):
      case OpenApiTypeReference(:final typeReference):
        return typeReference.property('fromJson').call([ref]);
      case OpenApiEmptyType():
        return ref;
    }
  }
}
