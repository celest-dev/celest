import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/cloud_command.dart';
import 'package:celest_cloud/celest_cloud.dart';

final class ListProjectEnvironmentsCommand
    extends CloudListCommand<ProjectEnvironment> {
  @override
  String get name => 'list';

  @override
  String get description => 'Lists environments in a Celest Cloud project.';

  @override
  String get resourceType => 'ProjectEnvironment';

  @override
  String? get parentResourceType => 'Project';

  @override
  Future<CloudListResult<ProjectEnvironment>> callService() async {
    final result = await cloud.projects.environments.list(
      parent: options.parentResourceId,
      filter: options.filter,
      orderBy: options.orderBy,
      pageSize: options.pageSize,
    );
    return (
      items: result.projectEnvironments,
      nextPageToken: result.hasNextPageToken() ? result.nextPageToken : null,
    );
  }
}
