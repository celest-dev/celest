import 'dart:collection';

import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/codegen/cloud/cloud_client_types.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:code_builder/code_builder.dart';

class LocalApiGenerator {
  LocalApiGenerator({
    required this.project,
    required Map<String, Reference> targets,
  }) :
        // Provides consistent ordering which helps with codegen diffing.
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
            (p) => p
              ..name = 'context'
              ..type = DartTypes.celest.context,
          ),
        )
        ..modifier = MethodModifier.async
        ..body = Block((b) {
          if (project.databases.isNotEmpty) {
            b.addExpression(
              CloudClientTypes.dataClass.ref
                  .property('init')
                  .call([refer('context')]).awaited,
            );
          }
          if (project.auth?.providers.isNotEmpty ?? false) {
            b.addExpression(
              CloudClientTypes.authClass.ref
                  .property('init')
                  .call([refer('context')]).awaited,
            );
          }
        });
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
}
