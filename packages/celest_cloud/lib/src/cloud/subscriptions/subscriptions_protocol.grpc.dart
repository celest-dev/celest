import 'package:celest_cloud/src/cloud/subscriptions/subscriptions_protocol.dart';
import 'package:celest_cloud/src/grpc.dart';
import 'package:grpc/grpc.dart';

final class SubscriptionsProtocolGrpc implements SubscriptionsProtocol {
  SubscriptionsProtocolGrpc(
    ClientChannel channel, {
    List<ClientInterceptor>? interceptors,
  }) : _client = SubscriptionsClient(channel, interceptors: interceptors);

  final SubscriptionsClient _client;

  @override
  Future<CancelSubscriptionResponse> cancel(CancelSubscriptionRequest request) {
    return _client.cancelSubscription(request);
  }

  @override
  Future<ChangePlanResponse> changePlan(ChangePlanRequest request) {
    return _client.changePlan(request);
  }

  @override
  Future<Subscription> get(GetSubscriptionRequest request) {
    return _client.getSubscription(request);
  }

  @override
  Future<PauseSubscriptionResponse> pause(PauseSubscriptionRequest request) {
    return _client.pauseSubscription(request);
  }

  @override
  Future<DescribePricingResponse> describePricing(
    DescribePricingRequest request,
  ) {
    return _client.describePricing(request);
  }
}
