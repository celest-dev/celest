@Tags(['openapi'])
library;

import 'dart:convert';
import 'dart:io';

import 'package:celest_cli/codegen/allocator.dart';
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli/openapi/model/openapi_schema_transformer.dart';
import 'package:celest_cli/openapi/openapi_generator.dart';
import 'package:celest_cli/openapi/type/openapi_type_system.dart';
import 'package:celest_cli/src/context.dart';
import 'package:checks/checks.dart';
import 'package:lib_openapi/lib_openapi.dart';
import 'package:test/test.dart';

import '../../fixtures.dart';
import 'fixtures.dart';

void main() {
  final cliDir = Directory.current;
  final fixturesRoot = cliDir.uri.resolve('test/openapi/fixtures/');
  final baseOutputRoot = cliDir.uri.resolve('test/openapi/goldens/');

  group('stripe', skip: true, () {
    final outputRoot = baseOutputRoot.resolve('stripe/');
    final outputDir = fileSystem.directory(outputRoot)
      ..createSync(recursive: true);

    final document = generateOpenApiV3(jsonEncode(stripeSpecV3SdkJson));
    final typeSystem = OpenApiTypeSystem();

    test('can resolve', () {
      final resolver = OpenApiSchemaTransformer(
        document: document,
        typeSystem: typeSystem,
      );
      check(resolver.resolve).returnsNormally();
    });

    test('can generate', () {
      final outputs = OpenApiGenerator.fromProto(document).generate();
      outputs.forEach((key, value) {
        print('emitting "$key"');

        final outputFile = File.fromUri(outputDir.uri.resolve(key));
        final code = CodeGenerator.emit(
          value,
          forFile: key,
          pathStrategy: PathStrategy.pretty,
          prefixingStrategy: switch (key) {
            'models.dart' || 'events.dart' => PrefixingStrategy.noImports,
            _ => PrefixingStrategy.none,
          },
        );

        print('writing ${outputFile.path}');
        outputFile
          ..createSync(recursive: true)
          ..writeAsStringSync(code);
      });
    });
  });

  group('cloudflare', skip: false, () {
    final outputRoot = baseOutputRoot.resolve('cloudflare/');
    final outputDir = fileSystem.directory(outputRoot)
      ..createSync(recursive: true);

    final document = generateOpenApiV3(
      fileSystem
          .directory(fixturesRoot)
          .childFile('cloudflare.json')
          .readAsStringSync(),
    );
    final typeSystem = OpenApiTypeSystem();

    test('can resolve', () {
      final resolver = OpenApiSchemaTransformer(
        document: document,
        typeSystem: typeSystem,
      );
      check(resolver.resolve).returnsNormally();
    });

    test('can generate', () {
      final outputs = OpenApiGenerator.fromProto(document).generate();
      outputs.forEach((key, value) {
        print('emitting "$key"');

        final outputFile = File.fromUri(outputDir.uri.resolve(key));
        final code = CodeGenerator.emit(
          value,
          forFile: 'client.dart',
          pathStrategy: PathStrategy.robust,
        );

        print('writing ${outputFile.path}');
        outputFile
          ..createSync(recursive: true)
          ..writeAsStringSync(code);
      });
    });
  });

  group('openapi-generator', skip: true, () {
    final outputRoot = baseOutputRoot.resolve('openapi-generator/');
    // TODO(dnys1): Mostly recursion issues.
    const skipTests = [
      'bugs/swift5_code_generation_bug2',
      'bugs/swift5_code_generation_stack_overflow_2966',
      'bugs/java_codegen_empty_array_as_default_value_issue_wrong_default',
      '3_0/issue_8052_recursive_model',
      '3_0/recursion',
      '3_0/issue_7532',
      '3_0/elm',
      'bugs/issue_constructor_required_values_with_multiple_inheritance',
      // External references.
      'bugs/java_codegen_empty_array_as_default_value/issue_wrong_default',
      '3_0/issue_16223',
      '3_0/external_refs/echo_api',

      // Not relevant to our codegen
      // https://github.com/OpenAPITools/openapi-generator/issues/13052
      'bugs/issue_13052',

      // Weird schema
      '3_0/simplify_one_of_any_of_test',

      // format=int364 for integer type ??
      '3_0/issue_7651',

      // 4xx for responses key ??
      '3_0/petstore_with_fake_endpoints_models_for_testing_with_http_signature',

      // Bad schema ref
      '3_0/property_title',
      '3_0/unsigned_test',

      // Havent checked
      '3_0/invalid_ref_request_body',
      'bugs/issue_13917',
      'bugs/issue_13150',
      'bugs/issue_13150',
      '3_0/any_of_discriminator',
      '3_0/any_of',
      '3_0/form_multipart_binary_array',
      '3_0/conflicting_parameter',
      '3_0/schema_unalias_test',
      '3_0/issue7506',
      '3_0/response_tests',
      '3_0/form_duplicated_parameter',
    ];
    for (final MapEntry(key: path, value: (:document, model: _))
        in openApiGeneratorFixturesV3.entries) {
      if (skipTests.contains(path)) {
        continue;
      }
      group(path, () {
        final typeSystem = OpenApiTypeSystem();

        test('can resolve', () {
          final resolver = OpenApiSchemaTransformer(
            document: document,
            typeSystem: typeSystem,
          );
          final resolvedSchema = resolver.resolve();
          print(resolvedSchema);
        });

        test('can generate', () {
          final outputs = OpenApiGenerator.fromProto(document).generate();
          final outputDir = fileSystem.directory(outputRoot.resolve('$path/'))
            ..createSync(recursive: true);
          outputs.forEach((key, value) {
            print('emitting "$key" for: $path');

            final outputFile = File.fromUri(outputDir.uri.resolve(key));
            final code = CodeGenerator.emit(
              value,
              forFile: 'client.dart',
              pathStrategy: PathStrategy.robust,
            );

            print('writing ${outputFile.path}');
            outputFile
              ..createSync(recursive: true)
              ..writeAsStringSync(code);
          });
        });
      });
    }
  });
}
