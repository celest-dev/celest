import 'package:built_collection/built_collection.dart';
import 'package:celest_cli/codegen/doc_comments.dart';
import 'package:celest_cli/openapi/generator/openapi_json_generator.dart';
import 'package:celest_cli/openapi/model/dart_name.dart';
import 'package:celest_cli/openapi/model/openapi_service.dart';
import 'package:celest_cli/openapi/model/openapi_v3.dart';
import 'package:celest_cli/openapi/openapi_generator.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:code_builder/code_builder.dart';
import 'package:logging/logging.dart';

extension type const OpenApiContentType(String _) implements String {
  static const any = OpenApiContentType('*/*');
  static const json = OpenApiContentType('application/json');
  static const xml = OpenApiContentType('application/xml');
}

final class OpenApiClientGenerator {
  OpenApiClientGenerator({
    required this.context,
    required this.service,
  });

  final OpenApiGeneratorContext context;

  static final supportedContentTypes = [
    OpenApiContentType.any,
    OpenApiContentType.json,
  ];

  static final Logger logger = Logger('OpenApiClientGenerator');

  static Expression interpolatedUri(String path) =>
      CodeExpression(Code("'\$_baseUri$path'"));

  final OpenApiService service;

  late final String clientClassName = service.clientClassName;
  late final Reference clientClassType = refer(clientClassName);
  late final ClassBuilder _client = ClassBuilder()
    ..name = clientClassName
    ..modifier = ClassModifier.final$
    ..fields.addAll([
      if (context.document.info.apiVersion case final apiVersion?)
        Field(
          (f) => f
            ..static = true
            ..modifier = FieldModifier.constant
            ..name = 'version'
            ..type = DartTypes.core.string
            ..assignment = literalString(apiVersion).code,
        ),
    ]);

  final _libraries = MapBuilder<String, LibraryBuilder>();

  LibraryBuilder _library(String path) => _libraries.putIfAbsent(
        path,
        LibraryBuilder.new,
        // Need extension methods in scope
        // TODO: adding this dups if already imported
        // ..directives.add(Directive.import('package:codable/codable.dart')),
      );

  Map<String, Library> generate() {
    _generateClientClass();
    return _libraries
        .build()
        .map((path, lib) => MapEntry(path, lib.build()))
        .toMap();
  }

  void _generateClientClass() {
    final (baseUriParam, serverInfoDefault) = _generateServerInfo();

    _client.constructors.add(
      Constructor(
        (c) => c
          ..optionalParameters.addAll([
            Parameter(
              (p) => p
                ..type = DartTypes.core.string
                ..name = 'apiKey'
                ..named = true
                ..required = true,
            ),
            Parameter(
              (p) => p
                ..required = false
                ..named = true
                ..type = DartTypes.http.client.nullable
                ..name = 'httpClient',
            ),
            baseUriParam,
          ])
          ..initializers.addAll([
            refer('_httpClient')
                .assign(
                  refer('StripeHttpClient', 'src/http/stripe_http_client.dart')
                      .newInstance([], {
                    'apiKey': refer('apiKey'),
                    'baseClient': refer('httpClient'),
                    if (context.document.info.apiVersion != null)
                      'version': refer('version'),
                  }),
                )
                .code,
            refer('_baseUri')
                .assign(
                  serverInfoDefault == null
                      ? refer(baseUriParam.name)
                      : refer(baseUriParam.name).ifNullThen(serverInfoDefault),
                )
                .code,
          ]),
      ),
    );

    _generatePath(service.rootPath);
  }

