import 'package:celest_core/celest_core.dart';
import 'package:celest_core/src/base/base_protocol.dart';
import 'package:http/http.dart' as http;

final class AuthClient implements AuthProtocol {
  AuthClient({
    required this.baseUri,
    http.Client? httpClient,
  }) : _client = httpClient ?? http.Client();

  final http.Client _client;
  final Uri baseUri;

  @override
  late final PasskeyClient passkeys = PasskeyClient(
    baseUri: baseUri,
    httpClient: _client,
  );

  @override
  late final EmailClient email = EmailClient(
    baseUri: baseUri,
    httpClient: _client,
  );
}

final class PasskeyClient with BaseProtocol implements PasskeyProtocol {
  PasskeyClient({
    required this.baseUri,
    required this.httpClient,
  });

  @override
  final http.Client httpClient;

  @override
  final Uri baseUri;

  @override
  Future<PasskeyOptions> authenticate({
    required PasskeyRequest request,
  }) async {
    final response = await postJson(
      '/_auth/passkeys/authenticate',
      request.toJson(),
    );
    return PasskeyOptions.fromJson(response);
  }

  @override
  Future<AuthenticatedUser> verify({
    required PasskeyCredential credential,
  }) async {
    final response = await postJson(
      '/_auth/passkeys/verify',
      credential.toJson(),
    );
    return AuthenticatedUser.fromJson(response);
  }
}

final class EmailClient with BaseProtocol implements EmailProtocol {
  EmailClient({
    required this.baseUri,
    required this.httpClient,
  });

  @override
  final http.Client httpClient;

  @override
  final Uri baseUri;

  @override
  Future<OtpParameters> sendOtp({
    required OtpSendRequest request,
  }) async {
    final response = await postJson(
      '/_auth/email/otp/send',
      request.toJson(),
    );
    return OtpParameters.fromJson(response);
  }

  @override
  Future<OtpParameters> resendOtp({
    required OtpSendRequest request,
  }) async {
    final response = await postJson(
      '/_auth/email/otp/resend',
      request.toJson(),
    );
    return OtpParameters.fromJson(response);
  }

  @override
  Future<AuthenticatedUser> verifyOtp({
    required OtpVerifyRequest verification,
  }) async {
    final resp = await postJson(
      '/_auth/email/otp/verify',
      verification.toJson(),
    );
    return AuthenticatedUser.fromJson(resp);
  }
}
