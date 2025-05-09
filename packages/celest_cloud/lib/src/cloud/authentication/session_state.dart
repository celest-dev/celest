import 'package:celest_cloud/celest_cloud.dart';

sealed class SessionState {
  SessionState({required this.sessionId, required this.sessionToken});

  factory SessionState.fromJson(Map<String, Object?> json) {
    return switch (json['@type']) {
      'EmailSessionVerifyCode' => EmailSessionVerifyCode.fromJson(json),
      'EmailSessionRegisterUser' => EmailSessionRegisterUser.fromJson(json),
      'EmailSessionSuccess' => EmailSessionSuccess.fromJson(json),
      'IdpSessionAuthorize' => IdpSessionAuthorize.fromJson(json),
      'IdpSessionLinkUser' => IdpSessionLinkUser.fromJson(json),
      'IdpSessionRegisterUser' => IdpSessionRegisterUser.fromJson(json),
      'IdpSessionSuccess' => IdpSessionSuccess.fromJson(json),
      final Object? unknown =>
        throw StateError('Unknown session state "$unknown": $json'),
    };
  }

  final String sessionId;
  final String sessionToken;

  Map<String, Object?> toJson();
}

sealed class SessionNeedsConfirmation implements SessionState {}

sealed class SessionRegisterUser implements SessionNeedsConfirmation {
  abstract final User user;
}

sealed class SessionLinkUser implements SessionNeedsConfirmation {
  abstract final User user;
}

sealed class SessionSuccess extends SessionState {
  SessionSuccess({
    required super.sessionId,
    required super.sessionToken,
    required this.isNewUser,
    required this.identityToken,
    required this.user,
  });

  final bool isNewUser;
  final String identityToken;
  final User user;
}

sealed class EmailSessionState extends SessionState {
  EmailSessionState({
    required super.sessionId,
    required super.sessionToken,
    required this.email,
  });

  final String email;
}

final class EmailSessionVerifyCode extends EmailSessionState {
  EmailSessionVerifyCode({
    required super.sessionId,
    required super.sessionToken,
    required super.email,
  });

  factory EmailSessionVerifyCode.fromJson(Map<String, Object?> json) {
    return EmailSessionVerifyCode(
      sessionId: json['sessionId'] as String,
      sessionToken: json['sessionToken'] as String,
      email: json['email'] as String,
    );
  }

  @override
  Map<String, Object?> toJson() => {
    '@type': 'EmailSessionVerifyCode',
    'sessionId': sessionId,
    'sessionToken': sessionToken,
    'email': email,
  };
}

sealed class EmailSessionNeedsConfirmation
    implements EmailSessionState, SessionNeedsConfirmation {}

final class EmailSessionRegisterUser extends EmailSessionState
    implements EmailSessionNeedsConfirmation, SessionRegisterUser {
  EmailSessionRegisterUser({
    required super.sessionId,
    required super.sessionToken,
    required super.email,
    required this.user,
  });

  factory EmailSessionRegisterUser.fromJson(Map<String, Object?> json) {
    return EmailSessionRegisterUser(
      sessionId: json['sessionId'] as String,
      sessionToken: json['sessionToken'] as String,
      email: json['email'] as String,
      user: User()..mergeFromProto3Json(json['user'] as Map<String, Object?>),
    );
  }

  @override
  final User user;

  @override
  Map<String, Object?> toJson() => {
    '@type': 'EmailSessionRegisterUser',
    'sessionId': sessionId,
    'sessionToken': sessionToken,
    'email': email,
    'user': user.toProto3Json(),
  };
}

final class EmailSessionSuccess extends SessionSuccess
    implements EmailSessionState {
  EmailSessionSuccess({
    required super.sessionId,
    required super.sessionToken,
    required super.isNewUser,
    required super.identityToken,
    required super.user,
    required this.email,
  });

  factory EmailSessionSuccess.fromJson(Map<String, Object?> json) {
    return EmailSessionSuccess(
      sessionId: json['sessionId'] as String,
      sessionToken: json['sessionToken'] as String,
      isNewUser: json['isNewUser'] as bool,
      identityToken: json['identityToken'] as String,
      user: User()..mergeFromProto3Json(json['user'] as Map<String, Object?>),
      email: json['email'] as String,
    );
  }

  @override
  final String email;

  @override
  Map<String, Object?> toJson() => {
    '@type': 'EmailSessionSuccess',
    'sessionId': sessionId,
    'sessionToken': sessionToken,
    'isNewUser': isNewUser,
    'identityToken': identityToken,
    'user': user.toProto3Json(),
    'email': email,
  };
}

sealed class SmsSessionState extends SessionState {
  SmsSessionState({
    required super.sessionId,
    required super.sessionToken,
    required this.phoneNumber,
  });

  final String phoneNumber;
}

final class SmsSessionVerifyCode extends SmsSessionState {
  SmsSessionVerifyCode({
    required super.sessionId,
    required super.sessionToken,
    required super.phoneNumber,
  });

