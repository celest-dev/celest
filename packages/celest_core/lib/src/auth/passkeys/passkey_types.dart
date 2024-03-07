import 'dart:convert';
import 'dart:typed_data';

import 'package:celest_core/src/util/base64_raw_url.dart';

/// A simple test to determine if a hostname is a properly-formatted domain name
///
/// A "valid domain" is defined here: https://url.spec.whatwg.org/#valid-domain
bool _isValidDomain(String hostname) {
  return hostname == 'localhost' || _validDomain.hasMatch(hostname);
}

/// From: https://www.oreilly.com/library/view/regular-expressions-cookbook/9781449327453/ch08s15.html
final _validDomain = RegExp(r'^([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$');

enum PasskeyRequestType { register, authenticate }

final class PasskeyRequest {
  const PasskeyRequest({
    required this.username,
    String? displayName,
    this.authenticatorSelection,
  }) : displayName = displayName ?? '';

  factory PasskeyRequest.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'username': final String username,
        }) {
      return PasskeyRequest(
        username: username,
        displayName: json['displayName'] as String?,
        authenticatorSelection: json['authenticatorSelection'] != null
            ? AuthenticatorSelectionCriteria.fromJson(
                (json['authenticatorSelection'] as Map<Object?, Object?>)
                    .cast(),
              )
            : null,
      );
    }
    throw FormatException('Invalid registration request: $json');
  }

  final String username;
  final String displayName;
  final AuthenticatorSelectionCriteria? authenticatorSelection;

  Map<String, Object?> toJson() => {
        'username': username,
        'displayName': displayName,
        if (authenticatorSelection case final authenticatorSelection?)
          'authenticatorSelection': authenticatorSelection.toJson(),
      };

  @override
  String toString() {
    final buffer = StringBuffer()
      ..writeln('PasskeyRequest(')
      ..writeln('  username: $username,')
      ..writeln('  displayName: $displayName,');
    if (authenticatorSelection case final authenticatorSelection?) {
      buffer.writeln('  authenticatorSelection: $authenticatorSelection,');
    }
    buffer.write(')');
    return buffer.toString();
  }
}

sealed class PasskeyOptions {
  const PasskeyOptions();

  factory PasskeyOptions.fromJson(Map<String, Object?> json) {
    return switch (json) {
      {'rp': Map()} => PasskeyRegistrationOptions.fromJson(json),
      {'rpId': String()} => PasskeyAuthenticationOptions.fromJson(json),
      _ => throw FormatException('Invalid passkey options: $json'),
    };
  }

  Uint8List get challenge;
  Duration get timeout;

  Map<String, Object?> toJson();
}

// https://w3c.github.io/webauthn/#dictionary-makecredentialoptions
final class PasskeyRegistrationOptions extends PasskeyOptions {
  PasskeyRegistrationOptions({
    required this.challenge,
    required this.rpName,
    required this.rpId,
    required this.userId,
    required this.userName,
    String? userDisplayName,
    this.timeout = const Duration(minutes: 5),
    this.attestation = 'none',
    this.authenticatorSelection =
        const AuthenticatorSelectionCriteria.passkey(),
    this.publicKeyCredentialParameters = const [],
  })  : assert(
          _isValidDomain(rpId),
          'Invalid rpId (must be a valid domain): $rpId',
        ),
        userDisplayName = userDisplayName ?? '';

