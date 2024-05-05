import 'package:celest_cli/codegen/doc_comments.dart';
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
  late final LibraryBuilder _library = LibraryBuilder();
  late final ClassBuilder _client = ClassBuilder()
    ..name = clientClassName
    ..modifier = ClassModifier.final$;

  Library get library => _library.build();

  Library generate() {
    _generateClientClass();
    return library;
  }

  void _generateClientClass() {
    final (baseUriParam, serverInfoDefault) = _generateServerInfo();

    _client.constructors.add(
      Constructor(
        (c) => c
          ..optionalParameters.addAll([
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
                  refer('httpClient').ifNullThen(
                    DartTypes.http.client.newInstance([]),
                  ),
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
      _library.body.add(vars.spec);
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

    _library.body.add(serverInfo.build());
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

    if (path.methods.isNotEmpty) {
      // Generate content type decoders.
      _addDecodeJsonMethod(class_);
    }

    for (final subpath in path.subpaths.values) {
      _generatePath(subpath);
      class_.methods.add(
        Method((m) {
          m.returns = refer(subpath.className!);
          if (subpath.pathParameters.isEmpty) {
            m.type = MethodType.getter;
          } else {
            for (final parameter in subpath.pathParameters.values) {
              m.optionalParameters.add(
                Parameter(
                  (p) => p
                    ..named = true
                    ..type = parameter.type.typeReference
                    ..required = !parameter.type.isNullable
                    ..name = parameter.variableName,
                ),
              );
            }
          }
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

    _library.body.add(class_.build());
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
          if (defaultValue == null) {
            final addParam = queryMap
                .index(literalString(queryParameter.rawName))
                .assign(queryParameter.assignmentExpression(false));
            body.statements.add(
              addParam.wrapWithBlockIf(
                refer(queryParameter.variableName).notEqualTo(literalNull),
                queryParameter.type.isNullable,
              ),
            );
          } else {
            final addParam =
                queryMap.index(literalString(queryParameter.rawName)).assign(
                      queryParameter
                          .assignmentExpression(true)
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

    // Build the request.
    final request = refer(r'$request');
    {
      final requestImpl = DartTypes.http.request.newInstance([
        literalString(operation.methodType.name.toUpperCase()),
        uri,
      ]);
      body.addExpression(
        declareFinal(r'$request').assign(requestImpl),
      );
      body.addExpression(
        request
            .property('headers')
            .index(literalString('accept'))
            .assign(literalString('application/json')),
      );
      for (final header in operation.headers) {
        final defaultValue = header.type.defaultValue;
        if (defaultValue == null) {
          final addHeader = request
              .property('headers')
              .index(literalString(header.rawName))
              .assign(header.assignmentExpression(false));
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
                header
                    .assignmentExpression(true)
                    .ifNullThen(literal(defaultValue)),
              );
          body.addExpression(addHeader);
        }
      }
    }

    if (operation.bodyType case final bodyType?) {
      m.optionalParameters.add(
        Parameter(
          (p) => p
            ..type = bodyType.typeReference
            ..required = !bodyType.typeReference.isNullableOrFalse
            ..named = true
            ..name = 'body',
        ),
      );
      body.statements.add(
        request
            .property('body')
            .assign(DartTypes.convert.jsonEncode.call([refer('body')]))
            .wrapWithBlockIf(
              refer('body').notEqualTo(literalNull),
              bodyType.isNullable,
            ),
      );
    }

    // Send the HTTP request.
    final response = refer(r'$response');
    {
      final responseCode =
          refer('_httpClient').property('send').call([request]);
      body.addExpression(
        declareFinal(r'$response').assign(responseCode.awaited),
      );
    }

    // Extract the content type.
    {
      final contentType =
          response.property('headers').index(literalString('content-type'));
      body.addExpression(
        declareFinal(r'$contentType').assign(contentType),
      );
    }

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

  void _addDecodeJsonMethod(ClassBuilder class_) {
    final decodeJson = Method((m) {
      m
        ..returns = DartTypes.core.future(refer('T'))
        ..name = '_decodeJson'
        ..types.add(refer('T'))
        ..modifier = MethodModifier.async
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..type = DartTypes.http.streamedResponse
              ..name = r'$response',
          ),
        );

      final decodeJsonBody = BlockBuilder();
      final jsonBody = refer(r'$body');
      {
        final decodeJson = refer(r'$response')
            .property('stream')
            .property('bytesToString')
            .call([]).awaited;
        decodeJsonBody.addExpression(
          declareFinal(r'$body').assign(decodeJson),
        );
      }
      final jsonResponse = refer(r'$json');
      {
        decodeJsonBody.addExpression(
          declareFinal(r'$json').assign(
            DartTypes.convert.jsonDecode.call([jsonBody]),
          ),
        );
      }
      final decoded = DartTypes.celest.serializers
          .property('instance')
          .property('deserialize')
          .call(
        [jsonResponse],
        {},
        [refer('T')],
      );
      decodeJsonBody.addExpression(decoded.returned);

      m.body = decodeJsonBody.build();
    });
    class_.methods.add(decodeJson);
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

      caseBuilder.addExpression(
        refer('_decodeJson').call(
          [refer(r'$response')],
          {},
          [responseType.typeReference],
        ).returned,
      );
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

extension on HeaderOrQueryParameter {
  Expression assignmentExpression(bool isNullable) => switch (type) {
        OpenApiSingleValueType(:final value) => switch (value) {
            final String value => literalString(value, raw: true),
            final List<Object?> values => literalList(values.cast<String>()),
            _ => literal(value).nullableProperty('toList', isNullable).call([]),
          },
        OpenApiDateType(:final primitiveType) => switch (primitiveType) {
            OpenApiIntegerType() => refer(variableName)
                .nullableProperty('millisecondsSinceEpoch', isNullable)
                .property('toString')
                .call([]),
            OpenApiStringType() => refer(variableName),
            _ => unreachable('Unexpected date type: $primitiveType'),
          },
        OpenApiStringType() || OpenApiListType() => refer(variableName),
        _ =>
          refer(variableName).nullableProperty('toString', isNullable).call([]),
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
