// ignore_for_file: unused_import

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:celest_cli/codegen/doc_comments.dart';
import 'package:celest_cli/codegen/reserved_words.dart';
import 'package:celest_cli/openapi/generator/openapi_array_generator.dart';
import 'package:celest_cli/openapi/generator/openapi_enum_generator.dart';
import 'package:celest_cli/openapi/generator/openapi_enum_or_primitive_generator.dart';
import 'package:celest_cli/openapi/generator/openapi_json_generator.dart';
import 'package:celest_cli/openapi/generator/openapi_record_generator.dart';
import 'package:celest_cli/openapi/generator/openapi_struct_generator.dart';
import 'package:celest_cli/openapi/generator/openapi_struct_or_id_generator.dart';
import 'package:celest_cli/openapi/generator/openapi_union_generator.dart';
import 'package:celest_cli/openapi/model/openapi_service.dart';
import 'package:celest_cli/openapi/model/openapi_v3.dart';
import 'package:celest_cli/openapi/openapi_generator.dart';
import 'package:celest_cli/openapi/stripe/stripe_generator_context.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/openapi/type/openapi_type_resolution_scope.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema_resolver.dart';
import 'package:celest_cli/openapi/type/openapi_type_system.dart';
import 'package:celest_cli/openapi/type/openapi_type_visitor.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/recase.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:http_parser/http_parser.dart';
import 'package:yaml/yaml.dart';

/// Fully resolves an [OpenApiDocument], preparing the API into a structure
/// suitable for code generation.
///
/// The goal of the linker is to extract the complexity of analyzing the document
/// during code generation, lifting that into a separate layer so that codegen
/// only needs to concern itself with the Dart output and nothing more.
///
/// The responsibilities of this class are:
/// - Instantiating type schemas to their usage site
/// - Removing OpenAPI abstractions and consolidating into concrete properties
final class OpenApiSchemaLinker {
  OpenApiSchemaLinker({
    required this.context,
  });

  final StripeOpenApiGeneratorContext context;

  final _service = OpenApiServiceBuilder();