  (Parameter, Expression? defaultValue) _generateServerInfo() {
    final defaultServer = service.info.hosts[service.info.defaultHost]!;
    final servers = service.info.hosts;
    if (servers.isEmpty) {
      final parameter = Parameter(
        (p) => p
          ..required = true
          ..named = true
          ..type = DartTypes.core.uri
          ..name = 'baseUri',
      );
      return (parameter, null);
    }
    if (servers.values.toList() case [Uri(isAbsolute: true) && final single]) {
      final parameter = Parameter(
        (p) => p
          ..required = false
          ..named = true
          ..type = DartTypes.core.uri.nullable
          ..name = 'baseUri',
      );
      return (
        parameter,
        DartTypes.core.uri
            .property('parse')
            .call([literalString(single.toString())])
      );
    }
    final serverInfoClassName = service.info.extensionTypeName;
    final serverInfoType = refer(serverInfoClassName);
    final serverInfo = ExtensionTypeBuilder()
      ..name = serverInfoClassName
      ..representationDeclaration = RepresentationDeclaration(
        (r) => r
          ..name = '_'
          ..declaredRepresentationType = DartTypes.core.uri,
      )
      ..implements.add(DartTypes.core.uri);
    for (final host in servers.values) {
      if (!host.hasVariables) {
        serverInfo.fields.add(
          Field(
            (b) => b
              ..static = true
              ..modifier = FieldModifier.final$
              ..type = serverInfoType
              ..name = host.name
              ..docs.addAll([
                if (host.description case final description?)
                  formatDocs(description),
              ])
              ..assignment = serverInfoType.newInstance([
                DartTypes.core.uri.newInstanceNamed(
                  'parse',
                  [literalString(host.mappedUrl, raw: true)],
                ),
              ]).code,
          ),
        );
        continue;
      }
      final vars = _ServerInfoVariableGenerator(
        className: host.variables!.className,
        variables: host.variables!.variables.entries
            .map((el) => (el.key, el.value))
            .toList(),
      );
      _library('client.dart').body.add(vars.spec);
      serverInfo.methods.add(
        Method((m) {
          m
            ..static = true
            ..returns = serverInfoType
            ..name = host.name
            ..requiredParameters.add(
              Parameter(
                (p) => p
                  ..name = 'vars'
                  ..type = vars.type,
              ),
            )
            ..body = serverInfoType.newInstance([
              DartTypes.core.uri.newInstanceNamed(
                'parse',
                [literalString(host.mappedUrl)],
              ),
            ]).code;
        }),
      );
    }
    serverInfo.fields.insert(
      0,
      Field(
        (b) => b
          ..static = true
          ..modifier = FieldModifier.final$
          ..type = serverInfoType
          ..name = 'defaultServer'
          ..assignment = defaultServer.hasVariables
              ? refer(defaultServer.name).call([]).code
              : refer(defaultServer.name).code,
      ),
    );

    _library('client.dart').body.add(serverInfo.build());
    final parameter = Parameter(
      (p) => p
        ..required = false
        ..named = true
        ..name = 'baseUri'
        ..type = DartTypes.core.uri.nullable,
    );
    return (parameter, serverInfoType.property('defaultServer'));
  }

