import 'dart:collection';

import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:code_builder/code_builder.dart';

class LocalApiGenerator {
  LocalApiGenerator({
    required this.projectType,
    required Map<String, Reference> targets,
  }) :
        // Provides consistent ordering which helps with codegen diffing.
        // TODO(dnys1): Order by API then definition order.
        targets = SplayTreeMap.of(targets);

  final CelestProjectType projectType;
  final SplayTreeMap<String, Reference> targets;

  Method get _mainMethod => Method(
        (m) => m
          ..name = 'main'
          ..returns = DartTypes.core.future(DartTypes.core.void$)
          ..modifier = MethodModifier.async
          ..body = Code.scope(
            (alloc) => switch (projectType) {
              CelestProjectType.dart => '''
await Future.wait(eagerError: true, [
  for (var i = 0; i < ${alloc(DartTypes.io.platform)}.numberOfProcessors; i++)
    ${alloc(DartTypes.isolate.isolate)}.run(start),
]);
''',
              CelestProjectType.flutter => '''
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
            },
          ),
      );

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
              }).awaited,
            );
          }),
      );

  List<Method> get body => [_mainMethod, _startMethod];

  Library generate() => Library((library) => library.body.addAll(body));
}
