//
//  Generated code. Do not modify.
//  source: celest/cloud/auth/v1alpha1/authentication.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../google/protobuf/empty.pb.dart' as $1;
import '../../../../google/protobuf/struct.pb.dart' as $10;
import '../../../../google/protobuf/timestamp.pb.dart' as $8;
import 'authentication.pbenum.dart';
import 'users.pb.dart' as $0;
import 'users.pbenum.dart' as $0;

export 'authentication.pbenum.dart';

enum Session_State { success, nextStep, notSet }

/// Response message for `StartSession` and `ContinueSession` methods.
class Session extends $pb.GeneratedMessage {
  factory Session({
    $core.String? parent,
    $core.String? sessionId,
    $core.String? sessionToken,
    $8.Timestamp? expireTime,
    AuthenticationSuccess? success,
    AuthenticationStep? nextStep,
    SessionClient? client,
  }) {
    final $result = create();
    if (parent != null) {
      $result.parent = parent;
    }
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (sessionToken != null) {
      $result.sessionToken = sessionToken;
    }
    if (expireTime != null) {
      $result.expireTime = expireTime;
    }
    if (success != null) {
      $result.success = success;
    }
    if (nextStep != null) {
      $result.nextStep = nextStep;
    }
    if (client != null) {
      $result.client = client;
    }
    return $result;
  }
  Session._() : super();
  factory Session.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Session.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Session_State> _Session_StateByTag = {
    5: Session_State.success,
    6: Session_State.nextStep,
    0: Session_State.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Session',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..oo(0, [5, 6])
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..aOS(2, _omitFieldNames ? '' : 'sessionId')
    ..aOS(3, _omitFieldNames ? '' : 'sessionToken')
    ..aOM<$8.Timestamp>(4, _omitFieldNames ? '' : 'expireTime',
        subBuilder: $8.Timestamp.create)
    ..aOM<AuthenticationSuccess>(5, _omitFieldNames ? '' : 'success',
        subBuilder: AuthenticationSuccess.create)
    ..aOM<AuthenticationStep>(6, _omitFieldNames ? '' : 'nextStep',
        subBuilder: AuthenticationStep.create)
    ..aOM<SessionClient>(7, _omitFieldNames ? '' : 'client',
        subBuilder: SessionClient.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Session clone() => Session()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Session copyWith(void Function(Session) updates) =>
      super.copyWith((message) => updates(message as Session)) as Session;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Session create() => Session._();
  Session createEmptyInstance() => create();
  static $pb.PbList<Session> createRepeated() => $pb.PbList<Session>();
  @$core.pragma('dart2js:noInline')
  static Session getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Session>(create);
  static Session? _defaultInstance;

  Session_State whichState() => _Session_StateByTag[$_whichOneof(0)]!;
  void clearState() => clearField($_whichOneof(0));

  /// Required. The parent resource in which the authentication session was created.
  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => clearField(1);

  /// Required. The ID of the authentication session.
  @$pb.TagNumber(2)
  $core.String get sessionId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sessionId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSessionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionId() => clearField(2);

  ///  A token to continue the authentication operation.
  ///
  ///  This token is valid for a limited time and must be passed to `ContinueSession`.
  @$pb.TagNumber(3)
  $core.String get sessionToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set sessionToken($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSessionToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearSessionToken() => clearField(3);

  /// Required. The time the flow will expire.
  @$pb.TagNumber(4)
  $8.Timestamp get expireTime => $_getN(3);
  @$pb.TagNumber(4)
  set expireTime($8.Timestamp v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasExpireTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpireTime() => clearField(4);
  @$pb.TagNumber(4)
  $8.Timestamp ensureExpireTime() => $_ensure(3);

  /// The authentication operation was successful.
  @$pb.TagNumber(5)
  AuthenticationSuccess get success => $_getN(4);
  @$pb.TagNumber(5)
  set success(AuthenticationSuccess v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSuccess() => $_has(4);
  @$pb.TagNumber(5)
  void clearSuccess() => clearField(5);
  @$pb.TagNumber(5)
  AuthenticationSuccess ensureSuccess() => $_ensure(4);

  ///  Further action is needed to complete the authentication.
  ///
  ///  Fill in the required fields and call `ContinueSession` with the same `session_id`.
  @$pb.TagNumber(6)
  AuthenticationStep get nextStep => $_getN(5);
  @$pb.TagNumber(6)
  set nextStep(AuthenticationStep v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNextStep() => $_has(5);
  @$pb.TagNumber(6)
  void clearNextStep() => clearField(6);
  @$pb.TagNumber(6)
  AuthenticationStep ensureNextStep() => $_ensure(5);

  /// Required. The client who initiated the session.
  @$pb.TagNumber(7)
  SessionClient get client => $_getN(6);
  @$pb.TagNumber(7)
  set client(SessionClient v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasClient() => $_has(6);
  @$pb.TagNumber(7)
  void clearClient() => clearField(7);
  @$pb.TagNumber(7)
  SessionClient ensureClient() => $_ensure(6);
}

/// A description of the client creating the session.
class SessionClient extends $pb.GeneratedMessage {
  factory SessionClient({
    $core.String? clientId,
    ClientType? clientType,
    SessionCallbacks? callbacks,
  }) {
    final $result = create();
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (clientType != null) {
      $result.clientType = clientType;
    }
    if (callbacks != null) {
      $result.callbacks = callbacks;
    }
    return $result;
  }
  SessionClient._() : super();
  factory SessionClient.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SessionClient.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionClient',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientId')
    ..e<ClientType>(2, _omitFieldNames ? '' : 'clientType', $pb.PbFieldType.OE,
        defaultOrMaker: ClientType.CLIENT_TYPE_UNSPECIFIED,
        valueOf: ClientType.valueOf,
        enumValues: ClientType.values)
    ..aOM<SessionCallbacks>(3, _omitFieldNames ? '' : 'callbacks',
        subBuilder: SessionCallbacks.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SessionClient clone() => SessionClient()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SessionClient copyWith(void Function(SessionClient) updates) =>
      super.copyWith((message) => updates(message as SessionClient))
          as SessionClient;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SessionClient create() => SessionClient._();
  SessionClient createEmptyInstance() => create();
  static $pb.PbList<SessionClient> createRepeated() =>
      $pb.PbList<SessionClient>();
  @$core.pragma('dart2js:noInline')
  static SessionClient getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SessionClient>(create);
  static SessionClient? _defaultInstance;

  /// Required. The ID of the client.
  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => clearField(1);

  /// Required. The platform of the client.
  @$pb.TagNumber(2)
  ClientType get clientType => $_getN(1);
  @$pb.TagNumber(2)
  set clientType(ClientType v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasClientType() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientType() => clearField(2);

  /// Required. If the client is able to receive callbacks.
  @$pb.TagNumber(3)
  SessionCallbacks get callbacks => $_getN(2);
  @$pb.TagNumber(3)
  set callbacks(SessionCallbacks v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCallbacks() => $_has(2);
  @$pb.TagNumber(3)
  void clearCallbacks() => clearField(3);
  @$pb.TagNumber(3)
  SessionCallbacks ensureCallbacks() => $_ensure(2);
}

/// Callback URIs for the client.
class SessionCallbacks extends $pb.GeneratedMessage {
  factory SessionCallbacks({
    $core.String? successUri,
    $core.String? errorUri,
  }) {
    final $result = create();
    if (successUri != null) {
      $result.successUri = successUri;
    }
    if (errorUri != null) {
      $result.errorUri = errorUri;
    }
    return $result;
  }
  SessionCallbacks._() : super();
  factory SessionCallbacks.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SessionCallbacks.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SessionCallbacks',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'successUri')
    ..aOS(2, _omitFieldNames ? '' : 'errorUri')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SessionCallbacks clone() => SessionCallbacks()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SessionCallbacks copyWith(void Function(SessionCallbacks) updates) =>
      super.copyWith((message) => updates(message as SessionCallbacks))
          as SessionCallbacks;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SessionCallbacks create() => SessionCallbacks._();
  SessionCallbacks createEmptyInstance() => create();
  static $pb.PbList<SessionCallbacks> createRepeated() =>
      $pb.PbList<SessionCallbacks>();
  @$core.pragma('dart2js:noInline')
  static SessionCallbacks getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SessionCallbacks>(create);
  static SessionCallbacks? _defaultInstance;

  /// Required. The URI to redirect to upon successful authentication.
  @$pb.TagNumber(1)
  $core.String get successUri => $_getSZ(0);
  @$pb.TagNumber(1)
  set successUri($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccessUri() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccessUri() => clearField(1);

  ///  Optional. The URI to redirect to upon an error.
  ///
  ///  If not provided, the user will be redirected to the success URL with an error query parameter.
  @$pb.TagNumber(2)
  $core.String get errorUri => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorUri($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasErrorUri() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorUri() => clearField(2);
}

enum StartSessionRequest_Factor { emailOtp, smsOtp, idp, notSet }

/// Request message for `StartSession` method.
class StartSessionRequest extends $pb.GeneratedMessage {
  factory StartSessionRequest({
    $core.String? parent,
    AuthenticationFactorEmailOtp? emailOtp,
    AuthenticationFactorSmsOtp? smsOtp,
    AuthenticationFactorIdp? idp,
    SessionClient? client,
  }) {
    final $result = create();
    if (parent != null) {
      $result.parent = parent;
    }
    if (emailOtp != null) {
      $result.emailOtp = emailOtp;
    }
    if (smsOtp != null) {
      $result.smsOtp = smsOtp;
    }
    if (idp != null) {
      $result.idp = idp;
    }
    if (client != null) {
      $result.client = client;
    }
    return $result;
  }
  StartSessionRequest._() : super();
  factory StartSessionRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StartSessionRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, StartSessionRequest_Factor>
      _StartSessionRequest_FactorByTag = {
    2: StartSessionRequest_Factor.emailOtp,
    3: StartSessionRequest_Factor.smsOtp,
    4: StartSessionRequest_Factor.idp,
    0: StartSessionRequest_Factor.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartSessionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..aOM<AuthenticationFactorEmailOtp>(2, _omitFieldNames ? '' : 'emailOtp',
        subBuilder: AuthenticationFactorEmailOtp.create)
    ..aOM<AuthenticationFactorSmsOtp>(3, _omitFieldNames ? '' : 'smsOtp',
        subBuilder: AuthenticationFactorSmsOtp.create)
    ..aOM<AuthenticationFactorIdp>(4, _omitFieldNames ? '' : 'idp',
        subBuilder: AuthenticationFactorIdp.create)
    ..aOM<SessionClient>(5, _omitFieldNames ? '' : 'client',
        subBuilder: SessionClient.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StartSessionRequest clone() => StartSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StartSessionRequest copyWith(void Function(StartSessionRequest) updates) =>
      super.copyWith((message) => updates(message as StartSessionRequest))
          as StartSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartSessionRequest create() => StartSessionRequest._();
  StartSessionRequest createEmptyInstance() => create();
  static $pb.PbList<StartSessionRequest> createRepeated() =>
      $pb.PbList<StartSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static StartSessionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartSessionRequest>(create);
  static StartSessionRequest? _defaultInstance;

  StartSessionRequest_Factor whichFactor() =>
      _StartSessionRequest_FactorByTag[$_whichOneof(0)]!;
  void clearFactor() => clearField($_whichOneof(0));

  ///  Optional. The parent resource in which the authentication session will be created.
  ///
  ///  If not provided, the session will be created in the root service context.
  ///
  ///  Format: `organizations/{organization}` or `organizations/{organization}/projects/{project}`.
  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => clearField(1);

  /// Authenticate using an email address and OTP.
  @$pb.TagNumber(2)
  AuthenticationFactorEmailOtp get emailOtp => $_getN(1);
  @$pb.TagNumber(2)
  set emailOtp(AuthenticationFactorEmailOtp v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEmailOtp() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmailOtp() => clearField(2);
  @$pb.TagNumber(2)
  AuthenticationFactorEmailOtp ensureEmailOtp() => $_ensure(1);

  /// Authenticate using a phone number and OTP.
  @$pb.TagNumber(3)
  AuthenticationFactorSmsOtp get smsOtp => $_getN(2);
  @$pb.TagNumber(3)
  set smsOtp(AuthenticationFactorSmsOtp v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSmsOtp() => $_has(2);
  @$pb.TagNumber(3)
  void clearSmsOtp() => clearField(3);
  @$pb.TagNumber(3)
  AuthenticationFactorSmsOtp ensureSmsOtp() => $_ensure(2);

  /// Authenticate using a third-party identity provider like Google or Apple.
  @$pb.TagNumber(4)
  AuthenticationFactorIdp get idp => $_getN(3);
  @$pb.TagNumber(4)
  set idp(AuthenticationFactorIdp v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIdp() => $_has(3);
  @$pb.TagNumber(4)
  void clearIdp() => clearField(4);
  @$pb.TagNumber(4)
  AuthenticationFactorIdp ensureIdp() => $_ensure(3);

  /// Required. The client initiating the session.
  @$pb.TagNumber(5)
  SessionClient get client => $_getN(4);
  @$pb.TagNumber(5)
  set client(SessionClient v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasClient() => $_has(4);
  @$pb.TagNumber(5)
  void clearClient() => clearField(5);
  @$pb.TagNumber(5)
  SessionClient ensureClient() => $_ensure(4);
}

enum AuthenticationStep_Step { needsProof, pendingConfirmation, notSet }

/// More information is needed to complete the authentication.
class AuthenticationStep extends $pb.GeneratedMessage {
  factory AuthenticationStep({
    AuthenticationFactor? needsProof,
    AuthenticationPendingConfirmation? pendingConfirmation,
  }) {
    final $result = create();
    if (needsProof != null) {
      $result.needsProof = needsProof;
    }
    if (pendingConfirmation != null) {
      $result.pendingConfirmation = pendingConfirmation;
    }
    return $result;
  }
  AuthenticationStep._() : super();
  factory AuthenticationStep.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuthenticationStep.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, AuthenticationStep_Step>
      _AuthenticationStep_StepByTag = {
    3: AuthenticationStep_Step.needsProof,
    7: AuthenticationStep_Step.pendingConfirmation,
    0: AuthenticationStep_Step.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthenticationStep',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..oo(0, [3, 7])
    ..aOM<AuthenticationFactor>(3, _omitFieldNames ? '' : 'needsProof',
        subBuilder: AuthenticationFactor.create)
    ..aOM<AuthenticationPendingConfirmation>(
        7, _omitFieldNames ? '' : 'pendingConfirmation',
        subBuilder: AuthenticationPendingConfirmation.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuthenticationStep clone() => AuthenticationStep()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuthenticationStep copyWith(void Function(AuthenticationStep) updates) =>
      super.copyWith((message) => updates(message as AuthenticationStep))
          as AuthenticationStep;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthenticationStep create() => AuthenticationStep._();
  AuthenticationStep createEmptyInstance() => create();
  static $pb.PbList<AuthenticationStep> createRepeated() =>
      $pb.PbList<AuthenticationStep>();
  @$core.pragma('dart2js:noInline')
  static AuthenticationStep getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthenticationStep>(create);
  static AuthenticationStep? _defaultInstance;

  AuthenticationStep_Step whichStep() =>
      _AuthenticationStep_StepByTag[$_whichOneof(0)]!;
  void clearStep() => clearField($_whichOneof(0));

  /// Further proof of an authentication factor is required.
  @$pb.TagNumber(3)
  AuthenticationFactor get needsProof => $_getN(0);
  @$pb.TagNumber(3)
  set needsProof(AuthenticationFactor v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNeedsProof() => $_has(0);
  @$pb.TagNumber(3)
  void clearNeedsProof() => clearField(3);
  @$pb.TagNumber(3)
  AuthenticationFactor ensureNeedsProof() => $_ensure(0);

  ///  The authentication operation needs confirmation.
  ///
  ///  Typically this happens when no user exists with the provided identity or when the
  ///  provided identity matches an existing one but they are not yet linked.
  @$pb.TagNumber(7)
  AuthenticationPendingConfirmation get pendingConfirmation => $_getN(1);
  @$pb.TagNumber(7)
  set pendingConfirmation(AuthenticationPendingConfirmation v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPendingConfirmation() => $_has(1);
  @$pb.TagNumber(7)
  void clearPendingConfirmation() => clearField(7);
  @$pb.TagNumber(7)
  AuthenticationPendingConfirmation ensurePendingConfirmation() => $_ensure(1);
}

/// An authentication method which sends a one-time passcode (OTP) to a user's
/// email address.
class AuthenticationFactorEmailOtp extends $pb.GeneratedMessage {
  factory AuthenticationFactorEmailOtp({
    $core.String? email,
    $core.String? code,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    if (code != null) {
      $result.code = code;
    }
    return $result;
  }
  AuthenticationFactorEmailOtp._() : super();
  factory AuthenticationFactorEmailOtp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuthenticationFactorEmailOtp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthenticationFactorEmailOtp',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuthenticationFactorEmailOtp clone() =>
      AuthenticationFactorEmailOtp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuthenticationFactorEmailOtp copyWith(
          void Function(AuthenticationFactorEmailOtp) updates) =>
      super.copyWith(
              (message) => updates(message as AuthenticationFactorEmailOtp))
          as AuthenticationFactorEmailOtp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthenticationFactorEmailOtp create() =>
      AuthenticationFactorEmailOtp._();
  AuthenticationFactorEmailOtp createEmptyInstance() => create();
  static $pb.PbList<AuthenticationFactorEmailOtp> createRepeated() =>
      $pb.PbList<AuthenticationFactorEmailOtp>();
  @$core.pragma('dart2js:noInline')
  static AuthenticationFactorEmailOtp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthenticationFactorEmailOtp>(create);
  static AuthenticationFactorEmailOtp? _defaultInstance;

  /// Required. The email address to send the OTP to.
  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  ///  Optional. The OTP code sent to the provided `email`.
  ///
  ///  Leave this field empty to send the OTP.
  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

/// An authentication method which sends a one-time passcode (OTP) to a user's
/// phone number.
class AuthenticationFactorSmsOtp extends $pb.GeneratedMessage {
  factory AuthenticationFactorSmsOtp({
    $core.String? phoneNumber,
    $core.String? code,
  }) {
    final $result = create();
    if (phoneNumber != null) {
      $result.phoneNumber = phoneNumber;
    }
    if (code != null) {
      $result.code = code;
    }
    return $result;
  }
  AuthenticationFactorSmsOtp._() : super();
  factory AuthenticationFactorSmsOtp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuthenticationFactorSmsOtp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthenticationFactorSmsOtp',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'phoneNumber')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuthenticationFactorSmsOtp clone() =>
      AuthenticationFactorSmsOtp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuthenticationFactorSmsOtp copyWith(
          void Function(AuthenticationFactorSmsOtp) updates) =>
      super.copyWith(
              (message) => updates(message as AuthenticationFactorSmsOtp))
          as AuthenticationFactorSmsOtp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthenticationFactorSmsOtp create() => AuthenticationFactorSmsOtp._();
  AuthenticationFactorSmsOtp createEmptyInstance() => create();
  static $pb.PbList<AuthenticationFactorSmsOtp> createRepeated() =>
      $pb.PbList<AuthenticationFactorSmsOtp>();
  @$core.pragma('dart2js:noInline')
  static AuthenticationFactorSmsOtp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthenticationFactorSmsOtp>(create);
  static AuthenticationFactorSmsOtp? _defaultInstance;

  /// Required. The phone number to send the OTP to.
  @$pb.TagNumber(1)
  $core.String get phoneNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set phoneNumber($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPhoneNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhoneNumber() => clearField(1);

  ///  Optional. The OTP code sent to the provided `phone_number`.
  ///
  ///  Leave this field empty to send the OTP.
  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

/// An authentication method which uses a social provider like Google or Apple.
class AuthenticationFactorIdp extends $pb.GeneratedMessage {
  factory AuthenticationFactorIdp({
    $0.IdentityProviderType? provider,
    $core.String? redirectUri,
  }) {
    final $result = create();
    if (provider != null) {
      $result.provider = provider;
    }
    if (redirectUri != null) {
      $result.redirectUri = redirectUri;
    }
    return $result;
  }
  AuthenticationFactorIdp._() : super();
  factory AuthenticationFactorIdp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuthenticationFactorIdp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthenticationFactorIdp',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..e<$0.IdentityProviderType>(
        1, _omitFieldNames ? '' : 'provider', $pb.PbFieldType.OE,
        defaultOrMaker:
            $0.IdentityProviderType.IDENTITY_PROVIDER_TYPE_UNSPECIFIED,
        valueOf: $0.IdentityProviderType.valueOf,
        enumValues: $0.IdentityProviderType.values)
    ..aOS(2, _omitFieldNames ? '' : 'redirectUri')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuthenticationFactorIdp clone() =>
      AuthenticationFactorIdp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuthenticationFactorIdp copyWith(
          void Function(AuthenticationFactorIdp) updates) =>
      super.copyWith((message) => updates(message as AuthenticationFactorIdp))
          as AuthenticationFactorIdp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthenticationFactorIdp create() => AuthenticationFactorIdp._();
  AuthenticationFactorIdp createEmptyInstance() => create();
  static $pb.PbList<AuthenticationFactorIdp> createRepeated() =>
      $pb.PbList<AuthenticationFactorIdp>();
  @$core.pragma('dart2js:noInline')
  static AuthenticationFactorIdp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthenticationFactorIdp>(create);
  static AuthenticationFactorIdp? _defaultInstance;

  /// Required. The social provider to authenticate with.
  @$pb.TagNumber(1)
  $0.IdentityProviderType get provider => $_getN(0);
  @$pb.TagNumber(1)
  set provider($0.IdentityProviderType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasProvider() => $_has(0);
  @$pb.TagNumber(1)
  void clearProvider() => clearField(1);

  /// Optional. The URI the client was redirected to.
  @$pb.TagNumber(2)
  $core.String get redirectUri => $_getSZ(1);
  @$pb.TagNumber(2)
  set redirectUri($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRedirectUri() => $_has(1);
  @$pb.TagNumber(2)
  void clearRedirectUri() => clearField(2);
}

enum AuthenticationFactor_Factor { emailOtp, smsOtp, idp, notSet }

/// A factor for authenticating a user.
class AuthenticationFactor extends $pb.GeneratedMessage {
  factory AuthenticationFactor({
    AuthenticationFactorEmailOtp? emailOtp,
    AuthenticationFactorSmsOtp? smsOtp,
    AuthenticationFactorIdp? idp,
  }) {
    final $result = create();
    if (emailOtp != null) {
      $result.emailOtp = emailOtp;
    }
    if (smsOtp != null) {
      $result.smsOtp = smsOtp;
    }
    if (idp != null) {
      $result.idp = idp;
    }
    return $result;
  }
  AuthenticationFactor._() : super();
  factory AuthenticationFactor.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuthenticationFactor.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, AuthenticationFactor_Factor>
      _AuthenticationFactor_FactorByTag = {
    3: AuthenticationFactor_Factor.emailOtp,
    4: AuthenticationFactor_Factor.smsOtp,
    5: AuthenticationFactor_Factor.idp,
    0: AuthenticationFactor_Factor.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthenticationFactor',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5])
    ..aOM<AuthenticationFactorEmailOtp>(3, _omitFieldNames ? '' : 'emailOtp',
        subBuilder: AuthenticationFactorEmailOtp.create)
    ..aOM<AuthenticationFactorSmsOtp>(4, _omitFieldNames ? '' : 'smsOtp',
        subBuilder: AuthenticationFactorSmsOtp.create)
    ..aOM<AuthenticationFactorIdp>(5, _omitFieldNames ? '' : 'idp',
        subBuilder: AuthenticationFactorIdp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuthenticationFactor clone() =>
      AuthenticationFactor()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuthenticationFactor copyWith(void Function(AuthenticationFactor) updates) =>
      super.copyWith((message) => updates(message as AuthenticationFactor))
          as AuthenticationFactor;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthenticationFactor create() => AuthenticationFactor._();
  AuthenticationFactor createEmptyInstance() => create();
  static $pb.PbList<AuthenticationFactor> createRepeated() =>
      $pb.PbList<AuthenticationFactor>();
  @$core.pragma('dart2js:noInline')
  static AuthenticationFactor getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthenticationFactor>(create);
  static AuthenticationFactor? _defaultInstance;

  AuthenticationFactor_Factor whichFactor() =>
      _AuthenticationFactor_FactorByTag[$_whichOneof(0)]!;
  void clearFactor() => clearField($_whichOneof(0));

  /// Continuation handler for the email OTP authentication session.
  @$pb.TagNumber(3)
  AuthenticationFactorEmailOtp get emailOtp => $_getN(0);
  @$pb.TagNumber(3)
  set emailOtp(AuthenticationFactorEmailOtp v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEmailOtp() => $_has(0);
  @$pb.TagNumber(3)
  void clearEmailOtp() => clearField(3);
  @$pb.TagNumber(3)
  AuthenticationFactorEmailOtp ensureEmailOtp() => $_ensure(0);

  /// Continuation handler for the SMS OTP authentication session.
  @$pb.TagNumber(4)
  AuthenticationFactorSmsOtp get smsOtp => $_getN(1);
  @$pb.TagNumber(4)
  set smsOtp(AuthenticationFactorSmsOtp v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSmsOtp() => $_has(1);
  @$pb.TagNumber(4)
  void clearSmsOtp() => clearField(4);
  @$pb.TagNumber(4)
  AuthenticationFactorSmsOtp ensureSmsOtp() => $_ensure(1);

  /// Continuation handler for the social authentication session.
  @$pb.TagNumber(5)
  AuthenticationFactorIdp get idp => $_getN(2);
  @$pb.TagNumber(5)
  set idp(AuthenticationFactorIdp v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIdp() => $_has(2);
  @$pb.TagNumber(5)
  void clearIdp() => clearField(5);
  @$pb.TagNumber(5)
  AuthenticationFactorIdp ensureIdp() => $_ensure(2);
}

enum ContinueSessionRequest_Update { proof, confirmation, resend, notSet }

/// Request message for `ContinueSession` method.
class ContinueSessionRequest extends $pb.GeneratedMessage {
  factory ContinueSessionRequest({
    $core.String? sessionId,
    $core.String? sessionToken,
    AuthenticationFactor? proof,
    AuthenticationPendingConfirmation? confirmation,
    AuthenticationFactor? resend,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (sessionToken != null) {
      $result.sessionToken = sessionToken;
    }
    if (proof != null) {
      $result.proof = proof;
    }
    if (confirmation != null) {
      $result.confirmation = confirmation;
    }
    if (resend != null) {
      $result.resend = resend;
    }
    return $result;
  }
  ContinueSessionRequest._() : super();
  factory ContinueSessionRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ContinueSessionRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ContinueSessionRequest_Update>
      _ContinueSessionRequest_UpdateByTag = {
    3: ContinueSessionRequest_Update.proof,
    4: ContinueSessionRequest_Update.confirmation,
    5: ContinueSessionRequest_Update.resend,
    0: ContinueSessionRequest_Update.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ContinueSessionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5])
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..aOS(2, _omitFieldNames ? '' : 'sessionToken')
    ..aOM<AuthenticationFactor>(3, _omitFieldNames ? '' : 'proof',
        subBuilder: AuthenticationFactor.create)
    ..aOM<AuthenticationPendingConfirmation>(
        4, _omitFieldNames ? '' : 'confirmation',
        subBuilder: AuthenticationPendingConfirmation.create)
    ..aOM<AuthenticationFactor>(5, _omitFieldNames ? '' : 'resend',
        subBuilder: AuthenticationFactor.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ContinueSessionRequest clone() =>
      ContinueSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ContinueSessionRequest copyWith(
          void Function(ContinueSessionRequest) updates) =>
      super.copyWith((message) => updates(message as ContinueSessionRequest))
          as ContinueSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContinueSessionRequest create() => ContinueSessionRequest._();
  ContinueSessionRequest createEmptyInstance() => create();
  static $pb.PbList<ContinueSessionRequest> createRepeated() =>
      $pb.PbList<ContinueSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static ContinueSessionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ContinueSessionRequest>(create);
  static ContinueSessionRequest? _defaultInstance;

  ContinueSessionRequest_Update whichUpdate() =>
      _ContinueSessionRequest_UpdateByTag[$_whichOneof(0)]!;
  void clearUpdate() => clearField($_whichOneof(0));

  /// Required. The ID of the authentication session.
  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);

  /// Required. The continuation token returned from a previous `StartSession`
  /// or `ContinueSession` call.
  @$pb.TagNumber(2)
  $core.String get sessionToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set sessionToken($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSessionToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionToken() => clearField(2);

  /// Proof for an authentication factor.
  @$pb.TagNumber(3)
  AuthenticationFactor get proof => $_getN(2);
  @$pb.TagNumber(3)
  set proof(AuthenticationFactor v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasProof() => $_has(2);
  @$pb.TagNumber(3)
  void clearProof() => clearField(3);
  @$pb.TagNumber(3)
  AuthenticationFactor ensureProof() => $_ensure(2);

  /// Confirmation of a pending session creation.
  @$pb.TagNumber(4)
  AuthenticationPendingConfirmation get confirmation => $_getN(3);
  @$pb.TagNumber(4)
  set confirmation(AuthenticationPendingConfirmation v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasConfirmation() => $_has(3);
  @$pb.TagNumber(4)
  void clearConfirmation() => clearField(4);
  @$pb.TagNumber(4)
  AuthenticationPendingConfirmation ensureConfirmation() => $_ensure(3);

  /// Resend an OTP code.
  @$pb.TagNumber(5)
  AuthenticationFactor get resend => $_getN(4);
  @$pb.TagNumber(5)
  set resend(AuthenticationFactor v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasResend() => $_has(4);
  @$pb.TagNumber(5)
  void clearResend() => clearField(5);
  @$pb.TagNumber(5)
  AuthenticationFactor ensureResend() => $_ensure(4);
}

/// The authentication session was successful.
class AuthenticationSuccess extends $pb.GeneratedMessage {
  factory AuthenticationSuccess({
    $core.String? identityToken,
    $0.User? user,
    $core.bool? isNewUser,
  }) {
    final $result = create();
    if (identityToken != null) {
      $result.identityToken = identityToken;
    }
    if (user != null) {
      $result.user = user;
    }
    if (isNewUser != null) {
      $result.isNewUser = isNewUser;
    }
    return $result;
  }
  AuthenticationSuccess._() : super();
  factory AuthenticationSuccess.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuthenticationSuccess.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthenticationSuccess',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'identityToken')
    ..aOM<$0.User>(2, _omitFieldNames ? '' : 'user', subBuilder: $0.User.create)
    ..aOB(3, _omitFieldNames ? '' : 'isNewUser')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuthenticationSuccess clone() =>
      AuthenticationSuccess()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuthenticationSuccess copyWith(
          void Function(AuthenticationSuccess) updates) =>
      super.copyWith((message) => updates(message as AuthenticationSuccess))
          as AuthenticationSuccess;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthenticationSuccess create() => AuthenticationSuccess._();
  AuthenticationSuccess createEmptyInstance() => create();
  static $pb.PbList<AuthenticationSuccess> createRepeated() =>
      $pb.PbList<AuthenticationSuccess>();
  @$core.pragma('dart2js:noInline')
  static AuthenticationSuccess getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthenticationSuccess>(create);
  static AuthenticationSuccess? _defaultInstance;

  /// The ID token for the user.
  @$pb.TagNumber(1)
  $core.String get identityToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set identityToken($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIdentityToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentityToken() => clearField(1);

  /// The user's information.
  @$pb.TagNumber(2)
  $0.User get user => $_getN(1);
  @$pb.TagNumber(2)
  set user($0.User v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  $0.User ensureUser() => $_ensure(1);

  /// Whether a new user was created or not.
  @$pb.TagNumber(3)
  $core.bool get isNewUser => $_getBF(2);
  @$pb.TagNumber(3)
  set isNewUser($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsNewUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsNewUser() => clearField(3);
}

enum AuthenticationPendingConfirmation_Pending {
  linkExistingUser,
  registerUser,
  notSet
}

/// The authentication operation needs confirmation from the user.
class AuthenticationPendingConfirmation extends $pb.GeneratedMessage {
  factory AuthenticationPendingConfirmation({
    $0.User? linkExistingUser,
    $0.User? registerUser,
  }) {
    final $result = create();
    if (linkExistingUser != null) {
      $result.linkExistingUser = linkExistingUser;
    }
    if (registerUser != null) {
      $result.registerUser = registerUser;
    }
    return $result;
  }
  AuthenticationPendingConfirmation._() : super();
  factory AuthenticationPendingConfirmation.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuthenticationPendingConfirmation.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, AuthenticationPendingConfirmation_Pending>
      _AuthenticationPendingConfirmation_PendingByTag = {
    1: AuthenticationPendingConfirmation_Pending.linkExistingUser,
    2: AuthenticationPendingConfirmation_Pending.registerUser,
    0: AuthenticationPendingConfirmation_Pending.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthenticationPendingConfirmation',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$0.User>(1, _omitFieldNames ? '' : 'linkExistingUser',
        subBuilder: $0.User.create)
    ..aOM<$0.User>(2, _omitFieldNames ? '' : 'registerUser',
        subBuilder: $0.User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuthenticationPendingConfirmation clone() =>
      AuthenticationPendingConfirmation()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuthenticationPendingConfirmation copyWith(
          void Function(AuthenticationPendingConfirmation) updates) =>
      super.copyWith((message) =>
              updates(message as AuthenticationPendingConfirmation))
          as AuthenticationPendingConfirmation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthenticationPendingConfirmation create() =>
      AuthenticationPendingConfirmation._();
  AuthenticationPendingConfirmation createEmptyInstance() => create();
  static $pb.PbList<AuthenticationPendingConfirmation> createRepeated() =>
      $pb.PbList<AuthenticationPendingConfirmation>();
  @$core.pragma('dart2js:noInline')
  static AuthenticationPendingConfirmation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthenticationPendingConfirmation>(
          create);
  static AuthenticationPendingConfirmation? _defaultInstance;

  AuthenticationPendingConfirmation_Pending whichPending() =>
      _AuthenticationPendingConfirmation_PendingByTag[$_whichOneof(0)]!;
  void clearPending() => clearField($_whichOneof(0));

  /// An existing user was found with the provided identity.
  @$pb.TagNumber(1)
  $0.User get linkExistingUser => $_getN(0);
  @$pb.TagNumber(1)
  set linkExistingUser($0.User v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLinkExistingUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearLinkExistingUser() => clearField(1);
  @$pb.TagNumber(1)
  $0.User ensureLinkExistingUser() => $_ensure(0);

  /// The user to be registered.
  @$pb.TagNumber(2)
  $0.User get registerUser => $_getN(1);
  @$pb.TagNumber(2)
  set registerUser($0.User v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRegisterUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearRegisterUser() => clearField(2);
  @$pb.TagNumber(2)
  $0.User ensureRegisterUser() => $_ensure(1);
}

/// Request message for `EndSession` method.
class EndSessionRequest extends $pb.GeneratedMessage {
  factory EndSessionRequest({
    $core.String? sessionId,
    $core.String? sessionToken,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (sessionToken != null) {
      $result.sessionToken = sessionToken;
    }
    return $result;
  }
  EndSessionRequest._() : super();
  factory EndSessionRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EndSessionRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EndSessionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..aOS(2, _omitFieldNames ? '' : 'sessionToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EndSessionRequest clone() => EndSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EndSessionRequest copyWith(void Function(EndSessionRequest) updates) =>
      super.copyWith((message) => updates(message as EndSessionRequest))
          as EndSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndSessionRequest create() => EndSessionRequest._();
  EndSessionRequest createEmptyInstance() => create();
  static $pb.PbList<EndSessionRequest> createRepeated() =>
      $pb.PbList<EndSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static EndSessionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EndSessionRequest>(create);
  static EndSessionRequest? _defaultInstance;

  ///  Optional. The ID of the authentication session.
  ///
  ///  If not provided, the session will be ended for the current authenticated user.
  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);

  ///  Optional. The session token returned from a previous `StartSession`
  ///  or `ContinueSession` call.
  ///
  ///  If not provided, the session will be ended for the current authenticated user.
  @$pb.TagNumber(2)
  $core.String get sessionToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set sessionToken($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSessionToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionToken() => clearField(2);
}

enum EndSessionResponse_Result { success, redirectUri, notSet }

/// Response message for `EndSession` method.
class EndSessionResponse extends $pb.GeneratedMessage {
  factory EndSessionResponse({
    $core.String? sessionId,
    $1.Empty? success,
    $core.String? redirectUri,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (success != null) {
      $result.success = success;
    }
    if (redirectUri != null) {
      $result.redirectUri = redirectUri;
    }
    return $result;
  }
  EndSessionResponse._() : super();
  factory EndSessionResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EndSessionResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, EndSessionResponse_Result>
      _EndSessionResponse_ResultByTag = {
    2: EndSessionResponse_Result.success,
    3: EndSessionResponse_Result.redirectUri,
    0: EndSessionResponse_Result.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EndSessionResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..aOM<$1.Empty>(2, _omitFieldNames ? '' : 'success',
        subBuilder: $1.Empty.create)
    ..aOS(3, _omitFieldNames ? '' : 'redirectUri')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EndSessionResponse clone() => EndSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EndSessionResponse copyWith(void Function(EndSessionResponse) updates) =>
      super.copyWith((message) => updates(message as EndSessionResponse))
          as EndSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndSessionResponse create() => EndSessionResponse._();
  EndSessionResponse createEmptyInstance() => create();
  static $pb.PbList<EndSessionResponse> createRepeated() =>
      $pb.PbList<EndSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static EndSessionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EndSessionResponse>(create);
  static EndSessionResponse? _defaultInstance;

  EndSessionResponse_Result whichResult() =>
      _EndSessionResponse_ResultByTag[$_whichOneof(0)]!;
  void clearResult() => clearField($_whichOneof(0));

  /// The ID of the authentication session that was ended.
  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);

  /// The authentication session was successfully ended.
  @$pb.TagNumber(2)
  $1.Empty get success => $_getN(1);
  @$pb.TagNumber(2)
  set success($1.Empty v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);
  @$pb.TagNumber(2)
  $1.Empty ensureSuccess() => $_ensure(1);

  ///  A final redirect URI to send the user to.
  ///
  ///  Used to clear cookies in social login flows.
  @$pb.TagNumber(3)
  $core.String get redirectUri => $_getSZ(2);
  @$pb.TagNumber(3)
  set redirectUri($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRedirectUri() => $_has(2);
  @$pb.TagNumber(3)
  void clearRedirectUri() => clearField(3);
}

///  The user info of the current user.
///
///  Structured to match the return value of the OIDC `/userinfo` endpoint:
///  https://openid.net/specs/openid-connect-core-1_0.html#UserInfoResponse
///
///  (-- api-linter: core::0123::resource-annotation=disabled
///      aip.dev/not-precedent: Not a resource. --)
class OpenIdUserinfo extends $pb.GeneratedMessage {
  factory OpenIdUserinfo({
    $core.String? sub,
    $core.String? name,
    $core.String? givenName,
    $core.String? familyName,
    $core.String? middleName,
    $core.String? nickname,
    $core.String? preferredUsername,
    $core.String? profile,
    $core.String? picture,
    $core.String? website,
    $core.String? email,
    $core.bool? emailVerified,
    $core.String? gender,
    $core.String? birthdate,
    $core.String? zoneinfo,
    $core.String? locale,
    $core.String? phoneNumber,
    $core.bool? phoneNumberVerified,
    $10.Value? address,
    $core.int? updatedAt,
  }) {
    final $result = create();
    if (sub != null) {
      $result.sub = sub;
    }
    if (name != null) {
      $result.name = name;
    }
    if (givenName != null) {
      $result.givenName = givenName;
    }
    if (familyName != null) {
      $result.familyName = familyName;
    }
    if (middleName != null) {
      $result.middleName = middleName;
    }
    if (nickname != null) {
      $result.nickname = nickname;
    }
    if (preferredUsername != null) {
      $result.preferredUsername = preferredUsername;
    }
    if (profile != null) {
      $result.profile = profile;
    }
    if (picture != null) {
      $result.picture = picture;
    }
    if (website != null) {
      $result.website = website;
    }
    if (email != null) {
      $result.email = email;
    }
    if (emailVerified != null) {
      $result.emailVerified = emailVerified;
    }
    if (gender != null) {
      $result.gender = gender;
    }
    if (birthdate != null) {
      $result.birthdate = birthdate;
    }
    if (zoneinfo != null) {
      $result.zoneinfo = zoneinfo;
    }
    if (locale != null) {
      $result.locale = locale;
    }
    if (phoneNumber != null) {
      $result.phoneNumber = phoneNumber;
    }
    if (phoneNumberVerified != null) {
      $result.phoneNumberVerified = phoneNumberVerified;
    }
    if (address != null) {
      $result.address = address;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  OpenIdUserinfo._() : super();
  factory OpenIdUserinfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OpenIdUserinfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OpenIdUserinfo',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sub')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'given_name')
    ..aOS(4, _omitFieldNames ? '' : 'family_name')
    ..aOS(5, _omitFieldNames ? '' : 'middle_name')
    ..aOS(6, _omitFieldNames ? '' : 'nickname')
    ..aOS(7, _omitFieldNames ? '' : 'preferred_username')
    ..aOS(8, _omitFieldNames ? '' : 'profile')
    ..aOS(9, _omitFieldNames ? '' : 'picture')
    ..aOS(10, _omitFieldNames ? '' : 'website')
    ..aOS(11, _omitFieldNames ? '' : 'email')
    ..aOB(12, _omitFieldNames ? '' : 'email_verified')
    ..aOS(13, _omitFieldNames ? '' : 'gender')
    ..aOS(14, _omitFieldNames ? '' : 'birthdate')
    ..aOS(15, _omitFieldNames ? '' : 'zoneinfo')
    ..aOS(16, _omitFieldNames ? '' : 'locale')
    ..aOS(17, _omitFieldNames ? '' : 'phone_number')
    ..aOB(18, _omitFieldNames ? '' : 'phone_number_verified')
    ..aOM<$10.Value>(19, _omitFieldNames ? '' : 'address',
        subBuilder: $10.Value.create)
    ..a<$core.int>(20, _omitFieldNames ? '' : 'updated_at', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OpenIdUserinfo clone() => OpenIdUserinfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OpenIdUserinfo copyWith(void Function(OpenIdUserinfo) updates) =>
      super.copyWith((message) => updates(message as OpenIdUserinfo))
          as OpenIdUserinfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OpenIdUserinfo create() => OpenIdUserinfo._();
  OpenIdUserinfo createEmptyInstance() => create();
  static $pb.PbList<OpenIdUserinfo> createRepeated() =>
      $pb.PbList<OpenIdUserinfo>();
  @$core.pragma('dart2js:noInline')
  static OpenIdUserinfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OpenIdUserinfo>(create);
  static OpenIdUserinfo? _defaultInstance;

  /// Required. The identifier for the End-User at the Issuer.
  @$pb.TagNumber(1)
  $core.String get sub => $_getSZ(0);
  @$pb.TagNumber(1)
  set sub($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSub() => $_has(0);
  @$pb.TagNumber(1)
  void clearSub() => clearField(1);

  /// Optional. End-User's full name in displayable form including all name parts, possibly
  /// including titles and suffixes, ordered according to the End-User's locale and preferences.
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  ///  Optional. Given name(s) or first name(s) of the End-User.
  ///
  ///  Note that in some cultures, people can have multiple given names; all can be present, with
  ///  the names being separated by space characters.
  @$pb.TagNumber(3)
  $core.String get givenName => $_getSZ(2);
  @$pb.TagNumber(3)
  set givenName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGivenName() => $_has(2);
  @$pb.TagNumber(3)
  void clearGivenName() => clearField(3);

  ///  Optional. 	Surname(s) or last name(s) of the End-User.
  ///
  ///  Note that in some cultures, people can have multiple family names or no family name;
  ///  all can be present, with the names being separated by space characters.
  @$pb.TagNumber(4)
  $core.String get familyName => $_getSZ(3);
  @$pb.TagNumber(4)
  set familyName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFamilyName() => $_has(3);
  @$pb.TagNumber(4)
  void clearFamilyName() => clearField(4);

  ///  Optional. Middle name(s) of the End-User.
  ///
  ///  Note that in some cultures, people can have multiple middle names; all can be present,
  ///  with the names being separated by space characters. Also note that in some cultures, middle
  ///  names are not used.
  ///  (-- api-linter: core::0122::name-suffix=disabled --)
  @$pb.TagNumber(5)
  $core.String get middleName => $_getSZ(4);
  @$pb.TagNumber(5)
  set middleName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMiddleName() => $_has(4);
  @$pb.TagNumber(5)
  void clearMiddleName() => clearField(5);

  ///  Optional. Casual name of the End-User that may or may not be the same as the given_name.
  ///
  ///  For instance, a nickname value of Mike might be returned alongside a given_name value of Michael.
  @$pb.TagNumber(6)
  $core.String get nickname => $_getSZ(5);
  @$pb.TagNumber(6)
  set nickname($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNickname() => $_has(5);
  @$pb.TagNumber(6)
  void clearNickname() => clearField(6);

  ///  Optional. Shorthand name by which the End-User wishes to be referred to at the RP, such as
  ///  janedoe or j.doe.
  ///
  ///  This value MAY be any valid JSON string including special characters such as @, /, or whitespace.
  ///  The RP MUST NOT rely upon this value being unique, as discussed in Section 5.7.
  @$pb.TagNumber(7)
  $core.String get preferredUsername => $_getSZ(6);
  @$pb.TagNumber(7)
  set preferredUsername($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPreferredUsername() => $_has(6);
  @$pb.TagNumber(7)
  void clearPreferredUsername() => clearField(7);

  ///  Optional. URL of the End-User's profile page.
  ///
  ///  The contents of this Web page SHOULD be about the End-User.
  @$pb.TagNumber(8)
  $core.String get profile => $_getSZ(7);
  @$pb.TagNumber(8)
  set profile($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasProfile() => $_has(7);
  @$pb.TagNumber(8)
  void clearProfile() => clearField(8);

  ///  Optional. URL of the End-User's profile picture.
  ///
  ///  This URL MUST refer to an image file (for example, a PNG, JPEG, or GIF image file), rather than
  ///  to a Web page containing an image. Note that this URL SHOULD specifically reference a profile photo
  ///  of the End-User suitable for displaying when describing the End-User, rather than an arbitrary
  ///  photo taken by the End-User.
  @$pb.TagNumber(9)
  $core.String get picture => $_getSZ(8);
  @$pb.TagNumber(9)
  set picture($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPicture() => $_has(8);
  @$pb.TagNumber(9)
  void clearPicture() => clearField(9);

  ///  Optional. URL of the End-User's Web page or blog.
  ///
  ///  This Web page SHOULD contain information published by the End-User or an organization that the
  ///  End-User is affiliated with.
  @$pb.TagNumber(10)
  $core.String get website => $_getSZ(9);
  @$pb.TagNumber(10)
  set website($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasWebsite() => $_has(9);
  @$pb.TagNumber(10)
  void clearWebsite() => clearField(10);

  ///  Optional. End-User's preferred e-mail address.
  ///
  ///  Its value MUST conform to the RFC 5322 [RFC5322] addr-spec syntax. The RP MUST NOT rely upon this
  ///  value being unique, as discussed in Section 5.7.
  @$pb.TagNumber(11)
  $core.String get email => $_getSZ(10);
  @$pb.TagNumber(11)
  set email($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasEmail() => $_has(10);
  @$pb.TagNumber(11)
  void clearEmail() => clearField(11);

  ///  Optional. True if the End-User's e-mail address has been verified; otherwise false.
  ///
  ///  When this Claim Value is true, this means that the OP took affirmative steps to ensure that this
  ///  e-mail address was controlled by the End-User at the time the verification was performed. The means
  ///  by which an e-mail address is verified is context specific, and dependent upon the trust framework
  ///  or contractual agreements within which the parties are operating.
  @$pb.TagNumber(12)
  $core.bool get emailVerified => $_getBF(11);
  @$pb.TagNumber(12)
  set emailVerified($core.bool v) {
    $_setBool(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasEmailVerified() => $_has(11);
  @$pb.TagNumber(12)
  void clearEmailVerified() => clearField(12);

  ///  Optional. End-User's gender.
  ///
  ///  Values defined by this specification are female and male. Other values MAY be used when neither
  ///  of the defined values are applicable.
  @$pb.TagNumber(13)
  $core.String get gender => $_getSZ(12);
  @$pb.TagNumber(13)
  set gender($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasGender() => $_has(12);
  @$pb.TagNumber(13)
  void clearGender() => clearField(13);

  ///  Optional. End-User's birthday, represented as an ISO 8601-1 [ISO8601‑1] YYYY-MM-DD format.
  ///
  ///  The year MAY be 0000, indicating that it is omitted. To represent only the year, YYYY format is
  ///  allowed. Note that depending on the underlying platform's date related function, providing just
  ///  year can result in varying month and day, so the implementers need to take this factor into account
  ///  to correctly process the dates.
  @$pb.TagNumber(14)
  $core.String get birthdate => $_getSZ(13);
  @$pb.TagNumber(14)
  set birthdate($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasBirthdate() => $_has(13);
  @$pb.TagNumber(14)
  void clearBirthdate() => clearField(14);

  ///  Optional. String from IANA Time Zone Database [IANA.time‑zones] representing the End-User's time zone.
  ///
  ///  For example, Europe/Paris or America/Los_Angeles.
  @$pb.TagNumber(15)
  $core.String get zoneinfo => $_getSZ(14);
  @$pb.TagNumber(15)
  set zoneinfo($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasZoneinfo() => $_has(14);
  @$pb.TagNumber(15)
  void clearZoneinfo() => clearField(15);

  ///  Optional. End-User's locale, represented as a BCP47 [RFC5646] language tag.
  ///
  ///  This is typically an ISO 639 Alpha-2 [ISO639] language code in lowercase and an ISO 3166-1 Alpha-2
  ///  [ISO3166‑1] country code in uppercase, separated by a dash. For example, en-US or fr-CA. As a
  ///  compatibility note, some implementations have used an underscore as the separator rather than a dash,
  ///  for example, en_US; Relying Parties MAY choose to accept this locale syntax as well.
  @$pb.TagNumber(16)
  $core.String get locale => $_getSZ(15);
  @$pb.TagNumber(16)
  set locale($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasLocale() => $_has(15);
  @$pb.TagNumber(16)
  void clearLocale() => clearField(16);

  ///  Optional. End-User's preferred telephone number.
  ///
  ///  E.164 [E.164] is RECOMMENDED as the format of this Claim, for example, +1 (425) 555-1212 or
  ///  +56 (2) 687 2400. If the phone number contains an extension, it is RECOMMENDED that the extension be
  ///  represented using the RFC 3966 [RFC3966] extension syntax, for example, +1 (604) 555-1234;ext=5678.
  @$pb.TagNumber(17)
  $core.String get phoneNumber => $_getSZ(16);
  @$pb.TagNumber(17)
  set phoneNumber($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasPhoneNumber() => $_has(16);
  @$pb.TagNumber(17)
  void clearPhoneNumber() => clearField(17);

  ///  Optional. True if the End-User's phone number has been verified; otherwise false.
  ///
  ///  When this Claim Value is true, this means that the OP took affirmative steps to ensure that this
  ///  phone number was controlled by the End-User at the time the verification was performed. The means
  ///  by which a phone number is verified is context specific, and dependent upon the trust framework or
  ///  contractual agreements within which the parties are operating. When true, the phone_number Claim MUST
  ///  be in E.164 format and any extensions MUST be represented in RFC 3966 format.
  @$pb.TagNumber(18)
  $core.bool get phoneNumberVerified => $_getBF(17);
  @$pb.TagNumber(18)
  set phoneNumberVerified($core.bool v) {
    $_setBool(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasPhoneNumberVerified() => $_has(17);
  @$pb.TagNumber(18)
  void clearPhoneNumberVerified() => clearField(18);

  ///  Optional. End-User's preferred postal address.
  ///
  ///  The value of the address member is a JSON [RFC8259] structure containing some or all of the members
  ///  defined in Section 5.1.1, for example:
  ///
  ///  ```
  ///  {
  ///    "formatted": "Mr. John Doe, 123 Main Street, Springfield, IL 62701",
  ///    "street_address": "123 Main Street",
  ///    "locality": "Springfield",
  ///    "region": "IL",
  ///    "postal_code": "62701",
  ///    "country": "US"
  ///  }
  ///  ```
  @$pb.TagNumber(19)
  $10.Value get address => $_getN(18);
  @$pb.TagNumber(19)
  set address($10.Value v) {
    setField(19, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasAddress() => $_has(18);
  @$pb.TagNumber(19)
  void clearAddress() => clearField(19);
  @$pb.TagNumber(19)
  $10.Value ensureAddress() => $_ensure(18);

  ///  Optional. Time the End-User's information was last updated.
  ///
  ///  Its value is a JSON number representing the number of seconds from 1970-01-01T00:00:00Z as measured
  ///  in UTC until the date/time.
  ///  (-- api-linter: core::0140::prepositions=disabled --)
  @$pb.TagNumber(20)
  $core.int get updatedAt => $_getIZ(19);
  @$pb.TagNumber(20)
  set updatedAt($core.int v) {
    $_setSignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasUpdatedAt() => $_has(19);
  @$pb.TagNumber(20)
  void clearUpdatedAt() => clearField(20);
}

/// End-User's preferred postal address.
class OpenIdAddress extends $pb.GeneratedMessage {
  factory OpenIdAddress({
    $core.String? formatted,
    $core.String? streetAddress,
    $core.String? locality,
    $core.String? region,
    $core.String? postalCode,
    $core.String? country,
  }) {
    final $result = create();
    if (formatted != null) {
      $result.formatted = formatted;
    }
    if (streetAddress != null) {
      $result.streetAddress = streetAddress;
    }
    if (locality != null) {
      $result.locality = locality;
    }
    if (region != null) {
      $result.region = region;
    }
    if (postalCode != null) {
      $result.postalCode = postalCode;
    }
    if (country != null) {
      $result.country = country;
    }
    return $result;
  }
  OpenIdAddress._() : super();
  factory OpenIdAddress.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OpenIdAddress.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OpenIdAddress',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'celest.cloud.auth.v1alpha1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'formatted')
    ..aOS(2, _omitFieldNames ? '' : 'street_address')
    ..aOS(3, _omitFieldNames ? '' : 'locality')
    ..aOS(4, _omitFieldNames ? '' : 'region')
    ..aOS(5, _omitFieldNames ? '' : 'postal_code')
    ..aOS(6, _omitFieldNames ? '' : 'country')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OpenIdAddress clone() => OpenIdAddress()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OpenIdAddress copyWith(void Function(OpenIdAddress) updates) =>
      super.copyWith((message) => updates(message as OpenIdAddress))
          as OpenIdAddress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OpenIdAddress create() => OpenIdAddress._();
  OpenIdAddress createEmptyInstance() => create();
  static $pb.PbList<OpenIdAddress> createRepeated() =>
      $pb.PbList<OpenIdAddress>();
  @$core.pragma('dart2js:noInline')
  static OpenIdAddress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OpenIdAddress>(create);
  static OpenIdAddress? _defaultInstance;

  /// Optional. Full mailing address, formatted for display or use on a mailing label.
  @$pb.TagNumber(1)
  $core.String get formatted => $_getSZ(0);
  @$pb.TagNumber(1)
  set formatted($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFormatted() => $_has(0);
  @$pb.TagNumber(1)
  void clearFormatted() => clearField(1);

  /// Optional. Full street address component, which MAY include house number, street name, P.O. Box, and multi-line extended street address information.
  @$pb.TagNumber(2)
  $core.String get streetAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set streetAddress($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStreetAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearStreetAddress() => clearField(2);

  /// Optional. City or locality component.
  @$pb.TagNumber(3)
  $core.String get locality => $_getSZ(2);
  @$pb.TagNumber(3)
  set locality($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLocality() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocality() => clearField(3);

  /// Optional. State, province, prefecture, or region component.
  @$pb.TagNumber(4)
  $core.String get region => $_getSZ(3);
  @$pb.TagNumber(4)
  set region($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRegion() => $_has(3);
  @$pb.TagNumber(4)
  void clearRegion() => clearField(4);

  /// Optional. Zip code or postal code component.
  @$pb.TagNumber(5)
  $core.String get postalCode => $_getSZ(4);
  @$pb.TagNumber(5)
  set postalCode($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPostalCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearPostalCode() => clearField(5);

  /// Optional. Country name component.
  /// (-- api-linter: core::0143::standardized-codes=disabled --)
  @$pb.TagNumber(6)
  $core.String get country => $_getSZ(5);
  @$pb.TagNumber(6)
  set country($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCountry() => $_has(5);
  @$pb.TagNumber(6)
  void clearCountry() => clearField(6);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
