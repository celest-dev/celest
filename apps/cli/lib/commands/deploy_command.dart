import 'package:celest_cli/commands/project_init.dart';
import 'package:celest_cli/frontend/celest_frontend.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:celest_proto/celest_proto.dart';
import 'package:mason_logger/mason_logger.dart';

final class DeployCommand extends CelestCommand with Configure {
  @override
  String get name => 'deploy';

  @override
  String get description => 'Deploys your Celest project to the cloud.';

  @override
  String get category => 'Project';

  @override
  bool get hidden => true;

  Future<String> _acceptInviteCode(String inviteCode) async {
    final acceptedInvite =
        await deployService.acceptInvite(inviteCode: inviteCode);
    final organizationId = switch (acceptedInvite) {
      DeployAcceptedInvite(:final organizationId) => organizationId,
      DeployFailed(:final error) => throw CelestException(error.message),
      _ => throw StateError('Unexpected response: $acceptedInvite'),
    };
    analytics.capture(
      'accept_invite',
      properties: {
        'organization_id': organizationId,
      },
    );
    await celestProject.config.settings.setOrganizationId(organizationId);
    return organizationId;
  }

  @override
  Future<int> run() async {
    await super.run();
    await configure();

    var organizationId =
        await celestProject.config.settings.getOrganizationId();

    final Progress currentProgress;
    if (organizationId == null) {
      cliLogger.warn(
        'Celest Cloud is currently invite-only. If you have an invite code, '
        'please enter it below.',
      );
      final email = cliLogger.prompt('Invite code:');
      if (email.isEmpty) {
        return 1;
      }
      currentProgress = cliLogger.progress('🔥 Warming up the engines');
      organizationId = await _acceptInviteCode(email);
    } else {
      currentProgress = cliLogger.progress('🔥 Warming up the engines');
    }

    return CelestFrontend().build(
      organizationId: organizationId,
      currentProgress: currentProgress,
    );
  }
}
