// // ignore_for_file: non_constant_identifier_names

// import 'package:celest_cli/openapi/model/openapi_v3.dart';
// import 'package:celest_cli/openapi/type/openapi_type.dart';
// import 'package:celest_cli/openapi/type/openapi_type_schema.dart';
// import 'package:celest_cli/openapi/type/openapi_type_schema_resolver.dart';
// import 'package:celest_cli/openapi/type/openapi_type_system.dart';
// import 'package:checks/checks.dart';
// import 'package:test/test.dart';

// import 'openapi_type_checks.dart';

// void main() {
//   group('OpenApiTypeSchemaResolver', () {
//     final typeSystem = OpenApiTypeSystem();
//     late final resolver = OpenApiTypeSchemaResolver(
//       typeSystem: typeSystem,
//       scope: null,
//     );

//     group('product type', () {
//       test('object & integer', () {
//         final sum = OpenApiProductTypeSchema(
//           typesBuilder: () => [
//             typeSystem.anyTypeSchema,
//             typeSystem.integerTypeSchema,
//           ],
//         );
//         check(sum.accept(resolver)).isIntType();
//       });

//       test('object? & integer', () {
//         final sum = OpenApiProductTypeSchema(
//           typesBuilder: () => [
//             typeSystem.anyTypeSchema.withNullability(true),
//             typeSystem.integerTypeSchema,
//           ],
//         );
//         check(sum.accept(resolver)).isIntType();
//       });

//       test('object & integer?', () {
//         final sum = OpenApiProductTypeSchema(
//           typesBuilder: () => [
//             typeSystem.anyTypeSchema,
//             typeSystem.integerTypeSchema.withNullability(true),
//           ],
//         );
//         check(sum.accept(resolver)).isIntType();
//       });

//       test('object? & integer?', () {
//         final sum = OpenApiProductTypeSchema(
//           typesBuilder: () => [
//             typeSystem.anyTypeSchema.withNullability(true),
//             typeSystem.integerTypeSchema.withNullability(true),
//           ],
//         );
//         check(sum.accept(resolver)).isIntType().isNullable();
//       });

//       test('object & double', () {
//         final sum = OpenApiProductTypeSchema(
//           typesBuilder: () => [
//             typeSystem.anyTypeSchema,
//             typeSystem.doubleTypeSchema,
//           ],
//         );
//         check(sum.accept(resolver)).isDoubleType();
//       });

//       test('int & double', () {
//         final sum = OpenApiProductTypeSchema(
//           typesBuilder: () => [
//             typeSystem.integerTypeSchema,
//             typeSystem.doubleTypeSchema,
//           ],
//         );
//         check(() => sum.accept(resolver)).throws<StateError>();
//       });

//       test(
//         r'struct<{$type: string, a: int}> & struct<{$type: string, b: int}>',
//         () {
//           final T1 = OpenApiStructTypeSchema(
//             required: ['type', 'a'],
//             fields: {
//               'type': OpenApiFieldSchema(
//                 name: 'type',
//                 schema: OpenApiStringTypeSchema(),
//               ),
//               'a': OpenApiFieldSchema(
//                 name: 'a',
//                 schema: OpenApiIntegerTypeSchema(),
//               ),
//             },
//             discriminator: OpenApiDiscriminator(
//               propertyName: 'type',
//             ),
//           );
//           final T2 = OpenApiStructTypeSchema(
//             required: ['type'],
//             fields: {
//               'type': OpenApiFieldSchema(
//                 name: 'type',
//                 schema: OpenApiStringTypeSchema(),
//               ),
//               'b': OpenApiFieldSchema(
//                 name: 'b',
//                 schema: OpenApiIntegerTypeSchema(),
//               ),
//             },
//             discriminator: OpenApiDiscriminator(
//               propertyName: 'type',
//             ),
//           );
//           final product = OpenApiProductTypeSchema(
//             typesBuilder: () => [T1, T2],
//           );
//           check(product.accept(resolver)).equals(
//             OpenApiStructType(
//               name: null,
//               fields: {
//                 'type': OpenApiField(
//                   name: 'type',
//                   dartName: 'type',
//                   type: OpenApiStringType(isNullable: false),
//                 ),
//                 'a': OpenApiField(
//                   name: 'a',
//                   dartName: 'a',
//                   type: OpenApiIntegerType(isNullable: false),
//                 ),
//                 'b': OpenApiField(
//                   name: 'b',
//                   dartName: 'b',
//                   type: OpenApiIntegerType(isNullable: true),
//                 ),
//               },
//               isNullable: false,
//             ),
//           );
//         },
//       );

