import 'package:celest_cloud/src/proto.dart';

abstract interface class AuthenticationProtocol {
  Future<Session> startSession(StartSessionRequest request);
  Future<Session> continueSession(ContinueSessionRequest request);
  Future<EndSessionResponse> endSession(EndSessionRequest request);
}
