import 'dart:collection';

import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/src/codegen/cloud/cloud_client_types.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
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
    (m) =>
        m
          ..name = 'main'
          ..returns = DartTypes.core.future(DartTypes.core.void$)
          ..modifier = MethodModifier.async
          ..body = Code.scope(
            (alloc) => switch (project.sdkConfig.targetSdk) {
              SdkType.dart => '''
return start();
''',

              // TODO(dnys1): No longer possible with stateful isolates (WS/SSE).
              //                   '''
              // await Future.wait(eagerError: true, [
              //   for (var i = 0; i < ${alloc(DartTypes.io.platform)}.numberOfProcessors; i++)
              //     ${alloc(DartTypes.isolate.isolate)}.run(start),
              // ]);
              // ''',
              SdkType.flutter => '''
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
            (p) =>
                p
                  ..name = 'context'
                  ..type = DartTypes.celest.context,
          ),
        )
        ..modifier = MethodModifier.async
        ..body = _init;
    });
  }

  Block get _init {
    return Block((b) {
      final database = project.databases.values.singleOrNull;
      if (database == null) {
        return;
      }

      final config = database.config as CelestDatabaseConfig;
      b.addExpression(
        declareFinal(database.dartName).assign(
          refer(
                'CelestDatabase',
                'package:celest/src/runtime/data/celest_database.dart',
              )
              .property('create')
              .call(
                [refer('context')],
                {
                  'name': literalString(
                    database.name,
                    raw: database.name.contains(r'$'),
                  ),
                  'factory': database.schema.declaration.property('new'),
                  'hostnameVariable': DartTypes.celest.environmentVariable
                      .constInstance([literalString(config.hostname.name)]),
                  'tokenSecret': DartTypes.celest.secret.constInstance([
                    literalString(config.token.name),
                  ]),
                },
              )
              .awaited,
        ),
      );
      b.addExpression(
        refer('context').property('put').call([
          refer(
            'CelestData',
            CloudPaths.data.toString(),
          ).property('${database.dartName}\$Key'),
          refer(database.dartName).property('connect').call([]).awaited,
        ]),
      );

      final hasCloudAuth = project.auth?.providers.isNotEmpty ?? false;
      if (hasCloudAuth) {
        b.addExpression(
          declareFinal(r'$cloudAuth').assign(
            refer(
              'CelestCloudAuth',
              'package:celest_cloud_auth/celest_cloud_auth.dart',
            ).property('create').call([], {
              'database': refer(
                'celest',
                CloudPaths.client.toString(),
              ).property('data').property(database.dartName),
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
      }

      // Create the DB studio
      // TODO(dnys1): Consider adding this production where it should work even
      // without Cloud Auth.
      b.statements.add(
        Block((b) {
          b.addExpression(
            declareFinal(r'$studio').assign(
              refer(database.dartName).property('createStudio').call([]),
            ),
          );
          b.addExpression(
            refer('context').property('router').property('mount').call([
              literalString('/_admin/studio'),
              refer(r'$studio').property('call'),
            ]),
          );
        }).wrapWithBlockIf(
          refer('context')
              .property('environment')
              .equalTo(DartTypes.celest.environment.property('local')),
        ),
      );
    });
  }

  Method get _startMethod => Method(
    (m) =>
        m
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
}
