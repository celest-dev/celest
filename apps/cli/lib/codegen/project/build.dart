import 'package:celest_cli/codegen/types.dart';
import 'package:celest_cli/project/paths.dart';
import 'package:code_builder/code_builder.dart';

class ProjectBuildGenerator {
  ProjectBuildGenerator({
    required this.projectReference,
    required this.projectPaths,
  });

  final Reference projectReference;
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
// ignore: invalid_use_of_internal_member
final project = ${alloc(DartTypes.celest.runWithContext)}(context, () {
  final widgets = ${alloc(_allResourcesRef)}.map((widget) => widget.toProto());
  return ${alloc(projectReference)}.toProto()..widgets.addAll(widgets);
});
sendPort.send(project.writeToBuffer());
''',
          ),
      );

  Library generate() => Library((library) {
        library.body.add(_mainMethod);
      });
}
