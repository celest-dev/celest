import 'package:celest_cli/src/commands/cloud_command.dart';
import 'package:celest_cli/src/context.dart' show cloud;
import 'package:celest_cloud/celest_cloud.dart';

final class CreateProjectEnvironmentCommand
    extends CloudCreateCommand<ProjectEnvironment> {
  @override
  String get description =>
      'Create a new environment in a Celest Cloud project.';

  @override
  String get name => 'create';

  @override
  String get resourceType => 'ProjectEnvironment';

  @override
  String? get parentResourceType => 'Project';

  @override
  ProjectEnvironment createEmptyResource() => ProjectEnvironment();

  @override
  CloudOperation<ProjectEnvironment> callService() async* {
    yield* cloud.projects.environments.create(
      parent: options.parent,
      projectEnvironmentId: options.resourceId,
      displayName: options.displayName,
      annotations: options.annotations,
      validateOnly: options.validateOnly,
    );
  }
}
