import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli/serialization/json_generator.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:path/path.dart' as path;

path.Context get p => fileSystem.path;

extension PlatformContext on path.Context {
  path.Context get url => path.url;
  path.Context get windows => path.windows;
  path.Context get posix => path.posix;
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
