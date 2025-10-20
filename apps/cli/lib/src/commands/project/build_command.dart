import 'package:celest_cli/src/commands/auth/authenticate.dart';
import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/frontend/celest_frontend.dart';
import 'package:celest_cli/src/init/project_init.dart';
import 'package:celest_cli/src/init/project_migrate.dart';
import 'package:mason_logger/src/mason_logger.dart';

typedef BuildInvoker =
    Future<int> Function({
      required bool migrateProject,
      required Progress currentProgress,
      required String environmentId,
    });

final class BuildCommand extends CelestCommand
    with Configure, Migrate, Authenticate {
  BuildCommand({
    BuildInvoker? buildInvoker,
    Future<bool> Function()? configureOverride,
  }) : _buildInvoker = buildInvoker,
       _configureOverride = configureOverride {
    argParser.addOption(
      'environment',
      abbr: 'e',
      help: 'Target project environment identifier.',
      valueHelp: 'ENV_ID',
      defaultsTo: 'production',
    );
  }

  @override
  String get name => 'build';

  @override
  String get description => 'Builds your Celest project for hosting.';

  @override
  String get category => 'Project';

  final BuildInvoker? _buildInvoker;
  final Future<bool> Function()? _configureOverride;

  @override
  Progress? currentProgress;

  String get _environmentId {
    final value = argResults?.option('environment')?.trim();
    return (value == null || value.isEmpty) ? 'production' : value;
  }

  @override
  Future<int> run() async {
    await super.run();

    final needsMigration = _configureOverride != null
        ? await _configureOverride()
        : await configure();
    final progress = cliLogger.progress('Building project');
    final invokeBuild =
        _buildInvoker ??
        ({
          required bool migrateProject,
          required Progress currentProgress,
          required String environmentId,
        }) {
          return CelestFrontend(stopSignal: stopSignal).build(
            migrateProject: migrateProject,
            currentProgress: currentProgress,
            environmentId: environmentId,
          );
        };

    return invokeBuild(
      migrateProject: needsMigration,
      currentProgress: progress,
      environmentId:
          _environmentId, // Default remains production unless overridden.
    );
  }
}
