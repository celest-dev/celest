import 'package:celest_cli/database/cloud/cloud_database.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cloud/celest_cloud.dart' as cloud;
import 'package:logging/logging.dart';

final class ProjectEnvironmentRepository {
  ProjectEnvironmentRepository(this._db, this._cloud);

  final CloudDatabase _db;
  final cloud.CelestCloud _cloud;

  static final _logger = Logger('ProjectEnvironmentRepository');

  Future<ProjectEnvironment?> get(
    String environmentIdOrAlias, {
    required String projectId,
  }) async {
    final result =
        await _db.listProjectEnvironments(projectId: projectId).get();
    if (result.isNotEmpty) {
      return result.firstWhere(
        (env) =>
            env.environmentId == environmentIdOrAlias ||
            env.id == environmentIdOrAlias,
      );
    }
    try {
      final cloudEnv = await _cloud.projects.environments.get(
        'projects/$projectId/environments/$environmentIdOrAlias',
      );
      if (cloudEnv != null) {
        return await put(cloudEnv.toDb());
      }
    } on Object catch (e, st) {
      _logger.fine('Failed to fetch project environment from cloud.', e, st);
    }
    return null;
  }

  Future<ProjectEnvironment> put(ProjectEnvironment project) async {
    final result = await _db.upsertProjectEnvironment(
      id: project.id,
      projectId: project.projectId,
      environmentId: project.environmentId,
      displayName: project.displayName,
      etag: project.etag,
    );
    return result.single;
  }

  Future<ProjectEnvironmentConfigData> getConfig(
    String environmentIdOrAlias, {
    required String projectId,
  }) async {
    final env = await get(
      environmentIdOrAlias,
      projectId: projectId,
    );
    if (env == null) {
      throw ArgumentError(
        'Project environment not found: $environmentIdOrAlias',
      );
    }
    final db = await _db
        .getProjectEnvironmentConfig(environmentId: env.id)
        .getSingle();
    return ProjectEnvironmentConfigData(
      environmentId: env.id,
      baseUri: db.baseUri,
      databaseHost: db.databaseHost,
      databaseTokenRef:
          (await isolatedSecureStorage.read(db.databaseTokenRef))!,
    );
  }

  Future<ProjectEnvironmentConfigData> putConfig({
    required String environmentId,
    required String baseUri,
    required String host,
    required String token,
  }) async {
    final env = await _db.getProjectEnvironment(id: environmentId).getSingle();
    final tokenRef = 'projects/${env.projectId}/environments/$environmentId';
    await isolatedSecureStorage.write(tokenRef, token);
    final result = await _db.upsertProjectEnvironmentConfig(
      environmentId: environmentId,
      baseUri: baseUri,
      databaseHost: host,
      databaseTokenRef: tokenRef,
    );
    return result.single;
  }
}

extension CloudProjectEnvironmentToDB on cloud.ProjectEnvironment {
  ProjectEnvironment toDb() {
    if (name.split('/') case [..., 'environments', final id]) {
      return ProjectEnvironment(
        id: id,
        projectId: parent.split('/').last,
        environmentId: projectEnvironmentId,
        displayName: displayName,
        etag: etag,
      );
    }
    throw ArgumentError('Invalid project environment name: $name');
  }
}
