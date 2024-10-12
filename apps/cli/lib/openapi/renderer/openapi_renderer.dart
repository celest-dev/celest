import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_type_to_openapi.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:code_builder/code_builder.dart';
import 'package:http_parser/http_parser.dart';
import 'package:lib_openapi/lib_openapi.dart';
import 'package:pub_semver/pub_semver.dart';

/// Renders an OpenAPI V3 document for a Celest [project].
class OpenApiRenderer {
  OpenApiRenderer({
    required this.project,
    required this.resolvedProject,
  });

  final ast.Project project;
  final ast.ResolvedProject resolvedProject;

  OpenApiDocument render() {
    final renderer = _OpenApiRenderer(
      resolved: resolvedProject,
    );
    project.acceptWithArg(renderer, '#');
    return renderer._builder.build();
  }

  String renderToYaml() {
    final document = render();
    return document.toYaml();
  }
}

final class _OpenApiRenderer extends ast.AstVisitorWithArg<void, String> {
  _OpenApiRenderer({
    required this.resolved,
  });

  final ast.ResolvedProject resolved;
  final _builder = OpenApiDocumentBuilder()
    // 3.1 seems to have poor support in the ecosystem and 3.0.3 is the latest
    // revision of the `3.0` spec.
    ..version = Version.parse('3.0.3');

  static final _applicationJson = MediaType.parse('application/json');

  @override
  void visitProject(ast.Project project, String ref) {
    _builder.info
      ..title = project.displayName ?? project.name
      ..apiVersion = 'v1';
    project.apis.forEach((name, api) {
      visitApi(api, '$ref/paths');
    });
  }

  @override
  void visitApi(ast.Api api, String ref) {
    api.functions.forEach((name, function) {
      visitFunction(function, '$ref/${function.route}');
    });
  }

  OpenApiComponentOrRef<OpenApiSchema> _schemaRef(
    TypeReference type,
    String ref, {
    Object? defaultValue,
  }) {
    final typeName = type.externalUri(resolved.projectId);
    if (_builder.components.schemas[typeName] case final schema?) {
      return OpenApiComponentOrRef.reference(
        ref: ref,
        reference: schema.toReference(),
      );
    }
    final dartType = typeHelper.fromReference(type);
    final visitor = DartTypeToOpenApi(
      ref: ref,
      components: _builder.components,
    );
    final result = dartType.accept(visitor);
    // switch (result) {
    //   case OpenApiComponentOrRef(:final component?):
    //     return result.rebuild((it) {
    //       it.component = component.rebuild((schema) {
    //         schema.defaultValue = defaultValue;
    //       });
    //     });
    //   case OpenApiComponentOrRef(:final reference?):
    //     _builder.components.schemas.updateValue(reference.name, (schema) {
    //       return schema.rebuild((schema) {
    //         schema.defaultValue = defaultValue;
    //       });
    //     });
    // }
    return result;
  }

  OpenApiSchema _exceptionType(TypeReference type, String ref) {
    final typeName = type.externalUri(resolved.projectId);
    final dartType = typeHelper.fromReference(type);
    final visitor = DartTypeToOpenApi(
      ref: ref,
      components: _builder.components,
    );
    final details = dartType.accept(visitor);
    return OpenApiSchema(
      ref: ref,
      type: const ItemValue(JsonType.object),
      nullable: false,
      properties: {
        'code': OpenApiComponentOrRef.component(
          component: OpenApiSchema(
            type: const ItemValue(JsonType.string),
            nullable: false,
            enumValues: [typeName],
          ),
        ),
        'message': OpenApiComponentOrRef.component(
          component: OpenApiSchema(
            type: const ItemValue(JsonType.string),
            nullable: true,
          ),
        ),
        'details': details,
      },
    );
  }

