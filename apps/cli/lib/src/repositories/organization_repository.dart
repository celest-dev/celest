import 'package:celest_cli/database/cloud/cloud_database.dart';
import 'package:celest_cloud/celest_cloud.dart' as cloud;
import 'package:logging/logging.dart';

final class OrganizationRepository {
  OrganizationRepository(this._db, this._cloud);

  final CloudDatabase _db;
  final cloud.CelestCloud _cloud;

  static final _logger = Logger('OrganizationRepository');

  Future<Organization?> get(String organizationIdOrAlias) async {
    final result = await _db.getOrganization(id: organizationIdOrAlias).get();
    if (result.isNotEmpty) {
      return result.single;
    }
    try {
      final cloudOrg = await _cloud.organizations.get(
        'organizations/$organizationIdOrAlias',
      );
      if (cloudOrg != null) {
        return await put(cloudOrg.toDb());
      }
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

  Future<Organization> put(Organization organization) async {
    final result = await _db.upsertOrganization(
      id: organization.id,
      organizationId: organization.organizationId,
      displayName: organization.displayName,
      primaryRegion: organization.primaryRegion,
      etag: organization.etag,
    );
    return result.single;
  }
}

extension CloudOrganizationToDB on cloud.Organization {
  Organization toDb() => Organization(
        id: name.split('/').last,
        organizationId: organizationId,
        displayName: displayName,
        primaryRegion: primaryRegion.name,
        etag: etag,
      );
}
