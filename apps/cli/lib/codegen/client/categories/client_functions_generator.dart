import 'dart:collection';

import 'package:analyzer/dart/element/type.dart' as dart_ast;
import 'package:analyzer/dart/element/type.dart' hide RecordType;
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/codegen/client/client_generator.dart';
import 'package:celest_cli/codegen/client/client_types.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

final class ClientFunctionsGenerator {
  ClientFunctionsGenerator({
    required this.apis,
    required this.apiOutputs,
  }) {
    apis.sort((a, b) => a.name.compareTo(b.name));
    _library = LibraryBuilder()
      ..name = ''
      ..comments.addAll(kClientHeader)
      ..body.add(lazySpec(_client.build));
  }

  final List<ast.Api> apis;
  final Map<String, ast.DeployedApi> apiOutputs;

  final customSerializers = LinkedHashSet<Class>(
    equals: (a, b) => a.name == b.name,
    hashCode: (a) => a.name.hashCode,
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

  void _generateApi(ast.Api api) {
    final apiType = ClientTypes.api(api);
    final apiClass = _beginClass(apiType.name)..docs.addAll(api.docs);

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
      final clientParameters =
          function.parameters.where((p) => p.includeInClient);
      final functionCall = Method(
        (m) => m
          ..name = function.name.camelCase
          ..returns = DartTypes.core.future(
            function.flattenedReturnType,
          )
          ..modifier = MethodModifier.async
          ..docs.addAll(function.docs)
          ..annotations.addAll(
            function.annotations.map((annotation) => annotation.stripConst),
          )
          ..requiredParameters.addAll(
            clientParameters.where((p) => p.required && !p.named).map(
                  (param) => Parameter(
                    (p) => p
                      ..name = param.name
                      ..type = param.type
                      ..defaultTo = param.defaultTo?.code
                      ..annotations.addAll(
                        param.annotations
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
                      ..type = param.type
                      ..named = param.named
                      ..required = param.required
                      ..defaultTo = param.defaultTo?.code
                      ..annotations.addAll(
                        param.annotations
                            .map((annotation) => annotation.stripConst),
                      ),
                  ),
                ),
          )
          ..body = Block((b) {
            final output = apiOutputs[api.name]!.functions[function.name]!;
            final httpClient =
                ClientTypes.topLevelClient.ref.property('httpClient');
            final baseUri = ClientTypes.topLevelClient.ref.property('baseUri');
            final functionCall = httpClient.property('post').call([
              baseUri.property('resolve').call([
                literalString(output.uri.path),
              ]),
            ], {
              'headers': literalConstMap({
                'Content-Type': literalString(
                  'application/json; charset=utf-8',
                ),
              }),
              // Don't include a body for functions with no parameters to save
              // on a `jsonEncode` call.
              if (clientParameters.isNotEmpty)
                'body': DartTypes.convert.jsonEncode.call([
                  literalMap({
                    for (final parameter in clientParameters)
                      literalString(parameter.name, raw: true):
                          jsonGenerator.toJson(
                        parameter.type,
                        refer(parameter.name),
                      ),
                  }),
                ]),
            }).awaited;

            b.addExpression(
              declareFinal(r'$response').assign(functionCall),
            );
            b.addExpression(
              declareFinal(r'$body').assign(
                DartTypes.convert.jsonDecode.call([
                  refer(r'$response').property('body'),
                ]).asA(typeHelper.toReference(jsonMapType)),
              ),
            );

            final returnedBody = typeHelper
                    .fromReference(function.flattenedReturnType) is VoidType
                ? const Code('return;')
                : jsonGenerator
                    .fromJson(
                      function.flattenedReturnType,
                      refer(r'$body').index(literalString('response')),
                    )
                    .returned
                    .statement;

            b.statements.add(
              returnedBody.wrapWithBlockIf(
                refer(r'$response')
                    .property('statusCode')
                    .equalTo(literalNum(200)),
              ),
            );

            // Else, handle the error.
            b
              ..addExpression(
                declareFinal(r'$error').assign(
                  refer(r'$body').index(literalString('error')).asA(
                        typeHelper.toReference(jsonMapType),
                      ),
                ),
              )
              ..addExpression(
                declareFinal(r'$code').assign(
                  refer(r'$error')
                      .index(literalString('code'))
                      .asA(DartTypes.core.string),
                ),
              )
              ..addExpression(
                declareFinal(r'$details').assign(
                  refer(r'$error')
                      .index(literalString('details'))
                      .asA(typeHelper.toReference(jsonMapType).nullable),
                ),
              );
            b.statements.add(const Code(r'switch ($code) {'));
            final exceptionTypes = {
              ...function.exceptionTypes,
              typeHelper.toReference(typeHelper.badRequestExceptionType),
              typeHelper.toReference(typeHelper.internalServerExceptionType),
            };
            for (final exceptionType in exceptionTypes) {
              final deserializedException = jsonGenerator.fromJson(
                exceptionType,
                refer(r'$details'),
              );
              b.statements.addAll([
                Code("case r'${exceptionType.symbol}': "),
                deserializedException.thrown.statement,
              ]);
            }
            b.statements.addAll([
              const Code(r'case _: switch ($response.statusCode) {'),
              const Code('case 400: '),
              DartTypes.celest.badRequestException
                  .newInstance([
                    refer(r'$code'),
                  ])
                  .thrown
                  .statement,
              const Code('case _: '),
              DartTypes.celest.internalServerException
                  .newInstance([
                    refer(r'$code'),
                  ])
                  .thrown
                  .statement,
              const Code('}'),
              const Code('}'),
            ]);
          }),
      );
      apiClass.methods.add(functionCall);
      final allTypes = Set.of(
        [
          function.flattenedReturnType,
          ...clientParameters.map((p) => p.type),
          ...function.exceptionTypes,
        ].where((type) => !type.isFunctionContext),
      );
      for (final type in allTypes) {
        final dartType = typeHelper.fromReference(type);
        customSerializers.addAll(
          typeHelper.customSerializers(dartType),
        );
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

  Library generate() {
    for (final api in apis) {
      _generateApi(api);
    }
    return _library.build();
  }
}
