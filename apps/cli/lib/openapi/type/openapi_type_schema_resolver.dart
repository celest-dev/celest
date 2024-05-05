// // ignore_for_file: non_constant_identifier_names, constant_identifier_names

// import 'package:celest_cli/openapi/type/openapi_type.dart';
// import 'package:celest_cli/openapi/type/openapi_type_schema.dart';
// import 'package:celest_cli/openapi/type/openapi_type_system.dart';
// import 'package:celest_cli/openapi/type/openapi_type_visitor.dart';
// import 'package:celest_cli/src/utils/error.dart';

// final class OpenApiTypeSchemaResolver
//     extends OpenApiTypeSchemaVisitor<OpenApiType> {
//   final OpenApiTypeSystem typeSystem = OpenApiTypeSystem();

//   @override
//   OpenApiType visitAny(OpenApiAnyTypeSchema schema) {
//     return OpenApiAnyType(isNullable: schema.isNullableOrFalse);
//   }

//   @override
//   OpenApiType visitArray(OpenApiArrayTypeSchema schema) {
//     final itemType = schema.itemType.accept(this);
//     if (schema.uniqueItems) {
//       return OpenApiSetType(
//         itemType: itemType,
//         isNullable: schema.isNullableOrFalse,
//       );
//     }
//     return OpenApiListType(
//       itemType: itemType,
//       isNullable: schema.isNullableOrFalse,
//     );
//   }

//   @override
//   OpenApiType visitBoolean(OpenApiBooleanTypeSchema schema) {
//     return OpenApiBooleanType(
//       isNullable: schema.isNullableOrFalse,
//     );
//   }

//   @override
//   OpenApiType visitEmpty(OpenApiEmptyTypeSchema schema) {
//     return OpenApiEmptyType.instance;
//   }

//   @override
//   OpenApiType visitEnum(OpenApiEnumTypeSchema schema) {
//     final baseType = schema.baseType.accept(this);
//     assert(baseType is OpenApiPrimitiveType);
//     return OpenApiEnumType(
//       baseType: baseType as OpenApiPrimitiveType,
//       values: schema.values,
//     );
//   }

//   @override
//   OpenApiType visitInteger(OpenApiIntegerTypeSchema schema) {
//     switch (schema.format) {
//       case OpenApiIntegerFormat.unixTime:
//         return OpenApiDateType(
//           primitiveType: OpenApiPrimitive.integer,
//           isNullable: schema.isNullableOrFalse,
//         );
//       default:
//         return OpenApiIntegerType(
//           format: schema.format,
//           isNullable: schema.isNullableOrFalse,
//         );
//     }
//   }

//   @override
//   OpenApiType visitNull(OpenApiNullTypeSchema schema) {
//     return OpenApiNullType.instance;
//   }

//   @override
//   OpenApiType visitNumber(OpenApiNumberTypeSchema schema) {
//     return OpenApiDoubleType(isNullable: schema.isNullableOrFalse);
//   }

//   @override
//   OpenApiType visitRecord(OpenApiRecordTypeSchema schema) {
//     return OpenApiRecordType(
//       valueType: schema.valueType.accept(this),
//       isNullable: schema.isNullableOrFalse,
//     );
//   }

//   @override
//   OpenApiType visitSingleValue(OpenApiSingleValueTypeSchema schema) {
//     final baseType = schema.baseType.accept(this);
//     assert(baseType is OpenApiPrimitiveType);
//     return OpenApiSingleValueType(
//       baseType: baseType as OpenApiPrimitiveType,
//       value: schema.value,
//     );
//   }

//   @override
//   OpenApiType visitString(OpenApiStringTypeSchema schema) {
//     switch (schema.format) {
//       case OpenApiStringFormat.date ||
//             OpenApiStringFormat.dateTime ||
//             OpenApiStringFormat.time:
//         return OpenApiDateType(
//           primitiveType: OpenApiPrimitive.string,
//           isNullable: schema.isNullableOrFalse,
//         );
//       case OpenApiStringFormat.duration:
//         TODO('Duration type: $schema');
//       case OpenApiStringFormat.regex:
//         TODO('RegExp type: $schema');
//       default:
//         return OpenApiStringType(
//           format: schema.format,
//           isNullable: schema.isNullableOrFalse,
//         );
//     }
//   }

//   @override
//   OpenApiType visitStruct(OpenApiStructTypeSchema schema) {
//     final name = schema.name ?? scope?.typeName ?? 'TODO';
//     return OpenApiStructType(
//       name: name,
//       fields: schema.fields.toMap().map((fieldName, field) {
//         final fieldType = field.schema.accept(this);
//         return MapEntry(
//           fieldName,
//           OpenApiField(
//             name: fieldName,
//             dartName: fieldName.camelCase,
//             type: fieldType
//                 .rebuild((t) => t..name ??= '${name}_$fieldName')
//                 .withNullability(
//                   !schema.required.contains(fieldName) || fieldType.isNullable,
//                 ),
//           ),
//         );
//       }),
//       discriminator: schema.discriminator,
//       isNullable: schema.isNullableOrFalse,
//     );
//   }

