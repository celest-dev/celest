import 'dart:collection';

import 'package:analyzer/dart/element/type.dart' as ast;
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/serialization/json_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

final class EntrypointGenerator {
  EntrypointGenerator({
    required this.api,
    required this.function,
    required this.outputDir,
  });

  final Api api;
  final CloudFunction function;
  final String outputDir;

  late final String projectRoot = projectPaths.projectRoot;
  late final JsonGenerator jsonGenerator = JsonGenerator(
    typeHelper: typeHelper,
  );
  late final String targetName = '${function.name.pascalCase}Target';
  final _customSerializers = LinkedHashSet<Class>(
    equals: (a, b) => a.name == b.name,
    hashCode: (a) => a.name.hashCode,
  );
  final _anonymousRecordTypes = <String, RecordType>{};

  Library generate() {
    final library = LibraryBuilder();
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
    final body = Method(
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
            } else if (param.references case final reference?) {
              switch (reference.type) {
                case NodeType.environmentVariable:
                  paramExp = DartTypes.io.platform
                      .property('environment')
                      .index(literalString(reference.name, raw: true))
                      .nullChecked;
                  final toType = switch (param.type.symbol) {
                    'int' => DartTypes.core.int,
                    'double' => DartTypes.core.double,
                    'bool' => DartTypes.core.bool,
                    'num' => DartTypes.core.num,
                    'String' => null,
                    _ => unreachable(),
                  };
                  if (toType != null) {
                    paramExp = toType.property('parse').call([paramExp]);
                  }
                default:
                  unreachable(
                    'Invalid reference type: ${reference.type}',
                  );
              }
            } else {
              final fromMap = refer('request').index(
                literalString(param.name, raw: true),
              );
              final deserialized = jsonGenerator.fromJson(param.type, fromMap);
              paramExp = deserialized;
            }
            if (param.named) {
              namedParams[param.name] = paramExp;
            } else {
              positionalParams.add(paramExp);
            }
          }
          if (function.exceptionTypes.isNotEmpty) {
            b.statements.add(const Code('try {'));
          }
          var response = functionReference.call(
            positionalParams,
            namedParams,
          );
          final returnType = function.returnType;
          final flattenedReturnTyep = function.flattenedReturnType;
          switch (flattenedReturnTyep.symbol) {
            case 'void':
              b.addExpression(response);
              b.addExpression(
                literalRecord([], {
                  'statusCode': literalNum(200),
                  // TODO(dnys1): Should `void` be represented as null or empty map?
                  // 'body': literalConstMap(
                  //   {},
                  //   DartTypes.core.string,
                  //   DartTypes.core.object.nullable,
                  // ),
                  'body': literalNull,
                }).returned,
              );
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
              b.addExpression(
                literalRecord([], {
                  'statusCode': literalNum(200),
                  'body': result,
                }).returned,
              );
          }
          final exceptionTypes = List.of(function.exceptionTypes)
            ..sort((a, b) {
              final dtA = typeHelper.fromReference(a);
              final dtB = typeHelper.fromReference(b);
              // Subtypes rank before supertypes so that switch/try-catch blocks
              // are in order of decreasing specificity. That is, more general
              // catch blocks should come after more specific catch blocks.
              return typeHelper.typeSystem.isSubtypeOf(dtA, dtB) ? -1 : 1;
            });
          for (final exceptionType in exceptionTypes) {
            b.statements.add(
              Code.scope(
                (alloc) => '} on ${alloc(exceptionType)} catch (e, st) {',
              ),
            );
            b.addExpression(
              refer('print').call([
                literalString(r'$e\n$st'),
              ]),
            );
            b.addExpression(
              declareFinal('error').assign(
                jsonGenerator.toJson(
                  exceptionType,
                  refer('e'),
                ),
              ),
            );
            b.addExpression(
              literalRecord([], {
                'statusCode': typeHelper.typeSystem.isSubtypeOf(
                  typeHelper.fromReference(exceptionType),
                  typeHelper.coreErrorType,
                )
                    ? literalNum(500)
                    : literalNum(400),
                'body': literalMap({
                  // TODO(dnys1): Should the payload be different depending
                  // on the environment? Or is it up to developers to protect
                  // which data is sent via `toJson`?
                  'error': literalMap({
                    'code': literalString(exceptionType.symbol!, raw: true),
                    'message': refer('e').property('toString').call([]),
                    'details': refer('error'),
                  }),
                }),
              }).returned,
            );
          }
          if (function.exceptionTypes.isNotEmpty) {
            b.statements.add(const Code('}'));
          }
        }),
    );
    final target = Class(
      (c) => c
        ..name = targetName
        ..modifier = ClassModifier.final$
        ..extend = DartTypes.celest.functionTarget
        ..constructors.add(
          Constructor((c) {
            c.initializers.add(
              refer('super').call([
                body.closure,
              ], {
                'middleware': literalList(
                  middleware
                      .map(
                        (m) => m.type.constInstance([]).property('handle'),
                      )
                      .toList(),
                ),
              }).code,
            );
          }),
        ),
    );

    final allTypes = Set.of(
      [
        function.flattenedReturnType,
        ...function.parameters.map((p) => p.type),
        ...function.exceptionTypes,
      ].where((type) => !type.isFunctionContext),
    );
    for (final type in allTypes) {
      final dartType = typeHelper.fromReference(type);
      _customSerializers.addAll(
        typeHelper.customSerializers(dartType),
      );
      if ((dartType, type)
          case (final ast.RecordType dartType, final RecordType recordType)) {
        _anonymousRecordTypes[dartType.symbol] = recordType;
      }
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
          for (final serializer in _customSerializers) {
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
      ..._customSerializers,
    ]);
    return library.build();
  }
}