  factory PasskeyRegistrationOptions.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'rp': {
            'name': final String rpName,
            'id': final String rpId,
          },
          'challenge': final String challenge,
          'user': {
            'id': final String userId,
            'name': final String userName,
            'displayName': final String userDisplayName,
          },
        }) {
      return PasskeyRegistrationOptions(
        rpName: rpName,
        rpId: rpId,
        userId: userId,
        userName: userName,
        userDisplayName: userDisplayName,
        challenge: base64RawUrl.decode(challenge),
        timeout: Duration(milliseconds: (json['timeout'] as num).toInt()),
        attestation: json['attestation'] as String? ?? 'none',
        authenticatorSelection: json['authenticatorSelection'] != null
            ? AuthenticatorSelectionCriteria.fromJson(
                (json['authenticatorSelection'] as Map<Object?, Object?>)
                    .cast(),
              )
            : const AuthenticatorSelectionCriteria.passkey(),
        publicKeyCredentialParameters: (json['pubKeyCredParams'] as List? ??
                const [])
            .cast<Map<Object?, Object?>>()
            .map((json) => PublicKeyCredentialParameter.fromJson(json.cast()))
            .toList(),
      );
    }
    throw FormatException('Invalid registration options: $json');
  }

  final String rpName;
  final String rpId;
  final String userId;
  final String userName;
  final String userDisplayName;
  @override
  final Uint8List challenge;
  @override
  final Duration timeout;
  final String attestation;
  final AuthenticatorSelectionCriteria authenticatorSelection;
  final List<PublicKeyCredentialParameter> publicKeyCredentialParameters;

  @override
  Map<String, Object?> toJson() => {
        'rp': {
          'name': rpName,
          'id': rpId,
        },
        'user': {
          'id': userId,
          'name': userName,
          'displayName': userDisplayName,
        },
        'challenge': base64RawUrl.encode(challenge),
        'timeout': timeout.inMilliseconds,
        'attestation': attestation,
        'authenticatorSelection': authenticatorSelection.toJson(),
        'pubKeyCredParams':
            publicKeyCredentialParameters.map((el) => el.toJson()).toList(),
      };

  @override
  String toString() {
    final buffer = StringBuffer()
      ..writeln('PasskeyRegistrationOptions(')
      ..writeln('  rpName: $rpName,')
      ..writeln('  rpId: $rpId,')
      ..writeln('  userId: $userId,')
      ..writeln('  userName: $userName,')
      ..writeln('  userDisplayName: $userDisplayName,')
      ..writeln('  challenge: ${base64RawUrl.encode(challenge)},')
      ..writeln('  timeout: $timeout,')
      ..writeln('  attestation: $attestation,');
    if (authenticatorSelection case final authenticatorSelection) {
      buffer.writeln('  authenticatorSelection: $authenticatorSelection,');
    }
    if (publicKeyCredentialParameters
        case final publicKeyCredentialParameters) {
      buffer.writeln('  publicKeyCredentialParameters: [');
      for (final el in publicKeyCredentialParameters) {
        buffer.writeln('    $el,');
      }
      buffer.writeln('  ],');
    }
    buffer.write(')');
    return buffer.toString();
  }
}

final class PasskeyCredential {
  const PasskeyCredential({
    required this.id,
    required this.rawId,
    required this.response,
    this.authenticatorAttachment,
  });

  factory PasskeyCredential.fromJson(Map<String, Object?> json) {
    return switch (json) {
      {
        'id': final String id,
        'rawId': final String rawId,
        'type': 'public-key',
        'response': final Map<Object?, Object?> response,
      } =>
        PasskeyCredential(
          id: id,
          rawId: base64RawUrl.decode(rawId),
          response: PasskeyResponse.fromJson(response.cast()),
          authenticatorAttachment:
              json['authenticatorAttachment'] as AuthenticatorAttachment?,
        ),
      _ => throw FormatException('Invalid credential: $json'),
    };
  }

  /// A base64url-encoded string representing the credential ID.
  final String id;

  /// The credential ID in its raw binary form.
  final Uint8List rawId;
  String get type => 'public-key';
  final PasskeyResponse response;

  /// This will be set to `platform` when the credential is created on a
  /// passkey-capable device.
  final AuthenticatorAttachment? authenticatorAttachment;

  Map<String, Object?> toJson() => {
        'id': id,
        'rawId': base64RawUrl.encode(rawId),
        'type': type,
        'response': response.toJson(),
        if (authenticatorAttachment != null)
          'authenticatorAttachment': authenticatorAttachment,
      };

