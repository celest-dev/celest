import 'package:celest_cli/src/commands/cloud_command.dart';
import 'package:celest_cli/src/context.dart' show cloud;
import 'package:celest_cloud/celest_cloud.dart';

final class ListProjectsCommand extends CloudListCommand<Project> {
  @override
  String get name => 'list';

  @override
  String get description => 'Lists projects in an organization.';

  @override
  String get resourceType => 'Project';

  @override
  String? get parentResourceType => 'Organization';

  @override
  Future<CloudListResult<Project>> callService() async {
    final result = await cloud.projects.list(
      parent: options.parentResourceId,
      filter: options.filter,
      orderBy: options.orderBy,
      pageSize: options.pageSize,
      showDeleted: options.showDeleted,
    );
    return (
      items: result.projects,
      nextPageToken: result.hasNextPageToken() ? result.nextPageToken : null,
    );
  }
}
