import 'package:celest_cloud/src/proto.dart';

abstract interface class SubscriptionsProtocol {
  Future<Subscription> get(GetSubscriptionRequest request);
  Future<ChangePlanResponse> changePlan(ChangePlanRequest request);
  Future<PauseSubscriptionResponse> pause(PauseSubscriptionRequest request);
  Future<CancelSubscriptionResponse> cancel(CancelSubscriptionRequest request);
  Future<DescribePricingResponse> describePricing(
    DescribePricingRequest request,
  );
}
