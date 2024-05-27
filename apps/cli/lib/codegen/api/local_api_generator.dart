import 'dart:collection';

import 'package:celest_cli/src/types/dart_types.dart';
import 'package:code_builder/code_builder.dart';

class LocalApiGenerator {
  LocalApiGenerator({
    required Map<String, Reference> targets,
  }) :
        // Provides consistent ordering which helps with codegen diffing.
        // TODO(dnys1): Order by API then definition order.
        targets = SplayTreeMap.of(targets);

  final SplayTreeMap<String, Reference> targets;

  Method get _mainMethod => Method(
        (m) => m
          ..name = 'main'
          ..returns = DartTypes.core.future(DartTypes.core.void$)
          ..modifier = MethodModifier.async
          ..body = Code.scope(
            (alloc) => '''
await Future.wait([
  for (var i = 0; i < ${alloc(DartTypes.io.platform)}.numberOfProcessors; i++)
    ${alloc(DartTypes.isolate.isolate)}.run(start),
]);
''',
          ),
      );

  Method get _startMethod => Method(
        (m) => m
          ..name = 'start'
          ..returns = DartTypes.core.future(DartTypes.core.void$)
          ..modifier = MethodModifier.async
          ..body = Block((b) {
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

  Library generate() => Library((library) {
        library.body.add(_mainMethod);
        library.body.add(_startMethod);
      });
}
