// ignore_for_file: unused_import

import 'dart:convert';

import 'package:aws_common/aws_common.dart';
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
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/openapi/type/openapi_type_resolution_scope.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema.dart';
import 'package:celest_cli/openapi/type/openapi_type_system.dart';
import 'package:celest_cli/openapi/type/openapi_type_visitor.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:yaml/yaml.dart';

typedef OpenApiTypeSchemaResolver
    = OpenApiTypeSchemaVisitor<OpenApiType, OpenApiTypeResolutionScope>;

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
final class OpenApiSchemaLinker implements OpenApiTypeSchemaResolver {
  OpenApiSchemaLinker({
    required this.context,
    required this.registerSpec,
  });

  final OpenApiGeneratorContext context;
  final OpenApiTypeSystem typeSystem = OpenApiTypeSystem();
  final Spec Function(String name, String url, Spec Function() build)
      registerSpec;

  OpenApiDocument get document => context.document;

  final _service = OpenApiServiceBuilder();

  final _reservedNames = <String, OpenApiTypeSchema?>{};
  final _dartNames = <String, String>{};
  final _dartRefs = <String, Reference>{};

  /// A map from path -> contextual operation name.
  final _stripeOperationNames = <(String, OpenApiOperationType), String>{};

  /// Dart names of Stripe event types.
  final _stripeEventTypes = <String>{};

  String _reserveName(String name, [OpenApiTypeSchema? reservedBy]) {
    if (_reservedNames.containsKey(name)) {
      final existing = _reservedNames[name];
      if (existing != reservedBy) {
        context.fail(
          'Could not reserve "$name". Name already reserved by another type.',
          additionalContext: {
            'existing': //
                // existing,
                LineSplitter.split(existing.toString()).take(10).join('\n'),
            'reservedBy': //
                // reservedBy,
                LineSplitter.split(reservedBy.toString()).take(10).join('\n'),
            'reservedNames': _reservedNames.keys.join(', '),
          },
        );
      }
    }
    _reservedNames[name] = reservedBy;
    // if (reservedBy?.name case final rawName?) {
    //   _dartNames[rawName] = name;
    // }
    return name;
  }

  TypeReference _wrapper(String name, OpenApiType baseType) {
    registerSpec(name, 'models.dart', () {
      return Class((c) {
        c
          ..name = name
          ..modifier = ClassModifier.final$
          ..constructors.addAll([
            Constructor(
              (ctor) {
                ctor.constant = true;
                if (identical(baseType, OpenApiEmptyType.instance)) {
                  ctor.name = '_';
                }
                if (!identical(baseType, OpenApiEmptyType.instance)) {
                  ctor.requiredParameters.add(
                    Parameter(
                      (b) => b
                        ..name = 'value'
                        ..toThis = true,
                    ),
                  );
                }
              },
            ),
            if (!identical(baseType, OpenApiEmptyType.instance))
              Constructor(
                (ctor) => ctor
                  ..factory = true
                  ..name = 'fromJson'
                  ..requiredParameters.add(
                    Parameter(
                      (p) => p
                        ..name = 'json'
                        ..type = DartTypes.core.object.nullable,
                    ),
                  )
                  ..lambda = true
                  ..body = refer(name).newInstance([
                    OpenApiJsonGenerator()
                        .fromJson(baseType.primitiveType!, refer('json')),
                  ]).code,
              ),
          ])
          ..fields.addAll([
            if (!identical(baseType, OpenApiEmptyType.instance))
              Field(
                (f) => f
                  ..modifier = FieldModifier.final$
                  ..type = baseType.typeReference
                  ..name = 'value',
              ),
          ])
          ..methods.addAll([
            if (!identical(baseType, OpenApiEmptyType.instance))
              Method(
                (m) => m
                  ..name = 'toJson'
                  ..returns = baseType.primitiveType!.typeReference.nonNullable
                  ..lambda = true
                  ..body = OpenApiJsonGenerator()
                      .toJson(baseType.primitiveType!, refer('value'))
                      .code,
              ),
          ]);
      });
    });
    return refer(name, 'models.dart').toTypeReference;
  }