  OpenApiService link() {
    _service
      ..typePrefix = context.apiName
      ..clientClassName = context.reserveName('${context.apiName}Client')
      ..description = context.document.info.description;
    _linkServers(context.document.servers.toList());

    // First pass to reserve names.
    for (final schema in context.document.components.schemas.entries) {
      var name = schema.key.pascalCase;

      // Stripe
      ({String className, String? inPackage})? stripeResource;
      switch (schema.value.extensions.toMap()) {
        case {
            'x-stripeResource': JsonObject(
              value: final Map<Object?, Object?> resourceJson
            )
          }:
          switch (resourceJson) {
            case {'class_name': final String className}:
              stripeResource = (
                className: className,
                inPackage: resourceJson['in_package'] as String?,
              );
          }
        case {
            'x-stripeEvent': JsonObject(value: {'type': final String eventType})
          }:
          // There are many conflicting names if we use the event type directly.
          //
          // For example, there's an `issuing_authorization_request` component
          // schema and an `issuing_authorization.request` event type.
          //
          // Since event types have dot separators, we can leverage that for
          // uniqueness.
          name = '${eventType.pascalCase}Event';
          context.dartRefs[schema.key] = refer(name, 'events.dart');
          context.stripeEventTypes[eventType] = name;
      }

      context.dartNames[schema.key] = context.reserveName(name, schema.value);
      context.dartRefs[schema.key] ??= refer(name, 'models.dart');

      if (schema.value.extensions['x-stripeOperations']
          case JsonObject(value: final List<Object?> operations)) {
        final stripeResourceId =
            schema.value.extensions['x-resourceId']?.value as String?;
        for (final operation in operations) {
          final operationData = (operation as Map).cast<String, Object?>();
          final path = operationData['path'] as String;
          final methodType = OpenApiOperationType.valueOf(
            operationData['operation'] as String,
          );
          final methodName = operationData['method_name'] as String;
          context.stripeOperationNames[(path, methodType)] = methodName;
          if (stripeResource != null) {
            context.stripeOperationResourceName[(path, methodType)] =
                stripeResource;
          }
          if (stripeResourceId != null) {
            final templates = <String>[];
            final qualifiedMethodName = path
                .split('/')
                .map((it) {
                  if (it.startsWith('{')) {
                    final template = it.substring(1, it.length - 1).camelCase;
                    templates.add(template);
                    return '';
                  }
                  return it.camelCase;
                })
                .followedBy([methodName])
                .where((it) => it.isNotEmpty)
                .join('.');
            if (templates.length <= 1) {
              context.stripeOperations.add(
                stripeResourceId,
                StripeOperation(
                  path: path,
                  type: StripeOperationType.values.byName(
                    operationData['method_type'] as String,
                  ),
                  qualifiedMethodName: qualifiedMethodName,
                  idField: templates.singleOrNull,
                ),
              );
            }
          }
        }
      }
    }

    // Second pass to resolve type.
    for (final schema in context.document.components.schemas.entries) {
      final name = context.dartNames[schema.key]!;
      final typeSchema = schema.value;
      final url = context.dartRefs[schema.key]!.url!;
      final type = typeSchema.accept(
        context.typeResolver,
        OpenApiTypeResolutionScope(
          global: true,
          nameResolver: () => [name],
          url: url,
        ),
      );
      if (schema.value.extensions['x-resourceId']?.value
          case final String resourceId) {
        context.stripeResources[resourceId] = type.typeReference;
      }
      _service.models[name] = ServiceModel(
        spec: context.schemaSpecs[name] ??
            context.generateSpec(
              name,
              schema.key,
              type,
              url: url,
            ),
        type: type,
      );
    }

    // Generate StripeEvent union
    final stripeEventSchema = OpenApiSealedType(
      typeReference: context.stripeEvent,
      schema: OpenApiDisjointUnionTypeSchema(types: []),
      branches: [
        for (final MapEntry(key: schemaName, value: dartName)
            in context.stripeEventTypes.entries)
          OpenApiSealedBranch(
            name: dartName,
            type: context.typeSchemaRefs[
                context.document.components.schemas[schemaName]!]!,
          ),
      ],
      discriminator: FieldDiscriminator(
        dartName: 'type',
        wireName: 'type',
        mapping: {
          for (final MapEntry(key: schemaName, value: _)
              in context.stripeEventTypes.entries)
            schemaName: context.typeSchemaRefs[
                context.document.components.schemas[schemaName]!]!,
        },
      ),
      isNullable: false,
    );
    final stripeEventUnion = OpenApiUnionGenerator(
      name: 'StripeEvent',
      context: context,
      type: stripeEventSchema,
    ).generate();
    context.schemaSpecs['StripeEvent'] = stripeEventUnion;
    context.schemasByUrl.add('events.dart', 'StripeEvent');

    for (final pathItem in context.document.paths.entries) {
      _linkPathItem(pathItem.key, pathItem.value);
    }

    return _service.build();
  }