  void _generatePath(ServicePath path) {
    final isRootPath = path.className == null;
    final class_ =
        isRootPath ? _client : (ClassBuilder()..name = path.className);
    final ctor = class_.constructors.isEmpty
        ? ConstructorBuilder()
        : class_.constructors.first.toBuilder();

    class_.fields.addAll([
      Field(
        (b) => b
          ..modifier = FieldModifier.final$
          ..type = DartTypes.http.client
          ..name = '_httpClient',
      ),
      Field(
        (b) => b
          ..modifier = FieldModifier.final$
          ..type = DartTypes.core.uri
          ..name = '_baseUri'
          ..docs.add(formatDocs('The base URI for the API')),
      ),
    ]);

    if (!isRootPath) {
      ctor
        ..optionalParameters.addAll([
          Parameter(
            (p) => p
              ..required = true
              ..named = true
              ..type = DartTypes.http.client
              ..name = 'httpClient',
          ),
          Parameter(
            (p) => p
              ..required = true
              ..named = true
              ..type = DartTypes.core.uri
              ..name = 'baseUri',
          ),
        ])
        ..initializers.addAll([
          refer('_httpClient').assign(refer('httpClient')).code,
          refer('_baseUri').assign(refer('baseUri')).code,
        ]);
    }

    for (final parameter in path.pathParameters.values) {
      class_.fields.add(
        Field(
          (b) => b
            ..modifier = FieldModifier.final$
            ..type = parameter.type.typeReference
            ..name = parameter.variableName,
          // ..docs.addAll([
          //   if (parameter.description case final description?)
          //     formatDocs(description),
          // ]),
        ),
      );
      ctor.optionalParameters.add(
        Parameter(
          (p) => p
            ..named = true
            ..toThis = true
            ..required = !parameter.type.isNullable
            ..name = parameter.variableName,
        ),
      );
    }
    class_.constructors
      ..clear()
      ..add(ctor.build());

    for (final method in path.methods.values) {
      class_.methods.add(
        _generateMethod(
          path.className ?? clientClassName,
          method,
        ),
      );
    }

    for (final subpath in path.subpaths.values) {
      _generatePath(subpath);
      class_.methods.add(
        Method((m) {
          m.returns = refer(subpath.className!);
          // if (subpath.pathParameters.isEmpty) {
          m.type = MethodType.getter;
          // } else {
          //   for (final parameter in subpath.pathParameters.values) {
          //     m.optionalParameters.add(
          //       Parameter(
          //         (p) => p
          //           ..named = true
          //           ..type = parameter.type.typeReference
          //           ..required = !parameter.type.isNullable
          //           ..name = parameter.variableName,
          //       ),
          //     );
          //   }
          // }
          m.name = subpath.variableName;
          m.lambda = true;
          m.body = refer(subpath.className!).newInstance([], {
            'baseUri': refer('_baseUri'),
            'httpClient': refer('_httpClient'),
            for (final parameter in subpath.pathParameters.values)
              parameter.variableName: refer(parameter.variableName),
          }).code;
        }),
      );
    }

    _library(path.libraryPath ?? 'client.dart').body.insert(0, class_.build());
  }

