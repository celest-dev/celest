import 'package:celest_cloud/src/cloud/authentication/authentication_protocol.dart';
import 'package:celest_cloud/src/cloud/authentication/authentication_protocol.grpc.dart';
import 'package:celest_cloud/src/cloud/base/base_grpc_client.dart';
import 'package:celest_cloud/src/cloud/cloud_protocol.dart';
import 'package:celest_cloud/src/cloud/operations/operations_protocol.dart';
import 'package:celest_cloud/src/cloud/operations/operations_protocol.grpc.dart';
import 'package:celest_cloud/src/cloud/organizations/organizations_protocol.dart';
import 'package:celest_cloud/src/cloud/organizations/organizations_protocol.grpc.dart';
import 'package:celest_cloud/src/cloud/projects/projects_protocol.dart';
import 'package:celest_cloud/src/cloud/projects/projects_protocol.grpc.dart';
import 'package:celest_cloud/src/cloud/subscriptions/subscriptions_protocol.dart';
import 'package:celest_cloud/src/cloud/subscriptions/subscriptions_protocol.grpc.dart';
import 'package:celest_cloud/src/cloud/users/users_protocol.dart';
import 'package:celest_cloud/src/cloud/users/users_protocol.grpc.dart';
import 'package:celest_core/_internal.dart';
import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';

final class CloudProtocolGrpc implements CloudProtocol {
  CloudProtocolGrpc({
    required Uri uri,
    required Authenticator authenticator,
    String? userAgent,
    Logger? logger,
  })  : _channel = AuthenticatingGrpcChannel(
          uri.host,
          authenticator: authenticator,
          options: ChannelOptions(
            credentials: uri.scheme == 'http'
                ? const ChannelCredentials.insecure()
                : const ChannelCredentials.secure(),
            userAgent: userAgent ?? 'celest/dart',
          ),
          port: uri.hasPort
              ? uri.port
              : switch (uri.scheme) {
                  'http' => 80,
                  'https' => 443,
                  _ => throw Exception('Unsupported scheme: ${uri.scheme}'),
                },
        ),
        _interceptors = [
          RevokingGrpcInterceptor(
            authenticator: authenticator,
            logger: logger,
          ),
        ];

  final ClientChannel _channel;
  final List<ClientInterceptor> _interceptors;

  @override
  late final AuthenticationProtocol authentication =
      AuthenticationProtocolGrpc(_channel, interceptors: _interceptors);

  @override
  late final OrganizationsProtocol organizations =
      OrganizationsProtocolGrpc(_channel, interceptors: _interceptors);

  @override
  late final OperationsProtocol operations =
      OperationsProtocolGrpc(_channel, interceptors: _interceptors);

  @override
  late final UsersProtocol users =
      UsersProtocolGrpc(_channel, interceptors: _interceptors);

  @override
  late final ProjectsProtocol projects =
      ProjectsProtocolGrpc(_channel, interceptors: _interceptors);

  @override
  late final SubscriptionsProtocol subscriptions =
      SubscriptionsProtocolGrpc(_channel, interceptors: _interceptors);
}
