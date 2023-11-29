import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/analyzer/ast.dart';
import 'package:celest_cli/analyzer/serialization.dart';
import 'package:celest_cli/analyzer/validator.dart';
import 'package:celest_cli/analyzer/visitor.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as p;

final class CodeGenerator extends AstVisitor<void> {
  CodeGenerator(
    this._projectRoot, {
    String? outputDir,
  }) : _outputDir = outputDir ?? p.join(_projectRoot, '.dart_tool', 'celest');

  static final _formatter = DartFormatter();

  final String _projectRoot;
  final String _outputDir;

  /// A map of generated files to their contents.
  final Map<String, String> outputs = {};

  @override
  void visitProject(ProjectAst project) {
    project.apis.forEach(visitApi);
  }

  @override
  void visitApi(ApiAst api) {
    final outputDir = p.join(_outputDir, 'apis', api.name);
    for (final function in api.functions) {
      final entrypointFile = p.join(outputDir, '${function.name}.dart');
      final library = LibraryBuilder();
      final body = BlockBuilder();
      var pipeline =
          refer('Pipeline', 'package:shelf/shelf.dart').newInstance([]);
      for (final metadata in [
        ...api.metadata,
        ...function.metadata,
      ]) {
        if (metadata is ApiMiddleware) {
          pipeline = pipeline.property('addMiddleware').call([
            refer(metadata.type.name, metadata.type.libraryUri.toString())
                .constInstance([]).property('handle'),
          ]);
        }
      }
      pipeline = pipeline.property('addHandler').call([
        refer('_inner').property('handler'),
      ]);
      body
        ..addExpression(
          declareFinal('handler').assign(pipeline),
        )
        ..addExpression(
          refer('handler').call([refer('request')]).returned,
        );
      final innerTarget = Field(
        (f) => f
          ..name = '_inner'
          ..modifier = FieldModifier.final$
          ..assignment = refer(
            'JsonWithContextFunctionTarget',
            'package:functions_framework/serve.dart',
          ).newInstance([
            Method(
              (m) => m
                ..requiredParameters.addAll([
                  Parameter(
                    (p) => p..name = 'request',
                  ),
                  Parameter(
                    (p) => p..name = 'context',
                  ),
                ])
                ..modifier = MethodModifier.async
                // TODO: request -> variable mapping
                ..body = Block((b) {
                  final functionImport = p.relative(
                    p.join(_projectRoot, function.location.path),
                    from: outputDir,
                  );
                  final functionReference = refer(
                    function.name,
                    functionImport,
                  );
                  final functionContext =
                      refer('FunctionContext', 'package:celest/celest.dart');
                  if (function.parameters
                      .any((param) => param.type.isFunctionContext)) {
                    b.addExpression(
                      declareFinal('celestContext').assign(
                        functionContext.newInstance([], {
                          'logger': refer('context').property('logger'),
                        }),
                      ),
                    );
                  }
                  final positionalParams = <Expression>[];
                  final namedParams = <String, Expression>{};
                  for (final param in function.parameters) {
                    Expression paramExp;
                    if (param.type.isFunctionContext) {
                      paramExp = refer('celestContext');
                    } else {
                      final fromMap = refer('request').index(
                        literalString(param.name, raw: true),
                      );
                      final deserialized = param.type.dartType!.accept(
                        FromJsonSerializer(fromMap),
                      );
                      paramExp = param.required
                          ? deserialized
                          : fromMap.equalTo(literalNull).conditional(
                                literalNull,
                                deserialized,
                              );
                    }
                    if (param.named) {
                      namedParams[param.name] = paramExp;
                    } else {
                      positionalParams.add(paramExp);
                    }
                  }
                  var response = functionReference.newInstance(
                    positionalParams,
                    namedParams,
                  );
                  final returnType = function.returnType.dartType!;
                  switch (returnType.flattened) {
                    case VoidType():
                      b.addExpression(response.returned);
                    default:
                      if (returnType.isDartAsyncFuture ||
                          returnType.isDartAsyncFutureOr) {
                        response = response.awaited;
                      }
                      b.addExpression(
                        declareFinal('response').assign(response),
                      );
                      final toJson = returnType.accept(
                        ToJsonSerializer(refer('response')),
                      );
                      Expression result;
                      if (returnType.flattened.nullabilitySuffix !=
                              NullabilitySuffix.none ||
                          returnType.nullabilitySuffix !=
                                  NullabilitySuffix.none &&
                              returnType.isDartAsyncFutureOr) {
                        result = refer('response')
                            .equalTo(literalNull)
                            .conditional(literalNull, toJson);
                      } else {
                        result = toJson;
                      }
                      b.addExpression(result.returned);
                  }
                }),
            ).closure,
            Method(
              (m) => m
                ..requiredParameters.add(
                  Parameter(
                    (p) => p..name = 'json',
                  ),
                )
                ..body = const Code('json as Map<String, dynamic>')
                ..lambda = true,
            ).closure,
          ]).code,
      );
      final target = Class(
        (c) => c
          ..name = '${function.name.pascalCase}Target'
          ..extend = refer(
            'FunctionTarget',
            'package:functions_framework/serve.dart',
          )
          ..fields.add(innerTarget)
          ..methods.add(
            Method(
              (m) => m
                ..annotations.add(refer('override'))
                ..name = 'handler'
                ..returns = TypeReference(
                  (t) => t
                    ..symbol = 'FutureOr'
                    ..url = 'dart:async'
                    ..types.add(
                      refer('Response', 'package:shelf/shelf.dart'),
                    ),
                )
                ..requiredParameters.add(
                  Parameter(
                    (p) => p
                      ..name = 'request'
                      ..type = refer('Request', 'package:shelf/shelf.dart'),
                  ),
                )
                ..body = body.build(),
            ),
          ),
      );
      final serveRef = refer(
        'serve',
        'package:functions_framework/serve.dart',
      );
      final entrypoint = Method(
        (m) => m
          ..name = 'main'
          ..returns = refer('Future<void>')
          ..modifier = MethodModifier.async
          ..requiredParameters.add(
            Parameter(
              (p) => p
                ..name = 'args'
                ..type = refer('List<String>'),
            ),
          )
          ..body = Code.scope(
            (alloc) => '''
  await ${alloc(serveRef)}(
    args,
    (_) => ${target.name}(),
  );
''',
          ),
      );
      library.body.addAll([target, entrypoint]);
      final emitter = DartEmitter.scoped(
        orderDirectives: true,
      );
      final contents = library.build().accept(emitter).toString();
      outputs[entrypointFile] = _formatter.format(contents);
    }
  }

  @override
  void visitApiAuthenticated(ApiAuthenticated annotation) {}

  @override
  void visitApiMiddleware(ApiMiddleware annotation) {}

  @override
  void visitFunction(FunctionAst function) {}

  @override
  void visitParameter(ParameterAst parameter) {}
}
