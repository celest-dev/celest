import 'package:analyzer/dart/element/type.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/codegen/client/client_generator.dart';
import 'package:celest_cli/codegen/client/client_types.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

final class FunctionsGenerator {
  FunctionsGenerator({
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
            final functionCall = httpClient.property('post').call([
              DartTypes.core.uri.property('parse').call([
                literalString(output.uri.toString()),
              ]),
            ], {
              'headers': literalConstMap({
                'Content-Type': literalString(
                  'application/json; charset=utf-8',
                ),
              }),
              // Don't include a body for functions with no parameters to save
              // on a `jsonEncode` call.
              if (function.parameters.isNotEmpty)
                'body': DartTypes.convert.jsonEncode.call([
                  literalMap({
                    for (final parameter in function.parameters)
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
            if (typeHelper.fromReference(function.flattenedReturnType)
                is VoidType) {
              b.statements.add(const Code('return;'));
              return;
            }
            final fromJson = jsonGenerator.fromJson(
              function.flattenedReturnType,
              DartTypes.convert.jsonDecode.call([
                refer(r'$response').property('body'),
              ]),
            );
            b.addExpression(fromJson.returned);
          }),
      );
      apiClass.methods.add(functionCall);
    }
  }

  Library generate() {
    for (final api in apis) {
      _generateApi(api);
    }
    return _library.build();
  }
}
