import 'dart:collection';

import 'package:analyzer/dart/element/element.dart' as ast;
import 'package:analyzer/dart/element/type.dart' as ast;
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/serialization/serializer_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_proto/ast.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

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
  late final String targetName = '${function.name.pascalCase}Target';

  // Map of serializer classes to their type tokens, if any.
  final _customSerializers = LinkedHashSet<SerializerDefinition>(
    equals: (a, b) => a.type == b.type,
    hashCode: (a) => a.type.hashCode,
  );
  final _anonymousRecordTypes = <String, RecordType>{};

  Library generate() {
    final library = LibraryBuilder();
    // final middleware = [
    //   ...api.metadata,
    //   ...function.metadata,
    // ].whereType<ApiMiddleware>().toList();
    final innerHandle = Method(
      (m) => m
        ..returns = DartTypes.core.future(DartTypes.celest.celestResponse)
        ..name = 'innerHandle'
        ..types.addAll(function.typeParameters)
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..type = typeHelper.toReference(jsonMapType)
              ..name = 'request',
          ),
        )
        ..modifier = MethodModifier.async
        ..body = Block((b) {
          final functionReference = refer(
            function.name,
            function.location.sourceUrl.toString(),
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
                    'Uri' => DartTypes.core.uri,
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
              final deserialized = jsonGenerator.fromJson(
                param.type,
                fromMap,
                defaultValue: param.defaultTo,
              );
              paramExp = deserialized;
            }
            if (param.named) {
              namedParams[param.name] = paramExp;
            } else {
              positionalParams.add(paramExp);
            }
          }
          if (api.exceptionTypes.isNotEmpty) {
            b.statements.add(const Code('try {'));
          }
          var response = functionReference.call(
            positionalParams,
            namedParams,
            function.typeParameters.map((t) => t.noBound).toList(),
          );
          final returnType = function.returnType;
          final flattenedReturnType = function.flattenedReturnType;
          final dartReturnType = typeHelper.fromReference(returnType);
          if (dartReturnType.isDartAsyncFuture ||
              dartReturnType.isDartAsyncFutureOr) {
            response = response.awaited;
          }
          switch (flattenedReturnType.symbol) {
            case 'void':
              b.addExpression(response);
              b.addExpression(
                literalRecord([], {
                  'statusCode': literalNum(200),
                  'body': literalMap({
                    'response': literalNull,
                  }),
                }).returned,
              );
            default:
              b.addExpression(
                declareFinal('response').assign(response),
              );
              final result = jsonGenerator.toJson(
                flattenedReturnType,
                refer('response'),
              );
              b.addExpression(
                literalRecord([], {
                  'statusCode': literalNum(200),
                  'body': literalMap({
                    'response': result,
                  }),
                }).returned,
              );
          }
          final exceptionTypes = List.of(api.exceptionTypes)
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
                (alloc) => '} on ${alloc(exceptionType)} catch (e) {',
              ),
            );
            b.addExpression(
              declareConst('statusCode').assign(
                typeHelper.typeSystem.isSubtypeOf(
                  typeHelper.fromReference(exceptionType),
                  typeHelper.coreTypes.coreErrorType,
                )
                    ? literalNum(500)
                    : literalNum(400),
              ),
            );
            b.addExpression(
              refer('print').call([
                literalString(r'$statusCode $e'),
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
                'statusCode': refer('statusCode'),
                'body': literalMap({
                  'error': literalMap({
                    'code': literalString(exceptionType.symbol!, raw: true),
                    'details': refer('error'),
                  }),
                }),
              }).returned,
            );
          }
          if (api.exceptionTypes.isNotEmpty) {
            b.statements.add(const Code('}'));
          }
        }),
    );

    final Code handleBody;
    if (function.typeParameters.isEmpty) {
      handleBody =
          refer('innerHandle').call([refer('request')]).returned.statement;
    } else {
      handleBody = Block((b) {
        final request = refer('request');
        final types = <Reference>[];
        for (final typeParameter in function.typeParameters) {
          final typeMapName = '\$${typeParameter.symbol!}';
          b.addExpression(
            declareFinal(typeMapName).assign(
              request
                  .index(literalString(typeMapName, raw: true))
                  .asA(DartTypes.core.string.nullable),
            ),
          );
          types.add(refer(typeMapName));
        }
        b.addExpression(
          declareFinal(r'$types').assign(
            literalRecord(types, {}),
          ),
        );
        b.statements.addAll([
          const Code(r'return switch($types) {'),
          for (final typeParameters in _combinations(
            function.typeParameters.map(_subtypes),
          )) ...[
            literalRecord(
              typeParameters
                  .map(
                    (t) => switch (t) {
                      _BoundReference(:final reference) =>
                        literalString(reference.symbol!, raw: true)
                            .or(literalNull),
                      _SubtypeReference(:final reference) =>
                        literalString(reference.symbol!, raw: true),
                    },
                  )
                  .toList(),
              {},
            ).code,
            const Code(' => '),
            refer('innerHandle').call(
              [request],
              {},
              typeParameters.references,
            ).code,
            const Code(','),
          ],
          const Code('_ => '),
          // TODO(dnys1): Test this
          DartTypes.celest.serializationException
              .newInstance([
                literalString(r'Invalid type parameters: ${$types}'),
              ])
              .thrown
              .code,
          const Code(',};'),
        ]);
      });
    }

    final handle = Method(
      (m) => m
        ..returns = DartTypes.core.future(DartTypes.celest.celestResponse)
        ..annotations.add(DartTypes.core.override)
        ..name = 'handle'
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'request'
              ..type = typeHelper.toReference(jsonMapType),
          ),
        )
        ..modifier = MethodModifier.async
        ..body = handleBody,
    );

    final allTypes = Set.of(
      [
        function.flattenedReturnType,
        ...function.parameters.map((p) => p.type),
        ...api.exceptionTypes,
      ].where((type) => !type.isFunctionContext),
    );
    for (final type in allTypes) {
      final dartType = typeHelper.fromReference(type);
      _customSerializers.addAll(typeHelper.customSerializers(dartType));
      if ((dartType, type)
          case (final ast.RecordType dartType, final RecordType recordType)) {
        _anonymousRecordTypes[dartType.symbol] =
            // Typedefs should always point to the non-nullable
            // version since the type is only used to invoke the
            // serializer and the serializer handles null values.
            recordType.rebuild((r) => r.isNullable = false);
      }
    }

    final target = Class(
      (c) => c
        ..name = targetName
        ..modifier = ClassModifier.final$
        ..extend = DartTypes.celest.cloudFunctionTarget
        ..methods.addAll([
          Method(
            (m) => m
              ..name = 'name'
              ..annotations.add(DartTypes.core.override)
              ..returns = DartTypes.core.string
              ..type = MethodType.getter
              ..lambda = true
              ..body = literalString(function.name).code,
          ),
          if (function.typeParameters.isEmpty)
            innerHandle.rebuild(
              (m) => m
                ..name = 'handle'
                ..annotations.add(DartTypes.core.override),
            )
          else ...[handle, innerHandle],
          if (_customSerializers.isNotEmpty)
            Method(
              (m) => m
                ..returns = DartTypes.core.void$
                ..annotations.add(DartTypes.core.override)
                ..name = 'init'
                ..body = Block.of(
                  _customSerializers.sorted((a, b) {
                    final aLoc = a.type.url;
                    final bLoc = b.type.url;
                    if (aLoc == null) {
                      return -1;
                    }
                    if (bLoc == null) {
                      return 1;
                    }
                    final loc = aLoc.compareTo(bLoc);
                    if (loc != 0) {
                      return loc;
                    }
                    final aSym = a.type.symbol!;
                    final bSym = b.type.symbol!;
                    return aSym.compareTo(bSym);
                  }).map((s) => s.initAll),
                ),
            ),
        ]),
    );

    final entrypoint = Method(
      (m) => m
        ..name = 'main'
        ..returns = DartTypes.core.future(DartTypes.core.void$)
        ..modifier = MethodModifier.async
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'args'
              ..type = DartTypes.core.list(DartTypes.core.string),
          ),
        )
        ..body = Code.scope(
          (alloc) => '''
  await ${alloc(DartTypes.celest.serve)}(
    targets: {'/': ${target.name}()},
  );
''',
        ),
    );
    library.body.addAll([
      target,
      entrypoint,
      ..._anonymousRecordTypes.entries
          .map(
            (recordType) => TypeDef(
              (t) => t
                ..name = recordType.key
                ..definition = recordType.value,
            ),
          )
          .toList()
        ..sort((a, b) => a.name.compareTo(b.name)),
      ..._customSerializers.map((s) => s.genericClass).nonNulls.toList()
        ..sort((a, b) => a.name.compareTo(b.name)),
    ]);
    return library.build();
  }
}