//   @override
//   OpenApiType visitDisjointUnion(OpenApiDisjointUnionTypeSchema schema) {
//     // Create a sealed class hiearchy for the different branches.
//     final baseName = schema.name ?? scope?.typeName ?? 'TODO';
//     return OpenApiSealedType.build((b) {
//       b.name = baseName;
//       b.isNullable = schema.isNullableOrFalse;

//       final discriminator = schema.discriminator;
//       if (discriminator != null) {
//         b.discriminator.replace(discriminator);
//       }

//       assert(schema.types.isNotEmpty, '$baseName had no types');
//       for (final type in schema.types) {
//         final branchType = type.accept(this);
//         b.branches.add(
//           OpenApiSealedBranch(
//             name: branchType.name ??
//                 switch (scope) {
//                   OpenApiTypeResolutionScopeResponse(:final statusCode) =>
//                     '${baseName}_${statusCode ?? 'default'}',
//                   // `TODO`: based on context
//                   _ => 'TODO',
//                 },
//             type: branchType,
//           ),
//         );
//       }
//     });
//   }

//   @override
//   OpenApiType visitProduct(OpenApiProductTypeSchema schema) {
//     // Solves X1 & X2 & ... & Xn
//     final resolved = schema.types.map((type) {
//       final typeOrRef = type.accept(this);
//       return switch (typeOrRef) {
//         OpenApiTypeReference(:final name) => schemas[name]!,
//         final type => type,
//       };
//     }).fold(typeSystem.topType, typeSystem.greatestLowerBound);

//     // If we're unable to resolve to a Dart type, then it's very likely a bad
//     // type, e.g. `string & number` and we must bail.
//     if (identical(resolved, typeSystem.bottomType)) {
//       throw StateError('allOf could not be resolved to a Dart type');
//     }

//     return resolved.rebuild(
//       (b) => b
//         ..isNullable = schema.isNullable ?? resolved.isNullable
//         ..name = schema.name ?? scope?.typeName,
//     );
//   }

//   @override
//   OpenApiType visitSum(OpenApiSumTypeSchema schema) {
//     // Solves X1 | X2 | ... | Xn
//     final resolved = schema.types
//         .map(
//           (type) => switch (type.accept(this)) {
//             OpenApiTypeReference(:final name) => schemas[name]!,
//             final type => type,
//           },
//         )
//         .fold(typeSystem.bottomType, typeSystem.leastUpperBound);

//     if (resolved is OpenApiAnyType) {
//       // `TODO`: Resolve as disjoint union so that we don't have APIs with just
//       // `Object?`.
//     }

//     return resolved.rebuild(
//       (b) => b
//         ..isNullable = schema.isNullable ?? resolved.isNullable
//         ..name = schema.name ?? scope?.typeName,
//     );
//   }
// }

// // final class _InterfaceLeastUpperBoundHelper {
// //   _InterfaceLeastUpperBoundHelper();


// //   // Models [SubtypeHelper._isInterfaceSubtypeOf].
// //   // `TODO`: Add OpenApiInterfaceType
// //   bool _isInterfaceSubtypeOf(
// //     OpenApiInterfaceType subType,
// //     OpenApiInterfaceType superType,
// //   ) {
// //     // Note: we should never reach `_isInterfaceSubtypeOf` with `i2 == Object`,
// //     // because top types are eliminated before `isSubtypeOf` calls this.
// //     assert(superType is! OpenApiAnyType);

// //     if (identical(subType, superType)) {
// //       return true;
// //     }

// //     // Object cannot subtype anything but itself (handled above).
// //     if (subType is OpenApiAnyType) {
// //       return false;
// //     }

// //     for (final interface in subType.allSuperTypes) {
// //       if (interface == superType) {
// //         return true; // Handle subtyping of records/lists/svcs
// //       }
// //     }

// //     return false;
// //   }

// //   /// Compute the least upper bound of types [i] and [j], both of which are
// //   /// known to be interface types.
// //   OpenApiInterfaceType _computeLeastUpperBound(
// //     OpenApiInterfaceType i,
// //     OpenApiInterfaceType j,
// //   ) {
// //     throw UnimplementedError();
// //   }

// //   OpenApiType compute(
// //     OpenApiInterfaceType type1,
// //     OpenApiInterfaceType type2,
// //   ) {
// //     final nullability = _chooseNullability(type1, type2);

// //     // Strip off nullability.
// //     type1 = type1.withNullability(false);
// //     type2 = type2.withNullability(false);

// //     if (_isSubtypeOf(type1, type2)) {
// //       return type2.withNullability(nullability);
// //     }
// //     if (_isSubtypeOf(type2, type1)) {
// //       return type1.withNullability(nullability);
// //     }

// //     var result = _computeLeastUpperBound(type1, type2);
// //     if (nullability == true) {
// //       result = result.withNullability(true);
// //     }
// //     return result;
// //   }
// // }
