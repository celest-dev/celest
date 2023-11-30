import 'package:celest_cli/codegen/types.dart';
import 'package:code_builder/code_builder.dart';

class ProjectBuildGenerator {
  ProjectBuildGenerator(this.projectType);

  final Reference projectType;

  Method get _mainMethod => Method(
        (m) => m
          ..name = 'main'
          ..returns = DartTypes.core.void$
          ..requiredParameters.addAll([
            Parameter(
              (p) => p
                ..name = 'args'
                ..type = DartTypes.core.list(DartTypes.core.string),
            ),
            Parameter(
              (p) => p
                ..name = 'sendPort'
                ..type = DartTypes.isolate.sendPort,
            ),
          ])
          ..body = Block((b) {
            b
              ..addExpression(
                declareFinal('project').assign(projectType.newInstance([])),
              )
              ..addExpression(
                declareFinal('context').assign(
                  DartTypes.celest.projectContext.newInstance([
                    DartTypes.celest.buildEnvironment
                        .newInstanceNamed('fromArgs', [refer('args')]),
                  ]),
                ),
              )
              ..statements.add(
                const Code('// ignore: invalid_use_of_internal_member'),
              )
              ..addExpression(
                declareFinal('resources').assign(
                  refer('context').property('build').call([refer('project')]),
                ),
              )
              ..addExpression(
                refer('sendPort').property('send').call([
                  refer('resources').property('writeToBuffer').call([]),
                ]),
              );
          }),
      );

  Library generate() => Library((library) {
        library.body.add(_mainMethod);
      });
}
