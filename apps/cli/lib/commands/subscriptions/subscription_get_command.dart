import 'dart:async';
import 'dart:io';

import 'package:celest_cli/commands/authenticate.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

final class SubscriptionGetCommand extends CelestCommand with Authenticate {
  @override
  String get name => 'get';

  @override
  String get description => 'Gets the current subscription to Celest Cloud.';

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
    if (subscription == null) {
      cliLogger.info('You do not have an active subscription.');
      return 0;
    }
    stdout.writeln(subscription);
    return 0;
  }
}