  @override
  String toString() {
    final buffer = StringBuffer()
      ..writeln('PasskeyCredential(')
      ..writeln('  id: $id,')
      ..writeln('  rawId: ${base64RawUrl.encode(rawId)},')
      ..writeln('  type: $type,')
      ..writeln('  response: $response,');
    if (authenticatorAttachment != null) {
      buffer.writeln('  authenticatorAttachment: $authenticatorAttachment,');
    }
    buffer.write(')');
    return buffer.toString();
  }
}

sealed class PasskeyResponse {
  const PasskeyResponse();

  factory PasskeyResponse.fromJson(Map<String, Object?> json) {
    return switch (json) {
      {
        'clientDataJSON': String(),
        'attestationObject': String(),
      } =>
        PasskeyRegistrationResponse.fromJson(json),
      {
        'clientDataJSON': String(),
        'authenticatorData': String(),
        'signature': String(),
      } =>
        PasskeyAuthenticationResponse.fromJson(json),
      _ => throw FormatException('Invalid passkey response: $json'),
    };
  }

  Uint8List get clientDataJson;

  Map<String, Object?> toJson();
}

final class PasskeyRegistrationResponse extends PasskeyResponse {
  const PasskeyRegistrationResponse({
    required this.clientDataJson,
    required this.attestationObject,
    this.transports,
    this.publicKeyAlgorithm,
    this.publicKey,
    this.authenticatorData,
  });

  factory PasskeyRegistrationResponse.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'clientDataJSON': final String clientDataJson,
          'attestationObject': final String attestationObject,
        }) {
      return PasskeyRegistrationResponse(
        clientDataJson: base64RawUrl.decode(clientDataJson),
        attestationObject: base64RawUrl.decode(attestationObject),
        transports: (json['transports'] as List?)?.cast(),
        publicKeyAlgorithm: json['publicKeyAlgorithm'] != null
            ? COSEAlgorithmIdentifier._(
                json['publicKeyAlgorithm'] as int,
              )
            : null,
        publicKey: json['publicKey'] != null
            ? base64RawUrl.decode(json['publicKey'] as String)
            : null,
        authenticatorData: json['authenticatorData'] != null
            ? base64RawUrl.decode(json['authenticatorData'] as String)
            : null,
      );
    }
    throw FormatException('Invalid registration response: $json');
  }

  @override
  final Uint8List clientDataJson;
  final Uint8List attestationObject;
  final List<AuthenticatorTransport>? transports;
  final COSEAlgorithmIdentifier? publicKeyAlgorithm;
  final Uint8List? publicKey;
  final Uint8List? authenticatorData;

  @override
  Map<String, Object?> toJson() => {
        'clientDataJSON': base64RawUrl.encode(clientDataJson),
        'attestationObject': base64RawUrl.encode(attestationObject),
        if (transports != null) 'transports': transports,
        if (publicKeyAlgorithm != null)
          'publicKeyAlgorithm': publicKeyAlgorithm,
        if (publicKey != null) 'publicKey': base64RawUrl.encode(publicKey!),
        if (authenticatorData != null)
          'authenticatorData': base64RawUrl.encode(authenticatorData!),
      };

  @override
  String toString() {
    final buffer = StringBuffer()
      ..writeln('PasskeyRegistrationResponse(')
      ..writeln('  clientDataJson: ${utf8.decode(clientDataJson)},')
      ..writeln(
          '  attestationObject: ${base64RawUrl.encode(attestationObject)},')
      ..writeln('  transports: ${transports?.join(', ')},')
      ..writeln('  publicKeyAlgorithm: $publicKeyAlgorithm,')
      ..writeln(
          '  publicKey: ${base64RawUrl.encode(publicKey ?? Uint8List(0))},')
      ..writeln(
          '  authenticatorData: ${base64RawUrl.encode(authenticatorData ?? Uint8List(0))},')
      ..write(')');
    return buffer.toString();
  }
}

