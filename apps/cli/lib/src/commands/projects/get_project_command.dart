import 'package:celest_cli/src/commands/cloud_command.dart';
import 'package:celest_cli/src/context.dart' show cloud;
import 'package:celest_cloud/celest_cloud.dart';

final class GetProjectCommand extends CloudGetCommand<Project> {
  @override
  String get name => 'get';

  @override
  String get description => 'Retrieves a project.';

  @override
  String get resourceType => 'Project';

  @override
  Project createEmptyResource() => Project();

  @override
  Future<Project?> callService() {
    return cloud.projects.get(options.resourceId);
  }
}
