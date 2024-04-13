import 'dart:async';

import 'package:celest_cli/openapi/generator/openapi_schema_visitor.dart';
import 'package:code_builder/code_builder.dart';
import 'package:lib_openapi/openapi_v3.dart' as v3;

final class OpenApiGenerator {
  OpenApiGenerator({
    required this.document,
  });

  final v3.Document document;

  Map<String, Library> generate() {
    final context = OpenApiGeneratorContext(document: document);
    return runZoned(
      _generate,
      zoneValues: {OpenApiGeneratorContext: context},
    );
  }

  Map<String, Library> _generate() {
    final libraries = <String, Library>{};
    for (final schema in document.components.schemas.additionalProperties) {
      openapi.schemaOrReference(schema.value, schema.name);
    }
    return libraries;
  }
}

OpenApiGeneratorContext get openapi =>
    Zone.current[OpenApiGeneratorContext] as OpenApiGeneratorContext;

R withOpenApi<R>(R Function() callback, OpenApiGeneratorContext openapi) {
  return runZoned(callback, zoneValues: {OpenApiGeneratorContext: openapi});
}

final class OpenApiGeneratorContext {
  OpenApiGeneratorContext({
    required this.document,
  });

  final v3.Document document;

  final Map<String, TypeReference> schemaReferences = {};
  final Map<String, Spec> schemaSpecs = {};

  Class addSchema(String name, [void Function(ClassBuilder)? updates]) {
    return schemaSpecs.update(
      name,
      (value) {
        final builder = (value as Class).toBuilder();
        updates?.call(builder);
        return builder.build();
      },
      ifAbsent: () {
        final builder = ClassBuilder();
        updates?.call(builder);
        return builder.build();
      },
    ) as Class;
  }

  TypeReference schemaOrReference(
    v3.SchemaOrReference schemaOrReference, [
    String? name,
  ]) {
    return const OpenApiTypeVisitor().visit(schemaOrReference, name);
  }
}

extension DocumentSearch on v3.Document {
  v3.NamedSchemaOrReference operator [](String ref) {
    final parts = ref.split('/');
    if (parts.first != '#') {
      throw ArgumentError.value(ref, 'ref', 'Must start with #');
    }
    if (!ref.startsWith('#/components/schemas/')) {
      throw ArgumentError.value(ref, 'ref', 'Must reference a schema');
    }
    return components.schemas.additionalProperties
        .firstWhere((schema) => schema.name == parts.last);
  }
}