final class PublicKeyCredentialParameter {
  const PublicKeyCredentialParameter({
    required this.algorithm,
  });

  factory PublicKeyCredentialParameter.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'type': 'public-key',
          'alg': final int algorithm,
        }) {
      return PublicKeyCredentialParameter(
        algorithm: COSEAlgorithmIdentifier._(algorithm),
      );
    }
    throw FormatException('Invalid credential parameter: $json');
  }

  String get type => 'public-key';
  final COSEAlgorithmIdentifier algorithm;

  Map<String, Object?> toJson() => {
        'type': type,
        'alg': algorithm,
      };

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write('PasskeyCredentialParameter(')
      ..write('type: $type, ')
      ..write('algorithm: $algorithm')
      ..write(')');
    return buffer.toString();
  }
}

// https://w3c.github.io/webauthn/#dictdef-authenticatorselectioncriteria
final class AuthenticatorSelectionCriteria {
  const AuthenticatorSelectionCriteria({
    this.authenticatorAttachment,
    this.residentKey,
    UserVerificationRequirement? userVerification,
  }) : userVerification =
            userVerification ?? UserVerificationRequirement.preferred;

  const AuthenticatorSelectionCriteria.passkey()
      :
        // Try to use UV if possible.
        //
        // Why not required: https://passkeys.dev/docs/use-cases/bootstrapping/#a-note-about-user-verification
        userVerification = UserVerificationRequirement.preferred,

        // "platform" indicates that the RP wants a platform authenticator
        // (an authenticator embedded to the platform device) which will
        // not prompt to insert e.g. a USB security key. The user has a
        // simpler option to create a passkey.
        authenticatorAttachment = AuthenticatorAttachment.platform,

        // A discoverable credential (resident key) stores user
        // information to the passkey and lets users select the account
        // upon authentication.
        //
        //
        residentKey = ResidentKeyRequirement.preferred;

  factory AuthenticatorSelectionCriteria.fromJson(Map<String, Object?> json) {
    return AuthenticatorSelectionCriteria(
      authenticatorAttachment:
          json['authenticatorAttachment'] as AuthenticatorAttachment?,
      residentKey: json['residentKey'] as ResidentKeyRequirement?,
      userVerification:
          json['userVerification'] as UserVerificationRequirement?,
    );
  }

  final AuthenticatorAttachment? authenticatorAttachment;
  final ResidentKeyRequirement? residentKey;

  /// This property is retained for backward compatibility from
  /// WebAuthn Level 1, an older version of the specification. This is set
  /// to true if residentKey is 'required', otherwise set it to false.
  ///
  /// See: https://w3c.github.io/webauthn/#dom-authenticatorselectioncriteria-requireresidentkey
  bool get requireResidentKey => residentKey == ResidentKeyRequirement.required;

  final UserVerificationRequirement userVerification;

  Map<String, Object?> toJson() => {
        if (authenticatorAttachment != null)
          'authenticatorAttachment': authenticatorAttachment,
        if (residentKey != null) 'residentKey': residentKey,
        'requireResidentKey': requireResidentKey,
        'userVerification': userVerification,
      };

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write('AuthenticatorSelectionCriteria(')
      ..write('authenticatorAttachment: $authenticatorAttachment, ')
      ..write('residentKey: $residentKey, ')
      ..write('requireResidentKey: $requireResidentKey, ')
      ..write('userVerification: $userVerification')
      ..write(')');
    return buffer.toString();
  }
}

/// The client data returned by the authenticator during registration and
/// authentication.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/API/AuthenticatorResponse/clientDataJSON
final class PasskeyClientData {
  const PasskeyClientData({
    required this.challenge,
    bool? crossOrigin,
    required this.origin,
    this.topOrigin,
    required this.type,
    this.tokenBinding,
  }) : crossOrigin = crossOrigin ?? false;

