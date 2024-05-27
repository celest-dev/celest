import 'dart:collection';

import 'package:analyzer/dart/element/element.dart' as dart_ast;
import 'package:analyzer/dart/element/type.dart' as dart_ast;
import 'package:analyzer/dart/element/type.dart' hide RecordType;
import 'package:api_celest/ast.dart' as ast;
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/codegen/client/client_generator.dart';
import 'package:celest_cli/codegen/client/client_types.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/serialization/serializer_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

final class ClientFunctionsGenerator {
  ClientFunctionsGenerator({
    required this.apis,
  }) {
    apis.sort((a, b) => a.name.compareTo(b.name));
    _library = LibraryBuilder()
      ..name = ''
      ..comments.addAll(kClientHeader)
      ..body.add(lazySpec(_client.build));
  }

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

  void _generateApi(ast.Api api) {
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
      final clientParameters =
          function.parameters.where((p) => p.includeInClient);
      final functionCall = Method(
        (m) => m
          ..name = function.name.camelCase
          ..returns = DartTypes.core.future(
            function.flattenedReturnType.noBound,
          )
          ..types.addAll(function.typeParameters)
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
                      ..type = param.type.noBound
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
                      ..type = param.type.noBound
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
            final httpClient =
                ClientTypes.topLevelClient.ref.property('httpClient');
            final baseUri = ClientTypes.topLevelClient.ref.property('baseUri');
            final functionCall = httpClient.property('post').call([
              baseUri.property('resolve').call([
                literalString(function.route),
              ]),
            ], {
              'headers': literalConstMap({
                'Content-Type': literalString(
                  'application/json; charset=utf-8',
                ),
              }),
              // Don't include a body for functions with no parameters to save
              // on a `jsonEncode` call.
              if (clientParameters.isNotEmpty ||
                  function.typeParameters.isNotEmpty)
                'body': DartTypes.convert.jsonEncode.call([
                  literalMap({
                    for (final typeParameter in function.typeParameters)
                      literalString(typeMaps[typeParameter]!, raw: true):
                          refer(typeMaps[typeParameter]!)
                              .index(refer(typeParameter.symbol!))
                              .nullChecked,
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

            final handleError = refer('_throwError').call([], {
              r'$statusCode': refer(r'$response').property('statusCode'),
              r'$body': refer(r'$body'),
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
                ..name = r'$statusCode'
                ..named = true
                ..required = true
                ..type = DartTypes.core.int,
            ),
            Parameter(
              (p) => p
                ..name = r'$body'
                ..named = true
                ..required = true
                ..type = typeHelper.toReference(jsonMapType),
            ),
          ])
          ..body = Block((b) {
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
            for (final exceptionType in api.exceptionTypes) {
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
              const Code(r'case _: switch ($statusCode) {'),
              const Code('case 400: '),
              DartTypes.celest.badRequestException
                  .newInstance([
                    refer(r'$code'),
                  ])
                  .thrown
                  .statement,
              const Code('case _: '),
              DartTypes.celest.internalServerError
                  .newInstance([
                    refer(r'$code'),
                  ])
                  .thrown
                  .statement,
              const Code('}'),
              const Code('}'),
            ]);
          });
      });

  Library generate() {
    for (final api in apis) {
      _generateApi(api);
    }
    return _library.build();
  }
}
