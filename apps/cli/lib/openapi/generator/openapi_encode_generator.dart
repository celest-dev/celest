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
    switch (type) {
      case OpenApiDateType():
        return container
            .property('writeDateTime')
            .call([if (key != null) key, ref]);
      case OpenApiSingleValueType(:final value):
        return container
            .property('write')
            .call([if (key != null) key, literal(value)]);
      case OpenApiPrimitiveType(
              typeReference: TypeReference(url: == 'dart:core'),
            ) ||
            OpenApiEnumType(
              typeReference: TypeReference(url: == 'dart:core'),
            ):
        return container.property('write').call([if (key != null) key, ref]);
      case OpenApiBinaryType(): // XFile
        return container
            .property('writeString')
            .call([if (key != null) key, ref.property('path')]);
      case OpenApiIterableInterface(:final itemType):
        final element = refer('el');
        final serializedElement = encode(
          type: itemType,
          ref: element,
          container: refer('container'),
          key: null,
        );
        return container.property('writeList').call([
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
        return container.property('writeMap').call([
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
      case OpenApiStructType():
      case OpenApiSealedType():
      case OpenApiTypeReference():
        return container.property('writeValue').call([
          if (key != null) key,
          ref.property('encode'),
        ]);
      case OpenApiEmptyType():
        unreachable('Empty type');
    }
  }
}