  factory PasskeyClientData.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'challenge': final String challenge,
          'origin': final String origin,
          'type': final String type,
        }) {
      return PasskeyClientData(
        challenge: base64RawUrl.decode(challenge),
        crossOrigin: json['crossOrigin'] as bool?,
        origin: origin,
        topOrigin: json['topOrigin'] as String?,
        type: type,
        tokenBinding: json['tokenBinding'] != null
            ? PasskeyClientDataTokenBinding.fromJson(
                (json['tokenBinding'] as Map<Object?, Object?>).cast(),
              )
            : null,
      );
    }
    throw FormatException('Invalid client data: $json');
  }

  final Uint8List challenge;
  final bool crossOrigin;
  final String origin;
  final String? topOrigin;
  final String type;
  final PasskeyClientDataTokenBinding? tokenBinding;

  Map<String, Object?> toJson() => {
        'challenge': base64RawUrl.encode(challenge),
        if (crossOrigin) 'crossOrigin': crossOrigin,
        'origin': origin,
        if (topOrigin != null) 'topOrigin': topOrigin,
        'type': type,
        if (tokenBinding != null) 'tokenBinding': tokenBinding!.toJson(),
      };

  @override
  String toString() {
    final buffer = StringBuffer()
      ..writeln('PasskeyClientData(')
      ..writeln('  challenge: ${base64RawUrl.encode(challenge)},')
      ..writeln('  crossOrigin: $crossOrigin,')
      ..writeln('  origin: $origin,')
      ..writeln('  topOrigin: $topOrigin,')
      ..writeln('  type: $type,');
    if (tokenBinding case final tokenBinding?) {
      buffer
        ..writeln('  tokenBinding: PasskeyClientDataTokenBinding(')
        ..writeln('    id: ${base64RawUrl.encode(tokenBinding.id)},')
        ..writeln('    status: ${tokenBinding.status},')
        ..writeln('  ),');
    }
    buffer.write(')');
    return buffer.toString();
  }
}

final class PasskeyClientDataTokenBinding {
  const PasskeyClientDataTokenBinding({
    required this.id,
    required this.status,
  });

  factory PasskeyClientDataTokenBinding.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'id': final String id,
          'status': final String status,
        }) {
      return PasskeyClientDataTokenBinding(
        id: base64RawUrl.decode(id),
        status: status,
      );
    }
    throw FormatException('Invalid token binding: $json');
  }

  /// The token binding ID which was used for communication.
  final Uint8List id;

  /// Either "supported" or "present".
  final String status;

  Map<String, Object?> toJson() => {
        'id': base64RawUrl.encode(id),
        'status': status,
      };

  @override
  String toString() {
    final buffer = StringBuffer()
      ..writeln('PasskeyClientDataTokenBinding(')
      ..writeln('  id: ${base64RawUrl.encode(id)},')
      ..writeln('  status: $status,')
      ..write(')');
    return buffer.toString();
  }
}

final class PasskeyDescriptor {
  const PasskeyDescriptor({
    required this.id,
    this.transports = const [],
  });

  factory PasskeyDescriptor.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'id': final String id,
        }) {
      return PasskeyDescriptor(
        id: id,
        transports: (json['transports'] as List?)?.cast() ?? const [],
      );
    }
    throw FormatException('Invalid passkey descriptor: $json');
  }

  final String id;
  final List<AuthenticatorTransport> transports;

  Map<String, Object?> toJson() => {
        'id': id,
        'transports': transports,
      };

  @override
  String toString() => 'PasskeyDescriptor('
      'id: $id, '
      'transports: ${transports.join(', ')})';
}

