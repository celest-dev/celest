import 'dart:convert';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';

import 'package:celest_auth/src/client/passkeys/passkey_platform_impl.web.dart';
import 'package:celest_core/celest_core.dart'
    hide AuthenticatorSelectionCriteria;
import 'package:web/web.dart'
    hide
        COSEAlgorithmIdentifier,
        AuthenticatorTransport,
        AuthenticatorAttachment,
        UserVerificationRequirement,
        ResidentKeyRequirement;

final class PasskeyPlatformWeb extends PasskeyPlatformImpl {
  PasskeyPlatformWeb({
    required super.protocol,
  }) : super.base();

  @override
  Future<bool> get isSupported async {
    final publicKeyCredential = window.getProperty('PublicKeyCredential'.toJS);
    if (!publicKeyCredential.typeofEquals('function')) {
      return false;
    }
    // TODO(dnys1): Check conditional mediation for autofill support.
    // https://web.dev/articles/passkey-registration#feature_detection
    return PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable()
        .toDart
        .then((value) => value.toDart);
  }

  @override
  Future<PasskeyRegistrationResponse> register(
    PasskeyRegistrationRequest request,
  ) async {
    if (!await isSupported) {
      throw const PasskeyException(
        message: 'Passkeys are not supported in this environment',
      );
    }
    final options = await protocol.requestRegistration(request: request);
    final credential = await window.navigator.credentials
        .create(
          CredentialCreationOptions(
            publicKey: PublicKeyCredentialCreationOptions(
              challenge: options.challenge.buffer.toJS,
              pubKeyCredParams: [
                for (final param in options.publicKeyCredentialParameters)
                  PublicKeyCredentialParameters(
                    alg: param.algorithm,
                    type: 'public-key',
                  ),
              ].toJS,
              rp: PublicKeyCredentialRpEntity(
                id: options.rpId,
              )..name = options.rpName,
              user: PublicKeyCredentialUserEntity(
                id: utf8.encode(options.userId).buffer.toJS,
                displayName: options.userDisplayName,
              )..name = options.userName,
              attestation: 'none',
              authenticatorSelection: AuthenticatorSelectionCriteria(
                authenticatorAttachment:
                    options.authenticatorSelection.authenticatorAttachment!,
                requireResidentKey:
                    options.authenticatorSelection.requireResidentKey,
                residentKey: options.authenticatorSelection.residentKey!,
                userVerification:
                    options.authenticatorSelection.userVerification,
              ),
              timeout: options.timeout.inMilliseconds,
            ),
          ),
        )
        .toDart
        .onError<JSObject>(
          (error, stackTrace) => Error.throwWithStackTrace(
            (error as RegistrationError).toPasskeyException(),
            stackTrace,
          ),
        ) as PublicKeyCredential?;
    if (credential == null) {
      throw const PasskeyException(message: 'Registration was not completed');
    }
    assert(credential.type == 'public-key');
    final response = credential.response as AuthenticatorAttestationResponse;
    return PasskeyRegistrationResponse(
      id: credential.id,
      rawId: credential.rawId.toDart.asUint8List(),
      clientDataJson: response.clientDataJSON.toDart.asUint8List(),
      attestationObject: response.attestationObject.toDart.asUint8List(),
      transports: response.transports,
      publicKeyAlgorithm: response.publicKeyAlgorithm,
      publicKey: response.publicKey,
      authenticatorData: response.authenticatorData,
      authenticatorAttachment:
          credential.authenticatorAttachment as AuthenticatorAttachment?,
    );
  }

  @override
  Future<PasskeyAuthenticationResponse> authenticate(
    PasskeyAuthenticationRequest request,
  ) async {
    if (!await isSupported) {
      throw const PasskeyException(
        message: 'Passkeys are not supported in this environment',
      );
    }
    final options = await protocol.requestAuthentication(request: request);
    final credential = await window.navigator.credentials
        .get(
          CredentialRequestOptions(
            publicKey: PublicKeyCredential.parseRequestOptionsFromJSON(
              options.toJson().jsify() as PublicKeyCredentialRequestOptionsJSON,
            ),
          ),
        )
        .toDart
        .onError<JSObject>(
          (error, stackTrace) => Error.throwWithStackTrace(
            (error as AuthenticationError).toPasskeyException(),
            stackTrace,
          ),
        ) as PublicKeyCredential?;
    if (credential == null) {
      throw const PasskeyException(
        message: 'Authentication was not completed',
      );
    }
    assert(credential.type == 'public-key');
    final response = credential.response as AuthenticatorAssertionResponse;
    return PasskeyAuthenticationResponse(
      id: credential.id,
      rawId: credential.rawId.toDart.asUint8List(),
      clientData: PasskeyClientData.fromJson(
        jsonDecode(
          utf8.decode(response.clientDataJSON.toDart.asUint8List()),
        ) as Map<String, Object?>,
      ),
      authenticatorData: response.authenticatorData.toDart.asUint8List(),
      signature: response.signature.toDart.asUint8List(),
      userHandle: response.userHandle?.toDart.asUint8List(),
      authenticatorAttachment:
          credential.authenticatorAttachment as AuthenticatorAttachment?,
    );
  }
}

extension on AuthenticatorAttestationResponse {
  List<AuthenticatorTransport>? get transports {
    // Continue to play it safe with `getTransports()` for now, even when L3
    // types say it's required
    if (!getProperty('getTransports'.toJS).typeofEquals('function')) {
      return null;
    }
    final transports = getTransports();
    return transports.toDart.cast<AuthenticatorTransport>();
  }

  COSEAlgorithmIdentifier? get publicKeyAlgorithm {
    // L3 says this is required, but browser and webview support are still
    // not guaranteed.
    if (!getProperty('getPublicKeyAlgorithm'.toJS).typeofEquals('function')) {
      return null;
    }
    return getPublicKeyAlgorithm() as COSEAlgorithmIdentifier;
  }

  Uint8List? get publicKey {
    // L3 says this is required, but browser and webview support are still
    // not guaranteed.
    if (!getProperty('getPublicKey'.toJS).typeofEquals('function')) {
      return null;
    }
    final publicKey = getPublicKey();
    return publicKey?.toDart.asUint8List();
  }

  Uint8List? get authenticatorData {
    // L3 says this is required, but browser and webview support are still
    // not guaranteed.
    if (!getProperty('getAuthenticatorData'.toJS).typeofEquals('function')) {
      return null;
    }
    final authenticatorData = getAuthenticatorData();
    return authenticatorData.toDart.asUint8List();
  }
}

@JS('Error')
extension type JSError._(JSObject e) implements JSObject {
  external String get message;
  external String get name;
  external String get stack;
}

extension type RegistrationError._(JSError _) implements JSError {
  // TODO(dnys1): Cover all cases
  // https://github.com/MasterKale/SimpleWebAuthn/blob/634ceabdb05f4b5e56132fff7c57598caa2401a8/packages/browser/src/helpers/identifyRegistrationError.ts#L7
  PasskeyException toPasskeyException() {
    return PasskeyException(message: '$name: $message');
  }
}

extension type AuthenticationError._(JSError _) implements JSError {
  // TODO(dnys1): Cover all cases
  // https://github.com/MasterKale/SimpleWebAuthn/blob/634ceabdb05f4b5e56132fff7c57598caa2401a8/packages/browser/src/helpers/identifyAuthenticationError.ts#L7
  PasskeyException toPasskeyException() {
    return PasskeyException(message: '$name: $message');
  }
}
