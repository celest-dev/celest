import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/cloud_command.dart';
import 'package:celest_cloud/celest_cloud.dart';

final class DeleteProjectEnvironmentCommand extends CloudDeleteCommand {
  @override
  String get description => 'Deletes a project environment.';

  @override
  String get name => 'delete';

  @override
  String get resourceType => 'ProjectEnvironment';

  @override
  CloudOperation<Empty> callService() {
    return cloud.projects.environments.delete(
      options.resourceId,
      validateOnly: options.validateOnly,
      allowMissing: options.allowMissing,
      etag: options.etag,
    );
  }
}