final class PasskeyAuthenticationOptions extends PasskeyOptions {
  PasskeyAuthenticationOptions({
    required this.rpId,
    required this.challenge,
    this.timeout = const Duration(minutes: 5),
    List<PasskeyDescriptor>? allowCredentials,
    UserVerificationRequirement? userVerification,
  })  : assert(
          _isValidDomain(rpId),
          'Invalid rpId (must be a valid domain): $rpId',
        ),
        allowCredentials = allowCredentials ?? const [],
        userVerification =
            userVerification ?? UserVerificationRequirement.preferred;

  factory PasskeyAuthenticationOptions.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'rpId': final String rpId,
          'challenge': final String challenge,
          'timeout': final int timeout,
          'allowCredentials': final List<Object?> allowCredentials,
        }) {
      return PasskeyAuthenticationOptions(
        rpId: rpId,
        challenge: base64RawUrl.decode(challenge),
        timeout: Duration(milliseconds: timeout),
        allowCredentials: allowCredentials
            .cast<Map<String, Object?>>()
            .map(PasskeyDescriptor.fromJson)
            .toList(),
        userVerification:
            json['userVerification'] as UserVerificationRequirement?,
      );
    }
    throw FormatException('Invalid authentication request: $json');
  }

  final String rpId;
  @override
  final Uint8List challenge;
  @override
  final Duration timeout;
  final List<PasskeyDescriptor> allowCredentials;
  final UserVerificationRequirement userVerification;

  @override
  Map<String, Object?> toJson() => {
        'rpId': rpId,
        'challenge': base64RawUrl.encode(challenge),
        'timeout': timeout.inMilliseconds,
        'allowCredentials': allowCredentials.map((el) => el.toJson()).toList(),
        'userVerification': userVerification,
      };

  @override
  String toString() {
    final buffer = StringBuffer()
      ..writeln('PasskeyAuthenticationRequest(')
      ..writeln('  rpId: $rpId,')
      ..writeln('  challenge: ${base64RawUrl.encode(challenge)},')
      ..writeln('  timeout: $timeout,')
      ..writeln('  allowCredentials: ${allowCredentials.join(', ')},')
      ..writeln('  userVerification: $userVerification,')
      ..write(')');
    return buffer.toString();
  }
}

final class PasskeyAuthenticationResponse extends PasskeyResponse {
  const PasskeyAuthenticationResponse({
    required this.clientDataJson,
    required this.authenticatorData,
    required this.signature,
    this.userHandle,
  });

  factory PasskeyAuthenticationResponse.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'clientDataJSON': final String clientDataJson,
          'authenticatorData': final String authenticatorData,
          'signature': final String signature,
        }) {
      return PasskeyAuthenticationResponse(
        clientDataJson: base64RawUrl.decode(clientDataJson),
        authenticatorData: base64RawUrl.decode(authenticatorData),
        signature: base64RawUrl.decode(signature),
        userHandle: json['userHandle'] != null
            ? base64RawUrl.decode(json['userHandle'] as String)
            : null,
      );
    }
    throw FormatException('Invalid authentication response: $json');
  }

  @override
  final Uint8List clientDataJson;
  final Uint8List authenticatorData;
  final Uint8List signature;
  final Uint8List? userHandle;

  @override
  Map<String, Object?> toJson() => {
        'clientDataJSON': base64RawUrl.encode(clientDataJson),
        'authenticatorData': base64RawUrl.encode(authenticatorData),
        'signature': base64RawUrl.encode(signature),
        if (userHandle != null) 'userHandle': base64RawUrl.encode(userHandle!),
      };

  @override
  String toString() {
    final buffer = StringBuffer()
      ..writeln('PasskeyAuthenticationResponse(')
      ..writeln('  clientData: ${base64RawUrl.encode(clientDataJson)}')
      ..writeln('  ),')
      ..writeln(
          '  authenticatorData: ${base64RawUrl.encode(authenticatorData)},')
      ..writeln('  signature: ${base64RawUrl.encode(signature)},')
      ..write(')');
    return buffer.toString();
  }
}

