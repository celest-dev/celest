import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/cloud_command.dart';
import 'package:celest_cloud/celest_cloud.dart';

final class UpdateOrganizationCommand extends CloudUpdateCommand<Organization> {
  @override
  String get description => 'Updates an organization.';

  @override
  String get name => 'update';

  @override
  String get resourceType => 'Organization';

  @override
  Organization createEmptyResource() => Organization();

  @override
  CloudOperation<Organization> callService() {
    return cloud.organizations.update(
      organization: Organization(
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
