import 'dart:typed_data';

import 'package:cedar/cedar.dart';
// ignore: invalid_use_of_internal_member
import 'package:celest/src/runtime/http/cloud_middleware.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cloud/src/proto.dart' as pb;
import 'package:celest_cloud_auth/src/authentication/authentication_model.dart';
import 'package:celest_cloud_auth/src/authorization/authorization_middleware.dart';
import 'package:celest_cloud_auth/src/authorization/authorizer.dart';
import 'package:celest_cloud_auth/src/authorization/corks_repository.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/crypto/crypto_key_repository.dart';
import 'package:celest_cloud_auth/src/database/auth_database.dart';
import 'package:celest_cloud_auth/src/http/http_helpers.dart';
import 'package:celest_cloud_auth/src/model/route_map.dart';
import 'package:celest_cloud_auth/src/otp/otp_repository.dart';
import 'package:celest_cloud_auth/src/util/typeid.dart';
import 'package:celest_core/celest_core.dart';
import 'package:corks_cedar/corks_cedar.dart';
import 'package:meta/meta.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

typedef _Deps = ({
  RouteMap routeMap,
  AuthDatabase db,
  OtpRepository otp,
  CryptoKeyRepository cryptoKeys,
  Authorizer authorizer,
  CorksRepository corks,
});

extension type AuthenticationService._(_Deps _deps) implements Object {
  AuthenticationService({
    required RouteMap routeMap,
    required AuthDatabase db,
    required OtpRepository otp,
    required CryptoKeyRepository cryptoKeys,
    required Authorizer authorizer,
    required CorksRepository corks,
  }) : this._(
          (
            routeMap: routeMap,
            db: db,
            otp: otp,
            cryptoKeys: cryptoKeys,
            authorizer: authorizer,
            corks: corks,
          ),
        );

  AuthDatabase get _db => _deps.db;
  OtpRepository get _otp => _deps.otp;
  CryptoKeyRepository get _cryptoKeys => _deps.cryptoKeys;
  CorksRepository get _corks => _deps.corks;

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