/// Supported crypto algo identifiers.
///
/// See:
/// - https://w3c.github.io/webauthn/#sctn-alg-identifier
/// - https://www.iana.org/assignments/cose/cose.xhtml#algorithms
extension type const COSEAlgorithmIdentifier._(int _) implements int {
  factory COSEAlgorithmIdentifier(int algId) {
    if (!values.contains(algId)) {
      throw ArgumentError.value(
        algId,
        'algId',
        'Unsupported COSE algorithm identifier.',
      );
    }
    return COSEAlgorithmIdentifier._(algId);
  }

  static const List<COSEAlgorithmIdentifier> prioritized = [
    // In first position to encourage authenticators to use this over ES256
    edDsa,
    es256,
    es512,
    rsaPss256,
    rsaPss384,
    rsaPss512,
    rs256,
    rs384,
    rs512,
    rsSha1, // ignore: deprecated_member_use_from_same_package
  ];

  static const List<COSEAlgorithmIdentifier> values = [
    edDsa,
    es256,
    es512,
    rsaPss256,
    rsaPss384,
    rsaPss512,
    rs256,
    rs384,
    rs512,
    rsSha1, // ignore: deprecated_member_use_from_same_package
  ];

  /// EdDSA
  static const edDsa = COSEAlgorithmIdentifier._(-8);

  /// ECDSA w/ SHA-256
  static const es256 = COSEAlgorithmIdentifier._(-7);

  /// ECDSA w/ SHA-512
  static const es512 = COSEAlgorithmIdentifier._(-36);

  /// RSASSA-PSS w/ SHA-256
  static const rsaPss256 = COSEAlgorithmIdentifier._(-37);

  /// RSASSA-PSS w/ SHA-384
  static const rsaPss384 = COSEAlgorithmIdentifier._(-38);

  /// RSASSA-PSS w/ SHA-512
  static const rsaPss512 = COSEAlgorithmIdentifier._(-39);

  /// RSASSA-PKCS1-v1_5 w/ SHA-256
  static const rs256 = COSEAlgorithmIdentifier._(-257);

  /// RSASSA-PKCS1-v1_5 w/ SHA-384
  static const rs384 = COSEAlgorithmIdentifier._(-258);

  /// RSASSA-PKCS1-v1_5 w/ SHA-512
  static const rs512 = COSEAlgorithmIdentifier._(-259);

  // RSASSA-PKCS1-v1_5 w/ SHA-1 (Deprecated; here for legacy support)
  @Deprecated('SHA-1 is deprecated and should not be used for new applications')
  static const rsSha1 = COSEAlgorithmIdentifier._(-65535);
}

/// A super class of TypeScript's `AuthenticatorTransport` that includes
/// support for the latest transports.
extension type const AuthenticatorTransport._(String transport)
    implements String {
  static const ble = AuthenticatorTransport._('ble');
  static const cable = AuthenticatorTransport._('cable');
  static const hybrid = AuthenticatorTransport._('hybrid');
  static const internal = AuthenticatorTransport._('internal');
  static const nfc = AuthenticatorTransport._('nfc');
  static const smartCard = AuthenticatorTransport._('smart-card');
  static const usb = AuthenticatorTransport._('usb');
}

extension type const AuthenticatorAttachment._(String attachment)
    implements String {
  static const crossPlatform = AuthenticatorAttachment._('cross-platform');
  static const platform = AuthenticatorAttachment._('platform');
}

extension type const UserVerificationRequirement._(String requirement)
    implements String {
  static const discouraged = UserVerificationRequirement._('discouraged');
  static const preferred = UserVerificationRequirement._('preferred');
  static const required = UserVerificationRequirement._('required');
}

extension type const ResidentKeyRequirement._(String requirement)
    implements String {
  static const discouraged = ResidentKeyRequirement._('discouraged');
  static const preferred = ResidentKeyRequirement._('preferred');
  static const required = ResidentKeyRequirement._('required');
}