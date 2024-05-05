@Tags(['openapi'])
library;

import 'dart:convert';

import 'package:celest_cli/openapi/model/openapi_schema_linker.dart';
import 'package:celest_cli/openapi/model/openapi_schema_transformer.dart';
import 'package:celest_cli/openapi/openapi_generator.dart';
import 'package:celest_cli/openapi/type/openapi_type_system.dart';
import 'package:lib_openapi/lib_openapi.dart';
import 'package:test/test.dart';

import '../fixtures.dart';

void main() {
  final document = generateOpenApiV3(jsonEncode(petstoreV3Json));

  group('OpenApiSchemaResolver', () {
    final typeSystem = OpenApiTypeSystem();

    test('can resolve', () {
      final resolver = OpenApiSchemaTransformer(
        document: document,
        typeSystem: typeSystem,
      );
      final resolvedSchema = resolver.resolve();
      print(resolvedSchema);
      final linker = OpenApiSchemaLinker(
        context: OpenApiGeneratorContext(document: resolvedSchema),
        registerSpec: (name, builder) {
          print('Registering spec "$name"');
          final spec = builder();
          print(spec);
          return spec;
        },
      );
      final linked = linker.link();
      print(linked);
    });
  });
}