  late final TypeReference emptyType = _wrapper(
    r'Empty$',
    OpenApiEmptyType.instance,
  );
  late final TypeReference _stringType = _wrapper(
    r'String$',
    OpenApiStringType(
      schema: OpenApiStringTypeSchema(),
      typeReference: DartTypes.core.string.toTypeReference,
      isNullable: false,
    ),
  );
  late final TypeReference _intType = _wrapper(
    r'Integer$',
    OpenApiIntegerType(
      schema: OpenApiIntegerTypeSchema(),
      typeReference: DartTypes.core.int.toTypeReference,
      isNullable: false,
    ),
  );
  late final TypeReference _doubleType = _wrapper(
    r'Double$',
    OpenApiDoubleType(
      schema: OpenApiNumberTypeSchema(),
      typeReference: DartTypes.core.double.toTypeReference,
      isNullable: false,
    ),
  );
  // late final TypeReference _numType = _wrapper(
  //   r'Number$',
  //   OpenApiNumberType(
  //     schema: OpenApiNumberTypeSchema(),
  //     typeReference: DartTypes.core.num.toTypeReference,
  //     isNullable: false,
  //   ),
  // );
  late final TypeReference _boolType = _wrapper(
    r'Boolean$',
    OpenApiBooleanType(
      schema: OpenApiBooleanTypeSchema(),
      typeReference: DartTypes.core.bool.toTypeReference,
      isNullable: false,
    ),
  );
  late final TypeReference _anyType = _wrapper(
    r'Any$',
    OpenApiAnyType(
      schema: OpenApiAnyTypeSchema(),
      typeReference: DartTypes.core.object.toTypeReference,
      isNullable: false,
    ),
  );

  late final TypeReference _stripeResource = run(() {
    registerSpec(
      'StripeResource',
      'models.dart',
      () => Class(
        (c) => c
          ..modifier = ClassModifier.final$
          ..name = 'StripeResource'
          ..constructors.add(
            Constructor(
              (ctor) {
                ctor
                  ..constant = true
                  ..optionalParameters.add(
                    Parameter(
                      (p) => p
                        ..name = 'id'
                        ..named = true
                        ..required = true
                        ..toThis = true,
                    ),
                  );
              },
            ),
          )
          ..fields.addAll([
            Field(
              (f) => f
                ..modifier = FieldModifier.final$
                // TODO: Should be non-null but `invoice` is nullable for some reason...
                // May cause problems with invoices
                ..type = DartTypes.core.string
                ..name = 'id',
            ),
          ])
          ..methods.add(
            Method(
              (m) => m
                ..returns = DartTypes.core.map(
                  DartTypes.core.string,
                  DartTypes.core.object.nullable,
                )
                ..name = 'toJson'
                ..lambda = true
                ..body = literalMap({'id': refer('id')}).code,
            ),
          ),
      ),
    );
    return refer(_reserveName('StripeResource'), 'models.dart').toTypeReference;
  });
  late final TypeReference _stripeEvent = run(() {
    registerSpec(
      'StripeEvent',
      'events.dart',
      () => Class(
        (c) => c
          ..sealed = true
          ..name = 'StripeEvent',
      ),
    );
    return refer(_reserveName('StripeEvent'), 'events.dart').toTypeReference;
  });

  OpenApiType _resolveRef(
    OpenApiTypeSchema schemaOrRef,
    OpenApiTypeResolutionScope? scope,
    String? suffix,
  ) {
    return switch (schemaOrRef) {
      OpenApiTypeSchema(:final name?) => schemaOrRef.accept(
          this,
          OpenApiTypeResolutionScope(
            typeName: _dartNames[name] ??
                context.fail(
                  'Name not registered: "$name"',
                  additionalContext: {
                    'dartNames': _dartNames,
                  },
                ),
            url: _dartRefs[name]!.url!,
          ),
        ),
      OpenApiTypeSchema() => schemaOrRef.accept(
          this,
          suffix?.let(scope!.subscope) ?? scope,
        ),
    };
  }

