import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

final class JsonGenerator {
  JsonGenerator({
    required this.typeHelper,
  });

  final TypeHelper typeHelper;

  Expression toJson(Reference type, Expression ref) {
    final dartType = typeHelper.fromReference(type);
    if (dartType.isDartAsyncFuture || dartType.isDartAsyncFutureOr) {
      return toJson(type.toTypeReference.types.single, ref);
    }
    if (dartType.isDartCoreBool ||
        dartType.isDartCoreDouble ||
        dartType.isDartCoreInt ||
        dartType.isDartCoreNum ||
        dartType.isDartCoreString ||
        dartType.isDartCoreObject ||
        dartType.isDartCoreNull) {
      return ref;
    }
    if (typeHelper.fromReference(type).isEnum) {
      return ref.property('name');
    }
    if (dartType.isDartCoreEnum || dartType.isDartCoreSet) {
      throw unreachable('Should have been caught in checker');
    }
    if (dartType.isDartCoreIterable || dartType.isDartCoreList) {
      final element = refer('el');
      final serializedElement =
          toJson(type.toTypeReference.types.single, element);
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
    if (dartType.isDartCoreMap) {
      final keyType = type.toTypeReference.types[0];
      final dartKeyType = typeHelper.fromReference(keyType);
      if (!dartKeyType.isDartCoreString) {
        throw unreachable('Should have been caught in checker');
      }
      final value = refer('value');
      final serializedValue = toJson(type.toTypeReference.types[1], value);
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
    if (type case TypedefRecordType(recordType: final record)) {
      final serialized = <String, Expression>{};
      for (final (index, field) in record.positionalFieldTypes.indexed) {
        final indexProperty = '\$$index';
        serialized[indexProperty] = toJson(
          field,
          ref.property(indexProperty),
        );
      }
      for (final MapEntry(key: name, value: field)
          in record.namedFieldTypes.entries) {
        serialized[name] = toJson(
          field,
          ref.property(name),
        );
      }
      return literalMap(serialized);
    }
    return ref.property('toJson').call([]);
  }

  Expression fromJson(Reference type, Expression ref) {
    final fromJson = _fromJson(type, ref);
    return switch (type) {
      // TODO: Needed to support TypedefRecordType
      dynamic(:final bool isNullable) when !isNullable => fromJson,
      _ => ref.equalTo(literalNull).conditional(literalNull, fromJson),
    };
  }

  Expression _fromJson(Reference type, Expression ref) {
    final dartType = typeHelper.fromReference(type);
    if (dartType.isDartCoreBool ||
        dartType.isDartCoreDouble ||
        dartType.isDartCoreInt ||
        dartType.isDartCoreNum ||
        dartType.isDartCoreString ||
        dartType.isDartCoreNull) {
      return ref.asA(type.nonNullable);
    }
    if (typeHelper.fromReference(type).isEnum) {
      return type.nonNullable
          .property('values')
          .property('byName')
          .call([ref.asA(DartTypes.core.string)]);
    }
    if (dartType.isDartCoreEnum || dartType.isDartCoreSet) {
      throw unreachable('Should have been caught in checker');
    }
    if (dartType.isDartCoreIterable || dartType.isDartCoreList) {
      final cast = ref.asA(
        // already null-checked
        DartTypes.core.iterable(DartTypes.core.object.nullable),
      );
      final element = refer('el');
      final elementType = type.toTypeReference.types.single;
      final serializedElement = fromJson(elementType, element);
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
                  final elementType = type.toTypeReference.types.single;
                  final dartElementType = typeHelper.fromReference(elementType);
                  if (!dartElementType.isSimpleJson) {
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
    if (dartType.isDartCoreMap) {
      final keyType = type.toTypeReference.types[0];
      final dartKeyType = typeHelper.fromReference(keyType);
      if (!dartKeyType.isDartCoreString) {
        throw unreachable('Should have been caught in checker');
      }
      final cast = ref.asA(
        DartTypes.core.map(
          DartTypes.core.string,
          DartTypes.core.object.nullable,
        ),
      );
      final value = refer('value');
      final valueType = type.toTypeReference.types[1];
      final serializedValue = fromJson(valueType, value);
      if (value == serializedValue) {
        return cast;
      }
      final dartValueType = typeHelper.fromReference(valueType);
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
              if (!dartValueType.isSimpleJson) {
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
    if (type case TypedefRecordType(recordType: final record)) {
      final deserializedPositional = <Expression>[];
      for (final (index, field) in record.positionalFieldTypes.indexed) {
        final indexProperty = '\$$index';
        deserializedPositional.add(
          fromJson(
            field.type,
            ref.index(literalString(indexProperty)),
          ),
        );
      }
      final deserializedNamed = <String, Expression>{};
      for (final MapEntry(:key, :value) in record.namedFieldTypes.entries) {
        deserializedNamed[key] = fromJson(value, ref.index(literalString(key)));
      }
      return literalRecord(deserializedPositional, deserializedNamed);
    }
    return type.newInstanceNamed('fromJson', [
      ref.asA(
        DartTypes.core.map(
          DartTypes.core.string,
          DartTypes.core.dynamic,
        ),
      ),
    ]);
  }
}
