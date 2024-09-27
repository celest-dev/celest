import 'package:celest_cli/database/cloud/cloud_database.dart';
import 'package:celest_cli/src/repositories/organization_repository.dart';
import 'package:celest_cloud/celest_cloud.dart' as cloud;
import 'package:logging/logging.dart';

final class ProjectRepository {
  ProjectRepository(this._db, this._cloud);

  final CloudDatabase _db;
  final cloud.CelestCloud _cloud;
  OrganizationRepository get _organizations =>
      OrganizationRepository(_db, _cloud);

  static final _logger = Logger('ProjectRepository');

  Future<Project?> get(String projectIdOrAlias) async {
    final result = await _db.getProject(id: projectIdOrAlias).get();
    if (result.isNotEmpty) {
      return result.single;
    }
    try {
      final cloudPrj = await _cloud.projects.get(
        'projects/$projectIdOrAlias',
      );
      if (cloudPrj != null) {
        return await put(cloudPrj.toDb());
      }
    } on Object catch (e, st) {
      _logger.fine('Failed to fetch project from cloud.', e, st);
    }
    return null;
  }

  Future<Project> put(Project project) async {
    // Ensure org is in cache first.
    await _organizations.get(
      'organizations/${project.organizationId}',
    );
    final result = await _db.upsertProject(
      id: project.id,
      projectId: project.projectId,
      organizationId: project.organizationId,
      displayName: project.displayName,
      region: project.region,
      etag: project.etag,
    );
    return result.single;
  }
}

extension CloudProjectToDB on cloud.Project {
  Project toDb() {
    if (name.split('/') case [..., 'projects', final id]) {
      return Project(
        id: id,
        organizationId: parent.split('/').last,
        projectId: projectId,
        displayName: displayName,
        region: regions.first.name,
        etag: etag,
      );
    }
    throw ArgumentError('Invalid project name: $name');
  }
}
