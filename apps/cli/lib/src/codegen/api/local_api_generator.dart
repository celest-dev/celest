import 'dart:collection';

import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/src/codegen/cloud/cloud_client_types.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/recase.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';

class LocalApiGenerator {
  LocalApiGenerator({
    required this.project,
    required Map<String, Reference> targets,
  }) : // Provides consistent ordering which helps with codegen diffing.
       // TODO(dnys1): Order by API then definition order.
       targets = SplayTreeMap.of(targets);

  final Project project;
  final SplayTreeMap<String, Reference> targets;

  Method get _mainMethod => Method(
    (m) => m
      ..name = 'main'
      ..returns = DartTypes.core.future(DartTypes.core.void$)
      ..modifier = MethodModifier.async
      ..body = Code.scope(
        (alloc) => switch (project.sdkConfig.targetSdk) {
          SdkType.dart =>
            '''
return start();
''',

          // TODO(dnys1): No longer possible with stateful isolates (WS/SSE).
          //                   '''
          // await Future.wait(eagerError: true, [
          //   for (var i = 0; i < ${alloc(DartTypes.io.platform)}.numberOfProcessors; i++)
          //     ${alloc(DartTypes.isolate.isolate)}.run(start),
          // ]);
          // '''
          SdkType.flutter =>
            '''
return start();
''',
          // TODO(dnys1): Not sure if this is possible...
          //               '''
          // final rootIsolateToken = ${alloc(DartTypes.flutter.servicesBiding)}.rootIsolateToken!;
          // await Future.wait(eagerError: true, [
          //   for (var i = 0; i < ${alloc(DartTypes.io.platform)}.numberOfProcessors; i++)
          //     ${alloc(DartTypes.isolate.isolate)}.run(() => start(rootIsolateToken)),
          // ]);
          // '''
          final unknown => unreachable('Unknown project type: $unknown'),
        },
      ),
  );

