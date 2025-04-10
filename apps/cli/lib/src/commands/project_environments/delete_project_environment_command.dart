import 'package:celest_cli/src/commands/cloud_command.dart';
import 'package:celest_cli/src/context.dart' show cloud;
import 'package:celest_cloud/celest_cloud.dart';

final class DeleteProjectEnvironmentCommand
    extends CloudDeleteCommand<ProjectEnvironment> {
  @override
  String get description => 'Deletes a project environment.';

  @override
  String get name => 'delete';

  @override
  String get resourceType => 'ProjectEnvironment';

  @override
  ProjectEnvironment createEmptyResource() => ProjectEnvironment();

  @override
  CloudOperation<ProjectEnvironment> callService() {
    return cloud.projects.environments.delete(
      options.resourceId,
      validateOnly: options.validateOnly,
      allowMissing: options.allowMissing,
      etag: options.etag,
    );
  }
}