//       test(
//         'Dog = Pet + struct<{bark: bool, bread: enum}>',
//         () {
//           final Pet = OpenApiStructTypeSchema(
//             name: 'Pet',
//             required: ['pet_type'],
//             fields: {
//               'pet_type': OpenApiFieldSchema(
//                 name: 'pet_type',
//                 schema: OpenApiStringTypeSchema(),
//               ),
//             },
//             discriminator: OpenApiDiscriminator(
//               propertyName: 'pet_type',
//             ),
//           );
//           final Dog = OpenApiStructTypeSchema(
//             fields: {
//               'bark': OpenApiFieldSchema(
//                 name: 'bark',
//                 schema: OpenApiBooleanTypeSchema(),
//               ),
//               'breed': OpenApiFieldSchema(
//                 name: 'breed',
//                 schema: OpenApiEnumTypeSchema(
//                   baseType: OpenApiStringTypeSchema(),
//                   values: ['Dingo', 'Husky', 'Retriever', 'Shepherd'],
//                 ),
//               ),
//             },
//           );
//           final product = OpenApiProductTypeSchema(
//             name: 'Dog',
//             typesBuilder: () => [Pet, Dog],
//           );
//           check(product.accept(resolver)).equals(
//             OpenApiStructType(
//               name: 'Dog',
//               fields: {
//                 'pet_type': OpenApiField(
//                   name: 'pet_type',
//                   dartName: 'petType',
//                   type: OpenApiStringType(isNullable: false),
//                 ),
//                 'bark': OpenApiField(
//                   name: 'bark',
//                   dartName: 'bark',
//                   type: OpenApiBooleanType(isNullable: true),
//                 ),
//                 'breed': OpenApiField(
//                   name: 'breed',
//                   dartName: 'breed',
//                   type: OpenApiEnumType(
//                     baseType: OpenApiStringType(isNullable: true),
//                     values: ['Dingo', 'Husky', 'Retriever', 'Shepherd'],
//                   ),
//                 ),
//               },
//               discriminator: OpenApiDiscriminator(
//                 propertyName: 'pet_type',
//               ),
//               isNullable: false,
//             ),
//           );
//         },
//       );
//     });

//     group('sum type', () {
//       test('object | integer', () {
//         final union = OpenApiSumTypeSchema(
//           typesBuilder: () => [
//             typeSystem.anyTypeSchema,
//             typeSystem.integerTypeSchema,
//           ],
//         );
//         check(union.accept(resolver)).isObjectType();
//       });

//       test('object? | integer', () {
//         final union = OpenApiSumTypeSchema(
//           typesBuilder: () => [
//             typeSystem.anyTypeSchema.withNullability(true),
//             typeSystem.integerTypeSchema,
//           ],
//         );
//         check(union.accept(resolver)).isObjectType().isNullable();
//       });

//       test('object | integer?', () {
//         final union = OpenApiSumTypeSchema(
//           typesBuilder: () => [
//             typeSystem.anyTypeSchema,
//             typeSystem.integerTypeSchema.withNullability(true),
//           ],
//         );
//         check(union.accept(resolver)).isObjectType().isNullable();
//       });

//       test('object? | integer?', () {
//         final union = OpenApiSumTypeSchema(
//           typesBuilder: () => [
//             typeSystem.anyTypeSchema.withNullability(true),
//             typeSystem.integerTypeSchema.withNullability(true),
//           ],
//         );
//         check(union.accept(resolver)).isObjectType().isNullable();
//       });

//       test('object | double', () {
//         final union = OpenApiSumTypeSchema(
//           typesBuilder: () => [
//             typeSystem.anyTypeSchema,
//             typeSystem.doubleTypeSchema,
//           ],
//         );
//         check(union.accept(resolver)).isObjectType();
//       });

//       test(
//         r'struct<{$type: string, a: int}> | struct<{$type: string, b: int}>',
//         () {
//           final T1 = OpenApiStructTypeSchema(
//             required: ['type', 'a'],
//             fields: {
//               'type': OpenApiFieldSchema(
//                 name: 'type',
//                 schema: OpenApiStringTypeSchema(),
//               ),
//               'a': OpenApiFieldSchema(
//                 name: 'a',
//                 schema: OpenApiIntegerTypeSchema(),
//               ),
//             },
//             discriminator: OpenApiDiscriminator(
//               propertyName: 'type',
//             ),
//           );
//           final T2 = OpenApiStructTypeSchema(
//             required: ['type', 'b'],
//             fields: {
//               'type': OpenApiFieldSchema(
//                 name: 'type',
//                 schema: OpenApiStringTypeSchema(),
//               ),
//               'b': OpenApiFieldSchema(
//                 name: 'b',
//                 schema: OpenApiIntegerTypeSchema(),
//               ),
//             },
//             discriminator: OpenApiDiscriminator(
//               propertyName: 'type',
//             ),
//           );
//           final sum = OpenApiSumTypeSchema(typesBuilder: () => [T1, T2]);
//           check(sum.accept(resolver)).equals(
//             OpenApiStructType(
//               name: null,
//               fields: {
//                 'type': OpenApiField(
//                   name: 'type',
//                   dartName: 'type',
//                   type: OpenApiStringType(isNullable: false),
//                 ),
//                 'a': OpenApiField(
//                   name: 'a',
//                   dartName: 'a',
//                   type: OpenApiIntegerType(isNullable: true),
//                 ),
//                 'b': OpenApiField(
//                   name: 'b',
//                   dartName: 'b',
//                   type: OpenApiIntegerType(isNullable: true),
//                 ),
//               },
//               isNullable: false,
//             ),
//           );
//         },
//       );
//     });
//   });
// }
