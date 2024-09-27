import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/cloud_command.dart';
import 'package:celest_cloud/celest_cloud.dart';

final class GetOrganizationCommand extends CloudGetCommand<Organization> {
  @override
  String get description => 'Gets an organization.';

  @override
  String get name => 'get';

  @override
  String get resourceType => 'Organization';

  @override
  Future<Organization?> callService() {
    return cloud.organizations.get(options.resourceId);
  }
}
