import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli/serialization/json_generator.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:path/path.dart' as path;

export 'package:celest_cli_common/src/context.dart';

extension PlatformContext on path.Context {
  path.Context get url => path.url;
  path.Context get windows => path.windows;
  path.Context get posix => path.posix;
  path.Context get project => path.Context(
        current: projectPaths.projectRoot,
        style: path.Style.url,
      );
}

Future<ProjectPaths> init({
  required String projectRoot,
  String? outputsDir,
}) async {
  celestProject = await CelestProject.init(
    projectRoot: projectRoot,
    outputsDir: outputsDir,
  );
  return projectPaths = celestProject.projectPaths;
}

late CelestProject celestProject;
late ProjectPaths projectPaths;
final TypeHelper typeHelper = TypeHelper();
final JsonGenerator jsonGenerator = JsonGenerator();
