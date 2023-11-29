import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/analyzer/dart_type.dart';
import 'package:celest_cli/analyzer/serialization.dart';
import 'package:celest_cli/analyzer/visitor.dart';
import 'package:celest_cli/ast/ast.dart' as ast show Parameter;
import 'package:celest_cli/ast/ast.dart' hide Parameter;
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as p;

final class CodeGenerator extends AstVisitor<void> {
  CodeGenerator(
    String projectRoot, {
    String? outputDir,
  }) : _outputDir = outputDir ?? p.join(projectRoot, '.dart_tool', 'celest');

  static final _formatter = DartFormatter();

  final String _outputDir;

  /// A map of generated files to their contents.
  final Map<String, String> outputs = {};

  @override
  void visitProject(Project project) {
    project.apis.forEach(visitApi);
  }

  @override
  void visitApi(Api api) {
    final outputDir = p.join(_outputDir, 'apis', api.name);
    for (final function in api.functions) {
      final entrypointFile = p.join(outputDir, '${function.name}.dart');
      final library = LibraryBuilder();
      final body = BlockBuilder();
      var pipeline =
          refer('Pipeline', 'package:shelf/shelf.dart').newInstance([]);

      // TODO(dnys1): To Set (when removed element)
      // Actually, throw for duplicate values?
      for (final metadata in [
        ...api.metadata,
        ...function.metadata,
      ]) {
        if (metadata is ApiMetadataMiddleware) {
          pipeline = pipeline.property('addMiddleware').call([
            metadata.type.constInstance([]).property('handle'),
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
                ..body = Block((b) {
                  final functionImport = p.relative(
                    p.fromUri(function.location.uri),
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
                        functionContext.newInstance([]),
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
                      final deserialized = param.type.fromJson(fromMap);
                      paramExp = deserialized;
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
                  final returnType = function.returnType;
                  switch (returnType.flattened.symbol) {
                    case 'void':
                      b.addExpression(response.returned);
                    default:
                      if (returnType.isDartAsyncFuture ||
                          returnType.isDartAsyncFutureOr) {
                        response = response.awaited;
                      }
                      b.addExpression(
                        declareFinal('response').assign(response),
                      );
                      final toJson = returnType.toJson(refer('response'));
                      Expression result;
                      if (returnType.flattened.nullable ||
                          returnType.nullable &&
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
  void visitApiAuthenticated(ApiMetadataAuthenticated annotation) {}

  @override
  void visitApiMiddleware(ApiMetadataMiddleware annotation) {}

  @override
  void visitFunction(CloudFunction function) {}

  @override
  void visitParameter(ast.Parameter parameter) {}
}
