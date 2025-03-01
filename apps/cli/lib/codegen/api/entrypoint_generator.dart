import 'dart:collection';

import 'package:analyzer/dart/element/element.dart' as ast;
import 'package:analyzer/dart/element/type.dart' as ast;
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/codegen/api/local_api_generator.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/serialization/from_string_generator.dart';
import 'package:celest_cli/serialization/serializer_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/types/type_graph.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

final class EntrypointGenerator {
  EntrypointGenerator({
    required this.project,
    required this.api,
    required this.function,
    required this.httpConfig,
    required this.outputDir,
  });

  final Project project;
  final Api api;
  final CloudFunction function;
  final ResolvedHttpConfig httpConfig;
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
      case NodeType.variable || NodeType.secret:
        final dartType =
            reference.type == NodeType.variable
                ? DartTypes.celest.environmentVariable
                : DartTypes.celest.secret;
        paramExp = DartTypes.celest.globalContext.property('expect').call([
          dartType.constInstance([literalString(reference.name, raw: true)]),
        ]);
        if (param.type.symbol == 'Uint8List') {
          paramExp = DartTypes.convert.base64Decode.call([paramExp]);
        } else {
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
        }
      case NodeType.userContext:
        paramExp = DartTypes.celest.globalContext
            .property(param.type.isNullableOrFalse ? 'get' : 'expect')
            .call([DartTypes.celest.contextKey.property('principal')]);