  Method get _setupCallback {
    return Method((m) {
      m
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'context'
              ..type = DartTypes.celest.context,
          ),
        )
        ..modifier = MethodModifier.async
        ..body = _init;
    });
  }

  Block get _init {
    final databases = project.databases.values.toList(growable: false);
    final authDatabase = _cloudAuthDatabase;
    return Block((b) {
      if (databases.isEmpty) {
        return;
      }

      final registryRef = refer(
        'CelestDatabaseRegistry',
        'package:celest/src/runtime/data/database_registry.dart',
      );
      b.addExpression(
        declareFinal(r'$databases').assign(registryRef.newInstance([])),
      );
      b.addExpression(
        refer('context').property('put').call([
          registryRef.property('contextKey'),
          refer(r'$databases'),
        ]),
      );

      final hasCloudAuth = project.auth?.providers.isNotEmpty ?? false;
      Expression? cloudAuthConnection;

      for (var index = 0; index < databases.length; index++) {
        final database = databases[index];
        final schemaType = switch (database.schema) {
          DriftDatabaseSchema(:final declaration) => declaration,
        };
        final config = database.config as CelestDatabaseConfig;
        final celestVariable = '_${database.dartName}CelestDatabase';
        final databaseNameLiteral = literalString(
          database.name,
          raw: database.name.contains(r'$'),
        );
        final dartNameLiteral = literalString(
          database.dartName,
          raw: database.dartName.contains(r'$'),
        );
        final studioPath = _studioPath(database);

        b.addExpression(
          declareFinal(celestVariable).assign(
            refer(
                  'CelestDatabase',
                  'package:celest/src/runtime/data/celest_database.dart',
                )
                .property('create')
                .call(
                  [refer('context')],
                  {
                    'name': databaseNameLiteral,
                    'factory': schemaType.property('new'),
                    'hostnameVariable': DartTypes.celest.environmentVariable
                        .constInstance([
                          literalString(
                            config.hostname.name,
                            raw: config.hostname.name.contains(r'$'),
                          ),
                        ]),
                    'tokenSecret': DartTypes.celest.secret.constInstance([
                      literalString(
                        config.token.name,
                        raw: config.token.name.contains(r'$'),
                      ),
                    ]),
                  },
                )
                .awaited,
          ),
        );

        b.addExpression(
          declareFinal(
            database.dartName,
          ).assign(refer(celestVariable).property('connect').call([]).awaited),
        );

        b.addExpression(
          refer('context').property('put').call([
            refer(
              'CelestData',
              CloudPaths.data.toString(),
            ).property('${database.dartName}\$Key'),
            refer(database.dartName),
          ]),
        );

        b.addExpression(
          refer(r'$databases').property('register').call([], {
            'databaseId': databaseNameLiteral,
            'dartName': dartNameLiteral,
            'displayName': databaseNameLiteral,
            'database': refer(celestVariable),
            'connection': refer(database.dartName),
          }),
        );

        if (hasCloudAuth && database == authDatabase) {
          cloudAuthConnection = refer(database.dartName);
        }

        b.statements.add(
          Block((studioBlock) {
            studioBlock.addExpression(
              declareFinal(r'$studio').assign(
                refer(celestVariable).property('createStudio').call([], {
                  'pageTitle': databaseNameLiteral,
                }),
              ),
            );
            studioBlock.addExpression(
              refer('context').property('router').property('mount').call([
                literalString(studioPath),
                refer(r'$studio').property('call'),
              ]),
            );
            if (index == 0) {
              studioBlock.addExpression(
                refer('context').property('router').property('mount').call([
                  literalString('/_admin/studio'),
                  refer(r'$studio').property('call'),
                ]),
              );
            }
          }).wrapWithBlockIf(
            refer('context')
                .property('environment')
                .equalTo(DartTypes.celest.environment.property('local')),
          ),
        );
      }

      if (!hasCloudAuth) {
        return;
      }

      cloudAuthConnection ??= refer(databases.first.dartName);

      b.addExpression(
        declareFinal(r'$cloudAuth').assign(
          refer(
            'CelestCloudAuth',
            'package:celest_cloud_auth/celest_cloud_auth.dart',
          ).property('create').call([], {
            'database': cloudAuthConnection,
          }).awaited,
        ),
      );
      b.addExpression(
        refer('context').property('router').property('mount').call([
          literalString('/v1alpha1/auth/'),
          refer(r'$cloudAuth').property('handler'),
        ]),
      );
      b.addExpression(
        refer('context').property('put').call([
          refer(
            'CelestCloudAuth',
            'package:celest_cloud_auth/celest_cloud_auth.dart',
          ).property('contextKey'),
          refer(r'$cloudAuth'),
        ]),
      );
    });
  }

  Method get _startMethod => Method(
    (m) => m
      ..name = 'start'
      ..returns = DartTypes.core.future(DartTypes.core.void$)
      ..modifier = MethodModifier.async
      // ..requiredParameters.addAll([
      //   if (projectType == CelestProjectType.flutter)
      //     Parameter(
      //       (p) => p
      //         ..name = 'rootIsolateToken'
      //         ..type = DartTypes.flutter.rootIsolateToken,
      //     ),
      // ])
      ..body = Block((b) {
        // if (projectType == CelestProjectType.flutter) {
        //   b.addExpression(
        //     DartTypes.flutter.backgroundIsolateBinaryMessenger
        //         .property('ensureInitialized')
        //         .call([refer('rootIsolateToken')]),
        //   );
        // }
        b.addExpression(
          DartTypes.celest.serve.call([], {
            'targets': literalMap(
              targets.map((route, reference) {
                return MapEntry(
                  literalString(route),
                  reference.newInstance([]),
                );
              }),
            ),
            'setup': _setupCallback.closure,
          }).awaited,
        );
      }),
  );

  List<Method> get body => [_mainMethod, _startMethod];

  Library generate() => Library((library) => library.body.addAll(body));

  Database? get _cloudAuthDatabase {
    if (project.auth?.providers.isEmpty ?? true) {
      return null;
    }
    final databases = project.databases.values.toList(growable: false);
    if (databases.isEmpty) {
      return null;
    }
    for (final database in databases) {
      final schema = database.schema;
      if (schema is DriftDatabaseSchema) {
        final declaration = schema.declaration;
        if (declaration.symbol == 'CloudAuthDatabase') {
          return database;
        }
      }
      if (database.dartName == 'cloudAuth' ||
          database.name == 'CloudAuthDatabase') {
        return database;
      }
    }
    if (databases.length == 1) {
      return databases.single;
    }
    return null;
  }

  String _studioPath(Database database) {
    final segment = database.name.paramCase;
    return '/_admin/studio/$segment';
  }
}
