import 'dart:async';

import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/billing/billing_command.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

final class UnsubscribeCommand extends BillingCommand {
  @override
  String get name => 'unsubscribe';

  @override
  String get description => 'Cancel your subscription to Celest Cloud.';

  @override
  Future<int> run() async {
    await super.run();

    await auth.init();

    final cancelResp = await billingClient.cancelSubscription();
    final portalUrl = cancelResp.portalUrl;

    logger.finest(
      'Opening browser to cancel subscription: $portalUrl',
    );
    final launched = await launchUrl(portalUrl);
    if (!launched) {
      analytics.capture('launch_url_failed');
      cliLogger
        ..info(
          'Please open the following link in your browser to manage '
          'your subscription:',
        )
        ..info(portalUrl.toString());
    } else {
      analytics.capture('launch_url_succeeded');
      cliLogger.info(
        'Please use the customer portal in your browser to cancel your '
        'subscription.',
      );
    }

    return 0;
  }
}