  void _linkServers(List<OpenApiServer> servers) {
    if (servers.isEmpty) {
      servers = [OpenApiServer(url: '/')];
    }
    _service.info.extensionTypeName = '${context.apiName}Servers';

    final serverUris = <String, Uri>{};
    for (var serverIndex = 0; serverIndex < servers.length; serverIndex++) {
      final server = servers[serverIndex];

      // validate url is not relative
      final serverUrl = server.url;
      final uri = Uri.tryParse(serverUrl);
      if (uri == null) {
        context.fail(
          'Invalid server url: $serverUrl',
          additionalContext: server,
        );
      }
      // TODO(dnys1): Handle relative case mentioned here:
      // https://spec.openapis.org/oas/v3.1.0#fixed-fields-3
      // if (!uri.isAbsolute) {
      //   context.fail(
      //     'Server url must be absolute: $serverUrl',
      //     additionalContext: server,
      //   );
      // }
      var serverName = uri.host.camelCase;
      if (server.description case final description?) {
        final nameCandidate = description.camelCase;
        if (nameCandidate.length < serverName.length) {
          serverName = nameCandidate;
        }
      }
      if (serverName.trim().isEmpty) {
        serverName = 'server$serverIndex';
      }

      serverUris[serverName] = uri;

      final host = ServiceHost.build((b) {
        b
          ..name = serverName
          ..description = server.description
          ..mappedUrl = serverUrl;

        if (server.variables.isEmpty) {
          return;
        }

        final (mappedUrl, variables) = server.variables.extractFrom(serverUrl);
        b.mappedUrl = mappedUrl;
        b.variables.className = context.reserveName('${context.apiName}_Vars');

        for (final (dartName, variable) in variables) {
          b.variables.variables[dartName] = ServiceHostVariable.build((v) {
            if (variable.enumValues case final enumValues?) {
              v.extensionTypeName =
                  context.reserveName('${context.apiName}_Var_$dartName');
              for (final value in enumValues) {
                v.enumValues[value.camelCase] = value;
              }
            }
            v
              ..defaultValue = variable.defaultValue
              ..description = variable.description;
          });
        }
      });

      _service.info.hosts[serverName] = host;
    }

    // Pick the default server heuristically from URI complexity.
    var MapEntry(key: defaultServerName, value: defaultServer) =
        serverUris.entries.first;
    var currentScheme = defaultServer.scheme;
    var currentComplexity = defaultServer.complexity;
    void setDefaultServer(String name, String scheme, int complexity) {
      defaultServerName = name;
      currentScheme = scheme;
      currentComplexity = complexity;
    }

    for (final MapEntry(key: serverName, value: serverUri)
        in serverUris.entries.skip(1)) {
      final serverScheme = serverUri.scheme;
      final serverComplexity = serverUri.complexity;
      if (currentScheme != serverScheme) {
        if (serverScheme == 'https') {
          setDefaultServer(serverName, serverScheme, serverComplexity);
        }
        continue;
      }
      if (serverComplexity < currentComplexity) {
        setDefaultServer(serverName, serverScheme, serverComplexity);
        continue;
      }
    }

    _service.info.defaultHost = defaultServerName;
  }

  (String, bool isTemplate) _sanitizePathSegment(String pathSegment) {
    if (pathSegment.startsWith('{')) {
      return (pathSegment.substring(1, pathSegment.length - 1), true);
    }
    return (pathSegment, false);
  }

  void _updatePath(
    ServicePathBuilder path,
    List<String> route,
    void Function(String className, ServicePathBuilder b) updates,
  ) {
    final className = path.className ?? '${_service.clientClassName}';
    switch (route) {
      case []:
        updates(className, path);
      case [final rawPathSegment, ...final subroute]:
        final (pathSegment, isTemplate) = _sanitizePathSegment(rawPathSegment);
        if (isTemplate && subroute.isEmpty) {
          return updates(path.className!, path);
        }
        path.subpaths.updateValue(
          pathSegment,
          (subpath) => subpath.rebuild((subpath) {
            _updatePath(subpath, subroute, updates);
          }),
          ifAbsent: () {
            return ServicePath.build((b) {
              b
                // TODO: Need to handle lots of pathing if we do this
                // ..libraryPath = path.className == null
                //     ? 'src/apis/${pathSegment.snakeCase}.dart'
                //     : '${path.libraryPath!.replaceFirst(RegExp(r'.dart$'), '')}/${pathSegment.snakeCase}.dart'
                ..className = context.reserveName(
                  '${className}_$pathSegment'.pascalCase,
                )
                ..variableName = sanitizeVariableName(pathSegment.camelCase);
              _updatePath(b, subroute, updates);
            });
          },
        );
      default:
        unreachable();
    }
  }