  /// Genereates a method for the given operation (path/verb combination).
  ///
  /// https://spec.openapis.org/oas/v3.1.0#operation-object
  Method _generateMethod(
    String className,
    ServiceMethod operation,
  ) {
    final m = MethodBuilder()
      ..name = operation.methodName
      ..annotations.addAll([
        if (operation.deprecated) refer('deprecated'),
      ])
      ..modifier = MethodModifier.async
      ..docs.addAll([
        if (docsFromParts(operation.summary, operation.description)
            case final docs?)
          docs,
        // if (operation.hasExternalDocs() && operation.externalDocs.hasUrl())
        //   '/// ${operation.externalDocs.hasDescription() ? operation.externalDocs.description : 'See'}: '
        //       '${operation.externalDocs.url}',
      ])
      ..optionalParameters.addAll([
        for (final parameter in operation.pathParameters)
          Parameter(
            (p) => p
              ..named = true
              ..type = parameter.type.typeReference
              ..required = !parameter.type.isNullable
              ..name = parameter.variableName,
          ),
        for (final parameter
            in operation.queryParameters.followedBy(operation.headers))
          Parameter(
            (p) => p
              ..named = true
              ..type = parameter.type.typeReference
              ..required = !parameter.type.isNullable
              ..name = parameter.variableName,
          ),
      ]);

    final body = BlockBuilder();

    // Build the URI.
    final uri = refer(r'$uri');
    {
      final resolvedUrl = interpolatedUri(operation.mappedPath);
      var resolvedUri = DartTypes.core.uri.newInstanceNamed(
        'parse',
        [resolvedUrl],
      );
      if (operation.queryParameters.isNotEmpty) {
        final queryMap = refer(r'$queryParameters');
        body.addExpression(
          declareFinal(r'$queryParameters').assign(
            literalMap({}, DartTypes.core.string, DartTypes.core.object),
          ),
        );
        for (final queryParameter in operation.queryParameters) {
          final defaultValue = queryParameter.type.defaultValue;
          final variable = refer(queryParameter.variableName);
          if (defaultValue == null) {
            final addParam =
                queryMap.index(literalString(queryParameter.rawName)).assign(
                      queryParameter.type.stringifiedValue(variable, false),
                    );
            body.statements.add(
              addParam.wrapWithBlockIf(
                refer(queryParameter.variableName).notEqualTo(literalNull),
                queryParameter.type.isNullable,
              ),
            );
          } else {
            final addParam =
                queryMap.index(literalString(queryParameter.rawName)).assign(
                      queryParameter.type
                          .stringifiedValue(variable, true)
                          .ifNullThen(literal(defaultValue)),
                    );
            body.addExpression(addParam);
          }
        }
        resolvedUri = resolvedUri.property('replace').call(
          [],
          {'queryParameters': queryMap},
        );
      }
      body.addExpression(declareFinal(r'$uri').assign(resolvedUri));
    }

    final request = refer(r'$request');

    final requestBody = operation.requestBody.values.singleOrNull;
    final requestContentType = requestBody?.contentType.mimeType;
    final requestImpl = switch (requestContentType) {
      'multipart/form-data' => DartTypes.http.multipartRequest.newInstance([
          literalString(operation.methodType.name.toUpperCase()),
          uri,
        ]),
      _ => DartTypes.http.request.newInstance([
          literalString(operation.methodType.name.toUpperCase()),
          uri,
        ]),
    };
    body.addExpression(declareFinal(r'$request').assign(requestImpl));

    if (requestBody case ServiceMethodRequest(type: final bodyType?)) {
      m.optionalParameters.add(
        Parameter(
          (p) => p
            ..type = bodyType.typeReference
            ..required = !bodyType.isNullable
            ..named = true
            ..name = 'request',
        ),
      );
      switch (requestBody.contentType.mimeType) {
        case 'application/json':
          final encoded = DartTypes.convert.jsonEncode.call([
            refer('request').property('toJson').call([]),
          ]);
          body.statements.add(
            request.property('body').assign(encoded).wrapWithBlockIf(
                  refer('request').notEqualTo(literalNull),
                  bodyType.isNullable,
                ),
          );
        case 'application/x-www-form-urlencoded':
          if (bodyType is! OpenApiStructType) {
            unreachable('Unexpected form body type: $bodyType');
          }
          final encoded = refer('request').property('encodeWith').call([
            // TODO: refer('codable', 'models.dart')
            DartTypes.codable.codable$.property('formData').property('encoder'),
          ]);
          body.statements.add(
            request.property('body').assign(encoded).wrapWithBlockIf(
                  refer('request').notEqualTo(literalNull),
                  bodyType.isNullable,
                ),
          );
        case 'multipart/form-data':
          if (bodyType is! OpenApiStructType) {
            unreachable('Unexpected multipart type: $bodyType');
          }
          final files = <OpenApiField>[];
          final fields = <OpenApiField>[];
          for (final field in bodyType.fields.values) {
            if (field.type is OpenApiBinaryType) {
              files.add(field);
            } else {
              fields.add(field);
            }
          }
          final encoded = Block((b) {
            for (final field in files) {
              final fieldRef = refer('request').property(field.dartName);
              final addFile = request.property('files').property('add').call([
                DartTypes.http.multipartFile.newInstance([
                  literalString(field.name),
                  fieldRef.property('openRead').call([]),
                  fieldRef.property('length').call([]).awaited,
                ], {
                  'filename': fieldRef.property('name'),
                  'contentType': fieldRef
                      .property('mimeType')
                      .equalTo(literalNull)
                      .conditional(
                        literalNull,
                        DartTypes.httpParser.mediaType.property('parse').call([
                          fieldRef.property('mimeType').nullChecked,
                        ]),
                      ),
                }),
              ]);
              body.statements.add(
                addFile.wrapWithBlockIf(
                  fieldRef.notEqualTo(literalNull),
                  bodyType.isNullable,
                ),
              );
            }
            if (fields.isNotEmpty) {
              final encoded = refer('request').property('encodeWith').call([
                DartTypes.codable.formFieldsEncoder.newInstance([], {
                  // TODO: refer('codable', 'models.dart')
                  'codable': DartTypes.codable.codable$,
                  'fields': request.property('fields'),
                }),
              ]);
              body.statements.add(
                encoded.wrapWithBlockIf(
                  refer('request').notEqualTo(literalNull),
                  bodyType.isNullable,
                ),
              );
            }
          });
          body.statements.add(
            encoded.wrapWithBlockIf(
              refer('request').notEqualTo(literalNull),
              bodyType.isNullable,
            ),
          );
        default:
          unreachable(
            'Unknown request content type: ${requestBody.contentType}',
          );
      }
    }

    // Build the request.
    {
      if (requestContentType != null) {
        body.addExpression(
          request
              .property('headers')
              .index(literalString('Content-Type'))
              .assign(literalString(requestContentType)),
        );
      }
      body.addExpression(
        request
            .property('headers')
            .index(literalString('Accept'))
            .assign(literalString('application/json')),
      );
      for (final header in operation.headers) {
        final defaultValue = header.type.defaultValue;
        final variable = refer(header.variableName);
        if (defaultValue == null) {
          final addHeader = request
              .property('headers')
              .index(literalString(header.rawName))
              .assign(header.type.stringifiedValue(variable, false));
          body.statements.add(
            addHeader.wrapWithBlockIf(
              refer(header.variableName).notEqualTo(literalNull),
              header.type.isNullable,
            ),
          );
        } else {
          final addHeader = request
              .property('headers')
              .index(literalString(header.rawName))
              .assign(
                header.type
                    .stringifiedValue(variable, true)
                    .ifNullThen(literal(defaultValue)),
              );
          body.addExpression(addHeader);
        }
      }
    }

    // Send the HTTP request.
    {
      final responseCode =
          refer('_httpClient').property('send').call([request]);
      body.addExpression(
        declareFinal(r'$response').assign(responseCode.awaited),
      );
      {
        final bodyBytes = refer(r'$response')
            .property('stream')
            .property('toBytes')
            .call([]).awaited;
        body.addExpression(
          declareFinal(r'$body').assign(bodyBytes),
        );
      }
    }

    // Extract the content type.
    // {
    //   final contentType =
    //       response.property('headers').index(literalString('content-type'));
    //   body.addExpression(
    //     declareFinal(r'$contentType').assign(contentType),
    //   );
    // }

    final switchStatement = <Code>[
      const Code(r'switch ($response.statusCode) {'),
      for (final MapEntry(key: statusCode, value: response)
          in operation.responseCases.entries)
        run(() {
          return _generateResponseCase(
            statusCode,
            operation,
            response,
          );
        }),
      if (operation.defaultResponse case final defaultResponse?)
        _generateResponseCase(
          null,
          operation,
          defaultResponse,
        )
      else ...const [
        Code('default:'),
        Code("throw Exception('Unexpected response');"),
      ],
      const Code('}'),
    ];

    m.returns = DartTypes.core.future(operation.responseType.typeReference);

    body.statements.addAll(switchStatement);

    m.body = body.build();
    return m.build();
  }

