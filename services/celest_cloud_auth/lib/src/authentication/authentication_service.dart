import 'package:cedar/cedar.dart';
// ignore: invalid_use_of_internal_member
import 'package:celest/src/runtime/http/cloud_middleware.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud/src/proto.dart' as pb;
import 'package:celest_cloud_auth/src/authorization/authorization_middleware.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_auth/src/authorization/celest_role.dart';
import 'package:celest_cloud_auth/src/authorization/corks_repository.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/crypto/crypto_key_repository.dart';
import 'package:celest_cloud_auth/src/database/auth_database_accessors.dart';
import 'package:celest_cloud_auth/src/http/http_helpers.dart';
import 'package:celest_cloud_auth/src/model/route_map.dart';
import 'package:celest_cloud_auth/src/otp/otp_repository.dart';
import 'package:celest_cloud_auth/src/sessions/sessions_repository.dart';
import 'package:celest_cloud_auth/src/users/users_repository.dart';
import 'package:celest_cloud_auth/src/util/typeid.dart';
import 'package:celest_core/celest_core.dart';
import 'package:clock/clock.dart';
import 'package:corks_cedar/corks_cedar.dart';
import 'package:meta/meta.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

typedef _Deps = ({
  EntityUid issuer,
  RouteMap routeMap,
  CloudAuthDatabaseMixin db,
  OtpRepository otp,
  CryptoKeyRepository cryptoKeys,
  Authorizer authorizer,
  CorksRepository corks,
  SessionsRepository sessions,
  UsersRepository users,
});

extension type AuthenticationService._(_Deps _deps) implements Object {
  AuthenticationService({
    required EntityUid issuer,
    required RouteMap routeMap,
    required CloudAuthDatabaseMixin db,
    required OtpRepository otp,
    required CryptoKeyRepository cryptoKeys,
    required Authorizer authorizer,
    required CorksRepository corks,
    required SessionsRepository sessions,
    required UsersRepository users,
  }) : this._(
          (
            issuer: issuer,
            routeMap: routeMap,
            db: db,
            otp: otp,
            cryptoKeys: cryptoKeys,
            authorizer: authorizer,
            corks: corks,
            sessions: sessions,
            users: users,
          ),
        );

  CloudAuthDatabaseAccessors get _db => _deps.db.cloudAuth;
  OtpRepository get _otp => _deps.otp;
  CorksRepository get _corks => _deps.corks;
  SessionsRepository get _sessions => _deps.sessions;
  UsersRepository get _users => _deps.users;

  static const String apiId = 'celest.cloud.auth.v1alpha1.Authentication';
  static const EntityUid apiUid = EntityUid.of('Celest::Api', apiId);

