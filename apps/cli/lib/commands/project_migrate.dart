import 'package:celest_cli/commands/project_init.dart';
import 'package:celest_cli/init/project_migrator.dart';
import 'package:celest_cli/src/context.dart';

base mixin Migrate on Configure {
  Future<void> migrateProject() async {
    logger.finest(
      'Migrating project at "${projectPaths.projectRoot}"...',
    );
    await performance.trace('StartCommand', 'migrateProject', () async {
      // TODO(dnys1): Improve this logic. Save in YAML?
      final project = await celestProject.database.findProjectByPath(
        projectPaths.projectRoot,
      );
      final projectName = project?.name;
      await ProjectMigrator(
        appRoot: projectPaths.appRoot,
        projectRoot: projectPaths.projectRoot,
        projectName: projectName,
      ).migrate();
    });
  }
}
