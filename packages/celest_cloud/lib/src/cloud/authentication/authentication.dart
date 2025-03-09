import 'package:celest_cloud/src/cloud/authentication/authentication_protocol.dart';
import 'package:celest_cloud/src/cloud/authentication/session_state.dart';
import 'package:celest_cloud/src/cloud/base/base_service.dart';
import 'package:celest_cloud/src/proto.dart';
import 'package:logging/logging.dart';

final class Authentication with BaseService {
  Authentication({
    required AuthenticationProtocol protocol,
    ClientType clientType = ClientType.CLIENT_TYPE_UNSPECIFIED,
    this.logger,
  })  : _clientType = clientType,
        _protocol = protocol;

  final AuthenticationProtocol _protocol;
  @override
  final Logger? logger;
  final ClientType _clientType;

  late final IdpAuthentication idp = IdpAuthentication._(
    _protocol,
    logger,
    _clientType,
  );

  late final EmailAuthentication email = EmailAuthentication._(
    _protocol,
    logger,
    _clientType,
  );

  late final SmsAuthentication sms = SmsAuthentication._(
    _protocol,
    logger,
    _clientType,
  );

  Future<Uri?> endSession(SessionState? state) async {
    final request = EndSessionRequest(
      sessionId: state?.sessionId,
      sessionToken: state?.sessionToken,
    );
    final response = await run(
      'Authentication.EndSession',
      request: request,
      action: _protocol.endSession,
    );
    return switch (response.whichResult()) {
      EndSessionResponse_Result.success => null,
      EndSessionResponse_Result.redirectUri => Uri.parse(response.redirectUri),
      _ => throw StateError('Unexpected response: $response'),
    };
  }
}

final class EmailAuthentication with BaseService {
  EmailAuthentication._(this._client, this.logger, this._clientType);

  final AuthenticationProtocol _client;
  @override
  final Logger? logger;
  final ClientType _clientType;

  Future<EmailSessionState> start({
    required String email,
  }) async {
    final request = StartSessionRequest(
      emailOtp: AuthenticationFactorEmailOtp(
        email: email,
      ),
      client: SessionClient(
        clientType: _clientType,
      ),
    );
    final response = await run(
      'Email.StartSession',
      request: request,
      action: _client.startSession,
    );
    return switch (response.whichState()) {
      Session_State.nextStep
          when response.nextStep.hasNeedsProof() &&
              response.nextStep.needsProof.hasEmailOtp() =>
        EmailSessionVerifyCode(
          sessionId: response.sessionId,
          sessionToken: response.sessionToken,
          email: email,
        ),
      Session_State.nextStep when response.nextStep.hasPendingConfirmation() =>
        switch (response.nextStep.pendingConfirmation.whichPending()) {
          AuthenticationPendingConfirmation_Pending.registerUser =>
            EmailSessionRegisterUser(
              sessionId: response.sessionId,
              sessionToken: response.sessionToken,
              email: email,
              user: response.nextStep.pendingConfirmation.registerUser,
            ),
          _ => throw StateError('Unexpected response: $response'),
        },
      _ => throw StateError('Unexpected response: $response'),
    };
  }

  Future<EmailSessionVerifyCode> resendCode({
    required EmailSessionVerifyCode state,
  }) async {
    final request = ContinueSessionRequest(
      sessionId: state.sessionId,
      sessionToken: state.sessionToken,
      resend: AuthenticationFactor(
        emailOtp: AuthenticationFactorEmailOtp(
          email: state.email,
        ),
      ),
    );
    final response = await run(
      'Email.ContinueSession',
      request: request,
      action: _client.continueSession,
    );
    return switch (response.whichState()) {
      Session_State.nextStep
          when response.nextStep.hasNeedsProof() &&
              response.nextStep.needsProof.hasEmailOtp() =>
        EmailSessionVerifyCode(
          sessionId: response.sessionId,
          sessionToken: response.sessionToken,
          email: state.email,
        ),
      _ => throw StateError('Unexpected response: $response'),
    };
  }

  Future<EmailSessionSuccess> verifyCode({
    required EmailSessionVerifyCode state,
    required String code,
  }) async {
    final request = ContinueSessionRequest(
      sessionId: state.sessionId,
      sessionToken: state.sessionToken,
      proof: AuthenticationFactor(
        emailOtp: AuthenticationFactorEmailOtp(
          email: state.email,
          code: code,
        ),
      ),
    );
    final response = await run(
      'Email.ContinueSession',
      request: request,
      action: _client.continueSession,
    );
    if (response.whichState() != Session_State.success) {
      throw StateError('Unexpected response: $response');
    }
    return EmailSessionSuccess(
      sessionId: response.sessionId,
      sessionToken: response.sessionToken,
      isNewUser: response.success.isNewUser,
      identityToken: response.success.identityToken,
      user: response.success.user,
      email: state.email,
    );
  }

