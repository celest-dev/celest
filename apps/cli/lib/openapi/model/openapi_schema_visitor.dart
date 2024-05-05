import 'package:celest_cli/openapi/model/openapi_v3.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema.dart';

abstract class OpenApiSchemaVisitor<R> {
  R visitDocument(OpenApiDocument document);
  R visitServer(OpenApiServer server, [OpenApiDocument? parent]);
  R visitPathItem(OpenApiPathItem pathItem, [OpenApiDocument? parent]);
  R visitOperation(OpenApiOperation operation, [OpenApiDocument? parent]);
  R visitResponse(OpenApiResponse response, [OpenApiOperation? parent]);
  R visitSchema(OpenApiTypeSchema schema);
  R visitHeader(OpenApiHeader header);
}
