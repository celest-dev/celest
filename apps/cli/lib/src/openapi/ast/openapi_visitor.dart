import 'package:celest_cli/src/openapi/ast/openapi_ast.dart';

abstract class OpenApiVisitor<R> {
  R visitDocument(OpenApiDocument document);
  R visitInfo(OpenApiInfo info);
  R visitServer(OpenApiServer server);
  R visitServerVariable(OpenApiServerVariable serverVariable);
  R visitPathItem(OpenApiPathItem pathItem);
  R visitOperation(OpenApiOperation operation);
  R visitParameter(OpenApiParameter parameter);
  R visitMediaType(OpenApiMediaType mediaType);
  R visitRequestBody(OpenApiRequestBody requestBody);
  R visitEncoding(OpenApiEncoding encoding);
  R visitResponse(OpenApiResponse response);
  R visitHeader(OpenApiHeader header);
  R visitComponents(OpenApiComponents components);
  R visitComponent(OpenApiComponent component) => switch (component) {
        OpenApiPathItem() => visitPathItem(component),
        OpenApiParameter() => visitParameter(component),
        OpenApiRequestBody() => visitRequestBody(component),
        OpenApiResponse() => visitResponse(component),
        OpenApiHeader() => visitHeader(component),
        OpenApiSchema() => visitSchema(component),
        OpenApiSecurityScheme() => visitSecurityScheme(component),
      };
  R visitSchema(OpenApiSchema schema);
  R visitSecurityRequirement(OpenApiSecurityRequirement securityRequirement);
  R visitSecurityScheme(OpenApiSecurityScheme securityScheme);
  R visitOAuthFlows(OpenApiOAuthFlows oauthFlows);
  R visitOAuthFlow(OpenApiOAuthFlow oauthFlow);
  R visitAdditionalProperties(OpenApiAdditionalProperties additionalProperties);
  R visitDiscriminator(OpenApiDiscriminator discriminator);
  R visitReference(OpenApiReference reference);
  R visitExternalDocs(OpenApiExternalDocs externalDocs);
  R visitTag(OpenApiTag tag);
  R visitContact(OpenApiContact contact);
  R visitLicense(OpenApiLicense license);
}

abstract class OpenApiVisitorWithArg<R, A> {
  R visitDocument(OpenApiDocument document, A arg);
  R visitInfo(OpenApiInfo info, A arg);
  R visitServer(OpenApiServer server, A arg);
  R visitServerVariable(OpenApiServerVariable serverVariable, A arg);
  R visitPathItem(OpenApiPathItem pathItem, A arg);
  R visitOperation(OpenApiOperation operation, A arg);
  R visitParameter(OpenApiParameter parameter, A arg);
  R visitMediaType(OpenApiMediaType mediaType, A arg);
  R visitRequestBody(OpenApiRequestBody requestBody, A arg);
  R visitEncoding(OpenApiEncoding encoding, A arg);
  R visitResponse(OpenApiResponse response, A arg);
  R visitHeader(OpenApiHeader header, A arg);
  R visitComponents(OpenApiComponents components, A arg);
  R visitComponent(OpenApiComponent component, A arg) => switch (component) {
        OpenApiPathItem() => visitPathItem(component, arg),
        OpenApiParameter() => visitParameter(component, arg),
        OpenApiRequestBody() => visitRequestBody(component, arg),
        OpenApiResponse() => visitResponse(component, arg),
        OpenApiHeader() => visitHeader(component, arg),
        OpenApiSchema() => visitSchema(component, arg),
        OpenApiSecurityScheme() => visitSecurityScheme(component, arg),
      };
  R visitSchema(OpenApiSchema schema, A arg);
  R visitSecurityRequirement(
    OpenApiSecurityRequirement securityRequirement,
    A arg,
  );
  R visitSecurityScheme(OpenApiSecurityScheme securityScheme, A arg);
  R visitOAuthFlows(OpenApiOAuthFlows oauthFlows, A arg);
  R visitOAuthFlow(OpenApiOAuthFlow oauthFlow, A arg);
  R visitAdditionalProperties(
    OpenApiAdditionalProperties additionalProperties,
    A arg,
  );
  R visitDiscriminator(OpenApiDiscriminator discriminator, A arg);
  R visitReference(OpenApiReference reference, A arg);
  R visitExternalDocs(OpenApiExternalDocs externalDocs, A arg);
  R visitTag(OpenApiTag tag, A arg);
  R visitContact(OpenApiContact contact, A arg);
  R visitLicense(OpenApiLicense license, A arg);
}
