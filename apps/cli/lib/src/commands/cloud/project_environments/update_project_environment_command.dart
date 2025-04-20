import 'package:celest_cli/src/commands/cloud/cloud_command.dart';
import 'package:celest_cli/src/context.dart' show cloud;
import 'package:celest_cloud/celest_cloud.dart';

final class UpdateProjectEnvironmentCommand
    extends CloudUpdateCommand<ProjectEnvironment> {
  @override
  String get description => 'Updates a project environment.';

  @override
  String get name => 'update';

  @override
  String get resourceType => 'ProjectEnvironment';

  @override
  ProjectEnvironment createEmptyResource() => ProjectEnvironment();

  @override
  CloudOperation<ProjectEnvironment> callService() {
    return cloud.projects.environments.update(
      projectEnvironment: ProjectEnvironment(
        name: options.resourceId,
        displayName: options.displayName,
        annotations: options.annotations,
      ),
      allowMissing: options.allowMissing,
      updateMask: FieldMask(
        paths: [
          if (options.wasParsed('display-name')) 'display_name',
          if (options.wasParsed('annotation')) 'annotations',
        ],
      ),
      validateOnly: options.validateOnly,
    );
  }
}
