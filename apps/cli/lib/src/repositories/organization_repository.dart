import 'package:celest_cloud/celest_cloud.dart' as cloud;
import 'package:logging/logging.dart';

final class OrganizationRepository {
  OrganizationRepository(this._cloud);

  final cloud.CelestCloud _cloud;

  static final _logger = Logger('OrganizationRepository');

  Future<cloud.Organization?> get(String organizationIdOrAlias) async {
    try {
      _logger.finest('Resolving organization in cloud: $organizationIdOrAlias');
      final cloudOrg = await _cloud.organizations.get(
        'organizations/$organizationIdOrAlias',
      );
      return cloudOrg;
    } on Object catch (e, st) {
      _logger.fine('Failed to fetch organization from cloud.', e, st);
    }
    return null;
  }

  Future<cloud.Organization?> get primary async {
    try {
      final cloudOrgs = await _cloud.organizations.list();
      if (cloudOrgs.organizations.isNotEmpty) {
        return cloudOrgs.organizations.first;
      }
    } on Object catch (e, st) {
      _logger.fine('Failed to fetch organizations from cloud.', e, st);
    }
    return null;
  }
}
