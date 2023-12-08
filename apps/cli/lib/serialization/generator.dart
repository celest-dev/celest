import 'package:celest_cli/codegen/types.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
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
    if (type.isDartCoreEnum || type.isDartCoreSet) {
      throw unreachable('Should have been caught in checker');
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
        throw unreachable('Should have been caught in checker');
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
            ..body = DartTypes.core.mapEntry.newInstance([
              refer('key'),
              serializedValue,
            ]).code
            ..lambda = true,
        ).closure,
      ]);
    }
    if (this case TypedefRecordType(recordType: final record)) {
      final serialized = <String, Expression>{};
      for (final (index, field) in record.positionalFieldTypes.indexed) {
        final indexProperty = '\$$index';
        serialized[indexProperty] = field.toJson(
          ref.property(indexProperty),
        );
      }
      for (final MapEntry(key: name, value: field)
          in record.namedFieldTypes.entries) {
        serialized[name] = field.toJson(
          ref.property(name),
        );
      }
      return literalMap(serialized);
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
          .call([ref.asA(DartTypes.core.string)]);
    }
    if (type.isDartCoreEnum || type.isDartCoreSet) {
      throw unreachable('Should have been caught in checker');
    }
    if (type.isDartCoreIterable || type.isDartCoreList) {
      final cast = ref.asA(
        // already null-checked
        DartTypes.core.iterable(DartTypes.core.object.nullable),
      );
      final element = refer('el');
      final elementType = type.types.single;
      final serializedElement = elementType.fromJson(element);
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
                ..body = Block((b) {
                  if (!type.types.single.isSimpleJson) {
                    b.addExpression(
                      element.asA(
                        DartTypes.core
                            .map(
                              DartTypes.core.string,
                              DartTypes.core.object.nullable,
                            )
                            .withNullability(elementType.isNullableOrFalse),
                      ),
                    );
                  }
                  b.addExpression(serializedElement.returned);
                }),
            ).closure,
          ])
          .property('toList')
          .call([]);
    }
    if (type.isDartCoreMap) {
      if (!type.types[0].isDartCoreString) {
        throw unreachable('Should have been caught in checker');
      }
      final cast = ref.asA(
        DartTypes.core.map(
          DartTypes.core.string,
          DartTypes.core.object.nullable,
        ),
      );
      final value = refer('value');
      final valueType = type.types[1];
      final serializedValue = valueType.fromJson(value);
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
            ..body = Block((b) {
              if (!valueType.isSimpleJson) {
                b.addExpression(
                  value.asA(
                    DartTypes.core
                        .map(
                          DartTypes.core.string,
                          DartTypes.core.object.nullable,
                        )
                        .withNullability(valueType.isNullableOrFalse),
                  ),
                );
              }
              b.addExpression(
                refer('MapEntry').newInstance([
                  refer('key'),
                  serializedValue,
                ]).returned,
              );
            }),
        ).closure,
      ]);
    }
    if (this case TypedefRecordType(recordType: final record)) {
      final deserializedPositional = <Expression>[];
      for (final (index, field) in record.positionalFieldTypes.indexed) {
        final indexProperty = '\$$index';
        deserializedPositional.add(
          field.type.fromJson(
            ref.index(literalString(indexProperty)),
          ),
        );
      }
      final deserializedNamed = <String, Expression>{};
      for (final MapEntry(:key, :value) in record.namedFieldTypes.entries) {
        deserializedNamed[key] = value.fromJson(ref.index(literalString(key)));
      }
      return literalRecord(deserializedPositional, deserializedNamed);
    }
    return newInstanceNamed('fromJson', [
      ref.asA(
        DartTypes.core.map(
          DartTypes.core.string,
          DartTypes.core.dynamic,
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
