import 'package:api_celest/api_celest.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';

abstract base class BillingCommand extends CelestCommand {
  @override
  String get category => 'Subscription';

  late final billingClient = BillingClient(
    secureStorage: secureStorage,
    httpClient: httpClient,
    baseUri: baseUri,
  );
}
