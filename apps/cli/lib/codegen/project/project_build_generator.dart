import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:code_builder/code_builder.dart';

class ProjectBuildGenerator {
  ProjectBuildGenerator({
    required this.projectReference,
  });

  final Reference projectReference;

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
final projectBin = ${alloc(DartTypes.path.join)}(
  context.buildDir,
  '${p.basename(projectPaths.projectBuildBin)}',
);
${alloc(DartTypes.io.file)}(projectBin)
  ..createSync()
  ..writeAsBytesSync(project.writeToBuffer(), flush: true);
''',
          ),
      );

  Library generate() => Library((library) {
        library.body.add(_mainMethod);
      });
}
