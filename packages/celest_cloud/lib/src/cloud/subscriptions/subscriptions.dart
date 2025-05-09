import 'package:celest_cloud/src/cloud/base/base_service.dart';
import 'package:celest_cloud/src/cloud/subscriptions/subscriptions_protocol.dart';
import 'package:celest_cloud/src/proto.dart' as pb;
import 'package:celest_cloud/src/proto.dart';
import 'package:celest_core/celest_core.dart';
import 'package:logging/logging.dart';

final class Subscriptions with BaseService {
  Subscriptions({required SubscriptionsProtocol protocol, this.logger})
    : _protocol = protocol;

  @override
  final Logger? logger;
  final SubscriptionsProtocol _protocol;

  Future<Subscription?> get(String name) async {
    try {
      final request = GetSubscriptionRequest(name: name);
      return await run(
        'Subscriptions.Get',
        request: request,
        action: _protocol.get,
      );
    } on NotFoundException {
      return null;
    }
  }

  Future<ChangePlanResponse> changePlan({
    required String name,
    required SubscriptionPlan plan,
    Uri? redirectUri,
  }) async {
    final request = ChangePlanRequest(
      name: name,
      redirectUri: redirectUri?.toString(),
    );
    plan._changePlan(request);
    return run(
      'Subscriptions.ChangePlan',
      request: request,
      action: _protocol.changePlan,
    );
  }

  Future<PauseSubscriptionResponse> pause({
    required String name,
    DateTime? resumeTime,
  }) {
    final request = PauseSubscriptionRequest(
      name: name,
      resumeTime: resumeTime?.toProto(),
    );
    return run(
      'Subscriptions.Pause',
      request: request,
      action: _protocol.pause,
    );
  }

  Future<CancelSubscriptionResponse> cancel({
    required String name,
    CancelSubscriptionDetails? details,
  }) {
    final request = CancelSubscriptionRequest(name: name, details: details);
    return run(
      'Subscriptions.Cancel',
      request: request,
      action: _protocol.cancel,
    );
  }

  Future<DescribePricingResponse> describePricing({
    String? regionCode,
    String? currencyCode,
  }) {
    final request = DescribePricingRequest(
      regionCode: regionCode,
      currencyCode: currencyCode,
    );
    return run(
      'Subscriptions.DescribePricing',
      request: request,
      action: _protocol.describePricing,
    );
  }
}

sealed class SubscriptionPlan {
  const SubscriptionPlan();

  void _changePlan(ChangePlanRequest request);
}

final class CommunitySubscriptionPlan implements SubscriptionPlan {
  const CommunitySubscriptionPlan();

  @override
  void _changePlan(ChangePlanRequest request) {
    request.community = pb.CommunitySubscriptionPlan();
  }
}

final class BuilderSubscriptionPlan implements SubscriptionPlan {
  const BuilderSubscriptionPlan({
    this.currencyCode,
    required this.instanceType,
  });

  final String? currencyCode;
  final pb.InstanceType instanceType;

  @override
  void _changePlan(ChangePlanRequest request) {
    request.builder = pb.BuilderSubscriptionPlan(
      currencyCode: currencyCode,
      instanceType: instanceType,
    );
  }
}
