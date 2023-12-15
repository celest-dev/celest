import 'dart:collection';

import 'package:analyzer/dart/element/type.dart' as ast show RecordType;
import 'package:analyzer/dart/element/type.dart' hide RecordType;
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/serialization/json_generator.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

final class EntrypointGenerator {
  EntrypointGenerator({
    required this.api,
    required this.function,
    required this.projectRoot,
    required this.outputDir,
    required this.typeHelper,
  });

  final Api api;
  final CloudFunction function;
  final String projectRoot;
  final String outputDir;
  final TypeHelper typeHelper;

  late final JsonGenerator jsonGenerator = JsonGenerator(
    typeHelper: typeHelper,
  );
  final _customSerializers = <Uri, Class>{};
  final _anonymousRecordTypes = <String, RecordType>{};

  Library generate() {
    final library = LibraryBuilder();
    final body = BlockBuilder();
    var pipeline = DartTypes.shelf.pipeline.newInstance([]);

    // TODO(dnys1): To Set (when removed element)
    // Actually, throw for duplicate values?
    final middleware = [
      ...api.metadata,
      ...function.metadata,
    ]
        // Middleware are applied in reverse order
        .reversed
        .whereType<ApiMiddleware>()
        .toList();
    for (final middleware in middleware) {
      pipeline = pipeline.property('addMiddleware').call([
        middleware.type.constInstance([]).property('handle'),
      ]);
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
        ..assignment = DartTypes
            .functionsFramework.jsonWithContextFunctionTarget
            .newInstance([
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
                final functionReference = refer(
                  function.name,
                  function.location.uri.toString(),
                );
                if (function.parameters
                    .any((param) => param.type.isFunctionContext)) {
                  b.addExpression(
                    declareFinal('celestContext').assign(
                      DartTypes.celest.functionContext.newInstance([]),
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
                    final deserialized =
                        jsonGenerator.fromJson(param.type, fromMap);
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
                final flattenedReturnTyep = function.flattenedReturnType;
                switch (flattenedReturnTyep.symbol) {
                  case 'void':
                    b.addExpression(response.returned);
                  default:
                    final dartReturnType = typeHelper.fromReference(returnType);
                    if (dartReturnType.isDartAsyncFuture ||
                        dartReturnType.isDartAsyncFutureOr) {
                      response = response.awaited;
                    }
                    b.addExpression(
                      declareFinal('response').assign(response),
                    );
                    final result = jsonGenerator.toJson(
                      flattenedReturnTyep,
                      refer('response'),
                    );
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
              // All requests are JSON maps
              ..body = const Code('json as Map<String, dynamic>')
              ..lambda = true,
          ).closure,
        ]).code,
    );
    final target = Class(
      (c) => c
        ..name = '${function.name.pascalCase}Target'
        ..extend = DartTypes.functionsFramework.functionTarget
        ..fields.add(innerTarget)
        ..methods.add(
          Method(
            (m) => m
              ..annotations.add(DartTypes.core.override)
              ..name = 'handler'
              ..returns = DartTypes.async.futureOr(
                DartTypes.shelf.response,
              )
              ..requiredParameters.add(
                Parameter(
                  (p) => p
                    ..name = 'request'
                    ..type = DartTypes.shelf.request,
                ),
              )
              ..body = body.build(),
          ),
        ),
    );

    final queue = Queue.of(
      [
        function.flattenedReturnType,
        ...function.parameters.map((p) => p.type),
      ].where((type) => !type.isFunctionContext).map(typeHelper.fromReference),
    );

    final seen = <DartType>{};
    void addCustomType(DartType type) {
      if (!seen.add(type)) {
        return;
      }
      final customSerializer = typeHelper.customSerializer(type);
      if (customSerializer
          case (
            final uri,
            final serializer,
            final referencedTypes,
          )) {
        _customSerializers[uri] = serializer;
        queue.addAll(referencedTypes);
      }
      if ((type, typeHelper.toReference(type))
          case (final ast.RecordType dartType, final RecordType recordType)) {
        _anonymousRecordTypes[dartType.symbol] = recordType;
      }
    }

    while (queue.isNotEmpty) {
      addCustomType(queue.removeFirst());
    }
    final entrypoint = Method(
      (m) => m
        ..name = 'main'
        ..returns = DartTypes.async.future(DartTypes.core.void$)
        ..modifier = MethodModifier.async
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'args'
              ..type = DartTypes.core.list(DartTypes.core.string),
          ),
        )
        ..body = Block((b) {
          for (final serializer in _customSerializers.values) {
            b.addExpression(
              DartTypes.celest.serializers
                  .property('instance')
                  .property('put')
                  .call([
                refer(serializer.name).constInstance([]),
              ]),
            );
          }

          b.statements.add(
            Code.scope(
              (alloc) => '''
  await ${alloc(DartTypes.functionsFramework.serve)}(
    args,
    (_) => ${target.name}(),
  );
''',
            ),
          );
        }),
    );
    library.body.addAll([
      target,
      entrypoint,
      ..._anonymousRecordTypes.entries.map(
        (recordType) => TypeDef(
          (t) => t
            ..name = recordType.key
            ..definition = recordType.value,
        ),
      ),
      ..._customSerializers.values,
    ]);
    return library.build();
  }
}
