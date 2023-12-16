import 'dart:collection';

import 'package:celest_cli/src/types/dart_types.dart';
import 'package:code_builder/code_builder.dart';

class LocalApiGenerator {
  LocalApiGenerator({
    required Map<String, Reference> targets,
  }) :
        // Provides consistent ordering which helps with codegen diffing.
        // TODO: Order by API then definition order.
        targets = SplayTreeMap.of(targets);

  final SplayTreeMap<String, Reference> targets;

  Method get _mainMethod => Method(
        (m) => m
          ..name = 'main'
          ..returns = DartTypes.core.void$
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
              }),
            );
          }),
      );

  Library generate() => Library((library) {
        library.body.add(_mainMethod);
      });
}
