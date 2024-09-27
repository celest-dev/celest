import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/cloud_command.dart';
import 'package:celest_cloud/celest_cloud.dart';

final class CreateProjectCommand extends CloudCreateCommand<Project> {
  @override
  String get description =>
      'Create a new project in a Celest Cloud organization.';

  @override
  String get name => 'create';

  @override
  String get resourceType => 'Project';

  @override
  String? get parentResourceType => 'Organization';

  @override
  Project createEmptyResource() => Project();

  @override
  CloudOperation<Project> callService() {
    return cloud.projects.create(
      parent: options.parent,
      projectId: options.resourceId,
      displayName: options.displayName,
      annotations: options.annotations,
      validateOnly: options.validateOnly,
    );
  }
}
