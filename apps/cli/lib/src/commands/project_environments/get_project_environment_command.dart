import 'package:celest_cli/src/commands/cloud_command.dart';
import 'package:celest_cli/src/context.dart' show cloud;
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
  ProjectEnvironment createEmptyResource() => ProjectEnvironment();

  @override
  Future<ProjectEnvironment?> callService() {
    return cloud.projects.environments.get(options.resourceId);
  }
}
