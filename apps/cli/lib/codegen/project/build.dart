import 'package:celest_cli/codegen/types.dart';
import 'package:celest_cli/project/paths.dart';
import 'package:code_builder/code_builder.dart';

class ProjectBuildGenerator {
  ProjectBuildGenerator({
    required this.projectPaths,
  });

  final ProjectPaths projectPaths;

  late final _allResourcesRef = refer('all', projectPaths.resourcesDart);

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
          ..body = Code.scope(
            (alloc) => '''
final context = ${alloc(DartTypes.celest.projectContext)}(
  ${alloc(DartTypes.celest.buildEnvironment)}.fromArgs(args),
);
final widgets = ${alloc(DartTypes.celest.cloudWidgetSet)}();
// ignore: invalid_use_of_internal_member
final project = context.build((context) {
  widgets.addAll(${alloc(_allResourcesRef)}.map((widget) => widget.toProto()));
});
widgets.addAll(project.widgets);
project.widgets
  ..clear()
  ..addAll(widgets);
sendPort.send(project.writeToBuffer());
''',
          ),
      );

  Library generate() => Library((library) {
        library.body.add(_mainMethod);
      });
}
