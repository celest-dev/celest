import 'dart:io';

import 'package:analyzer/src/dart/analysis/byte_store.dart';
import 'package:analyzer/src/dart/element/inheritance_manager3.dart';
import 'package:celest_cli/src/analytics/interface.dart';
import 'package:celest_cli/src/analytics/noop.dart';
import 'package:celest_cli/src/commands/auth/cli_auth.dart';
import 'package:celest_cli/src/database/cache/cache_database.dart';
import 'package:celest_cli/src/database/project/project_database.dart';
import 'package:celest_cli/src/logging/cli_logger.dart';
import 'package:celest_cli/src/performance/local_perf.dart';
import 'package:celest_cli/src/process/logging_process_manager.dart';
import 'package:celest_cli/src/project/celest_project.dart';
import 'package:celest_cli/src/project/project_paths.dart';
import 'package:celest_cli/src/serialization/json_generator.dart';
import 'package:celest_cli/src/storage/storage.dart';
import 'package:celest_cli/src/types/type_helper.dart';
import 'package:celest_cloud/celest_cloud.dart';
import 'package:celest_core/_internal.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http;
import 'package:http/retry.dart' as http;
import 'package:io/ansi.dart' show ansiOutputEnabled;
import 'package:logging/logging.dart';
import 'package:mason_logger/mason_logger.dart' as mason_logger;
import 'package:meta/meta.dart';
import 'package:native_storage/native_storage.dart';
import 'package:path/path.dart' as path;
import 'package:platform/platform.dart';
import 'package:process/process.dart';

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
final CelestCloud cloud = CelestCloud.http(
  baseUri,
  authenticator: authenticator,
  httpClient: httpClient,
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
  var celestLocalPath = platform.environment['CELEST_LOCAL_PATH'];
  if (celestLocalPath != null) {
    celestLocalPath = p.canonicalize(p.normalize(celestLocalPath));
    if (fileSystem.directory(celestLocalPath).existsSync()) {
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

/// The identifier for the current CLI environment.
///
/// This should be used in Sentry/PostHog to identify events.
const String kCliEnvironment = kReleaseMode ? 'release' : 'debug';

/// Whether the current terminal supports ANSI output.
///
/// See: https://bixense.com/clicolors/
bool get ansiColorsEnabled {
  if (platform.environment.containsKey('NO_COLOR')) {
    return false;
  }
  if (platform.environment.containsKey('CLICOLOR_FORCE')) {
    return true;
  }
  return ansiOutputEnabled;
}

/// The base URL for the Celest control plane.
Uri baseUri = Uri.parse(
  platform.environment['CELEST_API_URI'] ?? 'https://cloud-hub.fly.dev',
);

/// Global CLI (mason) logger.
///
/// Set by [Cli.configure].
mason_logger.Logger cliLogger = CliLogger();

/// Global CLI log level.
///
/// Set by [Cli.configure].
Level kCliLogLevel = Level.INFO;

/// Global verbosity setting.
///
/// Set by [Cli.configure].
late bool verbose;

/// Whether Celest is being tested.
///
/// Defaults to `false`.
bool kCelestTest = false;

/// Global HTTP client.
///
/// Set by [Cli.configure].
http.Client httpClient = http.RetryClient(
  http.IOClient(
    HttpClient()
      ..userAgent = 'Celest/CLI'
      ..connectionTimeout = const Duration(seconds: 4),
  ),
  whenError: (e, _) => e is SocketException,
);

/// Global analytics instance.
///
/// Set by [Cli.configure].
Analytics analytics = const NoopAnalytics();

/// Global performance tracker.
///
/// Set by [Cli.configure].
CelestPerformance performance = const CelestPerformance();

/// Global process manager.
///
/// Set by [Cli.configure].
ProcessManager processManager = const LoggingProcessManager();

/// Global file system interface.
///
/// Set by [Cli.configure].
FileSystem fileSystem = const LocalFileSystem();

/// Global local file system.
FileSystem get localFileSystem => const LocalFileSystem();

/// Global path context.
path.Context get p => localFileSystem.path;

/// Global platform.
///
/// Set by [Cli.configure].
Platform platform = const LocalPlatform();

/// Global storage interface.
///
/// Set by [Cli.configure].
Storage storage = Storage();

/// Global secure storage interface.
///
/// Set by [Cli.configure].
NativeSecureStorage secureStorage = storage.secure;

/// The isolated [secureStorage] interface.
IsolatedNativeStorage get isolatedSecureStorage => secureStorage.isolated;
