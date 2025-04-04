import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/init/project_init.dart';
import 'package:celest_cli/src/init/project_migration.dart';
import 'package:celest_cli/src/init/project_migrator.dart';
import 'package:celest_cli/src/project/celest_project.dart';
import 'package:pub_semver/pub_semver.dart';

base mixin Migrate on Configure {
  Future<ProjectMigrationResult> migrateProject({
    required ParentProject? parentProject,
    required Version? upgradeFromVersion,
  }) async {
    logger.finest('Migrating project at "${projectPaths.projectRoot}"...');
    return performance.trace('Migrate', 'migrateProject', () async {
      final result = await ProjectMigrator(
        parentProject: parentProject,
        projectRoot: projectPaths.projectRoot,
        projectName: celestProject.projectName,
        upgradeFromVersion: upgradeFromVersion,
      ).migrate();
      logger.fine('Project migration result: $result');
      return result;
    });
  }
}
