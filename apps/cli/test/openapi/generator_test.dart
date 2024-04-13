import 'dart:convert';

import 'package:celest_cli/openapi/generator/generator.dart';
import 'package:celest_cli/openapi/generator/openapi_schema_generator.dart';
import 'package:celest_cli/openapi/openapi_generator.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:lib_openapi/src/converter.dart';
import 'package:test/test.dart';

import 'common.dart';

DartEmitter get emitter => DartEmitter(
      orderDirectives: true,
      useNullSafetySyntax: true,
    );

final DartFormatter _dartfmt = DartFormatter();
String _format(String source) {
  try {
    return _dartfmt.format(source);
  } on FormatException catch (_) {
    return _dartfmt.formatStatement(source);
  }
}

void main() {
  EqualsDart.format = _format;
  group('SchemaGenerator', () {
    final (_, document) = generateOpenApiV3(jsonEncode(petstoreV3Json));

    OpenApiGeneratorContext context() =>
        OpenApiGeneratorContext(document: document);
    R generate<R>(Generator<R> generator) {
      return withOpenApi(() => generator.generate(), context());
    }

    test('generates Pet schema', () {
      final petSchema = document.components.schemas.additionalProperties
          .firstWhere((schema) => schema.name == 'Pet');
      final generator = OpenApiSchemaGenerator(
        name: 'Pet',
        schema: petSchema.value.schema,
      );
      expect(
        generate(generator).build(),
        equalsDart(
          '''
final class Pet {
  const Pet({
    required this.id,
    required this.name,
    this.tag,
  });

  final int id;

  final String name;

  final String? tag;
}
''',
          emitter,
        ),
      );
    });

    test('generates Pets array', () {
      final petsSchema = document.components.schemas.additionalProperties
          .firstWhere((schema) => schema.name == 'Pets');
      withOpenApi(
        () {
          final type =
              openapi.schemaOrReference(petsSchema.value, petsSchema.name);
          expect(
            type,
            TypeReference(
              (t) => t
                ..symbol = 'Pets'
                ..url = 'schemas/Pets.dart',
            ),
          );
        },
        context(),
      );
    });
  });
}
