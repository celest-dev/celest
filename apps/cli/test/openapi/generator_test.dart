@Tags(['openapi'])
library;

import 'dart:convert';

import 'package:celest_cli/openapi/model/openapi_schema_transformer.dart';
import 'package:celest_cli/openapi/openapi_generator.dart';
import 'package:celest_cli/openapi/type/openapi_type_system.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:lib_openapi/src/converter.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

import 'fixtures.dart';

DartEmitter get emitter => DartEmitter(
      orderDirectives: true,
      useNullSafetySyntax: true,
    );

final DartFormatter _dartfmt = DartFormatter(
  fixes: StyleFix.all,
);
String formatDartTest(String source) {
  String formatted;
  try {
    formatted = _dartfmt.format(source);
  } on FormatException catch (_) {
    formatted = _dartfmt.formatStatement(source);
  }
  return formatted;
}

void main() {
  EqualsDart.format = formatDartTest;
  Logger.root.onRecord.listen((record) {
    print('[${record.loggerName}] ${record.message}');
  });
  group('petstore', () {
    final document = OpenApiSchemaTransformer(
      document: generateOpenApiV3(jsonEncode(petstoreV3Json)),
      typeSystem: OpenApiTypeSystem(),
    ).resolve();
    OpenApiGeneratorContext context() =>
        OpenApiGeneratorContext(document: document);

//     test('generates Pet schema', () {
//       final petSchema = document.components.schemas['Pet']!;
//       final ctx = context();
//       final generator = OpenApiStructGenerator(
//         context: ctx,
//         name: 'Pet',
//         type: petSchema.type as OpenApiStructType,
//         schema: petSchema,
//       );
//       expect(
//         generator.generate(),
//         equalsDart(
//           '''
// final class Pet {
//   const Pet({
//     required this.id,
//     required this.name,
//     this.tag,
//   });

//   final int id;

//   final String name;

//   final String? tag;
// }
// ''',
//           emitter,
//         ),
//       );
//     });

    // test('generates Pets array', skip: true, () {
    //   final petsSchema = document.components.schemas['Pets']!;
    //   final type = petsSchema.type.typeReference;
    //   expect(
    //     type,
    //     TypeReference(
    //       (t) => t
    //         ..symbol = 'Pets'
    //         ..url = 'schemas/Pets.dart',
    //     ),
    //   );
    // });

    test('generates client', () {
      final generator = OpenApiGenerator(
        context: context(),
      );
      final emitted = generator.generate().values.single.accept(emitter);
      print(formatDartTest(emitted.toString()));
//       expect(
//         generator.generate(),
//         equalsDart(
//           '''
// extension type OpenApiPetstoreServerUri(Uri _) implements Uri {
//   static final OpenApiPetstoreServerUri defaultServer = developmentServer;

//   /// Development server
//   static final OpenApiPetstoreServerUri developmentServer =
//       OpenApiPetstoreServerUri(Uri.parse(r'https://petstore.openapis.org/v1/'));
// }

// final class OpenApiPetstoreClient {
//   OpenApiPetstoreClient({Uri? baseUri}):
//     _baseUri = baseUri ?? OpenApiPetstoreServerUri.defaultServer;

//   /// The base URI for the API
//   final Uri _baseUri;
// }
// ''',
//           emitter,
//         ),
//       );
    });

    test('generates Pets document', () {
      final generated =
          OpenApiGenerator.fromJsonOrYaml(jsonEncode(petstoreV3Json))
              .generate();
      expect(
        generated.keys,
        unorderedEquals([
          'schemas/Error.dart',
          'schemas/Pet.dart',
          // 'schemas/Pets.dart',
        ]),
      );
    });
  });

//   group('bookstore', () {
//     final document = OpenApiSchemaTransformer(
//       document: generateOpenApiV3(jsonEncode(bookstoreV3Json)),
//       typeSystem: OpenApiTypeSystem(),
//     ).resolve();
//     OpenApiGeneratorContext context() =>
//         OpenApiGeneratorContext(document: document);

//     test('generates listBooksResponse schema', () {
//       final schema = document.components.schemas['listBooksResponse']!;
//       final ctx = context();
//       final generator = OpenApiStructGenerator(
//         context: ctx,
//         name: 'listBooksResponse',
//         type: schema.type as OpenApiStructType,
//         schema: schema,
//       );
//       expect(
//         generator.generate(),
//         equalsDart(
//           '''
// final class listBooksResponse {
//   const listBooksResponse({required this.books});

//   final List<book> books;
// }
// ''',
//           emitter,
//         ),
//       );
//     });

//     test('generates Bookstore document', () {
//       final generated =
//           OpenApiGenerator.fromJsonOrYaml(jsonEncode(bookstoreV3Json))
//               .generate();
//       expect(
//         generated.keys,
//         unorderedEquals([
//           'schemas/book.dart',
//           'schemas/listBooksResponse.dart',
//           'schemas/listShelvesResponse.dart',
//           'schemas/shelf.dart',
//           'schemas/error.dart',
//         ]),
//       );
//     });
  // });
}
