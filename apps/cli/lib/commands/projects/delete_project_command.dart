import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/cloud_command.dart';
import 'package:celest_cloud/celest_cloud.dart';

final class DeleteProjectCommand extends CloudDeleteCommand {
  @override
  String get name => 'delete';

  @override
  String get description => 'Marks a project for deletion.';

  @override
  String get resourceType => 'Project';

  @override
  CloudOperation<Empty> callService() {
    return cloud.projects.delete(
      options.resourceId,
      validateOnly: options.validateOnly,
      force: options.force,
      allowMissing: options.allowMissing,
      etag: options.etag,
    );
  }
}
