import 'dart:typed_data';

import 'package:cedar/cedar.dart';
import 'package:celest_cloud/src/proto.dart' as pb;
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/model/interop.dart';
import 'package:celest_cloud_auth/src/util/typeid.dart';
import 'package:celest_core/celest_core.dart';
import 'package:corks_cedar/corks_cedar.dart';
import 'package:protobuf/protobuf.dart';

sealed class AuthenticationFactor {
  const AuthenticationFactor();

  factory AuthenticationFactor.fromProto(pb.AuthenticationFactor proto) {
    return switch (proto.whichFactor()) {
      pb.AuthenticationFactor_Factor.emailOtp =>
        AuthenticationFactorEmailOtp.fromProto(proto.emailOtp),
      pb.AuthenticationFactor_Factor.smsOtp =>
        AuthenticationFactorSmsOtp.fromProto(proto.smsOtp),
      final unknown => throw ArgumentError.value(
          unknown,
          'factor',
          'Invalid AuthenticationFactor. Expected one of: emailOtp, smsOtp',
        ),
    };
  }

  pb.AuthenticationFactor toProto() => switch (this) {
        final AuthenticationFactorEmailOtp emailOtp => pb.AuthenticationFactor(
            emailOtp: emailOtp.toValueProto(),
          ),
        final AuthenticationFactorSmsOtp smsOtp => pb.AuthenticationFactor(
            smsOtp: smsOtp.toValueProto(),
          ),
      };

  GeneratedMessage toValueProto();

  @override
  String toString() => toProto().toString();
}

final class AuthenticationFactorEmailOtp extends AuthenticationFactor {
  const AuthenticationFactorEmailOtp({
    required this.email,
    this.code,
  });

  factory AuthenticationFactorEmailOtp.fromProto(
    pb.AuthenticationFactorEmailOtp emailOtp,
  ) {
    if (!emailOtp.hasEmail()) {
      throw const BadRequestException(
        'Missing email in AuthenticationFactorEmailOtp',
      );
    }
    return AuthenticationFactorEmailOtp(
      email: emailOtp.email,
      code: emailOtp.hasCode() ? emailOtp.code : null,
    );
  }

  final String email;
  final String? code;

  @override
  pb.AuthenticationFactorEmailOtp toValueProto() =>
      pb.AuthenticationFactorEmailOtp(
        email: email,
        code: code,
      );
}

final class AuthenticationFactorSmsOtp extends AuthenticationFactor {
  const AuthenticationFactorSmsOtp({
    required this.phoneNumber,
    this.code,
  });

  factory AuthenticationFactorSmsOtp.fromProto(
    pb.AuthenticationFactorSmsOtp smsOtp,
  ) {
    if (!smsOtp.hasPhoneNumber()) {
      throw const BadRequestException(
        'Missing phoneNumber in AuthenticationFactorSmsOtp',
      );
    }
    return AuthenticationFactorSmsOtp(
      phoneNumber: smsOtp.phoneNumber,
      code: smsOtp.hasCode() ? smsOtp.code : null,
    );
  }

  final String phoneNumber;
  final String? code;

  @override
  pb.AuthenticationFactorSmsOtp toValueProto() => pb.AuthenticationFactorSmsOtp(
        phoneNumber: phoneNumber,
        code: code,
      );
}

final class SessionClient {
  const SessionClient({
    required this.clientId,
    this.clientType,
    required this.callbacks,
  });

  factory SessionClient.fromProto(pb.SessionClient client) {
    return SessionClient(
      clientId: client.clientId,
      clientType: client.hasClientType() ? client.clientType : null,
      callbacks: SessionCallbacks.fromProto(client.callbacks),
    );
  }

  final String clientId;
  final pb.ClientType? clientType;
  final SessionCallbacks callbacks;

  pb.SessionClient toProto() => pb.SessionClient(
        clientId: clientId,
        clientType: clientType,
        callbacks: callbacks.toProto(),
      );

  @override
  String toString() => toProto().toString();
}

final class SessionCallbacks {
  const SessionCallbacks({
    required this.successUri,
    this.errorUri,
  });

  factory SessionCallbacks.fromProto(pb.SessionCallbacks callbacks) {
    return SessionCallbacks(
      successUri:
          callbacks.hasSuccessUri() ? Uri.parse(callbacks.successUri) : null,
      errorUri: callbacks.hasErrorUri() ? Uri.parse(callbacks.errorUri) : null,
    );
  }

  final Uri? successUri;
  final Uri? errorUri;

  pb.SessionCallbacks toProto() => pb.SessionCallbacks(
        successUri: successUri.toString(),
        errorUri: errorUri?.toString(),
      );

  @override
  String toString() => toProto().toString();
}

sealed class SessionState {
  const SessionState();

  void apply(pb.Session session);

  GeneratedMessage toProto();

  @override
  String toString() => toProto().toString();
}

final class SessionStateSuccess extends SessionState {
  const SessionStateSuccess({
    required this.cork,
    required this.user,
    required this.isNewUser,
  });

  factory SessionStateSuccess.fromProto(pb.AuthenticationSuccess success) {
    return SessionStateSuccess(
      cork: CedarCork.parse(success.identityToken),
      user: success.user.toModel(),
      isNewUser: success.isNewUser,
    );
  }

  final CedarCork cork;
  String get identityToken => cork.toString();

