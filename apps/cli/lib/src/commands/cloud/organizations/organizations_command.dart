import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/commands/cloud/organizations/create_organization_command.dart';
import 'package:celest_cli/src/commands/cloud/organizations/delete_organization_command.dart';
import 'package:celest_cli/src/commands/cloud/organizations/get_organization_command.dart';
import 'package:celest_cli/src/commands/cloud/organizations/list_organizations_command.dart';
import 'package:celest_cli/src/commands/cloud/organizations/update_organization_command.dart';

final class OrganizationsCommand extends CelestCommand {
  OrganizationsCommand() {
    addSubcommand(CreateOrganizationCommand());
    addSubcommand(UpdateOrganizationCommand());
    addSubcommand(GetOrganizationCommand());
    addSubcommand(ListOrganizationsCommand());
    addSubcommand(DeleteOrganizationCommand());
  }

  @override
  String get description => 'Create and manage Celest Cloud organizations.';

  @override
  String get name => 'organizations';

  @override
  String get category => 'Cloud';

  @override
  bool get hidden => true;
}