List<_Reference> _subtypes(Reference typeParameter) {
  final typeParameterType =
      typeHelper.fromReference(typeParameter) as ast.TypeParameterType;
  final typeParameterBound =
      typeParameterType.bound.element as ast.InterfaceElement;
  final subtypes = <_Reference>{
    _BoundReference(typeHelper.toReference(typeParameterType.bound)),
  };
  for (final subtype in typeHelper.subtypes[typeParameterBound]!) {
    subtypes.add(
      _SubtypeReference(typeHelper.toReference(subtype)),
    );
  }
  return subtypes.toList();
}

Iterable<List<_Reference>> _combinations(
  Iterable<Iterable<_Reference>> types,
) sync* {
  if (types.isEmpty) {
    return;
  }
  if (types.length == 1) {
    yield* types.first.map((t) => [t]);
    return;
  }
  final type = types.first;
  final rest = types.skip(1);
  for (final t in type) {
    for (final r in _combinations(rest)) {
      yield [t, ...r];
    }
  }
}

sealed class _Reference {
  const _Reference(this.reference);

  final Reference reference;
}

final class _SubtypeReference extends _Reference {
  _SubtypeReference(super.reference);

  @override
  bool operator ==(Object other) =>
      other is _SubtypeReference && reference == other.reference;

  @override
  int get hashCode => reference.hashCode;
}

final class _BoundReference extends _Reference {
  _BoundReference(super.reference);

  @override
  bool operator ==(Object other) =>
      other is _BoundReference && reference == other.reference;

  @override
  int get hashCode => reference.hashCode;
}

extension on Iterable<_Reference> {
  List<Reference> get references => map((r) => r.reference).toList();
}
