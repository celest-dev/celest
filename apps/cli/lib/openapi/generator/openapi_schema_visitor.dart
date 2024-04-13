import 'package:celest_cli/openapi/generator/openapi_schema_generator.dart';
import 'package:celest_cli/openapi/openapi_generator.dart';
import 'package:code_builder/code_builder.dart' hide Reference;
import 'package:lib_openapi/openapi_v3.dart';

abstract base class OpenApiSchemaVisitor<R> {
  const OpenApiSchemaVisitor();

  R visit(SchemaOrReference schemaOrReference, [String? name]) {
    if (schemaOrReference.hasReference()) {
      return visitReference(schemaOrReference.reference, name);
    }
    return visitSchema(schemaOrReference.schema, name);
  }

  R visitReference(Reference reference, [String? name]) {
    final schemaOrRef = openapi.document[reference.ref];
    return visit(schemaOrRef.value, name ?? schemaOrRef.name);
  }

  R visitSchema(Schema schema, [String? name]) {
    final type = schema.hasType() ? schema.type : 'object';
    return switch (type) {
      'array' => visitArray(
          schema,
          items: schema.items.schemaOrReference.single,
          name: name,
        ),
      'boolean' => visitBoolean(schema),
      'integer' => visitInteger(schema, format: schema.format),
      'number' => visitNumber(schema, format: schema.format),
      'object' => visitObject(schema, name: name!),
      'string' when schema.enum_24.isNotEmpty =>
        visitEnum(schema, values: schema.enum_24),
      'string' => visitString(schema),
      _ => throw UnimplementedError('Unsupported type: $type'),
    };
  }

  R visitArray(
    Schema schema, {
    required SchemaOrReference items,
    String? name,
  });
  R visitBoolean(Schema schema);
  R visitEnum(
    Schema schema, {
    required List<Any> values,
  });
  R visitInteger(
    Schema schema, {
    String? format,
  });
  R visitNumber(
    Schema schema, {
    String? format,
  });
  R visitObject(
    Schema schema, {
    required String name,
  });
  R visitString(Schema schema);
}

final class OpenApiTypeVisitor extends OpenApiSchemaVisitor<TypeReference> {
  const OpenApiTypeVisitor();

  @override
  TypeReference visitArray(
    Schema schema, {
    required SchemaOrReference items,
    String? name,
  }) {
    final definition = TypeReference(
      (b) => b
        ..symbol = 'List'
        ..types.add(visit(items)),
    );
    if (name != null) {
      final typedef = TypeDef(
        (t) => t
          ..name = name
          ..definition = definition,
      );
      openapi.schemaSpecs[name] = typedef;
      return openapi.schemaReferences[name] = TypeReference(
        (b) => b
          ..symbol = name
          ..url = 'schemas/$name.dart',
      );
    }
    return definition;
  }

  @override
  TypeReference visitBoolean(Schema schema) {
    return TypeReference((b) => b..symbol = 'bool');
  }

  @override
  TypeReference visitInteger(Schema schema, {String? format}) {
    return TypeReference((b) => b..symbol = 'int');
  }

  @override
  TypeReference visitNumber(Schema schema, {String? format}) {
    return TypeReference((b) => b..symbol = 'double');
  }

  @override
  TypeReference visitObject(
    Schema schema, {
    required String name,
  }) {
    final generator = OpenApiSchemaGenerator(name: name, schema: schema);
    openapi.schemaSpecs[name] = generator.generate().build();
    final path = 'schemas/$name.dart';
    return openapi.schemaReferences[name] = TypeReference(
      (b) => b
        ..symbol = name
        ..url = path,
    );
  }

  @override
  TypeReference visitEnum(
    Schema schema, {
    required List<Any> values,
  }) {
    throw UnimplementedError('Unsupported enum: ${schema.enum_24}');
  }

  @override
  TypeReference visitString(Schema schema) {
    return TypeReference((b) => b..symbol = 'String');
  }
}
