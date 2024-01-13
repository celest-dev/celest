import 'package:celest_cli/serialization/is_serializable.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

final class JsonGenerator {
  Expression toJson(Reference type, Expression ref) {
    final dartType = typeHelper.fromReference(type);
    if (dartType.isDartAsyncFuture || dartType.isDartAsyncFutureOr) {
      unreachable(
        'Must pass the flattened type so that nullability is correctly handled',
      );
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
          .nullableProperty('map', type.isNullableOrFalse)
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
      return ref.nullableProperty('map', type.isNullableOrFalse).call([
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
    final serializationVerdict = typeHelper.isSerializable(dartType);
    assert(
      serializationVerdict is VerdictYes,
      'Should not have passed analyzer if no',
    );
    return DartTypes.celest.serializers
        .property('scoped')
        .property('serialize')
        .call(
      [ref],
      {},
      [type],
    );
  }

  Expression fromJson(
    Reference type,
    Expression ref, {
    Expression? defaultValue,
  }) {
    type = type.withNullability(
      type.isNullableOrFalse || defaultValue != null,
    );
    var fromJson = _fromJson(type, ref);
    if (defaultValue != null) {
      fromJson = fromJson.parenthesized.ifNullThen(defaultValue);
    }
    return fromJson;
  }

  Expression _fromJson(Reference type, Expression ref) {
    final dartType = typeHelper.fromReference(type);
    if (dartType.isDartCoreBool ||
        dartType.isDartCoreNum ||
        dartType.isDartCoreString ||
        dartType.isDartCoreNull) {
      return ref.asA(type);
    }
    // JSON numbers get confused between int/double. We always deserialize as
    // num and cast to the correct type.
    if (dartType.isDartCoreDouble) {
      return ref
          .asA(DartTypes.core.num.withNullability(type.isNullableOrFalse))
          .nullableProperty('toDouble', type.isNullableOrFalse)
          .call([]);
    }
    if (dartType.isDartCoreInt) {
      return ref
          .asA(DartTypes.core.num.withNullability(type.isNullableOrFalse))
          .nullableProperty('toInt', type.isNullableOrFalse)
          .call([]);
    }
    if (dartType.isDartCoreEnum || dartType.isDartCoreSet) {
      throw unreachable('Should have been caught in checker');
    }
    if (dartType.isDartCoreIterable || dartType.isDartCoreList) {
      final cast = ref.asA(
        DartTypes.core
            .iterable(DartTypes.core.object.nullable)
            .withNullability(type.isNullableOrFalse),
      );
      final element = refer('el');
      final elementType = type.toTypeReference.types.single;
      final serializedElement = fromJson(elementType, element);
      if (element == serializedElement) {
        return cast;
      }
      return cast
          .nullableProperty('map', type.isNullableOrFalse)
          .call([
            Method(
              (m) => m
                ..requiredParameters.add(
                  Parameter(
                    (p) => p..name = 'el',
                  ),
                )
                ..body = serializedElement.code,
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
        DartTypes.core
            .map(
              DartTypes.core.string,
              DartTypes.core.object.nullable,
            )
            .withNullability(type.isNullableOrFalse),
      );
      final value = refer('value');
      final valueType = type.toTypeReference.types[1];
      final serializedValue = fromJson(valueType, value);
      if (value == serializedValue) {
        return cast;
      }
      return cast.nullableProperty('map', type.isNullableOrFalse).call([
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
            ]).code,
        ).closure,
      ]);
    }
    final serializationVerdict = typeHelper.isSerializable(dartType);
    assert(
      serializationVerdict is VerdictYes,
      'Should not have passed analyzer if no',
    );
    return DartTypes.celest.serializers
        .property('scoped')
        .property('deserialize')
        .call(
      [ref],
      {},
      [type],
    );
  }
}