  Spec _generateSpec(
    String name,
    String? key,
    OpenApiType type, {
    required String url,
    bool? structuralEnum,
  }) {
    final schema = type.schema.withNullability(false);
    return registerSpec(
      key ?? name,
      url,
      () => switch (type) {
        OpenApiPrimitiveType(:final typeReference) => ExtensionType(
            (t) => t
              // ..name = typeReference.symbol == name ? '$name\$' : name
              ..name = name
              ..constant = true
              ..constructors.addAll([
                Constructor(
                  (c) => c
                    ..constant = true
                    ..name = 'fromJson'
                    ..requiredParameters.add(
                      Parameter(
                        (p) => p
                          ..type = DartTypes.core.object.nullable
                          ..name = 'json',
                      ),
                    )
                    ..initializers.add(
                      refer('_').assign(refer('json').asA(typeReference)).code,
                    ),
                ),
              ])
              ..representationDeclaration = RepresentationDeclaration(
                (r) => r
                  ..name = '_'
                  ..declaredRepresentationType = typeReference,
              )
              ..implements.add(typeReference)
              ..methods.add(
                Method(
                  (m) => m
                    ..name = 'toJson'
                    ..returns = typeReference
                    ..lambda = true
                    ..body = refer('_').code,
                ),
              ),
          ),
        OpenApiIterableInterface() => OpenApiArrayGenerator(
            name: _reserveName(name, schema),
            type: type,
          ).generate(),
        OpenApiEnumType() => OpenApiEnumGenerator(
            name: _reserveName(name, schema),
            structuralEnum: false, // structuralEnum!,
            type: type,
          ).generate(),
        OpenApiStructType() => OpenApiStructGenerator(
            name: _reserveName(name, schema),
            type: type,
          ).generate(),
        OpenApiSealedType() => OpenApiUnionGenerator(
            name: _reserveName(name, schema),
            context: context,
            type: type,
          ).generate(),
        OpenApiRecordType() => OpenApiRecordGenerator(
            name: _reserveName(name, schema),
            type: type,
          ).generate(),
        _ => unreachable('$type'),
      } as Spec,
    );
  }

