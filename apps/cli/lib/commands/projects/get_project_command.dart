import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/cloud_command.dart';
import 'package:celest_cloud/celest_cloud.dart';

final class GetProjectCommand extends CloudGetCommand<Project> {
  @override
  String get name => 'get';

  @override
  String get description => 'Retrieves a project.';

  @override
  String get resourceType => 'Project';

  @override
  Future<Project?> callService() {
    return cloud.projects.get(options.resourceId);
  }
}
