import 'dart:async';
import 'dart:io';

import 'package:celest_cli/commands/authenticate.dart';
import 'package:celest_cli/commands/subscriptions/subscription_change_command.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:celest_cloud/celest_cloud.dart';
import 'package:intl/intl.dart';

final class SubscriptionDescribeCommand extends CelestCommand
    with Authenticate {
  @override
  String get name => 'describe';

  @override
  String get description => 'Shows your current subscription to Celest Cloud.';

  @override
  Future<int> run() async {
    await super.run();

    final user = await authenticateUser();
    if (user == null) {
      cliLogger.err('You must be logged in to view your subscription.');
      return 1;
    }

    final subscription = await cloud.subscriptions.get(
      'users/${user.userId}/subscription',
    );
    if (subscription == null ||
        subscription.whichState() == Subscription_State.canceled) {
      cliLogger.info('You do not have an active subscription.');
      return 0;
    }

    stdout.writeln('Status: ${subscription.stateDisplayString}');
    stdout.writeln('Plan: ${subscription.planDisplayString}');

    stdout.writeln(subscription);
    return 0;
  }
}

extension on Subscription {
  static final _prettyDateFormat = DateFormat.yMMMMd();

  String get stateDisplayString {
    switch (whichState()) {
      case Subscription_State.active:
        return 'Active';
      case Subscription_State.canceled:
        return 'Canceled';
      case Subscription_State.paused:
        if (paused.hasResumeTime()) {
          final resumeTime = paused.resumeTime.toDateTime(toLocal: true);
          if (resumeTime.isAfter(DateTime.now())) {
            return 'Paused until ${_prettyDateFormat.format(resumeTime)}';
          }
        }
        return 'Paused indefinitely';
      case Subscription_State.paymentRequired:
        return 'Payment required';
      case Subscription_State.suspended:
        if (suspended.reason.isNotEmpty) {
          return 'Suspended (${suspended.reason})';
        }
        return 'Suspended';
      case Subscription_State.notSet:
        return 'Unknown';
    }
  }

  String get planDisplayString {
    switch (whichPlan()) {
      case Subscription_Plan.community:
        return 'Community';
      case Subscription_Plan.builder:
        final instanceType = builder.instanceType;
        return 'Builder - ${instanceType.displayString}';
      case Subscription_Plan.enterprise:
        return 'Enterprise';
      case Subscription_Plan.notSet:
        return 'Unknown';
    }
  }
}
