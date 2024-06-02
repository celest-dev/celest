import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema.dart';

abstract class OpenApiTypeVisitor<R> {
  // Reference type
  R visitReference(OpenApiTypeReference type);

  // Primitive types
  R visitBoolean(OpenApiBooleanType type);
  R visitInteger(OpenApiIntegerType type);
  R visitNumber(OpenApiNumberType type);
  R visitDouble(OpenApiDoubleType type);
  R visitString(OpenApiStringType type);
  R visitNull(OpenApiNullType type);

  // Transposed primitive types
  R visitDate(OpenApiDateType type);
  R visitBinary(OpenApiBinaryType type);

  // Simple wrapper types
  R visitSingleValue(OpenApiSingleValueType type);
  R visitEnum(OpenApiEnumType type);
  R visitSealed(OpenApiSealedType type);

  // Collection types
  R visitList(OpenApiListType type);
  R visitSet(OpenApiSetType type);
  R visitIterable(OpenApiIterableType type);

  // Structural types
  R visitRecord(OpenApiRecordType type);
  R visitStruct(OpenApiStructType type);

  // Bottom type
  R visitEmpty(OpenApiEmptyType type);

  // Top type
  R visitAny(OpenApiAnyType type);
}

abstract class OpenApiTypeSchemaVisitor<R, C> {
  // Reference type
  R visitReference(OpenApiTypeSchemaReference schema, [C? context]);

  // Primitive types
  R visitBoolean(OpenApiBooleanTypeSchema schema, [C? context]);
  R visitInteger(OpenApiIntegerTypeSchema schema, [C? context]);
  R visitNumber(OpenApiNumberTypeSchema schema, [C? context]);
  R visitString(OpenApiStringTypeSchema schema, [C? context]);
  R visitNull(OpenApiNullTypeSchema schema, [C? context]);

  // Simple wrapper types
  R visitSingleValue(OpenApiSingleValueTypeSchema schema, [C? context]);
  R visitEnum(OpenApiEnumTypeSchema schema, [C? context]);

  // Collection types
  R visitArray(OpenApiArrayTypeSchema schema, [C? context]);

  // Structural types
  R visitRecord(OpenApiRecordTypeSchema schema, [C? context]);
  R visitStruct(OpenApiStructTypeSchema schema, [C? context]);

  // Bottom type
  R visitEmpty(OpenApiEmptyTypeSchema schema, [C? context]);

  // Top type
  R visitAny(OpenApiAnyTypeSchema schema, [C? context]);
  R visitSum(OpenApiSumTypeSchema schema, [C? context]);
  R visitDisjointUnion(OpenApiDisjointUnionTypeSchema schema, [C? context]);
}

// abstract base class OpenApiTypeSchemaGeneralizingVisitor<R>
//     extends OpenApiTypeSchemaVisitor<R> {
//   @override
//   R visitAny(OpenApiAnyTypeSchema schema) => visit(schema);

//   @override
//   R visitAnyObject(OpenApiAnyObjectTypeSchema schema) => visit(schema);

//   @override
//   R visitBoolean(OpenApiBooleanTypeSchema schema) => visit(schema);

//   @override
//   R visitDisjointUnion(OpenApiDisjointUnionTypeSchema schema) => visit(schema);

//   @override
//   R visitEmpty(OpenApiEmptyTypeSchema schema) => visit(schema);

//   @override
//   R visitEnum(OpenApiEnumTypeSchema schema) => visit(schema);

//   @override
//   R visitInteger(OpenApiIntegerTypeSchema schema) => visit(schema);

//   @override
//   R visitArray(OpenApiArrayTypeSchema schema) => visit(schema);

//   @override
//   R visitNull(OpenApiNullTypeSchema schema) => visit(schema);

//   @override
//   R visitNumber(OpenApiNumberTypeSchema schema) => visit(schema);

//   @override
//   R visitProduct(OpenApiProductTypeSchema schema) => visit(schema);

//   @override
//   R visitRecord(OpenApiRecordTypeSchema schema) => visit(schema);

//   @override
//   R visitSingleValue(OpenApiSingleValueTypeSchema schema) => visit(schema);

//   @override
//   R visitString(OpenApiStringTypeSchema schema) => visit(schema);

//   @override
//   R visitStruct(OpenApiStructTypeSchema schema) => visit(schema);

//   @override
//   R visitSum(OpenApiSumTypeSchema schema) => visit(schema);
// }