  void _linkPathItem(String path, OpenApiPathItem pathItem) {
    final pathRoute = path.split('/').skipWhile((p) => p.isEmpty).toList();
    _updatePath(_service.rootPath, pathRoute, (className, path) {
      for (final parameter in pathItem.parameters) {
        if (parameter.location != OpenApiParameterLocation.path) {
          continue;
        }
        final variableName = sanitizeVariableName(parameter.name.camelCase);
        final parameterType = context.typeResolver.resolveRef(
          parameter.schema ?? parameter.content!.$2.schema,
          OpenApiTypeResolutionScope(
            nameResolver: () => [
              '${pathRoute.lastOrNull?.pascalCase ?? ''}${variableName.pascalCase}',
            ],
            isNullable: !parameter.required,
            url: 'models.dart',
          ),
        );
        path.pathParameters[variableName] = ServicePathParameter.build((b) {
          b
            ..inherited = true
            ..type = parameterType
            ..variableName = variableName;
        });
      }
      for (final operation in pathItem.operations.values) {
        final parameters = {
          for (final parameter in pathItem.parameters)
            if (parameter.location != OpenApiParameterLocation.path)
              parameter.name: parameter,
          for (final parameter in operation.parameters)
            parameter.name: parameter,
        };

        final methodName = operation.operationId?.camelCase ??
            '${operation.type.name}_${operation.path}'.camelCase;
        path.methods[methodName] = ServiceMethod.build((method) {
          method
            ..methodName =
                context.stripeOperationNames[(pathItem.path, operation.type)] ??
                    methodName
            ..methodType = operation.type
            ..deprecated = operation.deprecated
            ..summary = operation.summary
            ..description = operation.description;

          var operationPath = operation.path;
          parameters.forEach((parameterName, parameter) {
            final variableName = sanitizeVariableName(parameterName.camelCase);
            final parameterType = context.typeResolver
                .resolveRef(
                  parameter.schema ?? parameter.content!.$2.schema,
                  OpenApiTypeResolutionScope(
                    nameResolver: () => [
                      '${pathRoute.lastOrNull?.pascalCase ?? ''}${variableName.pascalCase}',
                    ],
                    isNullable: !parameter.required,
                    url: 'models.dart',
                  ),
                )
                .withNullability(!parameter.required);
            switch (parameter.location) {
              case OpenApiParameterLocation.path:
                final template = '{$parameterName}';
                if (!operationPath.contains(template)) {
                  context.fail(
                    'Path parameter not found in path: "${parameter.name}"',
                    additionalContext: path,
                  );
                }
                method.pathParameters.add(
                  ServicePathParameter(
                    inherited: false,
                    type: parameterType,
                    variableName: variableName,
                  ),
                );
                operationPath =
                    operationPath.replaceAll(template, '\$$variableName');
              case OpenApiParameterLocation.query:
                method.queryParameters.add(
                  HeaderOrQueryParameter.build(
                    (b) => b
                      ..rawName = parameterName
                      ..variableName = variableName
                      ..type = parameterType,
                  ),
                );
              case OpenApiParameterLocation.header:
                method.headers.add(
                  HeaderOrQueryParameter.build(
                    (b) => b
                      ..rawName = parameterName
                      ..variableName = variableName
                      ..type = parameterType,
                  ),
                );
              case OpenApiParameterLocation.cookie:
              // TODO: How?
            }
          });
          method.mappedPath = operationPath;

          if (operation.requestBody case final requestBody?) {
            // final bodyMediaType = requestBody.content.values.firstWhere(
            //   (el) =>
            //       el.contentType.subtype == '*' ||
            //       el.contentType.subtype == 'json',
            //   // `TODO`: Stripe requires more types;
            //   orElse: () => requestBody.content.values.first,
            // );
            final bodyMediaType = requestBody.content.values.firstOrNull;
            if (bodyMediaType != null) {
              if (requestBody.content.length > 1) {
                throw ArgumentError(
                  'Multiple request body media types: '
                  '${requestBody.content.keys.join(', ')}',
                );
              }
              final stripeOperationName = context.stripeOperationResourceName[(
                operation.path,
                operation.type
              )];
              final bodyType = context.typeResolver
                  .resolveRef(
                    bodyMediaType.schema,
                    OpenApiTypeResolutionScope(
                      nameContext: stripeOperationName?.className,
                      nameResolver: () sync* {
                        final stripeOperationType =
                            context.stripeOperationNames[(
                                  pathItem.path,
                                  operation.type
                                )] ??
                                '';

                        if (stripeOperationName
                            case (:final className, :final inPackage)) {
                          // e.g. FileCreateOptions for (className=File, operationType=create)
                          yield '${(inPackage ?? '').pascalCase}${className.pascalCase}${stripeOperationType.pascalCase}Options';
                        }
                        yield '${methodName.pascalCase}Options';
                      },
                      isNullable: !requestBody.required,
                      mimeType: bodyMediaType.contentType.mimeType,
                      url: 'models.dart',
                    ),
                  )
                  .withNullability(!requestBody.required)
                  .rebuild((t) {
                if (requestBody.description case final description?) {
                  t.docs ??= formatDocs(description);
                }
              });
              method.requestBody[bodyMediaType.contentType.mimeType] =
                  ServiceMethodRequest(
                contentType: bodyMediaType.contentType,
                type: bodyType is OpenApiEmptyType ? null : bodyType,
                encoding: bodyMediaType.encoding.toMap(),
              );
            }
          }

          final allResponses = <OpenApiResponse>[
            if (operation.defaultResponse case final defaultResponse?)
              defaultResponse,
            ...operation.responses.values,
          ];

          final [successResponses, errorResponses] = switch (allResponses) {
            [] => const [<OpenApiResponse>[], <OpenApiResponse>[]],
            [
              OpenApiResponse(statusCode: null || (>= 200 && <= 300)) &&
                  final singleResponse
            ] =>
              [
                [singleResponse],
                const <OpenApiResponse>[],
              ],
            _ => [
                allResponses.where((it) {
                  final statusCode = it.statusCode;
                  return statusCode != null &&
                      (statusCode >= 200 && statusCode <= 300);
                }).toList(),
                allResponses.where((it) {
                  final statusCode = it.statusCode;
                  return statusCode == null || statusCode >= 300;
                }).toList(),
              ],
          };

          assert(
            successResponses.length + errorResponses.length ==
                allResponses.length,
          );

          switch (successResponses) {
            case [final singleSuccess]:
              final statusCode = singleSuccess.statusCode;
              final successResponse = _linkResponse(
                methodName,
                statusCode,
                singleSuccess,
                isError: false,
                name: '${methodName.pascalCase}Response',
                needsWrapper: false,
              );
              if (statusCode == null) {
                method.defaultResponse.replace(successResponse);
              } else {
                method.responseCases[statusCode] = successResponse;
              }
              method.responseType = successResponse.type;
            default:
              final allResponseTypes = <OpenApiType>{};
              for (final response in successResponses) {
                final statusCode = response.statusCode;
                final successResponse = _linkResponse(
                  methodName,
                  statusCode,
                  response,
                  name: '${methodName.pascalCase}Response_$statusCode',
                  isError: false,
                  needsWrapper: true,
                );
                if (statusCode == null) {
                  method.defaultResponse.replace(successResponse);
                } else {
                  method.responseCases[statusCode] = successResponse;
                }
                allResponseTypes.add(successResponse.type);
              }

              final responseInterfaceName = context.reserveName(
                '${methodName.pascalCase}Response',
              );
              context.registerSpec(
                responseInterfaceName,
                'models.dart',
                () => Class(
                  (c) => c
                    ..sealed = true
                    ..name = responseInterfaceName
                    ..docs.addAll([
                      '/// Response type for [$className.$methodName].',
                      '///',
                      '/// This is a marker interface implemented by all response types:',
                      for (final responseType in allResponseTypes)
                        '/// - [${responseType.typeReference.symbol}]',
                    ]),
                ),
              );

              for (final responseType in allResponseTypes) {
                context.implement(
                  responseType.typeReference.symbol,
                  refer(responseInterfaceName, 'models.dart'),
                );
              }

              method.responseType = OpenApiSealedType(
                typeReference:
                    refer(responseInterfaceName, 'models.dart').toTypeReference,
                schema: OpenApiAnyTypeSchema(),
                branches: [
                  for (final responseType in allResponseTypes)
                    OpenApiSealedBranch(
                      name: responseType.typeReference.symbol,
                      type: responseType,
                    ),
                ],
                discriminator: TypeDiscriminator(mapping: {}), // TODO
                isNullable: allResponseTypes.any((type) => type.isNullable),
              );
          }

          for (final errorResponse in errorResponses) {
            final statusCode = errorResponse.statusCode;
            final responseType = _linkResponse(
              methodName,
              statusCode,
              errorResponse,
              isError: true,
              needsWrapper: true,
            );
            if (statusCode == null) {
              method.defaultResponse.replace(responseType);
            } else {
              method.responseCases[statusCode] = responseType;
            }
            context.implement(
              responseType.type.typeReference.symbol,
              DartTypes.core.exception,
            );
          }
        });
      }
    });
  }

