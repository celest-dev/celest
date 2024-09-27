import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/cloud_command.dart';
import 'package:celest_cloud/celest_cloud.dart';

final class GetProjectEnvironmentCommand
    extends CloudGetCommand<ProjectEnvironment> {
  @override
  String get description => 'Retrieves a project environment.';

  @override
  String get name => 'get';

  @override
  String get resourceType => 'ProjectEnvironment';

  @override
  Future<ProjectEnvironment?> callService() {
    return cloud.projects.environments.get(options.resourceId);
  }
}
