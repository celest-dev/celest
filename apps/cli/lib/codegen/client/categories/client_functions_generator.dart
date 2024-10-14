import 'dart:collection';

import 'package:analyzer/dart/element/element.dart' as dart_ast;
import 'package:analyzer/dart/element/type.dart' as dart_ast;
import 'package:analyzer/dart/element/type.dart' hide RecordType;
import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/codegen/client/client_generator.dart';
import 'package:celest_cli/codegen/client/client_types.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/serialization/from_string_generator.dart';
import 'package:celest_cli/serialization/serializer_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:code_builder/code_builder.dart';

final class ClientFunctionsGenerator {
  ClientFunctionsGenerator({
    required this.resolvedProject,
    required this.project,
    required this.apis,
  }) {
    apis.sort((a, b) => a.name.compareTo(b.name));
    _library = LibraryBuilder()
      ..name = ''
      ..comments.addAll(kClientHeader)
      ..body.add(lazySpec(_client.build));
  }

  final ast.ResolvedProject resolvedProject;
  final ast.Project project;
  final List<ast.Api> apis;

  final customSerializers = LinkedHashSet<SerializerDefinition>(
    equals: (a, b) => a.type == b.type,
    hashCode: (a) => a.type.hashCode,
  );
  final anonymousRecordTypes = <String, RecordType>{};

  late final LibraryBuilder _library;
  final _client = ClassBuilder()..name = ClientTypes.functionsClass.name;

  final _classBuilders = <String, ClassBuilder>{};
  ClassBuilder _beginClass(String name) {
    final cached = _classBuilders[name];
    if (cached != null) {
      return cached;
    }
    final builder = ClassBuilder()..name = name;
    _library.body.add(lazySpec(builder.build));
    return builder;
  }

  void _sendHttp({
    required BlockBuilder b,
    required ast.CloudFunction function,
    required ast.ResolvedCloudFunction resolvedFunction,
    required Expression uri,
    required Map<Expression, Expression> headers,
    required Expression? payload,
  }) {
    final httpClient = ClientTypes.topLevelClient.ref.property('httpClient');
    final functionCall = httpClient
        .property(resolvedFunction.httpConfig.route.method.toLowerCase())
        .call([
      uri,
    ], {
      'headers': (headers.isEmpty ? literalConstMap : literalMap)({
        'Content-Type': literalString('application/json'),
        'Accept': literalString('application/json'),
        ...headers,
      }),
      if (payload != null)
        'body': DartTypes.celest.jsonUtf8.property('encode').call([payload]),
    }).awaited;

    b.addExpression(
      declareFinal(r'$response').assign(functionCall),
    );
    b.addExpression(
      declareFinal(r'$body').assign(
        DartTypes.celest.jsonUtf8.property('decode').call([
          refer(r'$response').property('bodyBytes'),
        ]),
      ),
    );

    final returnedBody =
        typeHelper.fromReference(function.flattenedReturnType) is VoidType
            ? const Code('return;')
            : jsonGenerator
                .fromJson(
                  function.flattenedReturnType,
                  refer(r'$body'),
                  inNullableContext: true,
                )
                .returned
                .statement;

    final handleError = refer('_throwError').call([], {
      'code': refer(r'$response').property('statusCode'),
      'body': refer(r'$body').asA(typeHelper.toReference(jsonMapType)),
    });

    b.statements
      ..add(
        handleError.wrapWithBlockIf(
          refer(r'$response')
              .property('statusCode')
              .notEqualTo(literalNum(200)),
        ),
      )
      ..add(returnedBody);
  }

  void _streamEvents({
    required BlockBuilder b,
    required ast.CloudFunction function,
    required Expression uri,
    required Expression? payload,
  }) {
    final eventClient = ClientTypes.topLevelClient.ref.property('eventClient');
    b.addExpression(
      declareFinal(r'$channel').assign(
        eventClient.property('connect').call([uri]),
      ),
    );
    final channel = refer(r'$channel');
    if (payload != null) {
      b.addExpression(
        channel.property('sink').property('add').call([payload]),
      );
    }

    final returnedBody =
        typeHelper.fromReference(function.flattenedReturnType) is VoidType
            ? const Code('return;')
            : jsonGenerator
                .fromJson(
                  function.flattenedReturnType,
                  refer(r'$event'),
                  inNullableContext: true,
                )
                .returned
                .statement;
    b.addExpression(
      channel.property('stream').property('map').call([
        Method(
          (m) => m
            ..requiredParameters.add(
              Parameter((p) => p.name = r'$event'),
            )
            ..body = Block.of([
              const Code(r'''
if ($event is Map<String, Object?> && $event.containsKey('@error')) {
  _throwError(body: $event);
}'''),
              returnedBody,
            ]),
        ).closure,
      ]).returned,
    );
  }

