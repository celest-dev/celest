import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/cloud_command.dart';
import 'package:celest_cloud/celest_cloud.dart';

final class DeleteOrganizationCommand extends CloudDeleteCommand {
  @override
  String get name => 'delete';

  @override
  String get description => 'Marks an organization for deletion.';

  @override
  String get resourceType => 'Organization';

  @override
  CloudOperation<Empty> callService() {
    return cloud.organizations.delete(
      options.resourceId,
      allowMissing: options.allowMissing,
      etag: options.etag,
      force: options.force,
      validateOnly: options.validateOnly,
    );
  }
}
