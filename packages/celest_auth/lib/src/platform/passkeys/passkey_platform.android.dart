import 'dart:async';
import 'dart:convert';

import 'package:celest_auth/src/native/android/jni_bindings.ffi.dart'
    hide Exception;
import 'package:celest_auth/src/native/android/jni_helpers.dart';
import 'package:celest_auth/src/platform/passkeys/passkey_platform_impl.vm.dart';
import 'package:celest_core/celest_core.dart';
import 'package:jni/jni.dart';

final class PasskeyPlatformAndroid extends PasskeyPlatformImpl {
  PasskeyPlatformAndroid() : super.base() {
    Jni.initDLApi();
  }

  late final Activity _mainActivity =
      Activity.fromRef(Jni.getCurrentActivity());
  late final CelestAuth _celestAuth = CelestAuth(_mainActivity);
  CancellationSignal? _cancellationSignal;

  // Throws with java.lang.NoSuchMethodError: no static method
  // "Landroidx/credentials/CredentialManager;.create(Landroid/content/Context;)Landroidx/credentials/CredentialManager;"
  // late final CredentialManager _credentialManager =
  //     CredentialManager.create(_mainActivityContext);

  @override
  Future<bool> get isSupported async {
    final callback = Completer<JBoolean>();
    final client = Fido.getFido2ApiClient(_mainActivity);
    final isAvailable = client.isUserVerifyingPlatformAuthenticatorAvailable();
    final onSuccess = OnSuccessListener.implement(
      $OnSuccessListenerImpl(
        TResult: isAvailable.TResult,
        onSuccess: callback.complete,
      ),
    );
    final onError = OnFailureListener.implement(
      // TODO(dnys1): Convert to PasskeyException
      $OnFailureListenerImpl(onFailure: (error) {
        callback.completeError(error);
      }),
    );
    isAvailable
      ..addOnSuccessListener(onSuccess)
      ..addOnFailureListener(onError);
    final result = await callback.future;
    return result.booleanValue();
  }

  @override
  void cancel() {
    _cancellationSignal?.cancel();
    _cancellationSignal = null;
  }

  @override
  Future<PasskeyCredential> register(
    PasskeyRegistrationOptions options,
  ) async {
    final requestJson = jsonEncode(options.toJson()).toJString();
    final responseCallback = Completer<CreateCredentialResponse>();
    _cancellationSignal = _celestAuth.register(
      requestJson,
      CredentialManagerCallback<CreateCredentialResponse,
          CreateCredentialException>.implement(
        $CredentialManagerCallbackImpl(
          R: CreateCredentialResponse.type,
          E: CreateCredentialException.type,
          onResult: responseCallback.complete,
          onError: responseCallback.completeError,
        ),
      ),
    );
    try {
      final response = await responseCallback.future;
      final passkeyJson = response
          .as(CreatePublicKeyCredentialResponse.type)
          .getRegistrationResponseJson()
          .toDartString();
      return PasskeyCredential.fromJson(
        jsonDecode(passkeyJson) as Map<String, Object?>,
      );
    } on CreateCredentialException catch (e) {
      if (e.instanceOf(CreatePublicKeyCredentialDomException.type)) {
        // Handle the passkey DOM errors thrown according to the
        // WebAuthn spec using e.domError
        throw Exception(
          'An error occurred while creating a passkey, please check logs for additional details.',
        );
      }
      if (e.instanceOf(CreateCredentialCancellationException.type)) {
        // The user intentionally canceled the operation and chose not
        // to register the credential.
        throw Exception(
            "The user intentionally canceled the operation and chose not to register the credential. Check logs for additional details.");
      }
      if (e.instanceOf(CreateCredentialInterruptedException.type)) {
        // Retry-able error. Consider retrying the call.
        throw Exception(
            "The operation was interrupted, please retry the call. Check logs for additional details.");
      }
      if (e.instanceOf(CreateCredentialProviderConfigurationException.type)) {
        // Your app is missing the provider configuration dependency.
        // Most likely, you're missing "credentials-play-services-auth".
        throw Exception(
            "Your app is missing the provider configuration dependency. Check logs for additional details.");
      }
      if (e.instanceOf(CreateCredentialUnknownException.type)) {
        throw Exception(
            "An unknown error occurred while creating passkey. Check logs for additional details.");
      }
      if (e.instanceOf(CreateCredentialCustomException.type)) {
        // You have encountered an error from a 3rd-party SDK. If you
        // make the API call with a request object that's a subclass of
        // CreateCustomCredentialRequest using a 3rd-party SDK, then you
        // should check for any custom exception type constants within
        // that SDK to match with e.type. Otherwise, drop or log the
        // exception.
        throw Exception(
            "An unknown error occurred from a 3rd party SDK. Check logs for additional details.");
      }
      throw Exception(
        "Unexpected exception type: ${e.getType().toDartString()}",
      );
    }
  }

  @override
  Future<PasskeyCredential> authenticate(
    PasskeyAuthenticationOptions options,
  ) async {
    final requestJson = jsonEncode(options.toJson()).toJString();
    // final jRequest = GetCredentialRequest_Builder()
    //     .addCredentialOption(
    //       GetPublicKeyCredentialOption.new3(requestJson),
    //     )
    //     .build();
    final responseCallback = Completer<GetCredentialResponse>();
    _cancellationSignal = _celestAuth.authenticate(
      requestJson,
      CredentialManagerCallback<GetCredentialResponse,
          GetCredentialException>.implement(
        $CredentialManagerCallbackImpl(
          R: GetCredentialResponse.type,
          E: GetCredentialException.type,
          onResult: responseCallback.complete,
          onError: responseCallback.completeError,
        ),
      ),
    );
    try {
      final response = await responseCallback.future;
      final passkeyJson = response
          .getCredential()
          .as(PublicKeyCredential.type)
          .getAuthenticationResponseJson()
          .toDartString();
      return PasskeyCredential.fromJson(
        jsonDecode(passkeyJson) as Map<String, Object?>,
      );
    } on GetCredentialException catch (e) {
      if (e.instanceOf(GetCredentialCancellationException.type)) {
        // The user intentionally canceled the operation and chose not
        // to authenticate the credential.
        throw Exception(
            "The user intentionally canceled the operation and chose not to authenticate the credential. Check logs for additional details.");
      }
      if (e.instanceOf(NoCredentialException.type)) {
        // TODO(dnys1): Handle
      }
      if (e.instanceOf(GetPublicKeyCredentialDomException.type)) {
        final message = e.getMessage().toDartString();
        if (message == 'Failed to decrypt credential.') {
          // TODO(dnys1): Sync account not available
        }
      }
      throw Exception(
        'Unexpected exception type: ${e.getType().toDartString()}',
      );
    }
  }
}