  Handler get handler {
    final requestAuthorizer = AuthorizationMiddleware(
      routeMap: _deps.routeMap,
      corks: _deps.corks,
      db: _deps.db,
      authorizer: _deps.authorizer,
    );
    return const Pipeline()
        .addMiddleware(const CloudExceptionMiddleware().call)
        .addMiddleware(requestAuthorizer.call)
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

  Future<Session> _createSession({
    required TypeId<Session> sessionId,
    required String? userId,
    required AuthenticationFactor factor,
    required SessionClient clientInfo,
    DateTime? expireTime,
    String? ipAddress,
  }) async {
    expireTime ??= DateTime.timestamp().add(const Duration(minutes: 15));
    return _db.transaction(() async {
      final keyData = await _cryptoKeys.mintHmacKey(
        cryptoKeyId: sessionId.uuid.value,
      );
      final session = await _db.authDrift.createSession(
        sessionId: sessionId.encoded,
        cryptoKeyId: keyData.cryptoKeyId,
        userId: userId,
        expireTime: expireTime!,
        authenticationFactor: factor,
        clientInfo: clientInfo,
        ipAddress: ipAddress,
      );
      return session.first;
    });
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
    final sessionId = TypeId<Session>();
    var user = context.get(ContextKey.principal);
    if (user == null) {
      switch (factor) {
        case AuthenticationFactorEmailOtp(:final email):
          user = await _db.findUserByEmail(email: email);
        case AuthenticationFactorSmsOtp(:final phoneNumber):
          user = await _db.findUserByPhoneNumber(phoneNumber: phoneNumber);
      }
    }
    await _createSession(
      sessionId: sessionId,
      userId: user?.userId,
      factor: factor,
      clientInfo: clientInfo,
      ipAddress: ipAddress,
    );

    try {
      final nextStep = await _sendOtp(
        sessionId: sessionId,
        factor: factor,
        resend: null,
      );
      return await _db.transaction(() async {
        final session = await _updateSessionState(
          sessionId: sessionId,
          state: nextStep,
        );
        final sessionToken = await _corks.createSessionCork(session: session);
        return session.copyWith(sessionToken: sessionToken.toString());
      });
    } on Object {
      await _db.authDrift.deleteSession(sessionId: sessionId.encoded);
      rethrow;
    }
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
    return session.toProto().jsonResponse();
  }

  Future<SessionStateSuccess> _authenticateUser({
    required TypeId<Session> sessionId,
    required String userId,
  }) async {
    final user = await _db.getUser(userId: userId);
    if (user == null) {
      throw const NotFoundException('User not found');
    }
    final cork = await _corks.createUserCork(
      user: user,
      sessionId: sessionId,
    );
    return SessionStateSuccess(
      cork: cork,
      user: user,
      isNewUser: false,
    );
  }

  Future<SessionStateSuccess> _createUser({
    required TypeId<Session> sessionId,
    required AuthenticationFactor factor,
  }) async {
    final (user, cork) = await _db.transaction(() async {
      final user = await _db.createUser(
        user: User(
          userId: typeId<User>(),
          emails: [
            if (factor case AuthenticationFactorEmailOtp(:final email))
              Email(email: email, isVerified: true, isPrimary: true),
          ],
          phoneNumbers: [
            if (factor case AuthenticationFactorSmsOtp(:final phoneNumber))
              PhoneNumber(
                phoneNumber: phoneNumber,
                isVerified: true,
                isPrimary: true,
              ),
          ],
          roles: const [EntityUid.of('Celest::Role', 'authenticated')],
        ),
      );
      final cork = await _corks.createUserCork(
        user: user,
        sessionId: sessionId,
      );
      return (user, cork);
    });
    return SessionStateSuccess(
      cork: cork,
      user: user,
      isNewUser: true,
    );
  }

  Future<Session> _updateSessionState<T extends SessionState>({
    required TypeId<Session> sessionId,
    required T state,
  }) async {
    final updated = await _db.authDrift.updateSession(
      sessionId: sessionId.encoded,
      state: state,
    );
    return updated.first;
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
    if (session.userId case final userId?) {
      return _authenticateUser(
        userId: userId,
        sessionId: session.sessionId,
      );
    }
    return _createUser(
      factor: factor,
      sessionId: session.sessionId,
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
          final resendIn = nextResend.difference(DateTime.timestamp());
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
        //   final resendIn = nextResend.difference(DateTime.timestamp());
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
    final session = await _db.authDrift
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

    return _updateSessionState(
      sessionId: sessionId,
      state: updatedState,
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
    return session.toProto(sessionToken: pbRequest.sessionToken).jsonResponse();
  }

  @visibleForTesting
  Future<void> endSession({
    required String sessionId,
    required String sessionToken,
  }) async {
    if (sessionId.isNotEmpty) {
      final session = await _db.authDrift
          .getSession(sessionId: sessionId)
          .getSingleOrNull();
      if (session == null) {
        throw const NotFoundException('Session not found');
      }
      sessionId = session.sessionId.encoded;
    } else {
      final sessionCork = CedarCork.parse(sessionToken);
      await _corks.verify(cork: sessionCork);
      sessionId = TypeId.decode(String.fromCharCodes(sessionCork.id)).encoded;
    }
    await _db.transaction(() async {
      await _db.authDrift.deleteSession(sessionId: sessionId);
      await _db.authDrift.deleteCork(
        corkId: Uint8List.fromList(sessionId.codeUnits),
      );
    });
  }

  Future<Response> handleEndSession(Request request) async {
    final jsonRequest = await JsonUtf8.decodeStream(request.read());
    final pbRequest = pb.EndSessionRequest()..mergeFromProto3Json(jsonRequest);
    await endSession(
      sessionId: pbRequest.sessionId,
      sessionToken: pbRequest.sessionToken,
    );
    final response = pb.EndSessionResponse(
      sessionId: pbRequest.sessionId,
      success: pb.Empty(),
    );
    return response.jsonResponse();
  }
}
