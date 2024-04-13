import 'dart:async';
import 'dart:io';

import 'package:api_celest/api_celest.dart';
import 'package:celest_cli/commands/authenticate.dart';
import 'package:celest_cli/commands/billing/billing_command.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

final class SubscribeCommand extends BillingCommand with Authenticate {
  @override
  String get name => 'subscribe';

  @override
  String get description => 'Subscribe to Celest Cloud.';

  @override
  Future<int> run() async {
    await super.run();

    if (await authenticate() case final code when code != 0) {
      return code;
    }

    final subscribeCompletion = Completer<void>.sync();
    final server = await shelf_io.serve(
      (request) async {
        if (subscribeCompletion.isCompleted) {
          performance.captureError(
            Exception(
              'Multiple calls to subscription listener: ${request.url}',
            ),
          );
          return Response.internalServerError();
        }
        if (request.url.queryParameters['error'] case final error?) {
          subscribeCompletion.completeError(
            CelestException(
              'The subscription could not be completed. '
              'Please contact us before trying again.',
              additionalContext: {'error': error},
            ),
          );
        } else {
          subscribeCompletion.complete();
        }
        return Response.ok(null);
      },
      InternetAddress.anyIPv4,
      0,
    );

    try {
      final response = await billingClient.subscribe(
        tier: OrganizationTier.solo,
        deviceId: secureStorage.deviceId,
        redirectUri: Uri(
          scheme: 'http',
          host: 'localhost',
          port: server.port,
        ),
      );
      var paymentLink = response.checkoutUrl;
      paymentLink = paymentLink.replace(
        queryParameters: {
          ...paymentLink.queryParameters,
          'utm_source': 'cli',
          'utm_medium': 'cli',
          'utm_campaign': 'subscribe',
          'client_reference_id': secureStorage.deviceId,
        },
      );
      logger.finest('Launching payment link: $paymentLink');

      final launchedUrl = await launchUrl(paymentLink);
      if (!launchedUrl) {
        analytics.capture('launch_url_failed');
        cliLogger
          ..info('Please open the following link in your browser to subscribe:')
          ..info(paymentLink.toString());
      } else {
        analytics.capture('launch_url_succeeded');
        cliLogger.info('Please complete the sign up in your browser.');
      }

      await subscribeCompletion.future;

      cliLogger.success(
        'Your subscription to Celest Cloud was successful! Welcome aboard! 🚀',
      );
    } finally {
      await server.close(force: true);
    }

    return 0;
  }
}
