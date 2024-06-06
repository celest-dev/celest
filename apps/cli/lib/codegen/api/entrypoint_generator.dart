import 'dart:collection';

import 'package:analyzer/dart/element/element.dart' as ast;
import 'package:analyzer/dart/element/type.dart' as ast;
import 'package:api_celest/ast.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/codegen/api/local_api_generator.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/serialization/from_string_generator.dart';
import 'package:celest_cli/serialization/serializer_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

final class EntrypointGenerator {
  EntrypointGenerator({
    required this.project,
    required this.api,
    required this.function,
    this.httpConfig,
    required this.outputDir,
  });

  final Project project;
  final Api api;
  final CloudFunction function;
  final ResolvedHttpConfig? httpConfig;
  final String outputDir;

  late final String projectRoot = projectPaths.projectRoot;
  late final String targetName = '${function.name.pascalCase}Target';

  // Map of serializer classes to their type tokens, if any.
  final _customSerializers = LinkedHashSet<SerializerDefinition>(
    equals: (a, b) => a.type == b.type,
    hashCode: (a) => a.type.hashCode,
  );
  final _anonymousRecordTypes = <String, RecordType>{};

  Expression _decodeReference(
    CloudFunctionParameter param,
    NodeReference reference,
  ) {
    Expression paramExp;
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
      case NodeType.userContext:
        final paramJson = refer('context').index(
          literalString(raw: true, reference.name.toLowerCase()),
        );
        paramExp = DartTypes.convert.jsonDecode.call([
          paramJson.nullChecked,
        ]);
        if (param.type.isNullableOrFalse) {
          paramExp =
              paramJson.equalTo(literalNull).conditional(literalNull, paramExp);
        }
        paramExp = jsonGenerator.fromJson(
          typeHelper
              .toReference(typeHelper.coreTypes.userType)
              .withNullability(param.type.isNullableOrFalse),
          paramExp,
        );

      case NodeType.httpHeader || NodeType.httpQuery:
        final map = reference.type == NodeType.httpHeader
            ? 'headers'
            : 'queryParameters';
        var fromMap = refer(map).index(literalString(param.name));
        final isNullable = param.type.isNullableOrFalse;
        final (toType, isList) = switch (param.type.toTypeReference) {
          TypeReference(:final types) when types.isNotEmpty => (
              types.first,
              true
            ),
          final type => (type, false),
        };

        var serialized = fromMap;
        if (isList) {
          serialized = refer('el');
        } else {
          serialized = serialized.nullChecked.property('first');
        }
        final deserialized = fromString(
          toType,
          serialized,
          defaultValue: param.defaultTo,
        );
        if (!isList) {
          if (isNullable) {
            return fromMap
                .equalTo(literalNull)
                .conditional(literalNull, deserialized);
          }
          return deserialized;
        }
        if (!isNullable) {
          fromMap = fromMap.nullChecked;
        }
        paramExp = fromMap
            .nullableProperty('map', isNullable)
            .call([
              Method(
                (m) => m
                  ..requiredParameters.add(
                    Parameter(
                      (p) => p
                        ..name = 'el'
                        ..type = DartTypes.core.string,
                    ),
                  )
                  ..lambda = true
                  ..body = deserialized.code,
              ).closure,
            ])
            .property('toList')
            .call([]);
      default:
        unreachable(
          'Invalid reference type: ${reference.type}',
        );
    }
    return paramExp;
  }

  Library generate() {
    final library = LibraryBuilder();
    // final middleware = [
    //   ...api.metadata,
    //   ...function.metadata,
    // ].whereType<ApiMiddleware>().toList();
    final innerHandle = Method(
      (m) => m
        ..returns = switch (function.streamType) {
          null => DartTypes.core.future(DartTypes.celest.celestResponse),
          _ => DartTypes.core.stream(
              DartTypes.core.map(
                DartTypes.core.string,
                DartTypes.core.object.nullable,
              ),
            ),
        }
        ..name = 'innerHandle'
        ..types.addAll(function.typeParameters)
        ..requiredParameters.addAll([
          Parameter(
            (p) => p
              ..type = typeHelper.toReference(jsonMapType)
              ..name = 'request',
          ),
        ])
        ..optionalParameters.addAll([
          Parameter(
            (p) => p
              ..type = DartTypes.core.map(
                DartTypes.core.string,
                DartTypes.core.string,
              )
              ..name = 'context'
              ..named = true
              ..required = true,
          ),
          Parameter(
            (p) => p
              ..type = DartTypes.core.map(
                DartTypes.core.string,
                DartTypes.core.list(DartTypes.core.string),
              )
              ..name = 'headers'
              ..named = true
              ..required = true,
          ),
          Parameter(
            (p) => p
              ..type = DartTypes.core.map(
                DartTypes.core.string,
                DartTypes.core.list(DartTypes.core.string),
              )
              ..name = 'queryParameters'
              ..named = true
              ..required = true,
          ),
        ])
        ..modifier = switch (function.streamType) {
          null => MethodModifier.async,
          _ => MethodModifier.asyncStar,
        }
        ..body = Block((b) {
          final functionReference = refer(
            function.name,
            function.location.sourceUrl.toString(),
          );
          final positionalParams = <Expression>[];
          final namedParams = <String, Expression>{};
          for (final param in function.parameters) {
            Expression paramExp;
            if (param.references case final reference?) {
              paramExp = _decodeReference(param, reference);
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
          } else if (dartReturnType.isDartAsyncStream) {
            response = CodeExpression(
              Block.of([
                const Code('await for (final response in '),
                response.code,
                const Code(') {'),
              ]),
            );
          }
          switch (flattenedReturnType.symbol) {
            case 'void':
              final resultBody = literalMap({
                'response': literalNull,
              });
              switch (function.streamType) {
                case null:
                  b.addExpression(response);
                  b.addExpression(
                    literalRecord([], {
                      'statusCode': literalNum(httpConfig?.statusCode ?? 200),
                      'body': resultBody,
                    }).returned,
                  );
                default:
                  b.statements.addAll([
                    response.code,
                    const Code('yield '),
                    resultBody.statement,
                    const Code('}'),
                  ]);
              }
            default:
              final result = jsonGenerator.toJson(
                flattenedReturnType,
                refer('response'),
              );
              final resultBody = literalMap({
                'response': result,
              });
              switch (function.streamType) {
                case null:
                  b.addExpression(
                    declareFinal('response').assign(response),
                  );
                  b.addExpression(
                    literalRecord([], {
                      'statusCode': literalNum(httpConfig?.statusCode ?? 200),
                      'body': resultBody,
                    }).returned,
                  );
                default:
                  b.statements.addAll([
                    response.code,
                    const Code('yield '),
                    resultBody.statement,
                    const Code('}'),
                  ]);
              }
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

          final rawStatusCodes = httpConfig?.errorStatuses.toMap().map(
                (type, status) => MapEntry(
                  typeHelper.fromReference(type),
                  status,
                ),
              );

          final exceptionCodes = <Reference, int>{};
          for (final exceptionType in exceptionTypes) {
            final dartExceptionType = typeHelper.fromReference(exceptionType);

            var statusCode = httpConfig?.errorStatuses[exceptionType];
            if (statusCode == null && rawStatusCodes != null) {
              final relevantExceptionCodes =
                  SplayTreeMap<ast.DartType, int>((a, b) {
                if (identical(a, b) || a == b) {
                  return 0;
                }
                // We want the most specific type to be first.
                return typeHelper.typeSystem.isSubtypeOf(a, b) ? -1 : 1;
              });
              rawStatusCodes.forEach((type, statusCode) {
                if (typeHelper.typeSystem
                    .isSubtypeOf(dartExceptionType, type)) {
                  relevantExceptionCodes[type] = statusCode;
                }
              });
              statusCode = relevantExceptionCodes.values.firstOrNull;
            }
            statusCode ??= typeHelper.typeSystem.isSubtypeOf(
              dartExceptionType,
              typeHelper.coreTypes.coreErrorType,
            )
                ? 500
                : 400;

            exceptionCodes[exceptionType] = statusCode;
          }

          for (final exceptionType in exceptionTypes) {
            b.statements.add(
              Code.scope(
                (alloc) => '} on ${alloc(exceptionType)} catch (e) {',
              ),
            );
            final statusCode = exceptionCodes[exceptionType]!;
            b.addExpression(
              declareConst('statusCode').assign(literalNum(statusCode)),
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
            final errorBody = literalMap({
              'error': literalMap({
                'code': literalString(exceptionType.symbol!, raw: true),
                'details': refer('error'),
              }),
            });
            switch (function.streamType) {
              case null:
                b.addExpression(
                  literalRecord([], {
                    'statusCode': refer('statusCode'),
                    'body': errorBody,
                  }).returned,
                );
              default:
                b.statements.addAll([
                  const Code('yield '),
                  errorBody.statement,
                ]);
            }
          }
          if (api.exceptionTypes.isNotEmpty) {
            b.statements.add(const Code('}'));
          }
        }),
    );

    final Code handleBody;
    if (function.typeParameters.isEmpty) {
      handleBody = refer('innerHandle')
          .call([
            refer('request'),
          ], {
            'context': refer('context'),
            'headers': refer('headers'),
            'queryParameters': refer('queryParameters'),
          })
          .returned
          .statement;
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
              {
                'context': refer('context'),
                'headers': refer('headers'),
                'queryParameters': refer('queryParameters'),
              },
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
        ..returns = switch (function.streamType) {
          null => DartTypes.core.future(DartTypes.celest.celestResponse),
          _ => DartTypes.core.stream(
              DartTypes.core.map(
                DartTypes.core.string,
                DartTypes.core.object.nullable,
              ),
            ),
        }
        ..annotations.add(DartTypes.core.override)
        ..name = 'handle'
        ..requiredParameters.addAll([
          Parameter(
            (p) => p
              ..name = 'request'
              ..type = typeHelper.toReference(jsonMapType),
          ),
        ])
        ..optionalParameters.addAll([
          Parameter(
            (p) => p
              ..type = DartTypes.core.map(
                DartTypes.core.string,
                DartTypes.core.string,
              )
              ..name = 'context'
              ..named = true
              ..required = true,
          ),
          Parameter(
            (p) => p
              ..type = DartTypes.core.map(
                DartTypes.core.string,
                DartTypes.core.list(DartTypes.core.string),
              )
              ..name = 'headers'
              ..named = true
              ..required = true,
          ),
          Parameter(
            (p) => p
              ..type = DartTypes.core.map(
                DartTypes.core.string,
                DartTypes.core.list(DartTypes.core.string),
              )
              ..name = 'queryParameters'
              ..named = true
              ..required = true,
          ),
        ])
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
        ..extend = switch (function.streamType) {
          null => DartTypes.celest.cloudFunctionHttpTarget,
          _ => DartTypes.celest.cloudEventSourceTarget,
        }
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
          if (function.streamType == null)
            Method(
              (m) => m
                ..name = 'method'
                ..annotations.add(DartTypes.core.override)
                ..returns = DartTypes.core.string
                ..type = MethodType.getter
                ..lambda = true
                ..body = literalString(httpConfig?.method ?? 'POST').code,
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

    final entrypoint = LocalApiGenerator(
      projectType: project.sdkInfo.flutterSdkVersion == null
          ? CelestProjectType.dart
          : CelestProjectType.flutter,
      targets: {'/': refer(targetName)},
    ).body;
    library.body.addAll([
      target,
      ...entrypoint,
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
      ..._customSerializers.map((s) => s.serializerClass).nonNulls.toList()
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