  void _generateApi(ast.Api api, ast.ResolvedApi resolvedApi) {
    final apiType = ClientTypes.api(api);
    final apiClass = _beginClass(apiType.name)
      ..docs.addAll(api.docs)
      ..methods.add(_throwError(api));

    _client.fields.add(
      Field(
        (f) => f
          ..docs.addAll(api.docs)
          ..modifier = FieldModifier.final$
          ..name = api.name.camelCase
          ..assignment = apiType.ref.newInstance([]).code,
      ),
    );

    final functions = api.functions.values.toList()..sort();
    for (final function in functions) {
      final resolvedFunction = resolvedApi.functions[function.name]!;
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
      final functionCall = Method(
        (m) => m
          ..name = function.name.camelCase
          ..returns = switch (function.streamType) {
            null => DartTypes.core.future(
                function.flattenedReturnType.noBound,
              ),
            _ => DartTypes.core.stream(
                function.flattenedReturnType.noBound,
              ),
          }
          ..types.addAll(function.typeParameters)
          ..modifier = switch (function.streamType) {
            null => MethodModifier.async,
            _ => null,
          }
          ..docs.addAll(function.docs)
          ..annotations.addAll(
            function.annotationExpressions
                .map((annotation) => annotation.stripConst),
          )
          ..annotations.add(
            DartTypes.celest.cloudFunction.newInstance([], {
              'api': literalString(api.name),
              'function': literalString(function.name),
            }),
          )
          ..requiredParameters.addAll(
            clientParameters.where((p) => p.required && !p.named).map(
                  (param) => Parameter(
                    (p) => p
                      ..name = param.name
                      ..type = param.type.noBound
                      ..defaultTo = param.defaultToExpression?.code
                      ..annotations.addAll(
                        param.annotationExpressions
                            .map((annotation) => annotation.stripConst),
                      ),
                  ),
                ),
          )
          ..optionalParameters.addAll(
            clientParameters.where((p) => !p.required || p.named).map(
                  (param) => Parameter(
                    (p) => p
                      ..name = param.name
                      ..type = param.type.noBound
                      ..named = param.named
                      ..required = param.required
                      ..defaultTo = param.defaultToExpression?.code
                      ..annotations.addAll(
                        param.annotationExpressions
                            .map((annotation) => annotation.stripConst),
                      ),
                  ),
                ),
          )
          ..body = Block((b) {
            final typeMaps = <Reference, String>{};
            for (final typeParameter in function.typeParameters) {
              final typeParameterType = typeHelper.fromReference(typeParameter)
                  as dart_ast.TypeParameterType;
              final typeParameterBound =
                  typeParameterType.bound.element as dart_ast.InterfaceElement;
              final typeMap = <Expression, Expression>{};
              final bound = typeHelper.toReference(typeParameterType.bound);
              typeMap[bound] = literalString(bound.symbol!, raw: true);
              for (final subtype in typeHelper.subtypes[typeParameterBound]!) {
                final subtypeReference = typeHelper.toReference(subtype);
                typeMap[subtypeReference] =
                    literalString(subtypeReference.symbol!, raw: true);
              }
              final typeMapName = '\$${typeParameter.symbol!}';
              b.addExpression(
                declareConst(typeMapName).assign(literalConstMap(typeMap)),
              );
              typeMaps[typeParameter] = typeMapName;
            }

            final headers = headerParameters.map((name, parameter) {
              return MapEntry(
                CodeExpression(
                  Block.of([
                    if (parameter.type.isNullableOrFalse)
                      Code('if ($name != null) '),
                    literalString(name, raw: true).code,
                  ]),
                ),
                generateToString(
                  parameter.type,
                  refer(parameter.name),
                ),
              );
            });
            final query = literalMap(
              queryParameters.map((name, parameter) {
                return MapEntry(
                  CodeExpression(
                    Block.of([
                      if (parameter.type.isNullableOrFalse)
                        Code('if ($name != null) '),
                      literalString(name, raw: true).code,
                    ]),
                  ),
                  generateToString(
                    parameter.type,
                    refer(parameter.name),
                  ),
                );
              }),
            );

            final baseUri = ClientTypes.topLevelClient.ref.property('baseUri');
            var uri = baseUri.property('resolve').call([
              literalString(function.route),
            ]);
            if (queryParameters.isNotEmpty) {
              uri = uri.property('replace').call([], {
                'queryParameters': query,
              });
            }

            Expression? payload;
            if (bodyParameters.isNotEmpty ||
                function.typeParameters.isNotEmpty) {
              payload = literalMap({
                for (final typeParameter in function.typeParameters)
                  literalString(typeMaps[typeParameter]!, raw: true):
                      refer(typeMaps[typeParameter]!)
                          .index(refer(typeParameter.symbol!))
                          .nullChecked,
                for (final parameter in bodyParameters)
                  literalString(parameter.name, raw: true):
                      jsonGenerator.toJson(
                    parameter.type,
                    refer(parameter.name),
                  ),
              });
            }
            switch (function.streamType) {
              case null:
                _sendHttp(
                  b: b,
                  function: function,
                  resolvedFunction: resolvedFunction,
                  uri: uri,
                  headers: headers,
                  payload: payload,
                );
              default:
                assert(
                  headers.isEmpty,
                  'Headers are not supported for streams. Should be caught in '
                  'resolver.',
                );
                _streamEvents(
                  b: b,
                  function: function,
                  uri: uri,
                  payload: payload,
                );
            }
          }),
      );
      apiClass.methods.add(functionCall);
      final allTypes = Set.of(
        [
          function.flattenedReturnType,
          ...clientParameters.map((p) => p.type),
          ...api.exceptionTypes,
        ].where((type) => !type.isFunctionContext),
      );
      for (final type in allTypes) {
        final dartType = typeHelper.fromReference(type);
        customSerializers.addAll(typeHelper.customSerializers(dartType));
        if ((dartType, type)
            case (
              final dart_ast.RecordType dartType,
              final RecordType recordType
            )) {
          anonymousRecordTypes[dartType.symbol] =
              // Typedefs should always point to the non-nullable
              // version since the type is only used to invoke the
              // serializer and the serializer handles null values.
              recordType.rebuild((r) => r.isNullable = false);
        }
      }
    }
  }