      case NodeType.httpHeader || NodeType.httpQuery:
        final map =
            reference.type == NodeType.httpHeader
                ? 'headers'
                : 'queryParameters';
        var fromMap = refer(map).index(literalString(reference.name));
        final isNullable = param.type.isNullableOrFalse;
        final (toType, isList) = switch (param.type.toTypeReference) {
          TypeReference(:final types) when types.isNotEmpty => (
            types.first,
            true,
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
          defaultValue: param.defaultToExpression,
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
                (m) =>
                    m
                      ..requiredParameters.add(
                        Parameter(
                          (p) =>
                              p
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
        unreachable('Invalid reference type: ${reference.type}');
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
      (m) =>
          m
            ..returns = switch (function.streamType) {
              null => DartTypes.core.future(DartTypes.shelf.response),
              _ => DartTypes.core.stream(DartTypes.core.object.nullable),
            }
            ..name = 'innerHandle'
            ..types.addAll(function.typeParameters)
            ..requiredParameters.addAll([
              Parameter(
                (p) =>
                    p
                      ..type = typeHelper.toReference(jsonMapType)
                      ..name = 'request',
              ),
            ])
            ..optionalParameters.addAll([
              Parameter(
                (p) =>
                    p
                      ..type = DartTypes.core.map(
                        DartTypes.core.string,
                        DartTypes.core.list(DartTypes.core.string),
                      )
                      ..name = 'headers'
                      ..named = true
                      ..required = true,
              ),
              Parameter(
                (p) =>
                    p
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
                  final fromMap = refer(
                    'request',
                  ).index(literalString(param.name, raw: true));
                  final deserialized = jsonGenerator.fromJson(
                    param.type,
                    fromMap,
                    defaultValue: param.defaultToExpression,
                    inNullableContext: true,
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
                  const resultBody = literalNull;
                  switch (function.streamType) {
                    case null:
                      b.addExpression(response);
                      b.addExpression(
                        DartTypes.shelf.response
                            .newInstance(
                              [literalNum(httpConfig.status)],
                              {
                                'headers': literalConstMap({
                                  'Content-Type': 'application/json',
                                }),
                                'body': DartTypes.celest.jsonUtf8
                                    .property('encode')
                                    .call([resultBody]),
                              },
                            )
                            .returned,
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
                  switch (function.streamType) {
                    case null:
                      b.addExpression(
                        declareFinal('response').assign(response),
                      );
                      b.addExpression(
                        DartTypes.shelf
                            .response(
                              [literalNum(httpConfig.status)],
                              {
                                'headers': literalConstMap({
                                  'Content-Type': 'application/json',
                                }),
                                'body': DartTypes.celest.jsonUtf8
                                    .property('encode')
                                    .call([result]),
                              },
                            )
                            .returned,
                      );
                    default:
                      b.statements.addAll([
                        response.code,
                        const Code('yield '),
                        result.statement,
                        const Code('}'),
                      ]);
                  }
              }

              final typeHiearchy = topologicallySortTypes(
                api.exceptionTypes.map(typeHelper.fromReference),
              );
              final exceptionTypes = typeHiearchy
                  .where(
                    (type) => !identical(type, typeHelper.coreTypes.objectType),
                  )
                  .map(typeHelper.toReference);
              final dartExceptionTypes = {
                for (final exceptionType in exceptionTypes)
                  exceptionType: typeHelper.fromReference(exceptionType),
              };

              final rawStatusCodes = httpConfig.statusMappings.toMap().map(
                (type, status) =>
                    MapEntry(typeHelper.fromReference(type), status),
              );

              final exceptionCodes = <Reference, Expression>{};
              for (final exceptionType in exceptionTypes) {
                final dartExceptionType = dartExceptionTypes[exceptionType]!;

                var statusCode = httpConfig.statusMappings[exceptionType]?.let(
                  literalNum,
                );
                if (statusCode == null &&
                    httpConfig.statusMappings.isNotEmpty) {
                  final relevantExceptionCodes =
                      SplayTreeMap<ast.DartType, int>((a, b) {
                        if (identical(a, b) || a == b) {
                          return 0;
                        }
                        // We want the most specific type to be first.
                        return typeHelper.typeSystem.isSubtypeOf(a, b) ? -1 : 1;
                      });
                  rawStatusCodes.forEach((type, statusCode) {
                    if (typeHelper.typeSystem.isSubtypeOf(
                      dartExceptionType,
                      type,
                    )) {
                      relevantExceptionCodes[type] = statusCode;
                    }
                  });
                  statusCode = relevantExceptionCodes.values.firstOrNull?.let(
                    literalNum,
                  );
                }

                // Check if the type or one of its supertypes is annotated with an
                // `@httpError` config.
                final exceptionElement = dartExceptionType.element;
                if (statusCode == null &&
                    exceptionElement is ast.InterfaceElement) {
                  final errorConfig =
                      [
                        ...exceptionElement.metadata,
                        ...exceptionElement.allSupertypes.expand(
                          (it) => it.element.metadata,
                        ),
                      ].where((m) => m.isHttpError).firstOrNull;
                  if (errorConfig?.computeConstantValue() case final value?) {
                    statusCode = value
                        .getField('statusCode')
                        ?.toIntValue()
                        ?.let(literalNum);
                  }
                }

                // Fallback based on the type hierarchy.
                statusCode ??=
                    dartExceptionType.isErrorType
                        ? literalNum(500)
                        : literalNum(400);

                exceptionCodes[exceptionType] = statusCode;
              }

              for (final exceptionType in exceptionTypes) {
                final dartExceptionType = dartExceptionTypes[exceptionType]!;

                b.statements.add(
                  Code.scope(
                    (alloc) => '} on ${alloc(exceptionType)} catch (e, st) {',
                  ),
                );
                final statusCode = exceptionCodes[exceptionType]!;
                b.addExpression(declareConst('statusCode').assign(statusCode));

                final messageExpression = switch (dartExceptionType) {
                  ast.DartType(isCloudExceptionType: true) => refer(
                    'e',
                  ).property('message'),
                  ast.DartType(element: ast.InterfaceElement(:final fields))
                      when fields.any(
                        (f) => f.name == 'message' && f.type.isDartCoreString,
                      ) =>
                    refer('e').property('message'),
                  _ => null,
                };

                b.addExpression(
                  DartTypes.celest.globalContext
                      .property('logger')
                      .property('severe')
                      .call([
                        messageExpression ??
                            refer('e').property('toString').call([]),
                        refer('e'),
                        refer('st'),
                      ]),
                );

                b.addExpression(
                  declareFinal('status').assign(
                    literalMap({
                      '@status': literalMap({
                        'code': refer('statusCode'),
                        'message': messageExpression,
                        'details': literalList([
                          literalMap({
                            '@type': dartExceptionType.externalUri(
                              project.name,
                            ),
                            'value': jsonGenerator.toJson(
                              exceptionType,
                              refer('e'),
                            ),
                          }),
                          collectionIf(
                            DartTypes.celest.globalContext
                                .property('environment')
                                .notEqualTo(
                                  DartTypes.celest.environment.property(
                                    'production',
                                  ),
                                ),
                            literalMap({
                              '@type': typeHelper.coreTypes.stackTraceType
                                  .externalUri(project.name),
                              'value': jsonGenerator.toJson(
                                DartTypes.core.stackTrace,
                                refer('st'),
                              ),
                            }),
                          ),
                        ]),
                      }),
                    }),
                  ),
                );
                switch (function.streamType) {
                  case null:
                    b.addExpression(
                      DartTypes.shelf.response
                          .newInstance(
                            [refer('statusCode')],
                            {
                              'headers': literalConstMap({
                                'Content-Type': 'application/json',
                              }),
                              'body': DartTypes.celest.jsonUtf8
                                  .property('encode')
                                  .call([refer('status')]),
                            },
                          )
                          .returned,
                    );
                  default:
                    b.statements.add(const Code('yield status;'));
                }
              }
              if (api.exceptionTypes.isNotEmpty) {
                b.statements.add(const Code('}'));
              }
            }),
    );

    final Code handleBody;
    if (function.typeParameters.isEmpty) {
      handleBody =
          refer('innerHandle')
              .call(
                [refer('request')],
                {
                  'headers': refer('headers'),
                  'queryParameters': refer('queryParameters'),
                },
              )
              .returned
              .statement;
    } else {
      handleBody = Block((b) {
        // TODO: `@type.T`
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
          declareFinal(r'$types').assign(literalRecord(types, {})),
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
                      _BoundReference(:final reference) => literalString(
                        reference.symbol!,
                        raw: true,
                      ).or(literalNull),
                      _SubtypeReference(:final reference) => literalString(
                        reference.symbol!,
                        raw: true,
                      ),
                    },
                  )
                  .toList(),
              {},
            ).code,
            const Code(' => '),
            refer('innerHandle')
                .call(
                  [request],
                  {
                    'headers': refer('headers'),
                    'queryParameters': refer('queryParameters'),
                  },
                  typeParameters.references,
                )
                .code,
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
      (m) =>
          m
            ..returns = switch (function.streamType) {
              null => DartTypes.core.future(DartTypes.shelf.response),
              _ => DartTypes.core.stream(DartTypes.core.object.nullable),
            }
            ..annotations.add(DartTypes.core.override)
            ..name = 'handle'
            ..requiredParameters.addAll([
              Parameter(
                (p) =>
                    p
                      ..name = 'request'
                      ..type = typeHelper.toReference(jsonMapType),
              ),
            ])
            ..optionalParameters.addAll([
              Parameter(
                (p) =>
                    p
                      ..type = DartTypes.core.map(
                        DartTypes.core.string,
                        DartTypes.core.list(DartTypes.core.string),
                      )
                      ..name = 'headers'
                      ..named = true
                      ..required = true,
              ),
              Parameter(
                (p) =>
                    p
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
      if ((dartType, type) case (
        final ast.RecordType dartType,
        final RecordType recordType,
      )) {
        _anonymousRecordTypes[dartType.symbol] =
        // Typedefs should always point to the non-nullable
        // version since the type is only used to invoke the
        // serializer and the serializer handles null values.
        recordType.rebuild((r) => r.isNullable = false);
      }
    }

    Expression? authMiddleware;
    final authMetadata = [
      ...function.metadata.whereType<ApiAuth>(),
      ...api.metadata.whereType<ApiAuth>(),
    ];
    // final authRequired = authMetadata.whereType<ApiAuthenticated>().isNotEmpty;
    if (authMetadata.isNotEmpty) {
      if (project.auth?.providers.isNotEmpty ?? false) {
        authMiddleware = DartTypes.celest.middleware.property('shelf').call([
          refer(
                'CelestCloudAuth',
                'package:celest_cloud_auth/celest_cloud_auth.dart',
              )
              .property('of')
              .call([DartTypes.celest.globalContext])
              .property('middleware')
              .property('call'),
        ]);
      }
      final externalAuthProviders = [...?project.auth?.externalProviders];
      for (final externalAuthProvider in externalAuthProviders) {
        switch (externalAuthProvider) {
          case FirebaseExternalAuthProvider(:final projectId):
            authMiddleware = DartTypes.celest.firebaseAuthMiddleware
                .newInstance([], {
                  'projectId': DartTypes.celest.globalContext
                      .property('expect')
                      .call([
                        DartTypes.celest.environmentVariable.constInstance([
                          literalString(
                            projectId.name,
                            raw: projectId.name.contains(r'$'),
                          ),
                        ]),
                      ]),
                  'required': literalBool(false),
                });
          case SupabaseExternalAuthProvider(
            :final projectUrl,
            :final jwtSecret,
          ):
            authMiddleware = DartTypes.celest.supabaseAuthMiddleware
                .newInstance([], {
                  'url': DartTypes.celest.globalContext.property('expect').call(
                    [
                      DartTypes.celest.environmentVariable.constInstance([
                        literalString(
                          projectUrl.name,
                          raw: projectUrl.name.contains(r'$'),
                        ),
                      ]),
                    ],
                  ),
                  if (jwtSecret != null)
                    'jwtSecret': DartTypes.convert.utf8.property('encode').call(
                      [
                        DartTypes.celest.globalContext.property('expect').call([
                          DartTypes.celest.secret.constInstance([
                            literalString(
                              jwtSecret.name,
                              raw: jwtSecret.name.contains(r'$'),
                            ),
                          ]),
                        ]),
                      ],
                    ),
                  'required': literalBool(false),
                });
        }
      }
    }
    final middlewares = [if (authMiddleware != null) authMiddleware];

    final target = Class(
      (c) =>
          c
            ..name = targetName
            ..modifier = ClassModifier.final$
            ..extend =
                project.sdkConfig.featureEnabled(FeatureFlag.streaming)
                    ? switch (function.streamType) {
                      null => DartTypes.celest.cloudFunctionHttpTarget,
                      _ => DartTypes.celest.cloudEventSourceTarget,
                    }
                    : DartTypes.celest.cloudFunctionTarget
            ..methods.addAll([
              Method(
                (m) =>
                    m
                      ..name = 'name'
                      ..annotations.add(DartTypes.core.override)
                      ..returns = DartTypes.core.string
                      ..type = MethodType.getter
                      ..lambda = true
                      ..body = literalString(function.name).code,
              ),
              if (middlewares.isNotEmpty)
                Method(
                  (m) =>
                      m
                        ..name = 'middlewares'
                        ..annotations.add(DartTypes.core.override)
                        ..returns = DartTypes.core.list(
                          DartTypes.celest.middleware,
                        )
                        ..type = MethodType.getter
                        ..lambda = true
                        ..body = literalList(middlewares).code,
                ),
              if (function.streamType == null)
                Method(
                  (m) =>
                      m
                        ..name = 'method'
                        ..annotations.add(DartTypes.core.override)
                        ..returns = DartTypes.core.string
                        ..type = MethodType.getter
                        ..lambda = true
                        ..body = literalString(httpConfig.route.method).code,
                )
              else
                Method(
                  (m) =>
                      m
                        ..name = 'hasBody'
                        ..annotations.add(DartTypes.core.override)
                        ..returns = DartTypes.core.bool
                        ..type = MethodType.getter
                        ..lambda = true
                        ..body = literalBool(function.hasHttpBody).code,
                ),
              if (function.typeParameters.isEmpty)
                innerHandle.rebuild(
                  (m) =>
                      m
                        ..name = 'handle'
                        ..annotations.add(DartTypes.core.override),
                )
              else ...[
                handle,
                innerHandle,
              ],
              if (_customSerializers.isNotEmpty)
                Method(
                  (m) =>
                      m
                        ..returns = DartTypes.core.void$
                        ..annotations.add(DartTypes.core.override)
                        ..name = 'init'
                        ..body = Block.of(
                          _customSerializers
                              .sorted((a, b) {
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
                              })
                              .map((s) => s.initAll),
                        ),
                ),
            ]),
    );

    final entrypoint =
        LocalApiGenerator(
          project: project,
          targets: {'/': refer(targetName)},
        ).body;
    library.body.addAll([
      target,
      ...entrypoint,
      ..._anonymousRecordTypes.entries
          .map(
            (recordType) => TypeDef(
              (t) =>
                  t
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
    subtypes.add(_SubtypeReference(typeHelper.toReference(subtype)));
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