  @override
  void visitFunction(ast.CloudFunction function, String ref) {
    final resolvedFunction =
        resolved.apis[function.apiName]!.functions[function.name]!;
    final operationId = '${function.apiName}.${function.name}';
    final operationType = resolvedFunction.operationType;

    final clientParameters =
        function.parameters.where((p) => p.includeInClient);
    final bodyParameters = Set.of(clientParameters);
    final headerParameters = <String, ast.CloudFunctionParameter>{};
    final queryParameters = <String, ast.CloudFunctionParameter>{};
    for (final parameter in clientParameters) {
      switch (parameter.references) {
        case ast.NodeReference(type: ast.NodeType.httpHeader, :final name):
          bodyParameters.remove(parameter);
          headerParameters[name] = parameter;
        case ast.NodeReference(type: ast.NodeType.httpQuery, :final name):
          bodyParameters.remove(parameter);
          queryParameters[name] = parameter;
        default:
          break;
      }
    }

    OpenApiComponentOrRef<OpenApiRequestBody>? requestBody;
    if (function.hasHttpBody) {
      final requestBodyTypeName =
          '${resolved.projectId}.v1.${operationId.pascalCase}Request';
      final requestBodyRef = '#/components/schemas/$requestBodyTypeName';
      final requestBodyType = OpenApiSchema(
        ref: requestBodyRef,
        type: const ItemValue(JsonType.object),
        nullable: bodyParameters.isEmpty,
        properties: {
          for (final parameter in bodyParameters)
            parameter.name: visitParameter(
              parameter,
              '$requestBodyRef/${parameter.name}',
            ),
        },
        additionalProperties: OpenApiAdditionalProperties(allow: false),
      );
      _builder.components.schemas.updateValue(
        requestBodyTypeName,
        (_) => throw StateError('Duplicate schema: $requestBodyTypeName'),
        ifAbsent: () => requestBodyType,
      );
      requestBody = OpenApiComponentOrRef.component(
        ref: '$ref/requestBody',
        component: OpenApiRequestBody(
          required: true,
          content: {
            _applicationJson: OpenApiMediaType(
              schema: OpenApiComponentOrRef.reference(
                reference: OpenApiSchemaReference(
                  ref: requestBodyRef,
                  name: requestBodyTypeName,
                ),
              ),
            ),
          },
        ),
      );
    }

    final parameters = <OpenApiComponentOrRef<OpenApiParameter>>[];
    var parameterIndex = 0;
    for (final queryParameter in queryParameters.entries) {
      final parameterRef =
          '$ref/${operationType.name}/parameters/${parameterIndex++}';
      final parameter = OpenApiComponentOrRef.component(
        ref: parameterRef,
        component: OpenApiParameter(
          name: queryParameter.key,
          location: OpenApiParameterLocation.query,
          required: queryParameter.value.required,
          deprecated: queryParameter.value.annotations.any((annotation) {
            return annotation.staticType ==
                DartTypes.core.deprecated.toTypeReference;
          }),
          schema: _schemaRef(
            queryParameter.value.type.toTypeReference,
            parameterRef,
          ),
        ),
      );
      parameters.add(parameter);
    }
    for (final headerParameter in headerParameters.entries) {
      final parameterRef =
          '$ref/${operationType.name}/parameters/${parameterIndex++}';
      final parameter = OpenApiComponentOrRef.component(
        ref: parameterRef,
        component: OpenApiParameter(
          name: headerParameter.key,
          location: OpenApiParameterLocation.header,
          required: headerParameter.value.required,
          deprecated: headerParameter.value.annotations.any((annotation) {
            return annotation.staticType ==
                DartTypes.core.deprecated.toTypeReference;
          }),
          schema: _schemaRef(
            headerParameter.value.type.toTypeReference,
            parameterRef,
          ),
        ),
      );
      parameters.add(parameter);
    }

    final responseRef = '$ref/${operationType.name}/responses/default';
    final responseType = _schemaRef(
      function.flattenedReturnType.toTypeReference,
      responseRef,
    );

    final successStatusCode = StatusCode(resolvedFunction.httpConfig.status);
    final successResponse = OpenApiComponentOrRef.component(
      ref: responseRef,
      component: OpenApiResponse(
        statusCode: successStatusCode,
        description: 'Successful response',
        content: {
          _applicationJson: OpenApiMediaType(
            schema: responseType,
          ),
        },
      ),
    );

    final exceptionalResponses =
        <StatusCodeOrRange, OpenApiComponentOrRef<OpenApiResponse>>{};
    final statusMappings = resolvedFunction.httpConfig.statusMappings.toMap();
    final errorsByStatusCode = <int, List<TypeReference>>{};
    for (final MapEntry(key: exceptionType, value: statusCode)
        in statusMappings.entries) {
      errorsByStatusCode.putIfAbsent(statusCode, () => []).add(exceptionType);
    }
    for (final MapEntry(key: statusCode, value: exceptionTypes)
        in errorsByStatusCode.entries) {
      final responseTypeName =
          '${resolved.projectId}.v1.${operationId.pascalCase}Error_$statusCode';
      final responseRef = '$ref/${operationType.name}/responses/$statusCode';
      final responseType = switch (exceptionTypes) {
        [final singleType] => _exceptionType(singleType, responseRef),
        final types => OpenApiSchema(
            ref: responseRef,
            type: const ItemValue(JsonType.object),
            nullable: false,
            oneOf: [
              for (final type in types)
                OpenApiComponentOrRef.component(
                  component: _exceptionType(type, responseRef),
                ),
            ],
            discriminator: OpenApiDiscriminator(
              ref: responseRef,
              propertyName: 'code',
              mapping: {
                for (final type in types.map(
                  (it) => it.externalUri(resolved.projectId)!,
                ))
                  type: '#/components/schemas/$type',
              },
            ),
          ),
      };
      _builder.components.schemas.updateValue(
        responseTypeName,
        (_) => throw StateError('Duplicate schema: $responseTypeName'),
        ifAbsent: () => responseType,
      );
      exceptionalResponses[StatusCode(statusCode)] =
          OpenApiComponentOrRef.component(
        ref: responseRef,
        component: OpenApiResponse(
          statusCode: StatusCode(statusCode),
          description: 'Error response',
          content: {
            _applicationJson: OpenApiMediaType(
              schema: OpenApiComponentOrRef.reference(
                reference: OpenApiSchemaReference(
                  ref: responseRef,
                  name: responseTypeName,
                ),
              ),
            ),
          },
        ),
      );
    }

    final docs = [
      for (final doc in function.docs)
        doc.replaceAll(RegExp(r'^\s*///?\s*'), ''),
    ];
    final pathItem = OpenApiPathItem(
      ref: ref,
      summary: docs.firstOrNull,
      description: docs.isEmpty ? null : function.docs.join('\n'),
      operations: {
        resolvedFunction.operationType: OpenApiOperation(
          operationId: operationId,
          type: resolvedFunction.operationType,
          summary: docs.firstOrNull,
          description: docs.isEmpty ? null : function.docs.join('\n'),
          deprecated: function.annotations.any((annotation) {
            return annotation.staticType ==
                DartTypes.core.deprecated.toTypeReference;
          }),
          parameters: parameters,
          requestBody: requestBody,
          defaultResponse: OpenApiComponentOrRef.component(
            ref: responseRef,
            component: OpenApiResponse(
              statusCode: null,
              description: 'Default response. This should never be returned.',
              content: {
                _applicationJson: OpenApiMediaType(
                  schema: OpenApiComponentOrRef.component(
                    component:
                        DartTypeToOpenApi.primitiveTypes[DartTypes.core.never]!,
                  ),
                ),
              },
            ),
          ),
          responses: {
            successStatusCode: successResponse,
            ...exceptionalResponses,
          },
        ),
      },
    );
    _builder.paths[function.route] = OpenApiComponentOrRef.component(
      ref: ref,
      component: pathItem,
    );
  }

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitParameter(
    ast.CloudFunctionParameter parameter,
    String ref,
  ) {
    return _schemaRef(
      parameter.type.toTypeReference,
      ref,
      defaultValue: parameter.defaultTo?.toJson(),
    );
  }