  Code _generateResponseCase(
    int? statusCode,
    ServiceMethod operation,
    ServiceMethodResponse response,
  ) {
    final caseBuilder = BlockBuilder();

    void decodeResponse(OpenApiType responseType) {
      // Decode headers.
      // if (response.headers.isNotEmpty) {
      // TODO(dnys1): Handle headers.
      // https://spec.openapis.org/oas/v3.1.0#header-object
      // }

      if (responseType is OpenApiEmptyType) {
        caseBuilder.addExpression(
          responseType.typeReference.constInstanceNamed('_', []).returned,
        );
        return;
      }

      if (responseType is OpenApiNullType) {
        caseBuilder.addExpression(literalNull.returned);
        return;
      }

      switch (response.type) {
        case OpenApiBinaryType():
          caseBuilder.addExpression(refer(r'$body').returned);
        default:
          final decoded = DartTypes.convert.jsonDecode.call([
            DartTypes.convert.utf8.property('decode').call([refer(r'$body')]),
          ]);
          caseBuilder.addExpression(declareFinal(r'$json').assign(decoded));
          final instance = OpenApiJsonGenerator().fromJson(
            responseType,
            refer(r'$json'),
          );
          caseBuilder.addExpression(
            response.isError ? instance.thrown : instance.returned,
          );
      }
    }

    // Attach description to the case statement, if available.
    caseBuilder.statements.add(
      Code(formatDocs(response.description)),
    );

    {
      final statusCodeDart = statusCode != null ? '$statusCode' : '_';
      if (statusCode == null && operation.responseCases.isEmpty) {
        caseBuilder.statements.addAll([
          const Code('default:'),
        ]);
        decodeResponse(response.type);
      } else {
        caseBuilder.statements.addAll([
          Code('case $statusCodeDart:'),
        ]);
        decodeResponse(response.type);
      }
      // if (contentTypes.isEmpty) {
      //   caseBuilder.statements.addAll([
      //     Code('case $statusCodeDart:'),
      //   ]);
      //   decodeResponse();
      //   break body;
      // }
      // for (final OpenApiMediaType(:contentType, :schema) in contentTypes) {
      //   print('Content type ($contentType):  $schema');
      //   caseBuilder.statements.addAll([
      //     Code('case $statusCodeDart:'),
      //   ]);
      //   aggregatedContentTypes.add(contentType);
      //   // if (!supportedContentTypes.contains(contentType.mimeType)) {
      //   //   caseBuilder.addExpression(
      //   //     DartTypes.core.unsupportedError.newInstance([
      //   //       literalString('Unsupported content type: $contentType'),
      //   //     ]).thrown,
      //   //   );
      //   //   continue;
      //   // }
      // }
    }

    return caseBuilder.build();
  }
}

