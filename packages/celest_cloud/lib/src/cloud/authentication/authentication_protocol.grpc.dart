import 'package:celest_cloud/src/cloud/authentication/authentication_protocol.dart';
import 'package:celest_cloud/src/proto/celest/cloud/auth/v1alpha1/authentication.pbgrpc.dart';
import 'package:grpc/grpc.dart';

final class AuthenticationProtocolGrpc implements AuthenticationProtocol {
  AuthenticationProtocolGrpc(
    ClientChannel channel, {
    List<ClientInterceptor>? interceptors,
  }) : _client = AuthenticationClient(channel, interceptors: interceptors);

  final AuthenticationClient _client;

  @override
  Future<Session> startSession(StartSessionRequest request) {
    return _client.startSession(request);
  }

  @override
  Future<Session> continueSession(ContinueSessionRequest request) {
    return _client.continueSession(request);
  }

  @override
  Future<EndSessionResponse> endSession(EndSessionRequest request) {
    return _client.endSession(request);
  }
}
