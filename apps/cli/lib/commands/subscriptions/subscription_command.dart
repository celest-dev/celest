import 'package:celest_cli/commands/subscriptions/subscription_cancel_command.dart';
import 'package:celest_cli/commands/subscriptions/subscription_change_command.dart';
import 'package:celest_cli/commands/subscriptions/subscription_get_command.dart';
import 'package:celest_cli/commands/subscriptions/subscription_pause_command.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

final class SubscriptionCommand extends CelestCommand {
  SubscriptionCommand() {
    addSubcommand(SubscriptionGetCommand());
    addSubcommand(SubscriptionChangeCommand());
    addSubcommand(SubscriptionPauseCommand());
    addSubcommand(SubscriptionCancelCommand());
  }

  @override
  String get name => 'subscription';

  @override
  String get category => 'Subscription';

  @override
  String get description => 'Manage your Celest Cloud subscription.';
}
