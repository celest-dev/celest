import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:code_builder/code_builder.dart';

final openApiEncoder = OpenApiEncoder();

final class OpenApiEncoder {
  Expression encode({
    required OpenApiType type,
    required Expression ref,
    required Expression container,
    required Expression? key,
  }) {
    final encoded = _encode(
      type: type,
      ref: ref,
      container: container,
      key: key,
    );

    if (!type.isNullable) {
      return encoded;
    }
    return ref.equalTo(literalNull).conditional(
          container.property('encodeNull').call([]),
          encoded,
        );
  }

  Expression _encode({
    required OpenApiType type,
    required Expression ref,
    required Expression container,
    required Expression? key,
  }) {
    assert(!type.isNullable);
    switch (type) {
      case OpenApiDateType():
        return container
            .property('encodeDateTime')
            .call([if (key != null) key, ref]);
      case OpenApiSingleValueType(:final value):
        return encode(
          type: type.primitiveType,
          ref: literal(value),
          container: container,
          key: key,
        );
      case OpenApiStringType(
              typeReference: TypeReference(url: == 'dart:core'),
            ) ||
            OpenApiEnumType(
              typeReference: TypeReference(url: == 'dart:core'),
            ):
        return container
            .property('encodeString')
            .call([if (key != null) key, ref]);
      case OpenApiIntegerType(
          typeReference: TypeReference(url: == 'dart:core'),
        ):
        return container
            .property('encodeInt')
            .call([if (key != null) key, ref]);
      case OpenApiDoubleType(
          typeReference: TypeReference(url: == 'dart:core'),
        ):
        return container
            .property('encodeDouble')
            .call([if (key != null) key, ref]);
      case OpenApiNumberType(
          typeReference: TypeReference(url: == 'dart:core'),
        ):
        return container
            .property('encodeDouble')
            .call([if (key != null) key, ref]);
      case OpenApiBooleanType(
          typeReference: TypeReference(url: == 'dart:core'),
        ):
        return container
            .property('encodeBool')
            .call([if (key != null) key, ref]);
      case OpenApiAnyType(
          typeReference: TypeReference(url: == 'dart:core'),
        ):
        return container
            .property('encodePrimitive')
            .call([if (key != null) key, ref]);
      case OpenApiBinaryType(): // XFile
        return container
            .property('encodeString')
            .call([if (key != null) key, ref.property('path')]);

      case OpenApiIterableInterface(:final itemType):
        final element = refer('el');
        final serializedElement = encode(
          type: itemType,
          ref: element,
          container: refer('container'),
          key: null,
        );
        return container.property('encodeList').call([
          if (key != null) key,
          Method(
            (m) => m
              ..requiredParameters.add(Parameter((p) => p.name = 'container'))
              ..body = ref.property('forEach').call([
                Method(
                  (m) => m
                    ..requiredParameters.add(Parameter((p) => p.name = 'el'))
                    ..body = serializedElement.code
                    ..lambda = true,
                ).closure,
              ]).code,
          ).closure,
        ]);
      case OpenApiRecordType(:final valueType):
        final serializedValue = encode(
          type: valueType,
          ref: refer('value'),
          container: refer('container'),
          key: refer('key'),
        );
        return container.property('encodeMap').call([
          if (key != null) key,
          Method(
            (m) => m
              ..requiredParameters.add(Parameter((p) => p.name = 'container'))
              ..body = ref.property('forEach').call([
                Method(
                  (m) => m
                    ..requiredParameters.addAll([
                      Parameter((p) => p..name = 'key'),
                      Parameter((p) => p..name = 'value'),
                    ])
                    ..body = serializedValue.code
                    ..lambda = true,
                ).closure,
              ]).code,
          ).closure,
        ]);
      case OpenApiPrimitiveType(:final primitiveType):
        return encode(
          type: primitiveType,
          ref: ref.property('value'),
          container: container,
          key: key,
        );
      case OpenApiType(:final OpenApiType primitiveType):
        return encode(
          type: primitiveType,
          ref: ref,
          container: container,
          key: key,
        );
      case OpenApiStructType(:final typeReference):
      case OpenApiSealedType(:final typeReference):
      case OpenApiTypeReference(:final typeReference):
        return container.property('encode').call(
          [
            if (key != null) key,
            ref,
          ],
          {'as': typeReference.property('codableType')},
        );
      case OpenApiEmptyType():
        unreachable('Empty type');
    }
  }
}