  factory SmsSessionVerifyCode.fromJson(Map<String, Object?> json) {
    return SmsSessionVerifyCode(
      sessionId: json['sessionId'] as String,
      sessionToken: json['sessionToken'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );
  }

  @override
  Map<String, Object?> toJson() => {
    '@type': 'SmsSessionVerifyCode',
    'sessionId': sessionId,
    'sessionToken': sessionToken,
    'phoneNumber': phoneNumber,
  };
}

sealed class SmsSessionNeedsConfirmation
    implements SmsSessionState, SessionNeedsConfirmation {}

final class SmsSessionRegisterUser extends SmsSessionState
    implements SmsSessionNeedsConfirmation, SessionRegisterUser {
  SmsSessionRegisterUser({
    required super.sessionId,
    required super.sessionToken,
    required super.phoneNumber,
    required this.user,
  });

  factory SmsSessionRegisterUser.fromJson(Map<String, Object?> json) {
    return SmsSessionRegisterUser(
      sessionId: json['sessionId'] as String,
      sessionToken: json['sessionToken'] as String,
      phoneNumber: json['phoneNumber'] as String,
      user: User()..mergeFromProto3Json(json['user'] as Map<String, Object?>),
    );
  }

  @override
  final User user;

  @override
  Map<String, Object?> toJson() => {
    '@type': 'SmsSessionRegisterUser',
    'sessionId': sessionId,
    'sessionToken': sessionToken,
    'phoneNumber': phoneNumber,
    'user': user.toProto3Json(),
  };
}

final class SmsSessionSuccess extends SessionSuccess
    implements SmsSessionState {
  SmsSessionSuccess({
    required super.sessionId,
    required super.sessionToken,
    required super.isNewUser,
    required super.identityToken,
    required super.user,
    required this.phoneNumber,
  });

  factory SmsSessionSuccess.fromJson(Map<String, Object?> json) {
    return SmsSessionSuccess(
      sessionId: json['sessionId'] as String,
      sessionToken: json['sessionToken'] as String,
      isNewUser: json['isNewUser'] as bool,
      identityToken: json['identityToken'] as String,
      user: User()..mergeFromProto3Json(json['user'] as Map<String, Object?>),
      phoneNumber: json['phoneNumber'] as String,
    );
  }

  @override
  final String phoneNumber;

  @override
  Map<String, Object?> toJson() => {
    '@type': 'SmsSessionSuccess',
    'sessionId': sessionId,
    'sessionToken': sessionToken,
    'isNewUser': isNewUser,
    'identityToken': identityToken,
    'user': user.toProto3Json(),
    'phoneNumber': phoneNumber,
  };
}

sealed class IdpSessionState extends SessionState {
  IdpSessionState({required super.sessionId, required super.sessionToken});
}

final class IdpSessionAuthorize extends IdpSessionState {
  IdpSessionAuthorize({
    required super.sessionId,
    required super.sessionToken,
    required this.provder,
    required this.uri,
  });

  factory IdpSessionAuthorize.fromJson(Map<String, Object?> json) {
    return IdpSessionAuthorize(
      sessionId: json['sessionId'] as String,
      sessionToken: json['sessionToken'] as String,
      provder: IdentityProviderType.valueOf(json['provider'] as int)!,
      uri: Uri.parse(json['uri'] as String),
    );
  }

  final Uri uri;
  final IdentityProviderType provder;

  @override
  Map<String, Object?> toJson() => {
    '@type': 'IdpSessionAuthorize',
    'sessionId': sessionId,
    'sessionToken': sessionToken,
    'provider': provder.value,
    'uri': uri.toString(),
  };
}

sealed class IdpSessionResult implements IdpSessionState {}

sealed class IdpSessionNeedsConfirmation
    implements IdpSessionResult, SessionNeedsConfirmation {}

final class IdpSessionLinkUser extends IdpSessionState
    implements IdpSessionNeedsConfirmation, SessionLinkUser {
  IdpSessionLinkUser({
    required super.sessionId,
    required super.sessionToken,
    required this.user,
  });

  factory IdpSessionLinkUser.fromJson(Map<String, Object?> json) {
    return IdpSessionLinkUser(
      sessionId: json['sessionId'] as String,
      sessionToken: json['sessionToken'] as String,
      user: User()..mergeFromProto3Json(json['user'] as Map<String, Object?>),
    );
  }

  @override
  final User user;

  @override
  Map<String, Object?> toJson() => {
    '@type': 'IdpSessionLinkUser',
    'sessionId': sessionId,
    'sessionToken': sessionToken,
    'user': user.toProto3Json(),
  };
}

final class IdpSessionRegisterUser extends IdpSessionState
    implements IdpSessionNeedsConfirmation, SessionRegisterUser {
  IdpSessionRegisterUser({
    required super.sessionId,
    required super.sessionToken,
    required this.user,
  });

  factory IdpSessionRegisterUser.fromJson(Map<String, Object?> json) {
    return IdpSessionRegisterUser(
      sessionId: json['sessionId'] as String,
      sessionToken: json['sessionToken'] as String,
      user: User()..mergeFromProto3Json(json['user'] as Map<String, Object?>),
    );
  }

  @override
  final User user;

  @override
  Map<String, Object?> toJson() => {
    '@type': 'IdpSessionRegisterUser',
    'sessionId': sessionId,
    'sessionToken': sessionToken,
    'user': user.toProto3Json(),
  };
}

final class IdpSessionSuccess extends SessionSuccess
    implements IdpSessionResult {
  IdpSessionSuccess({
    required super.sessionId,
    required super.sessionToken,
    required super.identityToken,
    required super.user,
    required super.isNewUser,
  });

  factory IdpSessionSuccess.fromJson(Map<String, Object?> json) {
    return IdpSessionSuccess(
      sessionId: json['sessionId'] as String,
      sessionToken: json['sessionToken'] as String,
      isNewUser: json['isNewUser'] as bool,
      identityToken: json['identityToken'] as String,
      user: User()..mergeFromProto3Json(json['user'] as Map<String, Object?>),
    );
  }

  @override
  Map<String, Object?> toJson() => {
    '@type': 'IdpSessionSuccess',
    'sessionId': sessionId,
    'sessionToken': sessionToken,
    'isNewUser': isNewUser,
    'identityToken': identityToken,
    'user': user.toProto3Json(),
  };
}
