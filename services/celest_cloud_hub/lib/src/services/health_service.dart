import 'package:cedar/cedar.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud_hub/src/gateway/gateway_handler.dart';
import 'package:celest_cloud_hub/src/proto/health/v1/health.pbgrpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:grpc/src/server/call.dart';
import 'package:shelf/shelf.dart';

final class HealthService extends HealthServiceBase {
  static const String apiId = 'grpc.health.v1.Health';
  static const EntityUid apiUid = EntityUid.of('Celest::Api', apiId);

  static final ResolvedApi api = ResolvedApi(
    apiId: apiId,
    functions: {
      'Check': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'Check',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(method: 'GET', path: '/v1/healthz'),
        ),
      ),
    },
    policySet: PolicySet(
      templateLinks: [
        TemplateLink(
          templateId: 'cloud.functions.public',
          newId: apiId,
          values: {SlotId.resource: apiUid},
        ),
      ],
    ),
  );

  static final Map<String, GatewayHandler> $handlers = {
    'Check': _CheckHandler(),
  };

  @override
  Future<HealthCheckResponse> check(
    ServiceCall call,
    HealthCheckRequest request,
  ) async {
    return HealthCheckResponse(
      status: HealthCheckResponse_ServingStatus.SERVING,
    );
  }

  @override
  Stream<HealthCheckResponse> watch(
    ServiceCall call,
    HealthCheckRequest request,
  ) {
    throw GrpcError.unimplemented('Watch is not implemented');
  }
}

final class _CheckHandler extends GatewayHandler {
  _CheckHandler()
    : super(
        requestType: HealthCheckRequest(),
        responseType: HealthCheckResponse(),
      );

  @override
  Future<HealthCheckRequest> deserializeRequest(
    Request request,
    Map<String, String> routeParameters,
  ) async {
    final req = HealthCheckRequest();
    if (request.url.queryParameters['service'] case final service?) {
      req.service = service;
    }
    return req;
  }
}