  Future<EmailSessionState> confirm({
    required EmailSessionNeedsConfirmation state,
  }) async {
    final request = ContinueSessionRequest(
      sessionId: state.sessionId,
      sessionToken: state.sessionToken,
      confirmation: switch (state) {
        EmailSessionRegisterUser(:final user) =>
          AuthenticationPendingConfirmation(
            registerUser: user,
          ),
      },
    );
    final response = await run(
      'Email.ContinueSession',
      request: request,
      action: _client.continueSession,
    );
    return switch (response.whichState()) {
      Session_State.nextStep when response.nextStep.hasNeedsProof() => switch (
            response.nextStep.needsProof.whichFactor()) {
          AuthenticationFactor_Factor.emailOtp => EmailSessionVerifyCode(
              sessionId: response.sessionId,
              sessionToken: response.sessionToken,
              email: state.email,
            ),
          _ => throw StateError('Unexpected response: $response'),
        },
      Session_State.success => EmailSessionSuccess(
          sessionId: response.sessionId,
          sessionToken: response.sessionToken,
          identityToken: response.success.identityToken,
          user: response.success.user,
          isNewUser: response.success.isNewUser,
          email: state.email,
        ),
      _ => throw StateError('Unexpected response: $response'),
    };
  }
}

final class SmsAuthentication with BaseService {
  SmsAuthentication._(this._client, this.logger, this._clientType);

  final AuthenticationProtocol _client;
  @override
  final Logger? logger;
  final ClientType _clientType;

  Future<SmsSessionState> start({
    required String phoneNumber,
  }) async {
    final request = StartSessionRequest(
      smsOtp: AuthenticationFactorSmsOtp(
        phoneNumber: phoneNumber,
      ),
      client: SessionClient(
        clientType: _clientType,
      ),
    );
    final response = await run(
      'Sms.StartSession',
      request: request,
      action: _client.startSession,
    );
    return switch (response.whichState()) {
      Session_State.nextStep
          when response.nextStep.hasNeedsProof() &&
              response.nextStep.needsProof.hasSmsOtp() =>
        SmsSessionVerifyCode(
          sessionId: response.sessionId,
          sessionToken: response.sessionToken,
          phoneNumber: phoneNumber,
        ),
      Session_State.nextStep when response.nextStep.hasPendingConfirmation() =>
        switch (response.nextStep.pendingConfirmation.whichPending()) {
          AuthenticationPendingConfirmation_Pending.registerUser =>
            SmsSessionRegisterUser(
              sessionId: response.sessionId,
              sessionToken: response.sessionToken,
              phoneNumber: phoneNumber,
              user: response.nextStep.pendingConfirmation.registerUser,
            ),
          _ => throw StateError('Unexpected response: $response'),
        },
      _ => throw StateError('Unexpected response: $response'),
    };
  }

  Future<SmsSessionVerifyCode> resendCode({
    required SmsSessionVerifyCode state,
  }) async {
    final request = ContinueSessionRequest(
      sessionId: state.sessionId,
      sessionToken: state.sessionToken,
      resend: AuthenticationFactor(
        smsOtp: AuthenticationFactorSmsOtp(
          phoneNumber: state.phoneNumber,
        ),
      ),
    );
    final response = await run(
      'Sms.ContinueSession',
      request: request,
      action: _client.continueSession,
    );
    return switch (response.whichState()) {
      Session_State.nextStep
          when response.nextStep.hasNeedsProof() &&
              response.nextStep.needsProof.hasSmsOtp() =>
        SmsSessionVerifyCode(
          sessionId: response.sessionId,
          sessionToken: response.sessionToken,
          phoneNumber: state.phoneNumber,
        ),
      _ => throw StateError('Unexpected response: $response'),
    };
  }

  Future<SmsSessionSuccess> verifyCode({
    required SmsSessionVerifyCode state,
    required String code,
  }) async {
    final request = ContinueSessionRequest(
      sessionId: state.sessionId,
      sessionToken: state.sessionToken,
      proof: AuthenticationFactor(
        smsOtp: AuthenticationFactorSmsOtp(
          phoneNumber: state.phoneNumber,
          code: code,
        ),
      ),
    );
    final response = await run(
      'Sms.ContinueSession',
      request: request,
      action: _client.continueSession,
    );
    if (response.whichState() != Session_State.success) {
      throw StateError('Unexpected response: $response');
    }
    return SmsSessionSuccess(
      sessionId: response.sessionId,
      sessionToken: response.sessionToken,
      isNewUser: response.success.isNewUser,
      identityToken: response.success.identityToken,
      user: response.success.user,
      phoneNumber: state.phoneNumber,
    );
  }

