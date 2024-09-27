import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/cloud_command.dart';
import 'package:celest_cloud/celest_cloud.dart';

final class ListOrganizationsCommand extends CloudListCommand<Organization> {
  @override
  String get description => 'Lists organizations.';

  @override
  String get name => 'list';

  @override
  String get resourceType => 'Organization';

  @override
  String? get parentResourceType => null;

  @override
  Future<CloudListResult<Organization>> callService() async {
    final result = await cloud.organizations.list(
      filter: options.filter,
      orderBy: options.orderBy,
      pageSize: options.pageSize,
      showDeleted: options.showDeleted,
    );
    return (
      items: result.organizations,
      nextPageToken: result.hasNextPageToken() ? result.nextPageToken : null,
    );
  }
}
