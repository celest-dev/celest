import 'package:celest_cli/src/commands/celest_command.dart';
import 'package:celest_cli/src/commands/organizations/create_organization_command.dart';
import 'package:celest_cli/src/commands/organizations/delete_organization_command.dart';
import 'package:celest_cli/src/commands/organizations/get_organization_command.dart';
import 'package:celest_cli/src/commands/organizations/list_organizations_command.dart';
import 'package:celest_cli/src/commands/organizations/update_organization_command.dart';

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
