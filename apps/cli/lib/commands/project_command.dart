import 'package:celest_cli/commands/project_init.dart';
import 'package:celest_cli/config/celest_config.dart';
import 'package:celest_cli/database/database.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:meta/meta.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

abstract base class ProjectCommand extends CelestCommand with Configure {
  @override
  String get category => 'Project';

  /// The global database for Celest projects.
  late final database = CelestDatabase(CelestConfig.instance);

  @override
  @mustCallSuper
  Future<int> run() async {
    await super.run();

    await configure();

    // Ensure existing projects are in DB
    if (isExistingProject) {
      final celestPubspec = Pubspec.parse(
        fileSystem
            .file(p.join(projectPaths.projectRoot, 'pubspec.yaml'))
            .readAsStringSync(),
      );
      logger.finest('Checking if project existings in DB...');
      final dbProject =
          await database.findProjectByPath(projectPaths.projectRoot);
      logger.finest('Found project in DB: $dbProject');
      if (dbProject == null) {
        logger.finest('Creating project in DB...');
        await database.createProject(
          ProjectsCompanion.insert(
            name: celestPubspec.name,
            path: projectPaths.projectRoot,
          ),
        );
        logger.finest('Created project in DB');
      }
    }

    return 0;
  }
}