typedef MappedUri = ({
  String path,
  List<HeaderOrQueryParameter> queryParameters,
  List<HeaderOrQueryParameter> headers,
});

extension on OpenApiType {
  Expression stringifiedValue(
    Expression variable,
    bool isNullable,
  ) =>
      switch (this) {
        OpenApiSingleValueType(:final value) => switch (value) {
            final String value => literalString(value, raw: true),
            final List<Object?> values => literalList(values.cast<String>()),
            _ => literal(value).nullableProperty('toList', isNullable).call([]),
          },
        OpenApiDateType(:final primitiveType) => switch (primitiveType) {
            OpenApiIntegerType() => variable
                .nullableProperty('millisecondsSinceEpoch', isNullable)
                .property('toString')
                .call([]),
            OpenApiStringType() => variable,
            _ => unreachable('Unexpected date type: $primitiveType'),
          },
        OpenApiStringType() ||
        OpenApiEnumType() ||
        OpenApiListType() =>
          variable,
        _ => variable.nullableProperty('toString', isNullable).call([]),
      };
}

typedef ServerVariable = ({
  (int, int) replacement,
  OpenApiServerVariable variable,
});

final class _ServerInfoVariableGenerator {
  _ServerInfoVariableGenerator({
    required this.className,
    required this.variables,
  });

  final DartName className;
  final List<(DartName, ServiceHostVariable)> variables;

  late final Reference type = refer(className);

  late final Class spec = Class((c) {
    c
      ..name = className
      ..modifier = ClassModifier.final$;

    final constructor = ConstructorBuilder()..constant = true;
    for (final (dartName, variable) in variables) {
      final defaultValue = Code(variable.defaultValue);
      constructor.optionalParameters.add(
        Parameter((p) {
          p
            ..name = dartName
            ..named = true
            ..toThis = true
            ..required = false
            ..defaultTo = defaultValue;
        }),
      );
      if (variable.enumValues?.values case final enumValues?) {
        final assertExp = enumValues.fold<Expression?>(
          null,
          (exp, v) {
            final next = refer(dartName).equalTo(literalString(v));
            return exp?.or(next) ?? next;
          },
        )!;
        constructor.initializers.add(
          refer('assert').call([
            assertExp,
            literalString(
              '$dartName must be one of: ${enumValues.join(', ')}',
            ),
          ]).code,
        );
      }
      c.fields.add(
        Field((f) {
          f
            ..modifier = FieldModifier.final$
            ..type = DartTypes.core.string
            ..name = dartName
            ..docs.addAll([
              if (variable.description case final description?)
                formatDocs(description),
            ]);
        }),
      );
    }
    c.constructors.add(constructor.build());
  });
}