  @override
  void visitApiAuthenticated(
    ast.ApiAuthenticated annotation,
    covariant String context,
  ) {}

  @override
  void visitApiHttpMetadata(
    ast.ApiHttpMetadata metadata,
    covariant String context,
  ) {}

  @override
  void visitApiMiddleware(
    ast.ApiMiddleware annotation,
    covariant String context,
  ) {}

  @override
  void visitApiPublic(ast.ApiPublic annotation, covariant String context) {}

  @override
  void visitAuth(ast.Auth auth, covariant String context) {}

  @override
  void visitAuthProvider(ast.AuthProvider provider, covariant String context) {}

  @override
  void visitExternalAuthProvider(
    ast.ExternalAuthProvider provider,
    covariant String context,
  ) {}

  @override
  void visitVariable(
    ast.Variable variable,
    covariant String context,
  ) {}

  @override
  void visitSecret(ast.Secret secret, covariant String context) {}

  @override
  void visitDatabase(ast.Database database, covariant String context) {
    // TODO: implement visitDatabase
  }

  @override
  void visitDatabaseSchema(
      ast.DatabaseSchema schema, covariant String context) {
    // TODO: implement visitSchema
  }
}

extension on ast.ResolvedCloudFunction {
  OpenApiOperationType get operationType {
    return switch (httpConfig.method) {
      'GET' => OpenApiOperationType.get,
      'POST' => OpenApiOperationType.post,
      'PUT' => OpenApiOperationType.put,
      'DELETE' => OpenApiOperationType.delete,
      'PATCH' => OpenApiOperationType.patch,
      'HEAD' => OpenApiOperationType.head,
      'OPTIONS' => OpenApiOperationType.options,
      'TRACE' => OpenApiOperationType.trace,
      final unknown => unreachable('Unknown HTTP method: $unknown'),
    };
  }
}
