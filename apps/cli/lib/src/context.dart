import 'package:analyzer/src/dart/analysis/byte_store.dart';
import 'package:analyzer/src/dart/element/inheritance_manager3.dart';
import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/database/cache/cache_database.dart';
import 'package:celest_cli/database/project/project_database.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli/serialization/json_generator.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cli_common/src/context.dart' as ctx;
import 'package:celest_cloud/celest_cloud.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;

export 'package:celest_cli_common/src/context.dart';

extension PlatformContext on path.Context {
  path.Context get url => path.url;
  path.Context get windows => path.windows;
  path.Context get posix => path.posix;
  path.Context get project =>
      path.Context(current: projectPaths.projectRoot, style: style);
}

Future<ProjectPaths> init({
  required String projectRoot,
  ParentProject? parentProject,
  String? configHome,
  String? clientDir,
  String? outputsDir,
  @visibleForTesting CacheDatabase? cacheDb,
  @visibleForTesting ByteStore? byteStore,
  @visibleForTesting ProjectDatabase? projectDb,
}) async {
  celestProject = await CelestProject.init(
    projectRoot: projectRoot,
    parentProject: parentProject,
    configHome: configHome,
    clientDir: clientDir,
    outputsDir: outputsDir,
    // ignore: invalid_use_of_visible_for_testing_member
    cacheDb: cacheDb,
    // ignore: invalid_use_of_visible_for_testing_member
    byteStore: byteStore,
    // ignore: invalid_use_of_visible_for_testing_member
    projectDb: projectDb,
  );
  return celestProject.projectPaths;
}

late CelestProject celestProject;

ProjectPaths? _projectPaths;
ProjectPaths get projectPaths => _projectPaths ?? celestProject.projectPaths;

@visibleForTesting
set projectPaths(ProjectPaths? value) {
  _projectPaths = value;
}

// Need a new instance of InheritanceManager3 for each invocation since it
// has a builtin cache.
InheritanceManager3 get inheritanceManager => InheritanceManager3();
final TypeHelper typeHelper = TypeHelper();
final JsonGenerator jsonGenerator = JsonGenerator();

final Logger _cloudLogger = Logger('Celest.Cloud');
final CelestCloud cloud = CelestCloud(
  uri: ctx.baseUri,
  authenticator: authenticator,
  httpClient: ctx.httpClient,
  logger: Logger.detached('')
    ..onRecord.listen((record) {
      _cloudLogger.finest(record.message, record.error, record.stackTrace);
    }),
);

String? _celestLocalPath;

@visibleForTesting
set celestLocalPath(String? value) {
  _celestLocalPath = value;
}

/// The path to the local checkout of the `celest-dev/celest` repo, if set.
String? get celestLocalPath {
  if (_celestLocalPath case final localPathOverride?) {
    return localPathOverride;
  }
  var celestLocalPath = ctx.platform.environment['CELEST_LOCAL_PATH'];
  if (celestLocalPath != null) {
    celestLocalPath = ctx.p.canonicalize(ctx.p.normalize(celestLocalPath));
    if (ctx.fileSystem.directory(celestLocalPath).existsSync()) {
      Logger.root.finest('Using local Celest at $celestLocalPath');
    } else {
      Logger.root.warning(
        'CELEST_LOCAL_PATH is set to $celestLocalPath, but the directory '
        'does not exist. Ignoring.',
      );
      celestLocalPath = null;
    }
  }
  return celestLocalPath;
}
