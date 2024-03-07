import 'package:analyzer/src/dart/element/inheritance_manager3.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli/serialization/json_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cli_common/src/context.dart' as ctx;
import 'package:celest_proto/celest_proto.dart';
import 'package:path/path.dart' as path;

export 'package:celest_cli_common/src/context.dart';

extension PlatformContext on path.Context {
  path.Context get url => path.url;
  path.Context get windows => path.windows;
  path.Context get posix => path.posix;
  path.Context get project => path.Context(
        current: projectPaths.projectRoot,
        style: style,
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
  return celestProject.projectPaths;
}

late CelestProject celestProject;
ProjectPaths get projectPaths => celestProject.projectPaths;

// Need a new instance of InheritanceManager3 for each invocation since it
// has a builtin cache.
InheritanceManager3 get inheritanceManager => InheritanceManager3();
final TypeHelper typeHelper = TypeHelper();
final JsonGenerator jsonGenerator = JsonGenerator();

final baseUri = Uri.parse(
  platform.environment['CELEST_API_URI'] ?? 'https://api-preview.celest.dev',
);
DeployClient get deployService => DeployClient(
      secureStorage: ctx.storage,
      baseUri: baseUri,
      httpClient: ctx.httpClient,
    );
