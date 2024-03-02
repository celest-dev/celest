import 'dart:convert';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';

import 'package:celest_auth/src/client/passkeys/passkey_client_platform.web.dart';
import 'package:celest_auth/src/client/passkeys/passkey_exception.dart';
import 'package:celest_auth/src/client/passkeys/passkey_models.dart';
import 'package:web/web.dart'
    hide
        COSEAlgorithmIdentifier,
        AuthenticatorTransport,
        AuthenticatorAttachment;

final class PasskeyClientWeb extends PasskeyClientPlatform {
  PasskeyClientWeb() : super.base();

  @override
  Future<bool> get isSupported async {
    final publicKeyCredential = window.getProperty('PublicKeyCredential'.toJS);
    if (!publicKeyCredential.typeofEquals('function')) {
      return false;
    }
    return PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable()
        .toDart
        .then((value) => value.toDart);
  }

  static Uint8List _getRandomValues(int size) {
    final values = Uint8List(size);
    window.crypto.getRandomValues(values.toJS);
    return values;
  }

  @override
  Future<PasskeyRegistrationResponse> register(
    PasskeyRegistrationOptions options,
  ) async {
    if (!await isSupported) {
      throw const PasskeyException(
        message: 'Passkeys are not supported in this environment',
      );
    }
    final credential = await window.navigator.credentials
        .create(
          CredentialCreationOptions(
            publicKey: PublicKeyCredentialCreationOptions(
              challenge:
                  (options.challenge ?? _getRandomValues(32)).buffer.toJS,
              rp: PublicKeyCredentialRpEntity(
                id: options.rpId,
              )..name = options.rpName,
              user: PublicKeyCredentialUserEntity(
                id: utf8.encode(options.userId).buffer.toJS,
                displayName: options.userDisplayName ?? '',
              )..name = options.userName,
              // This Relying Party will accept either an ES256 or RS256
              // credential, but prefers an ES256 credential.
              pubKeyCredParams: [
                for (final algId in COSEAlgorithmIdentifier.defaultSupported)
                  PublicKeyCredentialParameters(
                    type: 'public-key',
                    alg: algId,
                  ),
              ].toJS,
              authenticatorSelection: AuthenticatorSelectionCriteria(
                // Try to use UV if possible. This is also the default.
                userVerification: 'preferred',
              ),
              timeout: const Duration(minutes: 5).inMilliseconds,
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
      clientData: PasskeyClientData.fromJson(
        jsonDecode(
          utf8.decode(response.clientDataJSON.toDart.asUint8List()),
        ) as Map<String, Object?>,
      ),
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
    final credential = await window.navigator.credentials
        .get(
          CredentialRequestOptions(
            publicKey: PublicKeyCredentialRequestOptions(
              challenge: request.challenge.buffer.toJS,
              rpId: request.rpId,
              allowCredentials:
                  (request.allowCredentials ?? const <PasskeyDescriptor>[])
                      .map(
                        (credential) => PublicKeyCredentialDescriptor(
                          id: credential.id.buffer.toJS,
                          type: 'public-key',
                          transports: (credential.transports ??
                                  const <AuthenticatorTransport>[])
                              .map((transport) => transport.toJS)
                              .toList()
                              .toJS,
                        ),
                      )
                      .toList()
                      .toJS,
              userVerification: request.userVerification,
              timeout: const Duration(minutes: 5).inMilliseconds,
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
  @JS('getTransports')
  external JSArray<JSString> _getTransports();

  List<AuthenticatorTransport>? get transports {
    // Continue to play it safe with `getTransports()` for now, even when L3
    // types say it's required
    if (!getProperty('getTransports'.toJS).typeofEquals('function')) {
      return null;
    }
    final transports = _getTransports();
    return transports.toDart.cast<AuthenticatorTransport>();
  }

  @JS('getPublicKeyAlgorithm')
  external COSEAlgorithmIdentifier _getPublicKeyAlgorithm();

  COSEAlgorithmIdentifier? get publicKeyAlgorithm {
    // L3 says this is required, but browser and webview support are still
    // not guaranteed.
    if (!getProperty('getPublicKeyAlgorithm'.toJS).typeofEquals('function')) {
      return null;
    }
    return _getPublicKeyAlgorithm();
  }

  @JS('getPublicKey')
  external JSArrayBuffer _getPublicKey();

  Uint8List? get publicKey {
    // L3 says this is required, but browser and webview support are still
    // not guaranteed.
    if (!getProperty('getPublicKey'.toJS).typeofEquals('function')) {
      return null;
    }
    final publicKey = _getPublicKey();
    return publicKey.toDart.asUint8List();
  }

  @JS('getAuthenticatorData')
  external JSArrayBuffer _getAuthenticatorData();

  Uint8List? get authenticatorData {
    // L3 says this is required, but browser and webview support are still
    // not guaranteed.
    if (!getProperty('getAuthenticatorData'.toJS).typeofEquals('function')) {
      return null;
    }
    final authenticatorData = _getAuthenticatorData();
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
