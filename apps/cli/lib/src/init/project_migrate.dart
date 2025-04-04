import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/init/project_init.dart';
import 'package:celest_cli/src/init/project_migrator.dart';
import 'package:celest_cli/src/project/celest_project.dart';

base mixin Migrate on Configure {
  Future<bool> migrateProject({required ParentProject? parentProject}) async {
    logger.finest('Migrating project at "${projectPaths.projectRoot}"...');
    return performance.trace('Migrate', 'migrateProject', () async {
      final result = await ProjectMigrator(
        parentProject: parentProject,
        projectRoot: projectPaths.projectRoot,
        projectName: celestProject.projectName,
      ).migrate();
      logger.fine('Project migration result: $result');
      return result.needsAnalyzerMigration;
    });
  }
}
