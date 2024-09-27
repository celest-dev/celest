import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/cloud_command.dart';
import 'package:celest_cloud/celest_cloud.dart';

final class UpdateProjectCommand extends CloudUpdateCommand<Project> {
  @override
  String get description => 'Updates a project.';

  @override
  String get name => 'update';

  @override
  String get resourceType => 'Project';

  @override
  Project createEmptyResource() => Project();

  @override
  CloudOperation<Project> callService() {
    return cloud.projects.update(
      project: Project(
        name: options.resourceId,
        annotations: options.annotations,
        displayName: options.displayName,
      ),
      updateMask: FieldMask(
        paths: [
          if (options.wasParsed('display-name')) 'display_name',
          if (options.wasParsed('annotation')) 'annotations',
        ],
      ),
      allowMissing: false,
      validateOnly: options.validateOnly,
    );
  }
}