  Method _throwError(ast.Api api) => Method((m) {
        m
          ..name = '_throwError'
          ..returns = DartTypes.core.never
          ..optionalParameters.addAll([
            Parameter(
              (p) => p
                ..name = 'code'
                ..named = true
                ..type = DartTypes.core.int.nullable,
            ),
            Parameter(
              (p) => p
                ..name = 'body'
                ..named = true
                ..required = true
                ..type = typeHelper.toReference(jsonMapType),
            ),
          ])
          ..body = Block((b) {
            b.statements.add(
              Code.scope(
                (alloc) => '''
final status = body['@status'] as Map<String, Object?>?;
final message = status?['message'] as String?;
final details = status?['details'] as ${alloc(DartTypes.celest.jsonList)}?;
final (errorType, errorValue, stackTrace) = switch (details) {
  null || [] => const (null, null, StackTrace.empty),
  [
    final errorDetails as Map<String, Object?>,
    {
      '@type': 'dart.core.StackTrace',
      'value': final stackTraceValue as String
    },
    ...
  ] =>
    (
      errorDetails['@type'],
      errorDetails['value'],
      StackTrace.fromString(stackTraceValue),
    ),
  [final errorDetails as Map<String, Object?>, ...] => (
      errorDetails['@type'],
      errorDetails['value'],
      StackTrace.empty,
    ),
};
''',
              ),
            );
            b.statements.add(const Code('switch (errorType) {'));
            for (final exceptionType in api.exceptionTypes) {
              final dartExceptionType = typeHelper.fromReference(exceptionType);
              final deserializedException = jsonGenerator.fromJson(
                exceptionType,
                refer('errorValue'),
                inNullableContext: true,
              );
              final exceptionUri = dartExceptionType.externalUri(project.name)!;
              b.statements.addAll([
                const Code('case '),
                literalString(exceptionUri, raw: exceptionUri.contains(r'$'))
                    .code,
                const Code(': '),
                DartTypes.core.error.property('throwWithStackTrace').call([
                  deserializedException,
                  refer('stackTrace'),
                ]).statement,
              ]);
            }
            b.statements.addAll([
              const Code('default: '),
              DartTypes.core.error.property('throwWithStackTrace').call([
                DartTypes.celest.cloudException.newInstanceNamed(
                  'http',
                  [],
                  {
                    'code': refer('code'),
                    'message': refer('message'),
                    'details': refer('details')
                        .ifNullThen(refer('body'))
                        .parenthesized
                        .asA(DartTypes.celest.jsonValue),
                  },
                ),
                DartTypes.core.stackTrace.property('empty'),
              ]).statement,
              const Code('}'),
            ]);
          });
      });

  Library generate() {
    for (final api in apis) {
      _generateApi(api, resolvedProject.apis[api.name]!);
    }
    return _library.build();
  }
}
