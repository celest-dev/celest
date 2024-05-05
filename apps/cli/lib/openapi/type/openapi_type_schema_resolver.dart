// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:aws_common/aws_common.dart';
import 'package:built_value/json_object.dart';
import 'package:celest_cli/codegen/doc_comments.dart';
import 'package:celest_cli/codegen/reserved_words.dart';
import 'package:celest_cli/openapi/generator/openapi_enum_or_primitive_generator.dart';
import 'package:celest_cli/openapi/generator/openapi_struct_or_id_generator.dart';
import 'package:celest_cli/openapi/model/openapi_v3.dart';
import 'package:celest_cli/openapi/openapi_generator.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/openapi/type/openapi_type_resolution_scope.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema.dart';
import 'package:celest_cli/openapi/type/openapi_type_visitor.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

class OpenApiTypeSchemaResolver
    implements
        OpenApiTypeSchemaVisitor<OpenApiType, OpenApiTypeResolutionScope> {
  OpenApiTypeSchemaResolver({
    required this.context,
  });

  final OpenApiGeneratorContext context;

  OpenApiType resolveRef(
    OpenApiTypeSchema schemaOrRef,
    OpenApiTypeResolutionScope? scope,
    String? suffix,
  ) {
    return switch (schemaOrRef) {
      OpenApiTypeSchema(:final name?) => schemaOrRef.accept(
          this,
          OpenApiTypeResolutionScope(
            typeName: context.dartNames[name] ??
                context.fail(
                  'Name not registered: "$name"',
                  additionalContext: {
                    'dartNames': context.dartNames,
                  },
                ),
            url: context.dartRefs[name]!.url!,
          ),
        ),
      OpenApiTypeSchema() => schemaOrRef.accept(
          this,
          suffix?.let(scope!.subscope) ?? scope,
        ),
    };
  }

  @override
  OpenApiType visitReference(
    OpenApiTypeSchemaReference schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final name = scope!.typeName;
    final isNullable = scope.isNullable ?? schema.isNullableOrFalse;
    return OpenApiTypeReference(
      typeReference: (context.dartRefs[name] ?? refer(name))
          .toTypeReference
          .withNullability(isNullable)
          .toTypeReference,
      // TODO: Needed for typedefs
      // primitiveType: switch (_reservedNames[name]) {
      //   OpenApiTypeSchema(primitiveType: != null) && final schema =>
      //     schema.accept(this, scope),
      //   _ => null,
      // },
      schema: schema,
      isNullable: isNullable,
    );
  }

  @override
  OpenApiType visitAny(
    OpenApiAnyTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final needsWrapper = scope?.needsWrapper ?? false;
    return OpenApiAnyType(
      schema: schema,
      isNullable: isNullable,
      typeReference: needsWrapper
          ? context.anyType.withNullability(isNullable).toTypeReference
          : DartTypes.core.object.withNullability(isNullable).toTypeReference,
    );
  }

  @override
  OpenApiType visitArray(
    OpenApiArrayTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final itemType = resolveRef(
      schema.itemType,
      scope,
      'Item',
    );

    final name = scope!.typeName;
    final needsWrapper = scope.needsWrapper;
    final isNullable = scope.isNullable ?? schema.isNullableOrFalse;
    final type = schema.uniqueItems
        ? OpenApiSetType(
            schema: schema,
            typeReference: needsWrapper
                ? refer(name, scope.url).toTypeReference
                : DartTypes.core.set(itemType.typeReference).toTypeReference,
            itemType: itemType,
            isNullable: isNullable,
            defaultValue: schema.defaultValue?.value,
          )
        : OpenApiListType(
            schema: schema,
            typeReference: needsWrapper
                ? refer(name, scope.url).toTypeReference
                : DartTypes.core.list(itemType.typeReference).toTypeReference,
            itemType: itemType,
            isNullable: isNullable,
            defaultValue: schema.defaultValue?.value,
          );
    if (needsWrapper) {
      context.generateSpec(name, schema.name, type, url: scope.url);
    }
    return type;
  }

  @override
  OpenApiType visitBoolean(
    OpenApiBooleanTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final needsWrapper = scope?.needsWrapper ?? false;
    return OpenApiBooleanType(
      schema: schema,
      typeReference: needsWrapper
          ? context.boolType.withNullability(isNullable).toTypeReference
          : DartTypes.core.bool.toTypeReference,
      isNullable: isNullable,
      defaultValue: schema.defaultValue?.value,
    );
  }

  @override
  OpenApiType visitDisjointUnion(
    OpenApiDisjointUnionTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final baseName = scope!.typeName;
    final type = OpenApiSealedType.build((b) {
      b.schema = schema;
      b.typeReference
        ..symbol = baseName
        ..url = scope.url
        ..isNullable = isNullable;
      b.isNullable = isNullable;

      final discriminator = schema.discriminator;
      if (discriminator case OpenApiDiscriminator(:final mapping?)) {
        b.discriminator = FieldDiscriminator(
          wireName: discriminator.propertyName,
          dartName: sanitizeVariableName(discriminator.propertyName.camelCase),
          mapping: mapping.map((value, ref) {
            final schemaName = ref.split('/').last;
            final typeSchema = context.document.components.schemas[schemaName]!;
            if (typeSchema.extensions['x-resourceId'] case final resourceId?) {
              value = resourceId.asString;
            } else if (typeSchema is OpenApiStructTypeSchema) {
              final discriminatorField =
                  typeSchema.fields[discriminator.propertyName];
              if (discriminatorField?.schema
                  case OpenApiSingleValueTypeSchema(
                    value: final discriminatorValue
                  )) {
                value = discriminatorValue.asString;
              }
            }
            return MapEntry(
              value,
              OpenApiTypeReference(
                typeReference: context.dartRefs[schemaName]!.toTypeReference,
                schema: OpenApiTypeSchemaReference(
                  name: schemaName,
                  ref: ref,
                ),
                isNullable: false,
              ),
            );
          }).toMap(),
        );
      } else {
        b.discriminator = TypeDiscriminator(mapping: {});
      }

      assert(schema.types.isNotEmpty);
      for (final type in schema.types) {
        final branchType = resolveRef(
          type,
          scope,
          '',
        );
        b.branches.add(
          OpenApiSealedBranch(
            name: branchType.typeReference.symbol,
            type: branchType,
          ),
        );
      }
    });
    context.generateSpec(baseName, schema.name, type, url: scope.url);
    return type;
  }

  @override
  OpenApiType visitEmpty(
    OpenApiEmptyTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final needsWrapper = scope?.needsWrapper ?? false;
    return OpenApiEmptyType(
      schema: schema,
      typeReference: needsWrapper
          ? context.emptyType
          : DartTypes.core.void$.toTypeReference,
    );
  }

  @override
  OpenApiType visitEnum(
    OpenApiEnumTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final name = scope!.typeName;
    final baseType = schema.baseType.accept(this);
    final isNullable = scope.isNullable ?? schema.isNullableOrFalse;
    final type = OpenApiEnumType(
      schema: schema,
      typeReference: refer(name, scope.url).toTypeReference,
      baseType: baseType as OpenApiPrimitiveType,
      values: schema.values.map((it) => it.value),
      isNullable: isNullable,
      defaultValue: schema.defaultValue?.value,
    );
    context.generateSpec(
      name,
      schema.name,
      type,
      structuralEnum: scope.structuralEnums,
      url: scope.url,
    );
    return type;
  }

  @override
  OpenApiType visitInteger(
    OpenApiIntegerTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final needsWrapper = scope?.needsWrapper ?? false;
    final baseType = OpenApiIntegerType(
      schema: schema,
      typeReference: needsWrapper
          ? context.intType.withNullability(isNullable).toTypeReference
          : DartTypes.core.int.withNullability(isNullable).toTypeReference,
      isNullable: isNullable,
      defaultValue: schema.defaultValue?.value,
    );
    switch (schema.format) {
      case OpenApiIntegerFormat.unixTime:
        assert(!needsWrapper); // TODO: needsWrapper
        return OpenApiDateType(
          typeReference: DartTypes.core.dateTime
              .withNullability(isNullable)
              .toTypeReference,
          schema: schema,
          primitiveType: baseType.primitiveType,
          isNullable: isNullable,
          defaultValue: schema.defaultValue?.value,
        );
      default:
        return baseType;
    }
  }

  @override
  OpenApiType visitNull(
    OpenApiNullTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    return OpenApiNullType.instance;
  }

  @override
  OpenApiType visitNumber(
    OpenApiNumberTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final needsWrapper = scope?.needsWrapper ?? false;
    return OpenApiNumberType(
      schema: schema,
      isNullable: isNullable,
      typeReference: needsWrapper
          ? context.doubleType.withNullability(isNullable).toTypeReference
          : DartTypes.core.double.withNullability(isNullable).toTypeReference,
      defaultValue: schema.defaultValue?.value,
    );
  }

  @override
  OpenApiType visitRecord(
    OpenApiRecordTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final name = scope!.typeName;
    final isNullable = scope.isNullable ?? schema.isNullableOrFalse;
    final needsWrapper = scope.needsWrapper;
    final valueType = resolveRef(
      schema.valueType,
      scope,
      'Value',
    );
    final type = OpenApiRecordType(
      schema: schema,
      typeReference: needsWrapper
          ? refer(name, scope.url).toTypeReference
          : DartTypes.core
              .map(DartTypes.core.string, valueType.typeReference)
              .toTypeReference,
      valueType: valueType,
      isNullable: isNullable,
      defaultValue: schema.defaultValue?.value,
    );
    if (needsWrapper) {
      context.generateSpec(name, schema.name, type, url: scope.url);
    }
    return type;
  }

  @override
  OpenApiType visitSingleValue(
    OpenApiSingleValueTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final baseType = schema.baseType.accept(this).withNullability(false);
    return OpenApiSingleValueType(
      schema: schema,
      baseType: baseType as OpenApiPrimitiveType,
      value: schema.value.value,
      isNullable: false, // always non-nullable
    );
  }

  @override
  OpenApiType visitString(
    OpenApiStringTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final needsWrapper = scope?.needsWrapper ?? false;
    final baseType = OpenApiStringType(
      schema: schema,
      typeReference: needsWrapper
          ? context.stringType.withNullability(isNullable).toTypeReference
          : DartTypes.core.string.withNullability(isNullable).toTypeReference,
      isNullable: isNullable,
      defaultValue: schema.defaultValue?.value,
    );
    return switch (schema.format) {
      OpenApiStringFormat.date ||
      OpenApiStringFormat.dateTime ||
      OpenApiStringFormat.time =>
        OpenApiDateType(
          schema: schema,
          typeReference: DartTypes.core.dateTime
              .withNullability(isNullable)
              .toTypeReference,
          primitiveType: baseType.primitiveType,
          isNullable: isNullable,
          defaultValue: schema.defaultValue?.value,
        ),
      OpenApiStringFormat.binary => OpenApiBinaryType(
          schema: schema,
          primitiveType: baseType,
          typeReference: scope!.isFile
              ? DartTypes.crossFile.xFile
                  .withNullability(isNullable)
                  .toTypeReference
              : DartTypes.typedData.uint8List
                  .withNullability(isNullable)
                  .toTypeReference,
          isNullable: isNullable,
          defaultValue: schema.defaultValue?.value,
        ),
      OpenApiStringFormat.duration => TODO(),
      OpenApiStringFormat.regex => TODO(),
      _ => baseType,
    };
  }

  @override
  OpenApiType visitStruct(
    OpenApiStructTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final name = scope!.typeName;
    final url = context.urlOf(name) ?? scope.url;
    final type = OpenApiStructType(
      schema: schema,
      typeReference: refer(name, url).toTypeReference,
      docs: docsFromParts(schema.title, schema.description),
      implements: context.structImplements(schema),
      fields: schema.fields.toMap().map((fieldName, field) {
        final fieldType = resolveRef(
          field.schema,
          scope,
          '_${fieldName.pascalCase}',
        );
        return MapEntry(
          fieldName,
          OpenApiField(
            name: fieldName,
            dartName: sanitizeVariableName(fieldName.camelCase),
            type: fieldType.withNullability(
              schema.extensions.containsKey('x-stripeResource') &&
                      fieldName == 'id'
                  ? false // work around `invoice` issue
                  : !schema.required.contains(fieldName) ||
                      fieldType.isNullable,
            )..rebuild(
                (t) => t.docs = docsFromParts(
                  field.schema.title,
                  field.schema.description,
                ),
              ),
          ),
        );
      }),
      isNullable: isNullable,
      defaultValue: schema.defaultValue?.value,
    );
    context.generateSpec(
      name,
      schema.name,
      type,
      url: url,
      mimeType: scope.mimeType,
    );
    return type;
  }

  OpenApiType _visitSum(
    OpenApiSumTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    // Solves X1 | X2 | ... | Xn
    final resolved = schema.types
        .map(
          (schema) => resolveRef(
            schema,
            scope,
            '_',
          ),
        )
        .fold<OpenApiType>(
          context.typeSystem.bottomType,
          (sum, type) =>
              context.typeSystem.leastUpperBound(sum, type, resolver: this),
        );

    if (resolved is OpenApiAnyType) {
      // `TODO`: Resolve as disjoint union so that we don't have APIs with just
      // `Object?`.
    }

    return resolved.withNullability(isNullable);
  }

  OpenApiType _structOrId({
    String? schemaName,
    required String typeName,
    required OpenApiTypeSchema schema,
    required bool isNullable,
  }) {
    final wrapperName = '${typeName}OrId';
    final flattenedType = OpenApiTypeReference(
      schema: schema,
      typeReference: refer(typeName, 'models.dart').toTypeReference,
      isNullable: isNullable,
    );
    context.registerSpec(
      context.reserveName(wrapperName),
      'models.dart',
      () => OpenApiStructOrIdGenerator(
        name: wrapperName,
        baseType: flattenedType,
      ).generate(),
    );
    final wrapperRef = refer(wrapperName, 'models.dart');
    context.implement('StripeResource', wrapperRef);
    if (schemaName != null) {
      context.implement(schemaName, wrapperRef);
    }
    context.implement(typeName, wrapperRef);
    return OpenApiTypeReference(
      typeReference: refer(wrapperName).toTypeReference,
      schema: schema,
      isNullable: isNullable,
    );
  }

  @override
  OpenApiType visitSum(
    OpenApiSumTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final types = schema.types.toList();

    // First, flatten known `anyOf` patterns into simpler shapes.

    // 1. Some value or the empty string.
    // Convert it to a nullable type with a default value of the empty string.
    final emptySv = types.singleWhereOrNull(
      (type) => type is OpenApiSingleValueTypeSchema && type.value.value == '',
    );
    if (emptySv != null) {
      schema = schema.rebuild(
        (schema) => schema
          ..types.remove(emptySv)
          ..defaultValue = JsonObject(''),
      );
      return schema.accept(this, scope).withNullability(true);
    }

    switch (types) {
      // 2. A single type
      case [final singleType]:
        return singleType
            .rebuild(
              (t) => t
                ..description = schema.description
                ..defaultValue = schema.defaultValue,
            )
            .withNullability(isNullable)
            .accept(this, scope);

      // 3. A sealed type or ID.
      case [...final typeReferences, final OpenApiStringTypeSchema idSchema] ||
              [final OpenApiStringTypeSchema idSchema, ...final typeReferences]
          when typeReferences
                  .every((type) => type is OpenApiTypeSchemaReference) &&
              schema.extensions.containsKey('x-expansionResources'):
        switch (typeReferences.cast<OpenApiTypeSchemaReference>()) {
          case [final typeReference]:
            final typeName = context.dartNames[typeReference.name]!;
            return _structOrId(
              schemaName: typeReference.name,
              typeName: typeName,
              schema: schema,
              isNullable: isNullable,
            );
          default:
            final unionSchema = schema.rebuild((b) => b.types.remove(idSchema));
            final unionType = unionSchema.accept(this, scope);
            return _structOrId(
              typeName: unionType.typeReference.symbol,
              schema: unionSchema,
              isNullable: isNullable,
            );
        }

      // 4. A union over two primitive types, one being an enum.
      case [
              final OpenApiEnumTypeSchema enumSchema,
              OpenApiTypeSchema(primitiveType: != null) &&
                  final primitiveSchema,
            ] ||
            [
              OpenApiTypeSchema(primitiveType: != null) &&
                  final primitiveSchema,
              final OpenApiEnumTypeSchema enumSchema,
            ]:
        final primitiveType = primitiveSchema.accept(this);
        final wrapperName = scope!.typeName;
        context.registerSpec(
          context.reserveName(wrapperName),
          'models.dart',
          () => OpenApiEnumOrPrimitiveGenerator(
            name: wrapperName,
            enumValues: enumSchema.values.map((it) => it.value).toList(),
            primitiveType: primitiveType as OpenApiPrimitiveType,
          ).generate(),
        );
        return OpenApiTypeReference(
          typeReference: refer(wrapperName, 'models.dart').toTypeReference,
          schema: schema,
          primitiveType: OpenApiAnyType(
            schema: schema,
            typeReference: DartTypes.core.object
                .withNullability(isNullable)
                .toTypeReference,
            isNullable: isNullable,
          ),
          isNullable: isNullable,
        );

      // Same as above but a single-valued "enum".
      case [
              final OpenApiSingleValueTypeSchema singleValueSchema,
              OpenApiTypeSchema(primitiveType: != null) &&
                  final primitiveSchema,
            ] ||
            [
              OpenApiTypeSchema(primitiveType: != null) &&
                  final primitiveSchema,
              final OpenApiSingleValueTypeSchema singleValueSchema,
            ]:
        final primitiveType = primitiveSchema.accept(this);
        final wrapperName = scope!.typeName;
        context.registerSpec(
          context.reserveName(wrapperName),
          'models.dart',
          () => OpenApiEnumOrPrimitiveGenerator(
            name: wrapperName,
            enumValues: [singleValueSchema.value.value],
            primitiveType: primitiveType as OpenApiPrimitiveType,
          ).generate(),
        );
        return OpenApiTypeReference(
          typeReference: refer(wrapperName, 'models.dart').toTypeReference,
          schema: schema,
          primitiveType: OpenApiAnyType(
            schema: schema,
            typeReference: DartTypes.core.object
                .withNullability(isNullable)
                .toTypeReference,
            isNullable: isNullable,
          ),
          isNullable: isNullable,
        );
    }

    var discriminator = schema.discriminator;
    if (types.every(
      (schema) =>
          schema is OpenApiTypeSchemaReference &&
          context.document.components.schemas[schema.name]!.extensions
              .containsKey('x-stripeResource'),
    )) {
      discriminator = OpenApiDiscriminator(
        propertyName: 'object',
        mapping: {
          for (final type in types.cast<OpenApiTypeSchemaReference>())
            type.name: type.ref,
        },
      );
    }
    return OpenApiDisjointUnionTypeSchema(
      ref: schema.ref,
      name: schema.name,
      discriminator: discriminator,
      types: types,
      extensions: schema.extensions.toMap(),
      isNullable: isNullable,
    ).accept(this, scope);
  }
}
