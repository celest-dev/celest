import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

extension ToFromJson on Reference {
  Expression toJson(Expression ref) {
    final type = toTypeReference;
    if (type.isDartAsyncFuture || type.isDartAsyncFutureOr) {
      return type.types.single.toJson(ref);
    }
    if (type.isDartCoreBool ||
        type.isDartCoreDouble ||
        type.isDartCoreInt ||
        type.isDartCoreString ||
        type.isDartCoreObject ||
        type.isDartCoreNull) {
      return ref;
    }
    if (type.isEnum) {
      return ref.property('name');
    }
    if (type.isDartCoreSet || type.isDartCoreEnum) {
      throw StateError('Bad type: $type');
    }
    if (type.isDartCoreIterable || type.isDartCoreList) {
      final element = refer('el');
      final serializedElement = toTypeReference.types.single.toJson(element);
      if (element == serializedElement) {
        return ref;
      }
      return ref
          .property('map')
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
    }
    if (type.isDartCoreMap) {
      if (!type.types[0].isDartCoreString) {
        throw StateError('Bad type: $type');
      }
      final value = refer('value');
      final serializedValue = type.types[1].toJson(value);
      if (value == serializedValue) {
        return ref;
      }
      return ref.property('map').call([
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
            ..body = refer('MapEntry').newInstance([
              refer('key'),
              serializedValue,
            ]).code
            ..lambda = true,
        ).closure,
      ]);
    }
    return ref.property('toJson').call([]);
  }

  Expression _fromJson(Expression ref) {
    final type = toTypeReference;
    if (type.isDartCoreBool ||
        type.isDartCoreDouble ||
        type.isDartCoreInt ||
        type.isDartCoreString ||
        type.isDartCoreNull) {
      return ref.asA(nonNullable);
    }
    if (type.isEnum) {
      return nonNullable
          .property('values')
          .property('byName')
          .call([ref.asA(refer('String', 'dart:core'))]);
    }
    if (type.isDartCoreSet || type.isDartCoreEnum) {
      throw StateError('Bad type: $type');
    }
    if (type.isDartCoreIterable || type.isDartCoreList) {
      final cast = ref.asA(
        TypeReference(
          (t) => t
            ..symbol = 'Iterable'
            ..url = 'dart:core'
            ..types.add(refer('Object?', 'dart:core'))
            ..isNullable = false, // already null-checked
        ),
      );
      final element = refer('el');
      final serializedElement = type.types.single.fromJson(element);
      if (element == serializedElement) {
        return cast;
      }
      return cast
          .property('map')
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
    }
    if (type.isDartCoreMap) {
      if (!type.types[0].isDartCoreString) {
        throw StateError('Bad type: $type');
      }
      final cast = ref.asA(
        TypeReference(
          (t) => t
            ..symbol = 'Map'
            ..url = 'dart:core'
            ..types.addAll([
              refer('String', 'dart:core'),
              refer('Object?', 'dart:core'),
            ]),
        ),
      );
      final value = refer('value');
      final serializedValue = type.types[1].fromJson(value);
      if (value == serializedValue) {
        return cast;
      }
      return cast.property('map').call([
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
            ..body = refer('MapEntry').newInstance([
              refer('key'),
              serializedValue,
            ]).code
            ..lambda = true,
        ).closure,
      ]);
    }
    return newInstanceNamed('fromJson', [
      ref.asA(
        TypeReference(
          (t) => t
            ..symbol = 'Map'
            ..url = 'dart:core'
            ..types.addAll([
              refer('String', 'dart:core'),
              refer('dynamic'),
            ]),
        ),
      ),
    ]);
  }

  Expression fromJson(Expression ref) {
    final fromJson = _fromJson(ref);
    if (!toTypeReference.isNullableOrFalse) {
      return fromJson;
    }
    return ref.equalTo(literalNull).conditional(literalNull, fromJson);
  }
}
