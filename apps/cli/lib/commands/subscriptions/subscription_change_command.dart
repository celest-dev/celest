import 'dart:async';
import 'dart:io';

import 'package:celest_cli/commands/authenticate.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:celest_cloud/celest_cloud.dart'
    show InstanceType, Subscription_State;
import 'package:celest_cloud/src/cloud/subscriptions/subscriptions.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

extension InstanceTypeDisplay on InstanceType {
  String get displayString => switch (this) {
        InstanceType.INSTANCE_TYPE_UNSPECIFIED => 'Free',
        InstanceType.MICRO => 'Micro (2 CPU/1GB RAM)',
        InstanceType.SMALL => 'Small (2 CPU/2GB RAM)',
        InstanceType.MEDIUM => 'Medium (2 CPU/4GB RAM)',
        InstanceType.LARGE => 'Large (2 CPU/8GB RAM)',
        InstanceType.QUAD => 'Quad (4 CPU/16GB RAM)',
        InstanceType.OCTA => 'Octo (8 CPU/32GB RAM)',
        InstanceType.HEXA => 'Hexa (16 CPU/64GB RAM)',
        final unhandled => unreachable('Unhandled instance type: $unhandled'),
      };
}

final class SubscriptionChangeCommand extends CelestCommand with Authenticate {
  @override
  String get name => 'change';

  @override
  String get description => 'Change your subscription to Celest Cloud.';

  @override
  Future<int> run() async {
    await super.run();

    final user = await authenticateUser();
    if (user == null) {
      cliLogger.err('You must be signed in to subscribe to Celest Cloud.');
      cliLogger.err('Please run `celest auth login` to sign in.');
      return 1;
    }

    final currentSubscription = await cloud.subscriptions.get(
      'users/${user.userId}/subscription',
    );
    if (currentSubscription == null) {
      cliLogger.err('You are currently not subscribed to Celest Cloud.');
      cliLogger.err('Please run `celest subscribe` to subscribe.');
      return 1;
    }

    final instanceType = cliLogger.chooseOne(
      'Select your instance type:',
      choices: [
        InstanceType.INSTANCE_TYPE_UNSPECIFIED,
        for (final instanceType in InstanceType.values)
          if (instanceType != InstanceType.INSTANCE_TYPE_UNSPECIFIED)
            instanceType,
      ],
      defaultValue: currentSubscription.builder.instanceType,
      display: (instanceType) => instanceType.displayString,
    );

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
      final response = await cloud.subscriptions.changePlan(
        name: 'users/${user.userId}/subscription',
        plan: switch (instanceType) {
          InstanceType.INSTANCE_TYPE_UNSPECIFIED =>
            const CommunitySubscriptionPlan(),
          final instanceType =>
            BuilderSubscriptionPlan(instanceType: instanceType),
        },
        redirectUri: Uri(
          scheme: 'http',
          host: 'localhost',
          port: server.port,
        ),
      );
      switch (response.subscription.whichState()) {
        case Subscription_State.active:
          break;
        case Subscription_State.paymentRequired:
          var paymentLink = Uri.parse(
            response.subscription.paymentRequired.paymentUri,
          );
          paymentLink = paymentLink.replace(
            queryParameters: {
              ...paymentLink.queryParameters,
              'utm_source': 'cli',
              'utm_medium': 'cli',
              'utm_campaign': 'subscribe',
            },
          );
          logger.finest('Launching payment link: $paymentLink');

          final launchedUrl = await launchUrl(paymentLink);
          if (!launchedUrl) {
            analytics.capture('launch_url_failed');
            cliLogger
              ..info(
                'Please open the following link in your browser to subscribe:',
              )
              ..info(paymentLink.toString());
          } else {
            analytics.capture('launch_url_succeeded');
            cliLogger.info('Please complete the sign up in your browser.');
          }

          await subscribeCompletion.future;
        case Subscription_State.notSet:
          throw StateError('Invalid subscription state (notSet): $response');
        case Subscription_State.canceled:
        case Subscription_State.paused:
        case Subscription_State.suspended:
          throw UnimplementedError();
      }
      cliLogger.success(
        'Your subscription to Celest Cloud was successful! '
        'Welcome aboard! 🚀',
      );
    } finally {
      await server.close(force: true);
    }

    return 0;
  }
}