  Future<SmsSessionState> confirm({
    required SmsSessionNeedsConfirmation state,
  }) async {
    final request = ContinueSessionRequest(
      sessionId: state.sessionId,
      sessionToken: state.sessionToken,
      confirmation: switch (state) {
        SmsSessionRegisterUser(:final user) =>
          AuthenticationPendingConfirmation(
            registerUser: user,
          ),
      },
    );
    final response = await run(
      'Sms.ContinueSession',
      request: request,
      action: _client.continueSession,
    );
    return switch (response.whichState()) {
      Session_State.nextStep when response.nextStep.hasNeedsProof() => switch (
            response.nextStep.needsProof.whichFactor()) {
          AuthenticationFactor_Factor.smsOtp => SmsSessionVerifyCode(
              sessionId: response.sessionId,
              sessionToken: response.sessionToken,
              phoneNumber: state.phoneNumber,
            ),
          _ => throw StateError('Unexpected response: $response'),
        },
      Session_State.success => SmsSessionSuccess(
          sessionId: response.sessionId,
          sessionToken: response.sessionToken,
          identityToken: response.success.identityToken,
          user: response.success.user,
          isNewUser: response.success.isNewUser,
          phoneNumber: state.phoneNumber,
        ),
      _ => throw StateError('Unexpected response: $response'),
    };
  }
}

final class IdpAuthentication with BaseService {
  IdpAuthentication._(this._client, this.logger, this._clientType);

  final AuthenticationProtocol _client;
  @override
  final Logger? logger;
  final ClientType _clientType;

  Future<IdpSessionAuthorize> start({
    required IdentityProviderType provider,
    required Uri redirectUri,
  }) async {
    final request = StartSessionRequest(
      idp: AuthenticationFactorIdp(
        provider: provider,
      ),
      client: SessionClient(
        clientType: _clientType,
        callbacks: SessionCallbacks(
          successUri: redirectUri.toString(),
        ),
      ),
    );
    final response = await run(
      'Idp.StartSession',
      request: request,
      action: _client.startSession,
    );
    return switch (response.whichState()) {
      Session_State.nextStep
          when response.nextStep.hasNeedsProof() &&
              response.nextStep.needsProof.hasIdp() =>
        IdpSessionAuthorize(
          sessionId: response.sessionId,
          sessionToken: response.sessionToken,
          provder: provider,
          uri: Uri.parse(
            response.nextStep.needsProof.idp.redirectUri,
          ),
        ),
      _ => throw StateError('Unexpected response: $response'),
    };
  }

  Future<IdpSessionResult> postRedirect({
    required IdpSessionAuthorize state,
    required Uri redirectUri,
  }) async {
    final request = ContinueSessionRequest(
      sessionId: state.sessionId,
      sessionToken: state.sessionToken,
      proof: AuthenticationFactor(
        idp: AuthenticationFactorIdp(
          provider: state.provder,
          redirectUri: redirectUri.toString(),
        ),
      ),
    );
    final response = await run(
      'Idp.ContinueSession',
      request: request,
      action: _client.continueSession,
    );
    return switch (response.whichState()) {
      Session_State.nextStep when response.nextStep.hasPendingConfirmation() =>
        switch (response.nextStep.pendingConfirmation.whichPending()) {
          AuthenticationPendingConfirmation_Pending.linkExistingUser =>
            IdpSessionLinkUser(
              sessionId: response.sessionId,
              sessionToken: response.sessionToken,
              user: response.nextStep.pendingConfirmation.linkExistingUser,
            ),
          AuthenticationPendingConfirmation_Pending.registerUser =>
            IdpSessionRegisterUser(
              sessionId: response.sessionId,
              sessionToken: response.sessionToken,
              user: response.nextStep.pendingConfirmation.registerUser,
            ),
          _ => throw StateError('Unexpected response: $response'),
        },
      Session_State.success => IdpSessionSuccess(
          sessionId: response.sessionId,
          sessionToken: response.sessionToken,
          identityToken: response.success.identityToken,
          user: response.success.user,
          isNewUser: response.success.isNewUser,
        ),
      _ => throw StateError('Unexpected response: $response'),
    };
  }

  Future<IdpSessionSuccess> confirm({
    required IdpSessionNeedsConfirmation state,
  }) async {
    final request = ContinueSessionRequest(
      sessionId: state.sessionId,
      sessionToken: state.sessionToken,
      confirmation: switch (state) {
        IdpSessionLinkUser(:final user) => AuthenticationPendingConfirmation(
            linkExistingUser: user,
          ),
        IdpSessionRegisterUser(:final user) =>
          AuthenticationPendingConfirmation(
            registerUser: user,
          ),
      },
    );
    final response = await run(
      'Idp.ContinueSession',
      request: request,
      action: _client.continueSession,
    );
    if (response.whichState() != Session_State.success) {
      throw StateError('Unexpected response: $response');
    }
    return IdpSessionSuccess(
      sessionId: response.sessionId,
      sessionToken: response.sessionToken,
      identityToken: response.success.identityToken,
      user: response.success.user,
      isNewUser: response.success.isNewUser,
    );
  }
}
