import 'dart:collection';

import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/serialization/serialization_verdict.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:code_builder/code_builder.dart' show Reference;
import 'package:lib_openapi/lib_openapi.dart';

final class DartTypeToOpenApi
    implements TypeVisitor<OpenApiComponentOrRef<OpenApiSchema>> {
  DartTypeToOpenApi({
    required this.ref,
    required this.components,
  });

  final String ref;
  static final Set<DartType> _seen = HashSet(
    equals: const DartTypeEquality(ignoreNullability: true).equals,
    hashCode: const DartTypeEquality(ignoreNullability: true).hash,
  );

  final OpenApiComponentsBuilder components;

  static final Map<Reference, OpenApiSchema> primitiveTypes = run(() {
    final primitiveTypes = LinkedHashMap<Reference, OpenApiSchema>(
      equals: (a, b) => a.url == b.url && a.symbol == b.symbol,
      hashCode: (ref) => Object.hash(ref.url, ref.symbol),
    );
    primitiveTypes[DartTypes.core.bool] = OpenApiSchema(
      type: const ItemValue(JsonType.boolean),
    );
    primitiveTypes[DartTypes.core.double] = OpenApiSchema(
      type: const ItemValue(JsonType.number),
      format: JsonTypeFormat.double,
    );
    primitiveTypes[DartTypes.core.num] = OpenApiSchema(
      type: const ItemValue(JsonType.number),
    );
    primitiveTypes[DartTypes.core.int] = OpenApiSchema(
      type: const ItemValue(JsonType.integer),
      format: JsonTypeFormat.int64,
    );
    primitiveTypes[DartTypes.core.string] = OpenApiSchema(
      type: const ItemValue(JsonType.string),
    );
    primitiveTypes[DartTypes.core.null$] = OpenApiSchema(
      type: const ItemValue(JsonType.null$),
      nullable: true,
    );
    primitiveTypes[DartTypes.core.void$] = OpenApiSchema(
      type: null,
      nullable: true,
    );
    primitiveTypes[DartTypes.core.dynamic] = OpenApiSchema(
      type: null,
      nullable: true,
    );
    primitiveTypes[DartTypes.core.never] = OpenApiSchema(
      type: null,
      nullable: true,
      additionalProperties: OpenApiAdditionalProperties(allow: false),
    );
    primitiveTypes[DartTypes.core.object] = OpenApiSchema(
      type: null,
    );

    assert(() {
      final coreTypes = [
        typeHelper.coreTypes.boolType,
        typeHelper.coreTypes.doubleType,
        typeHelper.coreTypes.intType,
        typeHelper.coreTypes.numType,
        typeHelper.coreTypes.stringType,
        typeHelper.coreTypes.nullType,
        typeHelper.coreTypes.voidType,
        typeHelper.coreTypes.dynamicType,
        typeHelper.coreTypes.neverType,
        typeHelper.coreTypes.objectType,
      ];
      for (final type in coreTypes) {
        final typeRef = typeHelper.toReference(type);
        if (!primitiveTypes.containsKey(typeRef)) {
          throw StateError('Missing primitive type: $type');
        }
      }
      return true;
    }());

    return primitiveTypes;
  });

  static final Map<Reference, OpenApiSchema> coreTypes = run(() {
    final coreTypes = LinkedHashMap<Reference, OpenApiSchema>(
      equals: (a, b) => a.url == b.url && a.symbol == b.symbol,
      hashCode: (ref) => Object.hash(ref.url, ref.symbol),
    );
    coreTypes[DartTypes.core.exception] = OpenApiSchema(
      ref: '#/components/schemas/Exception',
      name: 'Exception',
      type: const ItemValue(JsonType.object),
      properties: {
        'message': OpenApiComponentOrRef.component(
          ref: '#/components/schemas/Exception/message',
          component: primitiveTypes[DartTypes.core.string]!,
        ),
      },
      additionalProperties: OpenApiAdditionalProperties(allow: false),
    );
    coreTypes[DartTypes.core.error] = OpenApiSchema(
      ref: '#/components/schemas/Error',
      name: 'Error',
      type: const ItemValue(JsonType.object),
      properties: {
        'stackTrace': OpenApiComponentOrRef.reference(
          ref: '#/components/schemas/Error/stackTrace',
          reference: OpenApiSchemaReference(
            ref: '#/components/schemas/StackTrace',
            name: 'StackTrace',
          ),
        ),
      },
      additionalProperties: OpenApiAdditionalProperties(allow: false),
    );
    coreTypes[DartTypes.core.bigInt] = OpenApiSchema(
      ref: '#/components/schemas/BigInt',
      name: 'BigInt',
      type: const ItemValue(JsonType.string),
      format: JsonTypeFormat.int64,
    );
    coreTypes[DartTypes.core.dateTime] = OpenApiSchema(
      ref: '#/components/schemas/DateTime',
      name: 'DateTime',
      type: const ItemValue(JsonType.string),
      format: JsonTypeFormat.dateTime,
    );
    coreTypes[DartTypes.core.duration] = OpenApiSchema(
      ref: '#/components/schemas/Duration',
      name: 'Duration',
      type: const ItemValue(JsonType.object),
      format: JsonTypeFormat.duration,
      properties: {
        'days': OpenApiComponentOrRef.component(
          ref: '#/components/schemas/Duration/days',
          component: primitiveTypes[DartTypes.core.int]!,
        ),
        'hours': OpenApiComponentOrRef.component(
          ref: '#/components/schemas/Duration/hours',
          component: primitiveTypes[DartTypes.core.int]!,
        ),
        'minutes': OpenApiComponentOrRef.component(
          ref: '#/components/schemas/Duration/minutes',
          component: primitiveTypes[DartTypes.core.int]!,
        ),
        'seconds': OpenApiComponentOrRef.component(
          ref: '#/components/schemas/Duration/seconds',
          component: primitiveTypes[DartTypes.core.int]!,
        ),
        'milliseconds': OpenApiComponentOrRef.component(
          ref: '#/components/schemas/Duration/milliseconds',
          component: primitiveTypes[DartTypes.core.int]!,
        ),
        'microseconds': OpenApiComponentOrRef.component(
          ref: '#/components/schemas/Duration/microseconds',
          component: primitiveTypes[DartTypes.core.int]!,
        ),
      },
      additionalProperties: OpenApiAdditionalProperties(allow: false),
    );
    coreTypes[DartTypes.core.regExp] = OpenApiSchema(
      ref: '#/components/schemas/RegExp',
      name: 'RegExp',
      type: const ItemValue(JsonType.string),
      format: JsonTypeFormat.regex,
    );
    coreTypes[DartTypes.core.uri] = OpenApiSchema(
      ref: '#/components/schemas/Uri',
      name: 'Uri',
      type: const ItemValue(JsonType.string),
      format: JsonTypeFormat.uri,
    );
    coreTypes[DartTypes.core.uriData] = OpenApiSchema(
      ref: '#/components/schemas/UriData',
      name: 'UriData',
      type: const ItemValue(JsonType.string),
      format: JsonTypeFormat.uri,
    );
    coreTypes[DartTypes.typedData.uint8List] = OpenApiSchema(
      ref: '#/components/schemas/Uint8List',
      name: 'Uint8List',
      type: const ItemValue(JsonType.string),
      format: JsonTypeFormat.binary,
    );
    coreTypes[DartTypes.core.stackTrace] = OpenApiSchema(
      ref: '#/components/schemas/StackTrace',
      name: 'StackTrace',
      type: const ItemValue(JsonType.string),
    );

    assert(() {
      for (final type in builtInTypeToReference.keys) {
        if (!coreTypes.containsKey(typeHelper.toReference(type))) {
          throw StateError('Missing core type: $type');
        }
      }
      return true;
    }());

    return coreTypes;
  });

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitDynamicType(DynamicType type) {
    return OpenApiComponentOrRef.component(
      ref: ref,
      component: primitiveTypes[DartTypes.core.dynamic]!,
    );
  }

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitFunctionType(FunctionType type) {
    unreachable('Function type in OpenAPI schema');
  }

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitInterfaceType(InterfaceType type) {
    final typeRef = typeHelper.toReference(type).toTypeReference;
    if (primitiveTypes[typeRef] case final primitive?) {
      return OpenApiComponentOrRef.component(
        ref: ref,
        component: primitive.rebuild((primitive) {
          primitive.nullable = typeRef.isNullable;
        }),
      );
    }
    if (coreTypes[typeRef] case final core?) {
      return OpenApiComponentOrRef.reference(
        ref: ref,
        reference: core.toReference(),
      );
    }
    if (type.isDartCoreMap) {
      assert(type.typeArguments[0].isDartCoreString);
      final valueType = type.typeArguments[1].accept(this);
      return OpenApiComponentOrRef.component(
        ref: ref,
        component: OpenApiSchema(
          type: const ItemValue(JsonType.object),
          nullable: typeRef.isNullable,
          additionalProperties: OpenApiAdditionalProperties(
            schema: valueType,
          ),
        ),
      );
    }
    if (type.isDartCoreIterable || type.isDartCoreList || type.isDartCoreSet) {
      final uniqueItems = type.isDartCoreSet;
      final elementType = type.typeArguments[0].accept(this);
      return OpenApiComponentOrRef.component(
        ref: ref,
        component: OpenApiSchema(
          type: const ItemValue(JsonType.array),
          nullable: typeRef.isNullable,
          items: elementType,
          uniqueItems: uniqueItems,
        ),
      );
    }

    final typeName = type.externalUri(celestProject.projectName)!;
    if (!_seen.add(type)) {
      // Circular reference. Refer to the schema by name (which will eventually
      // be defined).
      return OpenApiComponentOrRef.reference(
        ref: ref,
        reference: OpenApiSchemaReference(
          ref: '#/components/schemas/$typeName',
          name: typeName,
        ),
      );
    }
    final schema = components.schemas.putIfAbsent(typeName, () {
      final serializationVerdict = typeHelper.isSerializable(type);
      if (serializationVerdict is! VerdictYes) {
        // Shouldn't have made it this far since types are from resolved AST.
        unreachable('VerdictNo for $typeName: $typeRef');
      }
      final serializationSpec = serializationVerdict.primarySpec;
      if (serializationSpec == null) {
        // Shouldn't have made it this far since types are from resolved AST.
        unreachable('Missing serialization spec for $typeName: $typeRef');
      }
      for (final additionalSpec in serializationVerdict.additionalSpecs) {
        additionalSpec.type.accept(this);
      }
      return OpenApiSchema(
        ref: '#/components/schemas/$typeName',
        name: typeName,
        type: const ItemValue(JsonType.object),
        properties: {
          for (final field in serializationSpec.fields)
            field.name: field.type.accept(this),
        },
        required: [
          for (final field in serializationSpec.fields)
            if (!typeHelper.toReference(field.type).isNullableOrFalse)
              field.name,
        ],
        additionalProperties: OpenApiAdditionalProperties(allow: false),
      );
    });
    return OpenApiComponentOrRef.reference(
      ref: ref,
      reference: schema.toReference(),
    );
  }

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitInvalidType(InvalidType type) {
    unreachable('Invalid type in OpenAPI schema');
  }

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitNeverType(NeverType type) {
    return OpenApiComponentOrRef.component(
      ref: ref,
      component: primitiveTypes[DartTypes.core.never]!,
    );
  }

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitRecordType(RecordType type) {
    final properties = <String, OpenApiComponentOrRef<OpenApiSchema>>{};
    for (final parameter in type.namedFields) {
      final component = parameter.type.accept(this);
      properties[parameter.name] = component.rebuild((component) {
        component.ref = '$ref/${parameter.name}';
      });
    }
    // TODO(dnys1): Positional fields
    final typeName = type.externalUri(celestProject.projectName);
    final schema = OpenApiSchema(
      name: typeName,
      type: const ItemValue(JsonType.object),
      nullable: switch (type.alias) {
        null => type.nullabilitySuffix != NullabilitySuffix.none,
        // `TODO`(dnys1): https://github.com/dart-lang/sdk/issues/54346
        // alias.element.nullabilitySuffix != NullabilitySuffix.none,
        _ => typeHelper.typeSystem.isNullable(type),
      },
      properties: properties,
      additionalProperties: OpenApiAdditionalProperties(allow: false),
    );
    return switch (typeName) {
      final typeName? => OpenApiComponentOrRef.reference(
          ref: ref,
          reference: components.schemas.putIfAbsent(typeName, () {
            return schema.rebuild((component) {
              return component.ref = '#/components/schemas/$typeName';
            });
          }).toReference(),
        ),
      _ => OpenApiComponentOrRef.component(
          ref: ref,
          component: schema.rebuild((component) {
            return component.ref = ref;
          }),
        ),
    };
  }

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitTypeParameterType(
    TypeParameterType type,
  ) {
    final bound = type.bound.accept(this);
    final subtypes = typeHelper.subtypes[type.bound.element]!;
    return OpenApiComponentOrRef.component(
      ref: ref,
      component: OpenApiSchema(
        type: const ItemValue(JsonType.object),
        nullable: typeHelper.toReference(type).isNullableOrFalse ||
            typeHelper.toReference(type.bound).isNullableOrFalse,
        allOf: [
          bound,
          OpenApiComponentOrRef.component(
            component: OpenApiSchema(
              properties: {
                r'$type': OpenApiComponentOrRef.component(
                  component: OpenApiSchema(
                    type: const ItemValue(JsonType.string),
                    enumValues: subtypes.map((type) {
                      return typeHelper.toReference(type).symbol;
                    }).toList(),
                  ),
                ),
              },
            ),
          ),
          OpenApiComponentOrRef.component(
            component: OpenApiSchema(
              oneOf: subtypes.map((type) => type.accept(this)).toList(),
            ),
          ),
        ],
        discriminator: OpenApiDiscriminator(
          propertyName: r'$type',
          mapping: {
            for (final subtype in subtypes)
              typeHelper.toReference(subtype).symbol!:
                  '#/components/schemas/${subtype.externalUri(celestProject.projectName)!}',
          },
        ),
        additionalProperties: OpenApiAdditionalProperties(allow: false),
      ),
    );
  }

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitVoidType(VoidType type) {
    return OpenApiComponentOrRef.component(
      ref: ref,
      component: primitiveTypes[DartTypes.core.void$]!,
    );
  }

  OpenApiComponentOrRef<OpenApiSchema> _withNullability(
    OpenApiComponentOrRef<OpenApiSchema> schemaOrRef,
    bool? isNullable,
  ) {
    final schemaNullability = schemaOrRef.resolve(components.build()).nullable;
    if (schemaNullability != isNullable) {
      return OpenApiComponentOrRef.component(
        component: OpenApiSchema(
          allOf: [
            schemaOrRef,
            OpenApiComponentOrRef.component(
              component: OpenApiSchema(
                nullable: isNullable,
              ),
            ),
          ],
        ),
      );
    }
    return schemaOrRef;
  }
}

extension OpenApiSchemaToReference on OpenApiSchema {
  OpenApiSchemaReference toReference() {
    return OpenApiSchemaReference(
      ref: ref!,
      name: name!,
    );
  }
}