  ServiceMethodResponse _linkResponse(
    String methodName,
    int? statusCode,
    OpenApiResponse response, {
    String? name,
    required bool isError,
    required bool needsWrapper,
  }) {
    if (response.content.isEmpty) {
      return ServiceMethodResponse(
        description: response.description,
        isError: isError,
        type: OpenApiEmptyType(
          schema: OpenApiEmptyTypeSchema.instance,
          typeReference: needsWrapper
              ? context.emptyType
              : DartTypes.core.void$.toTypeReference,
        ),
      );
    }

    // final responseMediaType = response.content.values.firstWhere(
    //   (el) => el.contentType.subtype == '*' || el.contentType.subtype == 'json',
    //   orElse: () => response.content.values.first,
    // );
    final responseMediaType = response.content.values.singleOrNull ??
        (throw ArgumentError(
          'Multiple response media types: ${response.content}',
        ));
    final responseType = context.typeResolver.resolveRef(
      responseMediaType.schema,
      OpenApiTypeResolutionScope(
        nameResolver: () sync* {
          final responseName = '${methodName.pascalCase}Response';
          yield responseName;
          yield '${responseName}_${statusCode ?? 'default'}';
        },
        needsWrapper: needsWrapper,
        url: 'models.dart',
      ),
    );
    return ServiceMethodResponse(
      description: response.description,
      isError: isError,
      type: responseType,
    );
  }
}

extension on BuiltMap<String, OpenApiServerVariable> {
  static final _cache =
      <String, (String mappedUrl, List<(String, OpenApiServerVariable)>)>{};

  (String mappedUrl, List<(String, OpenApiServerVariable)>) extractFrom(
    String url,
  ) {
    final originalUrl = url;
    if (_cache[originalUrl] case final cached?) {
      return cached;
    }
    final variables = <(String, OpenApiServerVariable)>[];
    for (final variable in values) {
      final variableName = variable.name;
      final variablePattern = '{$variableName}';
      final variableIndex = url.indexOf(variablePattern);
      if (variableIndex == -1) {
        throw ArgumentError('Variable not found in server url: $variableName');
      }
      final dartName = sanitizeVariableName(variableName.camelCase);
      url = url.replaceFirst(variablePattern, '\${vars.$dartName}');
      variables.add((dartName, variable));
    }
    return _cache[originalUrl] = (url, variables);
  }
}

extension on Uri {
  int get complexity => host.split('.').length;
}