  static final ResolvedApi api = ResolvedApi(
    apiId: apiId,
    functions: {
      'GetOpenIdUserInfo': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'GetOpenIdUserInfo',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: 'GET',
            path: '/v1alpha1/auth/userinfo',
          ),
        ),
      ),
      'StartSession': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'StartSession',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: 'POST',
            path: '/v1alpha1/auth/sessions:startSession',
          ),
        ),
      ),
      'ContinueSession': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'ContinueSession',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: 'POST',
            path: '/v1alpha1/auth/sessions:continueSession',
          ),
        ),
      ),
      'EndSession': ResolvedCloudFunction(
        apiId: apiId,
        functionId: 'EndSession',
        httpConfig: ResolvedHttpConfig(
          route: ResolvedHttpRoute(
            method: 'POST',
            path: '/v1alpha1/auth/sessions:endSession',
          ),
        ),
      ),
    },
    policySet: PolicySet(
      templateLinks: const [
        TemplateLink(
          templateId: 'cloud.functions.public',
          newId: apiId,
          values: {
            SlotId.resource: apiUid,
          },
        ),
      ],
    ),
  );

  Router get _router {
    return Router()
      ..get('/userinfo', handleGetOpenIdUserInfo)
      // Shelf doesn't like `:` in the path, but will route when escaped
      ..post('/sessions%3AstartSession', handleStartSession)
      ..post('/sessions%3AcontinueSession', handleContinueSession)
      ..post('/sessions%3AendSession', handleEndSession);
  }

  AuthorizationMiddleware get middleware {
    return AuthorizationMiddleware(
      routeMap: _deps.routeMap,
      corks: _deps.corks,
      cryptoKeys: _deps.cryptoKeys,
      users: _deps.users,
      db: _deps.db,
      authorizer: _deps.authorizer,
      issuer: _deps.issuer,
    );
  }

  Handler get handler {
    return const Pipeline()
        .addMiddleware(const CloudExceptionMiddleware().call)
        .addMiddleware(middleware.call)
        .addHandler(_router.call);
  }

  @visibleForTesting
  Future<pb.OpenIdUserinfo> getUserInfo() async {
    final user = context.get(ContextKey.principal);
    if (user == null) {
      throw const UnauthorizedException(null);
    }
    return pb.OpenIdUserinfo(
      sub: user.userId,
      email: user.emails.primary?.email,
      emailVerified: user.emails.primary?.isVerified,
      phoneNumber: user.phoneNumbers.primary?.phoneNumber,
      phoneNumberVerified: user.phoneNumbers.primary?.isVerified,
      familyName: user.familyName,
      givenName: user.givenName,
      locale: user.languageCode,
      zoneinfo: user.timeZone,
      updatedAt: switch (user.updateTime) {
        final updatedAt? => updatedAt.millisecondsSinceEpoch ~/ 1000,
        _ => null,
      },
    );
  }

  Future<Response> handleGetOpenIdUserInfo(Request request) async {
    final userInfo = await getUserInfo();
    return userInfo.jsonResponse();
  }

  @visibleForTesting
  Future<Session> startSession({
    required AuthenticationFactor factor,
    required SessionClient clientInfo,
    String? ipAddress,
  }) async {
    var user = context.get(ContextKey.principal);
    if (user == null) {
      switch (factor) {
        case AuthenticationFactorEmailOtp(:final email):
          user = await _db.findUserByEmail(email: email);
        case AuthenticationFactorSmsOtp(:final phoneNumber):
          user = await _db.findUserByPhoneNumber(phoneNumber: phoneNumber);
      }
    }

    return _db.transaction(() async {
      final session = await _sessions.createSession(
        userId: user?.userId,
        factor: factor,
        clientInfo: clientInfo,
        ipAddress: ipAddress,
      );
      final sessionId = session.sessionId;

      final nextStep = await _sendOtp(
        sessionId: sessionId,
        factor: factor,
        resend: null,
      );
      return _sessions.updateSession(
        session: session,
        state: nextStep,
      );
    });
  }

  Future<Response> handleStartSession(Request request) async {
    final jsonRequest = await JsonUtf8.decodeStream(request.read());
    final pbRequest = pb.StartSessionRequest()
      ..mergeFromProto3Json(jsonRequest);
    final factor = AuthenticationFactor.fromProto(
      pb.AuthenticationFactor(
        emailOtp: pbRequest.hasEmailOtp() ? pbRequest.emailOtp : null,
        smsOtp: pbRequest.hasSmsOtp() ? pbRequest.smsOtp : null,
      ),
    );
    final clientInfo = SessionClient.fromProto(pbRequest.client);
    final session = await startSession(
      factor: factor,
      clientInfo: clientInfo,
      ipAddress: request.clientIp,
    );
    return session.toResponse();
  }

  Future<SessionState> _verifyOtp({
    required Session session,
    required AuthenticationFactor factor,
    required AuthenticationFactor proof,
  }) async {
    switch ((factor, proof)) {
      case (
          AuthenticationFactorEmailOtp(),
          AuthenticationFactorEmailOtp(:final code)
        ):
        if (code == null) {
          throw const BadRequestException('Code is required');
        }
        final (ok, _) = await _otp.verify(
          sessionId: session.sessionId,
          code: code,
        );
        if (!ok) {
          throw const BadRequestException('Invalid code');
        }
      case (
          AuthenticationFactorSmsOtp(),
          AuthenticationFactorSmsOtp(:final code)
        ):
        if (code == null) {
          throw const BadRequestException('Code is required');
        }
        final (ok, _) = await _otp.verify(
          sessionId: session.sessionId,
          code: code,
        );
        if (!ok) {
          throw const BadRequestException('Invalid code');
        }
      default:
        throw BadRequestException(
          'Invalid proof. Expected ${factor.runtimeType}',
        );
    }
    var user = await _users.getUser(userId: session.userId);
    if (user == null) {
      throw InternalServerError('Unknown user: ${session.userId}');
    }

    final isNewUser = user.roles.contains(CelestRole.anonymous);
    if (isNewUser) {
      user = await _users.updateUser(
        userId: session.userId,
        factor: factor,
        roles: const [CelestRole.authenticated],
      );
    }
    final cork = await _corks.createCork(
      session: session.copyWith(
        expireTime: clock.now().add(SessionsRepository.postAuthSessionDuration),
      ),
      user: user,
    );
    return SessionStateSuccess(
      cork: cork,
      user: user,
      isNewUser: isNewUser,
    );
  }

  Future<SessionState> _sendOtp({
    required TypeId<Session> sessionId,
    required AuthenticationFactor factor,
    required AuthenticationFactor? resend,
  }) async {
    switch ((factor, resend)) {
      case (
          final AuthenticationFactorEmailOtp factor,
          AuthenticationFactorEmailOtp() || null
        ):
        final (ok, nextResend) = await _otp.send(
          sessionId: sessionId,
          to: factor.email,
          provider: context.email,
        );
        if (!ok) {
          if (nextResend == null) {
            throw const ResourceExhaustedException(
              'Failed to send OTP. Please restart the authentication flow.',
            );
          }
          final resendIn = nextResend.difference(clock.now());
          throw ResourceExhaustedException(
            'Failed to send OTP. Try again in ${resendIn.inSeconds} seconds',
          );
        }
      case (AuthenticationFactorSmsOtp(), AuthenticationFactorSmsOtp() || null):
        // final (ok, nextResend) = await _otp.send(
        //   sessionId: sessionId,
        //   to: factor.phoneNumber,
        //   provider: _otpProviders.sms,
        // );
        // if (!ok) {
        //   if (nextResend == null) {
        //     throw const ResourceExhaustedException(
        //       'Failed to send OTP. Please restart the authentication flow.',
        //     );
        //   }
        //   final resendIn = nextResend.difference(clock.now());
        //   throw ResourceExhaustedException(
        //     'Failed to send OTP. Try again in ${resendIn.inSeconds} seconds',
        //   );
        // }
        throw UnimplementedError('SMS OTP is not implemented');
      default:
        throw BadRequestException(
          'Invalid resend. Expected ${factor.runtimeType}',
        );
    }
    return SessionStateNeedsProof(
      factor: factor,
    );
  }

  @visibleForTesting
  Future<Session> continueSession({
    required TypeId<Session> sessionId,
    required String sessionToken,
    AuthenticationFactor? proof,
    SessionStatePendingConfirmation? confirmation,
    AuthenticationFactor? resend,
  }) async {
    final session = await _db.cloudAuthCoreDrift
        .getSession(sessionId: sessionId.encoded)
        .getSingleOrNull();
    if (session == null) {
      throw const NotFoundException('Session not found');
    }
    final sessionCork = CedarCork.parse(sessionToken);
    await _corks.verify(cork: sessionCork);

    final updatedState = await switch (session.state) {
      SessionStateNeedsProof(:final factor) => switch ((proof, resend)) {
          (final proof?, _) => _verifyOtp(
              session: session,
              factor: factor,
              proof: proof,
            ),
          (_, final resend?) => _sendOtp(
              sessionId: sessionId,
              factor: factor,
              resend: resend,
            ),
          _ => throw const BadRequestException('Proof is required'),
        },
      SessionStatePendingConfirmation() => throw UnimplementedError(),
      SessionStateSuccess() => throw StateError('Session already completed'),
      null => throw StateError('Unexpected state'),
    };

    return _sessions.updateSession(
      session: session,
      state: updatedState,
      sessionDuration: switch (updatedState) {
        SessionStateSuccess() => SessionsRepository.postAuthSessionDuration,
        _ => SessionsRepository.preAuthSessionDuration,
      },
    );
  }

  Future<Response> handleContinueSession(Request request) async {
    final jsonRequest = await JsonUtf8.decodeStream(request.read());
    final pbRequest = pb.ContinueSessionRequest()
      ..mergeFromProto3Json(jsonRequest);
    final session = await continueSession(
      sessionId: TypeId.decode(pbRequest.sessionId),
      sessionToken: pbRequest.sessionToken,
      proof: pbRequest.hasProof()
          ? AuthenticationFactor.fromProto(pbRequest.proof)
          : null,
      confirmation: pbRequest.hasConfirmation()
          ? SessionStatePendingConfirmation.fromProto(
              pbRequest.confirmation,
            )
          : null,
      resend: pbRequest.hasResend()
          ? AuthenticationFactor.fromProto(pbRequest.resend)
          : null,
    );
    return session.toResponse();
  }

  @visibleForTesting
  Future<void> endSession({
    required TypeId<Session>? sessionId,
    required String? sessionToken,
  }) async {
    if (sessionId == null) {
      CedarCork? sessionCork;
      if (sessionToken != null) {
        sessionCork = CedarCork.parse(sessionToken);
      } else {
        sessionCork = context.cork;
      }
      if (sessionCork == null) {
        throw UnauthorizedException();
      }
      await _corks.verify(cork: sessionCork);

      switch (sessionCork.bearer) {
        case EntityUid(type: 'Celest::Session', :final id):
          sessionId = TypeId.decode(id);
        case final unknownType:
          throw BadRequestException(
            'Invalid session cork type: ${unknownType.type}. '
            'Expected "Celest::Session"',
          );
      }
    }
    await _sessions.deleteSession(sessionId: sessionId);
  }

  Future<Response> handleEndSession(Request request) async {
    final jsonRequest = await JsonUtf8.decodeStream(request.read());
    final pbRequest = pb.EndSessionRequest()..mergeFromProto3Json(jsonRequest);
    await endSession(
      sessionId: switch (pbRequest.sessionId) {
        '' => null,
        final sessionId => TypeId.decode(sessionId),
      },
      sessionToken: switch (pbRequest.sessionToken) {
        '' => null,
        final sessionToken => sessionToken,
      },
    );
    final response = pb.EndSessionResponse(
      sessionId: pbRequest.sessionId,
      success: pb.Empty(),
    );
    return response.jsonResponse().clearCork();
  }
}

extension on Session {
  Response toResponse() {
    var response = toProto().jsonResponse();
    if (state case SessionStateSuccess(:final cork)) {
      response = response.setCork(cork);
    } else {
      response = response.setCork(sessionCork);
    }
    return response;
  }
}
