import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud/celest_cloud.dart' as pb show Region;
import 'package:celest_cloud_hub/src/database/cloud_hub_database.dart';
import 'package:celest_cloud_hub/src/database/schema/project_environments.drift.dart';
import 'package:celest_cloud_hub/src/deploy/turso/turso_api_client.dart';
import 'package:celest_cloud_hub/src/model/regions.dart';
import 'package:logging/logging.dart';

final class TursoDeploymentEngine {
  TursoDeploymentEngine({
    required this.db,
    required this.region,
    required this.turso,
    required this.projectAst,
  });

  final CloudHubDatabase db;
  final pb.Region region;
  final TursoApiClient turso;
  final ResolvedProject projectAst;

  static final Logger _logger = Logger('TursoDeploymentEngine');

  Future<(ProjectEnvironmentState, TursoDatabase)> deploy(
    ProjectEnvironmentState currentState,
    TursoDatabase? database,
  ) async {
    if (database != null) {
      return (currentState, database);
    }

    // Only lowercase letters, numbers, and dashes are allowed.
    final projectId = projectAst.projectId.replaceAll(
      RegExp(r'[^a-z0-9]'),
      '-',
    );
    final environmentId = currentState.projectEnvironmentId.replaceAll(
      '_',
      '-',
    );

    final databaseName = '$projectId-$environmentId';
    final databaseGroup = region.tursoGroup;
    _logger.info(
      'Creating Turso database: $databaseName in group "$databaseGroup"',
    );
    final tursoDatabase = await turso.createDatabase(
      name: databaseName,
      group: databaseGroup,
      sizeLimit: '1gb',
    );
    final token = await turso.createDatabaseToken(
      databaseName: tursoDatabase.name,
    );

    return db.transaction(() async {
      final database = (await db.projectEnvironmentsDrift.createTursoDatabase(
        databaseName: databaseName,
        databaseGroup: databaseGroup,
        databaseUrl: 'libsql://${tursoDatabase.hostname}',
        databaseToken: token,
      )).first;
      currentState =
          (await db.projectEnvironmentsDrift.upsertProjectEnvironmentState(
            projectEnvironmentId: currentState.projectEnvironmentId,
            tursoDatabaseName: database.databaseName,
          )).first;

      return (currentState, database);
    });
  }
}
