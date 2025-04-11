import 'package:celest_cloud/celest_cloud.dart' as cloud;
import 'package:logging/logging.dart';

final class ProjectEnvironmentRepository {
  ProjectEnvironmentRepository(this._cloud);

  final cloud.CelestCloud _cloud;

  static final _logger = Logger('ProjectEnvironmentRepository');

  Future<cloud.ProjectEnvironment?> get(
    String environmentIdOrAlias, {
    required String projectId,
  }) async {
    try {
      final cloudEnv = await _cloud.projects.environments.get(
        'projects/$projectId/environments/$environmentIdOrAlias',
      );
      return cloudEnv;
    } on Object catch (e, st) {
      _logger.fine('Failed to fetch project environment from cloud.', e, st);
    }
    return null;
  }
}
