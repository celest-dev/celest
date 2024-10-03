import 'dart:convert';

import 'package:celest_cloud/src/cloud/base/base_protocol.dart';
import 'package:celest_cloud/src/cloud/cloud.dart';
import 'package:celest_cloud/src/cloud/subscriptions/subscriptions_protocol.dart';
import 'package:celest_cloud/src/proto/celest/cloud/v1alpha1/subscriptions.pb.dart';
import 'package:http/http.dart' as http;

final class SubscriptionsProtocolHttp
    with BaseProtocol
    implements SubscriptionsProtocol {
  SubscriptionsProtocolHttp({
    required Uri uri,
    http.Client? httpClient,
  })  : _client = httpClient ?? http.Client(),
        _baseUri = uri;

  final http.Client _client;
  final Uri _baseUri;

  @override
  Future<CancelSubscriptionResponse> cancel(
    CancelSubscriptionRequest request,
  ) async {
    final path = '/v1alpha1/${request.name}:cancel';
    final uri = _baseUri.replace(path: path);
    final req = http.Request('POST', uri)
      ..headers['accept'] = 'application/json'
      ..body = jsonEncode(
        request.toProto3Json(
          typeRegistry: CelestCloud.typeRegistry,
        ),
      );
    final res = await _client.send(req);
    final body = await res.stream.bytesToString();
    if (res.statusCode != 200) {
      httpError(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return CancelSubscriptionResponse()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
      );
  }

  @override
  Future<ChangePlanResponse> changePlan(ChangePlanRequest request) async {
    final path = '/v1alpha1/${request.name}:changePlan';
    final uri = _baseUri.replace(path: path);
    final req = http.Request('POST', uri)
      ..headers['accept'] = 'application/json'
      ..body = jsonEncode(
        request.toProto3Json(
          typeRegistry: CelestCloud.typeRegistry,
        ),
      );
    final res = await _client.send(req);
    final body = await res.stream.bytesToString();
    if (res.statusCode != 200) {
      httpError(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return ChangePlanResponse()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
      );
  }

  @override
  Future<Subscription> get(GetSubscriptionRequest request) async {
    final path = '/v1alpha1/${request.name}';
    final uri = _baseUri.replace(path: path);
    final req = http.Request('GET', uri)
      ..headers['accept'] = 'application/json';
    final res = await _client.send(req);
    final body = await res.stream.bytesToString();
    if (res.statusCode != 200) {
      httpError(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return Subscription()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
      );
  }

  @override
  Future<PauseSubscriptionResponse> pause(
    PauseSubscriptionRequest request,
  ) async {
    final path = '/v1alpha1/${request.name}:pause';
    final uri = _baseUri.replace(path: path);
    final req = http.Request('POST', uri)
      ..headers['accept'] = 'application/json'
      ..body = jsonEncode(
        request.toProto3Json(
          typeRegistry: CelestCloud.typeRegistry,
        ),
      );
    final res = await _client.send(req);
    final body = await res.stream.bytesToString();
    if (res.statusCode != 200) {
      httpError(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return PauseSubscriptionResponse()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
      );
  }

  @override
  Future<DescribePricingResponse> describePricing(
    DescribePricingRequest request,
  ) async {
    const path = '/v1alpha1/subscriptions:describePricing';
    final uri = _baseUri.replace(
      path: path,
      queryParameters: {
        if (request.currencyCode.isNotEmpty)
          'currencyCode': request.currencyCode,
        if (request.regionCode.isNotEmpty) 'regionCode': request.regionCode,
      },
    );
    final req = http.Request('GET', uri)
      ..headers['accept'] = 'application/json';
    final res = await _client.send(req);
    final body = await res.stream.bytesToString();
    if (res.statusCode != 200) {
      httpError(
        statusCode: res.statusCode,
        body: body,
      );
    }
    return DescribePricingResponse()
      ..mergeFromProto3Json(
        jsonDecode(body),
        typeRegistry: CelestCloud.typeRegistry,
      );
  }
}
