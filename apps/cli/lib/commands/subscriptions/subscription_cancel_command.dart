import 'dart:async';

import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/authenticate.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:celest_cloud/celest_cloud.dart';

final class SubscriptionCancelCommand extends CelestCommand with Authenticate {
  @override
  String get name => 'cancel';

  @override
  String get description => 'Cancel your subscription to Celest Cloud.';

  @override
  Future<int> run() async {
    await super.run();

    final user = await assertAuthenticated();

    final feedback = cliLogger.chooseOne(
      "What's your main reason for canceling?",
      choices: CancelSubscriptionDetails_Feedback.values,
      display: (choice) => switch (choice) {
        CancelSubscriptionDetails_Feedback.CUSTOMER_SERVICE =>
          'Lack of support',
        CancelSubscriptionDetails_Feedback.LOW_QUALITY => 'Quality issues',
        CancelSubscriptionDetails_Feedback.MISSING_FEATURES =>
          'Missing features',
        CancelSubscriptionDetails_Feedback.SWITCHED_SERVICE =>
          'Switched to another service',
        CancelSubscriptionDetails_Feedback.TOO_COMPLEX => 'Too complex',
        CancelSubscriptionDetails_Feedback.TOO_EXPENSIVE => 'Too expensive',
        CancelSubscriptionDetails_Feedback.UNUSED => 'Not using it',
        CancelSubscriptionDetails_Feedback.OTHER => 'Other',
        CancelSubscriptionDetails_Feedback.FEEDBACK_UNSPECIFIED =>
          'Prefer not to say',
        final unhandled => unreachable('Unhandled choice: $unhandled'),
      },
    );

    String? comment;
    if (feedback != CancelSubscriptionDetails_Feedback.FEEDBACK_UNSPECIFIED) {
      comment = cliLogger.prompt('What could we have done better?');
    }

    final cancelResp = await cloud.subscriptions.cancel(
      name: 'users/${user.userId}/subscription',
      details: CancelSubscriptionDetails(
        reason: CancelSubscriptionDetails_Reason.CANCELLATION_REQUESTED,
        feedback: feedback,
        comment: comment,
      ),
    );
    switch (cancelResp.subscription.whichState()) {
      case Subscription_State.canceled:
        cliLogger.success('Your subscription has been canceled.');
        return 0;
      default:
        cliLogger.warn(
          'Your subscription could not be canceled. Please contact '
          'support@celest.dev to resolve this issue.',
        );
        cliLogger.info('We apologize for the inconvenience.');
        performance.captureError(
          StateError(
            'Unexpected subscription state (${cancelResp.subscription.whichState()}): '
            '$cancelResp',
          ),
        );
        return 1;
    }
  }
}
