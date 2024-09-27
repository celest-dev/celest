import 'package:analyzer/src/dart/element/inheritance_manager3.dart';
import 'package:api_celest/api_celest.dart';
import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli/serialization/json_generator.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cli_common/src/context.dart' as ctx;
import 'package:celest_cloud/celest_cloud.dart';
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
  ParentProject? parentProject,
  String? configHome,
  String? outputsDir,
}) async {
  celestProject = await CelestProject.init(
    projectRoot: projectRoot,
    parentProject: parentProject,
    configHome: configHome,
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

DeployClient get deployService => DeployClient(
      nativeStorage: ctx.storage.secure,
      baseUri: ctx.baseUri,
      httpClient: ctx.httpClient,
    );
ProjectClient get projectService => ProjectClient(
      nativeStorage: ctx.storage.secure,
      baseUri: ctx.baseUri,
      httpClient: ctx.httpClient,
    );

final CelestCloud cloud = CelestCloud(
  uri: ctx.baseUri,
  authenticator: authenticator,
  httpClient: ctx.httpClient,
);
