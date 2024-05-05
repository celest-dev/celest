// // ignore_for_file: non_constant_identifier_names

// import 'package:celest_cli/openapi/type/openapi_type.dart';
// import 'package:celest_cli/openapi/type/openapi_type_system.dart';
// import 'package:checks/checks.dart';
// import 'package:test/test.dart';

// import 'openapi_type_checks.dart';

// void main() {
//   group('OpenApiTypeSystem', () {
//     final typeSystem = OpenApiTypeSystem();

//     group('UP', () {
//       test('(integer, double)', () {
//         final lub = typeSystem.leastUpperBound(
//           typeSystem.integerType,
//           typeSystem.doubleType,
//         );
//         check(lub).isNumType();
//       });

//       test('(integer?, double)', () {
//         final lub = typeSystem.leastUpperBound(
//           typeSystem.integerType.withNullability(true),
//           typeSystem.doubleType,
//         );
//         check(lub).isNumType().isNullable();
//       });

//       test('(integer, double?)', () {
//         final lub = typeSystem.leastUpperBound(
//           typeSystem.integerType,
//           typeSystem.doubleType.withNullability(true),
//         );
//         check(lub).isNumType().isNullable();
//       });

//       test('(integer?, double?)', () {
//         final lub = typeSystem.leastUpperBound(
//           typeSystem.integerType.withNullability(true),
//           typeSystem.doubleType.withNullability(true),
//         );
//         check(lub).isNumType().isNullable();
//       });

//       test('object | integer', () {
//         check(
//           typeSystem.leastUpperBound(
//             typeSystem.anyType,
//             typeSystem.integerType,
//           ),
//         ).isObjectType();
//       });

//       test('object? | integer', () {
//         check(
//           typeSystem.leastUpperBound(
//             typeSystem.anyType.withNullability(true),
//             typeSystem.integerType,
//           ),
//         ).isObjectType().isNullable();
//       });

//       test('object | integer?', () {
//         check(
//           typeSystem.leastUpperBound(
//             typeSystem.anyType,
//             typeSystem.integerType.withNullability(true),
//           ),
//         ).isObjectType().isNullable();
//       });

//       test('object? | integer?', () {
//         check(
//           typeSystem.leastUpperBound(
//             typeSystem.anyType.withNullability(true),
//             typeSystem.integerType.withNullability(true),
//           ),
//         ).isObjectType().isNullable();
//       });

//       test('object | double', () {
//         check(
//           typeSystem.leastUpperBound(
//             typeSystem.anyType,
//             typeSystem.doubleType,
//           ),
//         ).isObjectType();
//       });

//       test('object? | null', () {
//         check(
//           typeSystem.leastUpperBound(
//             typeSystem.anyType.withNullability(true),
//             OpenApiNullType.instance,
//           ),
//         ).isObjectType().isNullable();
//       });

//       test('object | null', () {
//         check(
//           typeSystem.leastUpperBound(
//             typeSystem.anyType,
//             OpenApiNullType.instance,
//           ),
//         ).isObjectType().isNullable();
//       });

//       test('object | never', () {
//         check(
//           typeSystem.leastUpperBound(
//             typeSystem.anyType,
//             OpenApiEmptyType.instance,
//           ),
//         ).isObjectType();
//       });

//       test('object? | never', () {
//         check(
//           typeSystem.leastUpperBound(
//             typeSystem.anyType.withNullability(true),
//             OpenApiEmptyType.instance,
//           ),
//         ).isObjectType().isNullable();
//       });

//       test('(list<object>, set<object>)', () {
//         check(
//           typeSystem.leastUpperBound(
//             OpenApiListType(itemType: typeSystem.anyType, isNullable: false),
//             OpenApiSetType(itemType: typeSystem.anyType, isNullable: false),
//           ),
//         ).equals(
//           OpenApiIterableType(
//             itemType: OpenApiAnyType(isNullable: false),
//             isNullable: false,
//           ),
//         );
//       });

//       test('(list<double>, set<integer>)', () {
//         check(
//           typeSystem.leastUpperBound(
//             OpenApiListType(itemType: typeSystem.doubleType, isNullable: false),
//             OpenApiSetType(itemType: typeSystem.integerType, isNullable: false),
//           ),
//         ).equals(
//           OpenApiIterableType(
//             itemType: OpenApiNumberType(isNullable: false),
//             isNullable: false,
//           ),
//         );
//       });

//       test('(struct<{}>, struct<{a: int}>)', () {
//         final T1 = OpenApiStructType(
//           name: null,
//           fields: {},
//           isNullable: false,
//         );
//         final T2 = OpenApiStructType(
//           name: null,
//           fields: {
//             'a': OpenApiField(
//               name: 'a',
//               dartName: 'a',
//               type: OpenApiIntegerType(isNullable: true),
//             ),
//           },
//           isNullable: false,
//         );
//         check(typeSystem.leastUpperBound(T1, T2)).equals(T2);
//         check(typeSystem.leastUpperBound(T2, T1)).equals(T2);
//       });

//       test('(record<any>, record<int>)', () {
//         final T1 = OpenApiRecordType(
//           valueType: typeSystem.anyType,
//           isNullable: false,
//         );
//         final T2 = OpenApiRecordType(
//           valueType: typeSystem.integerType,
//           isNullable: false,
//         );
//         check(typeSystem.leastUpperBound(T1, T2)).equals(T1);
//         check(typeSystem.leastUpperBound(T2, T1)).equals(T1);
//       });
//     });

//     group('DOWN', () {
//       test('(integer, double)', () {
//         final glb = typeSystem.greatestLowerBound(
//           typeSystem.integerType,
//           typeSystem.doubleType,
//         );
//         check(glb).isNeverType();
//       });

//       test('(integer, integer)', () {
//         final glb = typeSystem.greatestLowerBound(
//           typeSystem.integerType,
//           typeSystem.integerType,
//         );
//         check(glb).isIntType();
//       });

//       test('(object, integer)', () {
//         final glb = typeSystem.greatestLowerBound(
//           typeSystem.anyType,
//           typeSystem.integerType,
//         );
//         check(glb).isIntType();
//       });

//       test('(object?, integer)', () {
//         final glb = typeSystem.greatestLowerBound(
//           typeSystem.anyType.withNullability(true),
//           typeSystem.integerType,
//         );
//         check(glb).isIntType();
//       });

//       test('(object?, integer?)', () {
//         final glb = typeSystem.greatestLowerBound(
//           typeSystem.anyType.withNullability(true),
//           typeSystem.integerType.withNullability(true),
//         );
//         check(glb).isIntType().isNullable();
//       });
//     });
//   });
// }
