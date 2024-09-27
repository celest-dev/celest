import 'package:args/src/arg_parser.dart';
import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/cloud_command.dart';
import 'package:celest_cloud/celest_cloud.dart';

final class CreateOrganizationCommand extends CloudCreateCommand<Organization> {
  @override
  String get description => 'Create a new Celest Cloud organization.';

  @override
  String get name => 'create';

  @override
  String? get parentResourceType => null;

  @override
  String get resourceType => 'Organization';

  @override
  // ignore: overridden_fields
  late final ArgParser argParser = super.argParser
    ..addOption(
      'primary-region',
      mandatory: true,
      allowed: [
        for (final region in Region.values)
          if (region != Region.REGION_UNSPECIFIED) region.name,
      ],
      help: 'The primary region of the organization',
    );

  @override
  Organization createEmptyResource() => Organization();

  @override
  CloudOperation<Organization> callService() {
    final primaryRegion = Region.values.firstWhere(
      (it) => argResults!.option('primary-region') == it.name,
    );
    return cloud.organizations.create(
      organizationId: options.resourceId,
      organization: Organization(
        annotations: options.annotations,
        displayName: options.displayName,
        primaryRegion: primaryRegion,
      ),
      validateOnly: options.validateOnly,
    );
  }
}
