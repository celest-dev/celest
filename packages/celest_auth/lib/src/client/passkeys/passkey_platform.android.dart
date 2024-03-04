import 'dart:async';
import 'dart:convert';

import 'package:celest_auth/src/client/passkeys/passkey_platform_impl.vm.dart';
import 'package:celest_auth/src/platform/android/jni_bindings.ffi.dart'
    hide Exception, Uri;
import 'package:celest_auth/src/platform/android/jni_helpers.dart';
import 'package:celest_core/celest_core.dart';
import 'package:jni/jni.dart';

final class PasskeyPlatformAndroid extends PasskeyPlatformImpl {
  PasskeyPlatformAndroid({
    required super.protocol,
  }) : super.base();

  late final Activity _mainActivity =
      Activity.fromRef(Jni.getCurrentActivity());
  late final Context _mainActivityContext =
      Context.fromRef(_mainActivity.reference);
  late final Context _applicationContext =
      Context.fromRef(Jni.getCachedApplicationContext());
  late final Executor _threadPool = Executor.fromRef(
    Executors.newCachedThreadPool().reference,
  );
  late final CredentialManager _credentialManager =
      CredentialManager.create(_applicationContext);

  @override
  Future<bool> get isSupported async {
    final callback = Completer<bool>();
    final client = Fido.getFido2ApiClient(_mainActivity);
    final isAvailable = client.isUserVerifyingPlatformAuthenticatorAvailable();
    isAvailable
      ..addOnSuccessListener(
        OnSuccessListener.implement(
          $OnSuccessListenerImpl(
            TResult: isAvailable.TResult,
            onSuccess: (boolean) => callback.complete(
              boolean.booleanValue(releaseOriginal: true),
            ),
          ),
        ),
      )
      ..addOnFailureListener(
        OnFailureListener.implement(
          // TODO(dnys1): Convert to PasskeyException
          $OnFailureListenerImpl(onFailure: callback.completeError),
        ),
      );
    return callback.future;
  }

  @override
  Future<PasskeyRegistrationResponse> register(
    PasskeyRegistrationRequest request,
  ) async {
    final options = await protocol.requestRegistration(request: request);
    final jRequest = CreatePublicKeyCredentialRequest.new7(
      jsonEncode(options.toJson()).toJString(),
    );
    final responseCallback = Completer<CreatePublicKeyCredentialResponse>();
    _credentialManager.createCredentialAsync(
      _mainActivityContext,
      jRequest,
      CancellationSignal(),
      _threadPool,
      CredentialManagerCallback<CreateCredentialResponse,
          CreateCredentialException>.implement(
        $CredentialManagerCallbackImpl(
          R: CreateCredentialResponse.type,
          E: CreateCredentialException.type,
          onResult: (resp) => responseCallback
              .complete(resp.as(CreatePublicKeyCredentialResponse.type)),
          onError: responseCallback.completeError,
        ),
      ),
    );
    try {
      final response = await responseCallback.future;
      final passkeyJson = response
          .getRegistrationResponseJson()
          .toDartString(releaseOriginal: true);
      return PasskeyRegistrationResponse.fromJson(
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
        "Unexpected exception type: "
        "${e.getType().toDartString(releaseOriginal: true)}",
      );
    }
  }

  @override
  Future<PasskeyAuthenticationResponse> authenticate(
    PasskeyAuthenticationRequest request,
  ) async {
    final options = await protocol.requestAuthentication(request: request);
    final jRequest = GetCredentialRequest_Builder()
        .addCredentialOption(
          GetPublicKeyCredentialOption.new3(
            jsonEncode(options.toJson()).toJString(),
          ),
        )
        .build();
    final responseCallback = Completer<GetCredentialResponse>();
    _credentialManager.getCredentialAsync(
      _mainActivityContext,
      jRequest,
      CancellationSignal(),
      _threadPool,
      CredentialManagerCallback<GetCredentialResponse,
          GetCredentialException>.implement(
        $CredentialManagerCallbackImpl(
          R: GetCredentialResponse.type,
          E: GetCredentialException.type,
          onResult: (resp) => responseCallback.complete(resp),
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
          .toDartString(releaseOriginal: true);
      return PasskeyAuthenticationResponse.fromJson(
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
        final message = e.getMessage().toDartString(releaseOriginal: true);
        if (message == 'Failed to decrypt credential.') {
          // TODO(dnys1): Sync account not available
        }
      }
      throw Exception(
        "Unexpected exception type: "
        "${e.getType().toDartString(releaseOriginal: true)}",
      );
    }
  }
}
