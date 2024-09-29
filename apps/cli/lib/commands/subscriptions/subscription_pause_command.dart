import 'dart:async';

import 'package:celest_auth/celest_auth.dart';
import 'package:celest_cli/auth/cli_auth.dart';
import 'package:celest_cli/commands/authenticate.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:celest_cloud/celest_cloud.dart' show Subscription_State;
import 'package:intl/intl.dart' as intl;

final class SubscriptionPauseCommand extends CelestCommand with Authenticate {
  @override
  String get name => 'pause';

  @override
  String get description => 'Pause your subscription to Celest Cloud.';

  static final _dateFormat = intl.DateFormat('yyyy-MM-dd');
  static final _prettyDateFormat = intl.DateFormat.yMMMMd();

  @override
  Future<int> run() async {
    await super.run();

    if (await authenticate() case final code when code != 0) {
      return code;
    }
    final state = await auth.authStateChanges.first as Authenticated;
    final user = state.user;

    DateTime? resumeTime;
    while (true) {
      final resumeTimeInput = cliLogger.prompt(
        'When would you like to resume? (YYYY-MM-DD or empty for indefinite)',
      );
      if (resumeTimeInput case '' || 'indefinite') {
        break;
      }
      resumeTime = _dateFormat.tryParse(resumeTimeInput);
      if (resumeTime == null) {
        cliLogger.err('Invalid date format. Please use YYYY-MM-DD.');
      } else if (resumeTime.isBefore(DateTime.now())) {
        cliLogger.err('Resume date must be in the future.');
      } else {
        break;
      }
    }

    final response = await cloud.subscriptions.pause(
      name: 'users/${user.userId}/subscription',
      resumeTime: resumeTime?.toUtc(),
    );
    switch (response.subscription.whichState()) {
      case Subscription_State.paused:
        final message = switch (resumeTime) {
          final resumeTime? => 'Your subscription has been paused until '
              '${_prettyDateFormat.format(resumeTime)}.',
          _ => 'Your subscription has been paused indefinitely.',
        };
        cliLogger.success(message);
        return 0;
      default:
        cliLogger.warn(
          'Your subscription could not be canceled. Please contact '
          'support@celest.dev to resolve this issue.',
        );
        cliLogger.info('We apologize for the inconvenience.');
        performance.captureError(
          StateError(
            'Unexpected subscription state (${response.subscription.whichState()}): '
            '$response',
          ),
        );
        return 1;
    }
  }
}
