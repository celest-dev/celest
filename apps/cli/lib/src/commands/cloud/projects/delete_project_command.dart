import 'package:celest_cli/src/commands/cloud/cloud_command.dart';
import 'package:celest_cli/src/context.dart' show cloud;
import 'package:celest_cloud/celest_cloud.dart';

final class DeleteProjectCommand extends CloudDeleteCommand<Project> {
  @override
  String get name => 'delete';

  @override
  String get description => 'Marks a project for deletion.';

  @override
  String get resourceType => 'Project';

  @override
  Project createEmptyResource() => Project();

  @override
  CloudOperation<Project> callService() {
    return cloud.projects.delete(
      options.resourceId,
      validateOnly: options.validateOnly,
      force: options.force,
      allowMissing: options.allowMissing,
      etag: options.etag,
    );
  }
}