  final User user;
  final bool isNewUser;

  @override
  void apply(pb.Session session) {
    session.success = toProto();
  }

  @override
  pb.AuthenticationSuccess toProto() => pb.AuthenticationSuccess(
        identityToken: cork.toString(),
        user: user.toProto(),
        isNewUser: isNewUser,
      );
}

sealed class SessionStateNextStep extends SessionState {
  const SessionStateNextStep();

  factory SessionStateNextStep.fromProto(pb.AuthenticationStep proto) {
    return switch (proto.whichStep()) {
      pb.AuthenticationStep_Step.needsProof =>
        SessionStateNeedsProof.fromProto(proto.needsProof),
      pb.AuthenticationStep_Step.pendingConfirmation =>
        SessionStatePendingConfirmation.fromProto(proto.pendingConfirmation),
      final unknown => throw ArgumentError.value(
          unknown,
          'step',
          'Invalid AuthenticationStep. Expected one of: needsProof, pendingConfirmation',
        ),
    };
  }

  @override
  pb.AuthenticationStep toProto() => switch (this) {
        final SessionStateNeedsProof needsProof => pb.AuthenticationStep(
            needsProof: needsProof.toValueProto(),
          ),
        final SessionStatePendingConfirmation pendingConfirmation =>
          pb.AuthenticationStep(
            pendingConfirmation: pendingConfirmation.toValueProto(),
          ),
      };

  @override
  void apply(pb.Session session) {
    session.nextStep = toProto();
  }
}

final class SessionStateNeedsProof extends SessionStateNextStep {
  const SessionStateNeedsProof({
    required this.factor,
  });
  factory SessionStateNeedsProof.fromProto(pb.AuthenticationFactor proto) {
    return SessionStateNeedsProof(
      factor: AuthenticationFactor.fromProto(proto),
    );
  }

  final AuthenticationFactor factor;

  pb.AuthenticationFactor toValueProto() => factor.toProto();
}

final class SessionStatePendingConfirmation extends SessionStateNextStep {
  const SessionStatePendingConfirmation({
    this.linkExistingUser,
    this.registerUser,
  });

  factory SessionStatePendingConfirmation.fromProto(
    pb.AuthenticationPendingConfirmation proto,
  ) {
    return SessionStatePendingConfirmation(
      linkExistingUser:
          proto.hasLinkExistingUser() ? proto.linkExistingUser.toModel() : null,
      registerUser:
          proto.hasRegisterUser() ? proto.registerUser.toModel() : null,
    );
  }

  final User? linkExistingUser;
  final User? registerUser;

  pb.AuthenticationPendingConfirmation toValueProto() =>
      pb.AuthenticationPendingConfirmation(
        linkExistingUser: linkExistingUser?.toProto(),
        registerUser: registerUser?.toProto(),
      );
}

final class Session {
  Session({
    EntityUid? parent,
    required String sessionId,
    required this.cryptoKeyId,
    required this.userId,
    required this.expireTime,
    this.sessionToken,
    required this.authenticationFactor,
    this.state,
    this.clientInfo,
    this.ipAddress,
    this.externalSessionId,
  })  : parent = parent ?? context.rootEntity,
        sessionId = TypeId<Session>.decode(sessionId);

  const Session._({
    required this.parent,
    required this.sessionId,
    required this.cryptoKeyId,
    required this.userId,
    required this.expireTime,
    required this.sessionToken,
    required this.authenticationFactor,
    required this.state,
    required this.clientInfo,
    required this.ipAddress,
    required this.externalSessionId,
  });

  final EntityUid? parent;
  final TypeId<Session> sessionId;
  final Uint8List cryptoKeyId;
  final String userId;
  final DateTime expireTime;
  final String? sessionToken;

  CedarCork get sessionCork => CedarCork.parse(sessionToken!);

  final AuthenticationFactor authenticationFactor;
  final SessionState? state;
  final SessionClient? clientInfo;
  final String? ipAddress;
  final String? externalSessionId;

  pb.Session toProto({
    String? sessionToken,
  }) {
    final session = pb.Session(
      parent: parent?.id,
      sessionId: sessionId.encoded,
      sessionToken: sessionToken ?? this.sessionToken,
      expireTime: expireTime.toProto(),
      client: clientInfo?.toProto(),
    );
    state?.apply(session);
    return session;
  }

  Session copyWith({
    EntityUid? parent,
    Uint8List? cryptoKeyId,
    String? userId,
    DateTime? expireTime,
    String? sessionToken,
    AuthenticationFactor? authenticationFactor,
    SessionState? state,
    SessionClient? clientInfo,
    String? ipAddress,
    String? externalSessionId,
  }) {
    return Session._(
      parent: parent ?? this.parent,
      sessionId: sessionId,
      cryptoKeyId: cryptoKeyId ?? this.cryptoKeyId,
      userId: userId ?? this.userId,
      expireTime: expireTime ?? this.expireTime,
      sessionToken: sessionToken ?? this.sessionToken,
      authenticationFactor: authenticationFactor ?? this.authenticationFactor,
      state: state ?? this.state,
      clientInfo: clientInfo ?? this.clientInfo,
      ipAddress: ipAddress ?? this.ipAddress,
      externalSessionId: externalSessionId ?? this.externalSessionId,
    );
  }
}
