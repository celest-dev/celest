import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/src/cli/stop_signal.dart';
import 'package:celest_cli/src/commands/cloud/cloud_command.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/repositories/organization_repository.dart';
import 'package:celest_cli/src/repositories/project_environment_repository.dart';
import 'package:celest_cli/src/repositories/project_repository.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/recase.dart';
import 'package:celest_cloud/src/proto.dart' as pb;
import 'package:logging/logging.dart';

mixin CloudRepository {
  Logger get logger;
  StopSignal get stopSignal;

  OrganizationRepository get organizations => OrganizationRepository(cloud);

  ProjectRepository get projects => ProjectRepository(cloud);

  ProjectEnvironmentRepository get projectEnvironments =>
      ProjectEnvironmentRepository(cloud);

  /// Returns the primary organization for the current user, if any.
  Future<pb.Organization?> get primaryOrganization async {
    final organization = await organizations.primary;
    switch (organization?.state) {
      case null:
        return null;
      case pb.LifecycleState.ACTIVE ||
            pb.LifecycleState.CREATING ||
            pb.LifecycleState.UPDATING:
        return organization;
      case pb.LifecycleState.DELETING || pb.LifecycleState.DELETED:
        throw StateError('Organization has been deleted');
      case pb.LifecycleState.CREATION_FAILED ||
            pb.LifecycleState.UPDATE_FAILED ||
            pb.LifecycleState.DELETION_FAILED:
        throw StateError('Organization is in a failed state');
      case pb.LifecycleState.LIFECYCLE_STATE_UNSPECIFIED:
      default:
        throw StateError('Organization is in an unknown state');
    }
  }

  Future<pb.Organization> createPrimaryOrg({
    ast.Region? primaryRegion,
  }) async {
    var organizationDisplayName = '';
    do {
      organizationDisplayName = cliLogger.prompt(
        'What should we call your organization?',
      );
      if (organizationDisplayName.isEmpty) {
        cliLogger.warn('Organization name cannot be empty.');
      }
    } while (organizationDisplayName.isEmpty);

    final organizationId = organizationDisplayName.paramCase;
    final progress = cliLogger.progress(
      'Creating organization $organizationId',
    );
    try {
      final operation = cloud.organizations.create(
        organizationId: organizationId,
        organization: pb.Organization(
          displayName: organizationDisplayName,
          primaryRegion: switch (primaryRegion) {
            ast.Region.europe => pb.Region.EUROPE,
            ast.Region.asiaPacific => pb.Region.ASIA_PACIFIC,
            ast.Region.northAmerica => pb.Region.NORTH_AMERICA,
            null => pb.Region.REGION_UNSPECIFIED,
            _ => unreachable('Unsupported region: $primaryRegion'),
          },
        ),
      );
      final waiter = CloudCliOperation(
        operation,
        resourceType: 'organization',
        logger: logger,
      );
      final organization = await waiter.run(
        verbs: const (
          run: 'create',
          running: 'Creating',
          completed: 'created',
        ),
        cancelTrigger: stopSignal.future,
        resource: pb.Organization(),
      );
      logger.fine('Created organization: $organization');
      progress.complete('Created organization $organizationId');
      return organization;
    } on Object catch (e, st) {
      logger.fine('Failed to create organization', e, st);
      progress.fail('Failed to create organization');
      rethrow;
    }
  }

  /// Ensures the creation of the current user's primary organization.
  Future<pb.Organization> ensurePrimaryOrg() async {
    final primaryOrg = await primaryOrganization;
    if (primaryOrg != null) {
      logger.finest('Primary organization: ${primaryOrg.name}');
      return primaryOrg;
    }
    cliLogger.success('Welcome to Celest Cloud!');
    return createPrimaryOrg();
  }
}
