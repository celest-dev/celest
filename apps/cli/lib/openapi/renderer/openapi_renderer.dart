import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/src/utils/error.dart';
import 'package:lib_openapi/lib_openapi.dart';

/// Renders an OpenAPI V3 document for a Celest [project].
class OpenApiRenderer {
  OpenApiRenderer({
    required this.project,
    required this.resolvedProject,
  });

  final ast.Project project;
  final ast.ResolvedProject resolvedProject;

  final _builder = OpenApiDocumentBuilder();

  OpenApiDocument render() {
    // `info`
    _builder.info
      ..title = project.name
      ..apiVersion = 'v1';

    // `servers`
    _builder.servers.add(
      OpenApiServer(
        url: '/',
      ),
    );

    // `components`

    // `paths`

    TODO();
  }
}
