import 'package:celest_cli/src/repositories/organization_repository.dart';
import 'package:celest_cloud/celest_cloud.dart' as cloud;
import 'package:logging/logging.dart';

extension type ProjectRepository(cloud.CelestCloud _cloud) {
  OrganizationRepository get _organizations => OrganizationRepository(_cloud);

  static final _logger = Logger('ProjectRepository');

  Future<cloud.Project?> get(String projectIdOrAlias) async {
    try {
      _logger.finest('Resolving project alias in cloud: $projectIdOrAlias');
      final organization = await _organizations.primary;
      if (organization == null) {
        _logger.finest('No primary organization found');
        return null;
      }
      _logger.finest('Primary organization: ${organization.name}');
      final cloudPrj = await _cloud.projects.get(
        '${organization.name}/projects/$projectIdOrAlias',
      );
      if (cloudPrj == null) {
        _logger.finest('Project not found in cloud: $projectIdOrAlias');
        return null;
      }
      _logger.finest('Project found in cloud: ${cloudPrj.name}');
      return cloudPrj;
    } on Object catch (e, st) {
      _logger.fine('Failed to fetch project from cloud.', e, st);
    }
    return null;
  }
}