  OpenApiService link() {
    _service
      ..typePrefix = context.apiName
      ..clientClassName = _reserveName('${context.apiName}Client')
      ..description = document.info.description;
    _linkServers(document.servers.toList());

    // Ensure generated.
    _stripeResource;
    _stripeEvent;

    // First pass to reserve names.
    for (final schema in document.components.schemas.entries) {
      var name = schema.key.pascalCase;

      // Stripe
      switch (schema.value.extensions.toMap()) {
        case {'x-stripeResource': final YamlMap _}:
          // TODO: Stripe's class_name cannot be trusted to be unique...
          // switch (stripeResource) {
          //   case {
          //       'in_package': final String packageName,
          //       'class_name': final String className
          //     }:
          //     name = '$packageName$className';
          //   case {'class_name': final String className}:
          //     name = className;
          // }
          break;
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
          _dartRefs[schema.key] = refer(name, 'events.dart');
          _stripeEventTypes.add(name);
      }

      _dartNames[schema.key] = name;
      _dartRefs[schema.key] ??= refer(name, 'models.dart');

      if (schema.value.extensions['x-stripeOperations']
          case JsonObject(value: final List<Object?> operations)) {
        for (final operation in operations) {
          final operationData = (operation as Map).cast<String, Object?>();
          final path = operationData['path'] as String;
          final methodType = OpenApiOperationType.valueOf(
            operationData['operation'] as String,
          );
          final methodName = operationData['method_name'] as String;
          _stripeOperationNames[(path, methodType)] = methodName;
        }
      }
    }

    // Second pass to resolve type.
    for (final schema in document.components.schemas.entries) {
      final name = _dartNames[schema.key]!;
      final typeSchema = schema.value;
      final url = _dartRefs[schema.key]!.url!;
      final type = typeSchema.accept(
        this,
        OpenApiTypeResolutionScope(typeName: name, url: url),
      );
      _service.models[name] = ServiceModel(
        spec: _generateSpec(
          name,
          schema.key,
          type,
          url: url,
        ),
        type: type,
      );
    }

    for (final pathItem in document.paths.entries) {
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
        b.variables.className = _reserveName('${context.apiName}_Vars');

        for (final (dartName, variable) in variables) {
          b.variables.variables[dartName] = ServiceHostVariable.build((v) {
            if (variable.enumValues case final enumValues?) {
              v.extensionTypeName =
                  _reserveName('${context.apiName}_Var_$dartName');
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
                ..className = _reserveName(
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
        final parameterType = _resolveRef(
          parameter.schema ?? parameter.content!.$2.schema,
          OpenApiTypeResolutionScope(
            typeName: variableName.pascalCase,
            isNullable: !parameter.required,
            url: 'models.dart',
          ),
          '_$variableName',
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
                _stripeOperationNames[(pathItem.path, operation.type)] ??
                    methodName
            ..methodType = operation.type
            ..deprecated = operation.deprecated
            ..summary = operation.summary
            ..description = operation.description;

          var operationPath = operation.path;
          parameters.forEach((parameterName, parameter) {
            final variableName = sanitizeVariableName(parameterName.camelCase);
            final parameterType = _resolveRef(
              parameter.schema ?? parameter.content!.$2.schema,
              OpenApiTypeResolutionScope(
                typeName: variableName.pascalCase,
                isNullable: !parameter.required,
                url: 'models.dart',
              ),
              '_$variableName',
            ).withNullability(!parameter.required);
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
            final bodyMediaType = requestBody.content.values.firstWhere(
              (el) =>
                  el.contentType.subtype == '*' ||
                  el.contentType.subtype == 'json',
              // TODO: Stripe requires more types;
              orElse: () => requestBody.content.values.first,
            );
            final bodyType = _resolveRef(
              bodyMediaType.schema,
              OpenApiTypeResolutionScope(
                typeName: '${methodName.pascalCase}Body',
                isNullable: !requestBody.required,
                url: 'models.dart',
              ),
              null,
            ).withNullability(!requestBody.required);
            // .rebuild((t) {
            //   if (requestBody.description case final description?) {
            //     t.docs ??= formatDocs(description);
            //   }
            // });
            if (bodyType is! OpenApiEmptyType) {
              method.bodyType = bodyType;
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

              final responseInterfaceName = _reserveName(
                '${methodName.pascalCase}Response',
              );
              registerSpec(
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
                  responseType.schema.name ?? responseType.typeReference.symbol,
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
              responseType.type.schema.name ??
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
          typeReference:
              needsWrapper ? emptyType : DartTypes.core.void$.toTypeReference,
        ),
      );
    }

    final responseMediaType = response.content.values.firstWhere(
      (el) => el.contentType.subtype == '*' || el.contentType.subtype == 'json',
      orElse: () => response.content.values.first,
    );
    final responseType = _resolveRef(
      responseMediaType.schema,
      OpenApiTypeResolutionScope(
        typeName: name ??
            '${methodName.pascalCase}Response_${statusCode ?? 'default'}',
        needsWrapper: needsWrapper,
        url: 'models.dart',
      ),
      null,
    );
    return ServiceMethodResponse(
      description: response.description,
      isError: isError,
      type: responseType,
    );
  }

  @override
  OpenApiType visitReference(
    OpenApiTypeSchemaReference schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final name = scope!.typeName;
    final isNullable = scope.isNullable ?? schema.isNullableOrFalse;
    return OpenApiTypeReference(
      typeReference: (_dartRefs[name] ?? refer(name))
          .toTypeReference
          .withNullability(isNullable)
          .toTypeReference,
      // TODO: Needed for typedefs
      // primitiveType: switch (_reservedNames[name]) {
      //   OpenApiTypeSchema(primitiveType: != null) && final schema =>
      //     schema.accept(this, scope),
      //   _ => null,
      // },
      schema: schema,
      isNullable: isNullable,
    );
  }

  @override
  OpenApiType visitAny(
    OpenApiAnyTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final needsWrapper = scope?.needsWrapper ?? false;
    return OpenApiAnyType(
      schema: schema,
      isNullable: isNullable,
      typeReference: needsWrapper
          ? _anyType.withNullability(isNullable).toTypeReference
          : DartTypes.core.object.withNullability(isNullable).toTypeReference,
    );
  }

  @override
  OpenApiType visitArray(
    OpenApiArrayTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final itemType = _resolveRef(
      schema.itemType,
      scope,
      'Item',
    );

    final name = scope!.typeName;
    final needsWrapper = scope.needsWrapper;
    final isNullable = scope.isNullable ?? schema.isNullableOrFalse;
    final type = schema.uniqueItems
        ? OpenApiSetType(
            schema: schema,
            typeReference: needsWrapper
                ? refer(name, scope.url).toTypeReference
                : DartTypes.core.set(itemType.typeReference).toTypeReference,
            itemType: itemType,
            isNullable: isNullable,
            defaultValue: schema.defaultValue?.value,
          )
        : OpenApiListType(
            schema: schema,
            typeReference: needsWrapper
                ? refer(name, scope.url).toTypeReference
                : DartTypes.core.list(itemType.typeReference).toTypeReference,
            itemType: itemType,
            isNullable: isNullable,
            defaultValue: schema.defaultValue?.value,
          );
    if (needsWrapper) {
      _generateSpec(name, schema.name, type, url: scope.url);
    }
    return type;
  }

  @override
  OpenApiType visitBoolean(
    OpenApiBooleanTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final needsWrapper = scope?.needsWrapper ?? false;
    return OpenApiBooleanType(
      schema: schema,
      typeReference: needsWrapper
          ? _boolType.withNullability(isNullable).toTypeReference
          : DartTypes.core.bool.toTypeReference,
      isNullable: isNullable,
      defaultValue: schema.defaultValue?.value,
    );
  }

  @override
  OpenApiType visitDisjointUnion(
    OpenApiDisjointUnionTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final baseName = scope!.typeName;
    final type = OpenApiSealedType.build((b) {
      b.schema = schema;
      b.typeReference
        ..symbol = baseName
        ..url = scope.url
        ..isNullable = isNullable;
      b.isNullable = isNullable;

      final discriminator = schema.discriminator;
      if (discriminator case OpenApiDiscriminator(:final mapping?)) {
        b.discriminator = FieldDiscriminator(
          wireName: discriminator.propertyName,
          dartName: sanitizeVariableName(discriminator.propertyName.camelCase),
          mapping: mapping.map((value, ref) {
            final schemaName = ref.split('/').last;
            final typeSchema = document.components.schemas[schemaName]!;
            if (typeSchema.extensions['x-resourceId'] case final resourceId?) {
              value = resourceId.asString;
            } else if (typeSchema is OpenApiStructTypeSchema) {
              final discriminatorField =
                  typeSchema.fields[discriminator.propertyName];
              if (discriminatorField?.schema
                  case OpenApiSingleValueTypeSchema(
                    value: final discriminatorValue
                  )) {
                value = discriminatorValue.asString;
              }
            }
            return MapEntry(
              value,
              OpenApiTypeReference(
                typeReference: _dartRefs[schemaName]!.toTypeReference,
                schema: OpenApiTypeSchemaReference(
                  name: schemaName,
                  ref: ref,
                ),
                isNullable: false,
              ),
            );
          }).toMap(),
        );
      } else {
        b.discriminator = TypeDiscriminator(mapping: {});
      }

      assert(schema.types.isNotEmpty);
      for (final type in schema.types) {
        final branchType = _resolveRef(
          type,
          scope,
          '',
        );
        b.branches.add(
          OpenApiSealedBranch(
            name: branchType.typeReference.symbol,
            type: branchType,
          ),
        );
      }
    });
    _generateSpec(baseName, schema.name, type, url: scope.url);
    return type;
  }

  @override
  OpenApiType visitEmpty(
    OpenApiEmptyTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final needsWrapper = scope?.needsWrapper ?? false;
    return OpenApiEmptyType(
      schema: schema,
      typeReference:
          needsWrapper ? emptyType : DartTypes.core.void$.toTypeReference,
    );
  }

  @override
  OpenApiType visitEnum(
    OpenApiEnumTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final name = scope!.typeName;
    final baseType = schema.baseType.accept(this);
    final isNullable = scope.isNullable ?? schema.isNullableOrFalse;
    final type = OpenApiEnumType(
      schema: schema,
      typeReference: refer(name, scope.url).toTypeReference,
      baseType: baseType as OpenApiPrimitiveType,
      values: schema.values.map((it) => it.value),
      isNullable: isNullable,
      defaultValue: schema.defaultValue?.value,
    );
    _generateSpec(
      name,
      schema.name,
      type,
      structuralEnum: scope.structuralEnums,
      url: scope.url,
    );
    return type;
  }

  @override
  OpenApiType visitInteger(
    OpenApiIntegerTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final needsWrapper = scope?.needsWrapper ?? false;
    final baseType = OpenApiIntegerType(
      schema: schema,
      typeReference: needsWrapper
          ? _intType.withNullability(isNullable).toTypeReference
          : DartTypes.core.int.withNullability(isNullable).toTypeReference,
      isNullable: isNullable,
      defaultValue: schema.defaultValue?.value,
    );
    switch (schema.format) {
      case OpenApiIntegerFormat.unixTime:
        assert(!needsWrapper); // TODO: needsWrapper
        return OpenApiDateType(
          typeReference: DartTypes.core.dateTime
              .withNullability(isNullable)
              .toTypeReference,
          schema: schema,
          primitiveType: baseType.primitiveType,
          isNullable: isNullable,
          defaultValue: schema.defaultValue?.value,
        );
      default:
        return baseType;
    }
  }

  @override
  OpenApiType visitNull(
    OpenApiNullTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    return OpenApiNullType.instance;
  }

  @override
  OpenApiType visitNumber(
    OpenApiNumberTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final needsWrapper = scope?.needsWrapper ?? false;
    return OpenApiNumberType(
      schema: schema,
      isNullable: isNullable,
      typeReference: needsWrapper
          ? _doubleType.withNullability(isNullable).toTypeReference
          : DartTypes.core.double.withNullability(isNullable).toTypeReference,
      defaultValue: schema.defaultValue?.value,
    );
  }

  @override
  OpenApiType visitRecord(
    OpenApiRecordTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final name = scope!.typeName;
    final isNullable = scope.isNullable ?? schema.isNullableOrFalse;
    final needsWrapper = scope.needsWrapper;
    final valueType = _resolveRef(
      schema.valueType,
      scope,
      '_Value',
    );
    final type = OpenApiRecordType(
      schema: schema,
      typeReference: needsWrapper
          ? refer(name, scope.url).toTypeReference
          : DartTypes.core
              .map(DartTypes.core.string, valueType.typeReference)
              .toTypeReference,
      valueType: valueType,
      isNullable: isNullable,
      defaultValue: schema.defaultValue?.value,
    );
    if (needsWrapper) {
      _generateSpec(name, schema.name, type, url: scope.url);
    }
    return type;
  }

  @override
  OpenApiType visitSingleValue(
    OpenApiSingleValueTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final baseType = schema.baseType.accept(this).withNullability(false);
    return OpenApiSingleValueType(
      schema: schema,
      baseType: baseType as OpenApiPrimitiveType,
      value: schema.value.value,
      isNullable: false, // always non-nullable
    );
  }

  @override
  OpenApiType visitString(
    OpenApiStringTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final needsWrapper = scope?.needsWrapper ?? false;
    final baseType = OpenApiStringType(
      schema: schema,
      typeReference: needsWrapper
          ? _stringType.withNullability(isNullable).toTypeReference
          : DartTypes.core.string.withNullability(isNullable).toTypeReference,
      isNullable: isNullable,
      defaultValue: schema.defaultValue?.value,
    );
    return switch (schema.format) {
      OpenApiStringFormat.date ||
      OpenApiStringFormat.dateTime ||
      OpenApiStringFormat.time =>
        OpenApiDateType(
          schema: schema,
          typeReference: DartTypes.core.dateTime
              .withNullability(isNullable)
              .toTypeReference,
          primitiveType: baseType.primitiveType,
          isNullable: isNullable,
          defaultValue: schema.defaultValue?.value,
        ),
      OpenApiStringFormat.duration => TODO(),
      OpenApiStringFormat.regex => TODO(),
      _ => baseType,
    };
  }

  @override
  OpenApiType visitStruct(
    OpenApiStructTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final name = scope!.typeName;
    final url = _stripeEventTypes.contains(name) ? 'events.dart' : scope.url;
    final type = OpenApiStructType(
      schema: schema,
      typeReference: refer(name, url).toTypeReference,
      docs: docsFromParts(schema.title, schema.description),
      implements: {
        if (schema.extensions['x-stripeResource']?.value
            case {'polymorphic_groups': final List<Object?> polymorphicGroups})
          ...polymorphicGroups.map(
            (group) => _dartRefs[group]!.toTypeReference,
          ),
        if (schema.extensions['x-stripeEvent'] != null) _stripeEvent,
      },
      fields: schema.fields.toMap().map((fieldName, field) {
        final fieldType = _resolveRef(
          field.schema,
          scope,
          '_${fieldName.camelCase}',
        );
        return MapEntry(
          fieldName,
          OpenApiField(
            name: fieldName,
            dartName: sanitizeVariableName(fieldName.camelCase),
            type: fieldType.withNullability(
              schema.extensions.containsKey('x-stripeResource') &&
                      fieldName == 'id'
                  ? false // work around `invoice` issue
                  : !schema.required.contains(fieldName) ||
                      fieldType.isNullable,
            )..rebuild(
                (t) => t.docs = docsFromParts(
                  field.schema.title,
                  field.schema.description,
                ),
              ),
          ),
        );
      }),
      isNullable: isNullable,
      defaultValue: schema.defaultValue?.value,
    );
    _generateSpec(name, schema.name, type, url: url);
    return type;
  }

  OpenApiType _visitSum(
    OpenApiSumTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    // Solves X1 | X2 | ... | Xn
    final resolved = schema.types
        .map(
          (schema) => _resolveRef(
            schema,
            scope,
            '_',
          ),
        )
        .fold<OpenApiType>(
          typeSystem.bottomType,
          (sum, type) => typeSystem.leastUpperBound(sum, type, resolver: this),
        );

    if (resolved is OpenApiAnyType) {
      // `TODO`: Resolve as disjoint union so that we don't have APIs with just
      // `Object?`.
    }

    return resolved.withNullability(isNullable);
  }

  @override
  OpenApiType visitSum(
    OpenApiSumTypeSchema schema, [
    OpenApiTypeResolutionScope? scope,
  ]) {
    final isNullable = scope?.isNullable ?? schema.isNullableOrFalse;
    final types = schema.types.toList();

    // First, flatten known `anyOf` patterns into simpler shapes.

    // 1. Some value or the empty string.
    // Convert it to a nullable type with a default value of the empty string.
    final emptySv = types.singleWhereOrNull(
      (type) => type is OpenApiSingleValueTypeSchema && type.value.value == '',
    );
    if (emptySv != null) {
      schema = schema.rebuild(
        (schema) => schema
          ..types.remove(emptySv)
          ..defaultValue = JsonObject(''),
      );
      return schema.accept(this, scope).withNullability(true);
    }

    switch (types) {
      // 2. A single type
      case [final singleType]:
        return singleType
            .rebuild(
              (t) => t
                ..description = schema.description
                ..defaultValue = schema.defaultValue,
            )
            .withNullability(isNullable)
            .accept(this, scope);

      // 3. A sealed type or ID.
      case [...final typeReferences, final OpenApiStringTypeSchema idSchema] ||
              [final OpenApiStringTypeSchema idSchema, ...final typeReferences]
          when typeReferences
                  .every((type) => type is OpenApiTypeSchemaReference) &&
              schema.extensions.containsKey('x-expansionResources'):
        switch (typeReferences.cast<OpenApiTypeSchemaReference>()) {
          case [final typeReference]:
            final typeName = _dartNames[typeReference.name]!;
            final wrapperName = '${typeName}OrId';
            final flattenedType = typeReference.accept(
              this,
              OpenApiTypeResolutionScope(
                typeName: typeName,
                sealedParent: wrapperName,
                url: 'models.dart',
              ),
            ) as OpenApiTypeReference;
            registerSpec(
              _reserveName(wrapperName),
              'models.dart',
              () => OpenApiStructOrIdGenerator(
                name: wrapperName,
                baseType: flattenedType,
              ).generate(),
            );
            final wrapperRef = refer(wrapperName, 'models.dart');
            context.implement('StripeResource', wrapperRef);
            context.implement(typeReference.name, wrapperRef);
            context.implement(typeName, wrapperRef);
            return OpenApiTypeReference(
              typeReference: refer(wrapperName).toTypeReference,
              schema: schema,
              isNullable: isNullable,
            );
          default:
            return OpenApiSumTypeSchema(
              types: [
                idSchema,
                schema.rebuild((b) => b.types.remove(idSchema)),
              ],
              isNullable: schema.isNullable,
            ).accept(this, scope);
        }

      // 4. A union over two primitive types, one being an enum.
      case [
              final OpenApiEnumTypeSchema enumSchema,
              OpenApiTypeSchema(primitiveType: != null) &&
                  final primitiveSchema,
            ] ||
            [
              OpenApiTypeSchema(primitiveType: != null) &&
                  final primitiveSchema,
              final OpenApiEnumTypeSchema enumSchema,
            ]:
        final primitiveType = primitiveSchema.accept(this);
        final wrapperName = scope!.typeName;
        registerSpec(
          _reserveName(wrapperName),
          'models.dart',
          () => OpenApiEnumOrPrimitiveGenerator(
            name: wrapperName,
            enumValues: enumSchema.values.map((it) => it.value).toList(),
            primitiveType: primitiveType as OpenApiPrimitiveType,
          ).generate(),
        );
        return OpenApiTypeReference(
          typeReference: refer(wrapperName, 'models.dart').toTypeReference,
          schema: schema,
          isNullable: isNullable,
        );

      // Same as above but a single-valued "enum".
      case [
              final OpenApiSingleValueTypeSchema singleValueSchema,
              OpenApiTypeSchema(primitiveType: != null) &&
                  final primitiveSchema,
            ] ||
            [
              OpenApiTypeSchema(primitiveType: != null) &&
                  final primitiveSchema,
              final OpenApiSingleValueTypeSchema singleValueSchema,
            ]:
        final primitiveType = primitiveSchema.accept(this);
        final wrapperName = scope!.typeName;
        registerSpec(
          _reserveName(wrapperName),
          'models.dart',
          () => OpenApiEnumOrPrimitiveGenerator(
            name: wrapperName,
            enumValues: [singleValueSchema.value.value],
            primitiveType: primitiveType as OpenApiPrimitiveType,
          ).generate(),
        );
        return OpenApiTypeReference(
          typeReference: refer(wrapperName, 'models.dart').toTypeReference,
          schema: schema,
          isNullable: isNullable,
        );
    }

    var discriminator = schema.discriminator;
    if (types.every(
      (schema) =>
          schema is OpenApiTypeSchemaReference &&
          document.components.schemas[schema.name]!.extensions
              .containsKey('x-stripeResource'),
    )) {
      discriminator = OpenApiDiscriminator(
        propertyName: 'object',
        mapping: {
          for (final type in types.cast<OpenApiTypeSchemaReference>())
            type.name: type.ref,
        },
      );
    }
    return OpenApiDisjointUnionTypeSchema(
      ref: schema.ref,
      name: schema.name,
      discriminator: discriminator,
      types: types,
      extensions: schema.extensions.toMap(),
      isNullable: isNullable,
    ).accept(this, scope);
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
