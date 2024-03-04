import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:celest_auth/src/platform/passkeys/passkey_platform_impl.vm.dart';
import 'package:celest_auth/src/native/darwin/celest_auth.ffi.dart';
import 'package:celest_core/celest_core.dart';
// ignore: implementation_imports
import 'package:celest_core/src/util/globals.dart';
import 'package:ffi/ffi.dart';

final class PasskeyPlatformDarwin extends PasskeyPlatformImpl {
  PasskeyPlatformDarwin({
    required super.protocol,
  }) : super.base();

  late final _platform = CelestAuthDarwin(DynamicLibrary.process());
  late final _celestAuth = CelestAuth.new1(_platform);

  @override
  Future<bool> get isSupported async {
    return kIsFlutter && _celestAuth.isPasskeysSupported;
  }

  @override
  void cancel() {
    _celestAuth.cancel();
    // TODO(dnys1): Ignore results?
  }

  @override
  Future<PasskeyRegistrationResponse> register(
    PasskeyRegistrationRequest request,
  ) async {
    if (!await isSupported) {
      throw const PasskeyUnsupportedException();
    }
    final options = await protocol.requestRegistration(request: request);

    final completer = Completer<PasskeyRegistrationResponse>();
    final onSuccess = ObjCBlock_ffiVoid_Uint8.listener(_platform, (json) {
      if (json == nullptr) {
        return completer.completeError(StateError('Bad ptr'));
      }
      final response = PasskeyRegistrationResponse.fromJson(
        jsonDecode(json.cast<Utf8>().toDartString()) as Map<String, Object?>,
      );
      completer.complete(response);
      _celestAuth.freePointer_(json);
    });
    final onError = ObjCBlock_ffiVoid_CelestAuthErrorCode_Uint8.listener(
      _platform,
      (code, error) {
        if (error == nullptr) {
          return completer.completeError(StateError('Bad pointer'));
        }
        final message = error.cast<Utf8>().toDartString();
        final exception = _CelestAuthError(code).toException(message);
        completer.completeError(exception);
        _celestAuth.freePointer_(error);
      },
    );
    _celestAuth.registerWithRequest_onSuccess_onError_(
      jsonEncode(options.toJson()).toNSString(_platform),
      onSuccess,
      onError,
    );

    // Await here so the blocks are not GC'd before they are called.
    final response = await completer.future;
    return response;
  }

  @override
  Future<PasskeyAuthenticationResponse> authenticate(
    PasskeyAuthenticationRequest request,
  ) async {
    if (!await isSupported) {
      throw const PasskeyUnsupportedException();
    }
    final options = await protocol.requestAuthentication(request: request);
    final completer = Completer<PasskeyAuthenticationResponse>();
    final onSuccess = ObjCBlock_ffiVoid_Uint8.listener(_platform, (json) {
      if (json == nullptr) {
        return completer.completeError(StateError('Bad ptr'));
      }
      final response = PasskeyAuthenticationResponse.fromJson(
        jsonDecode(json.cast<Utf8>().toDartString()) as Map<String, Object?>,
      );
      completer.complete(response);
      _celestAuth.freePointer_(json);
    });
    final onError = ObjCBlock_ffiVoid_CelestAuthErrorCode_Uint8.listener(
      _platform,
      (code, error) {
        if (error == nullptr) {
          return completer.completeError(StateError('Bad pointer'));
        }
        final message = error.cast<Utf8>().toString();
        final exception = _CelestAuthError(code).toException(message);
        completer.completeError(exception);
        _celestAuth.freePointer_(error);
      },
    );
    _celestAuth.authenticateWithRequest_onSuccess_onError_(
      jsonEncode(options.toJson()).toNSString(_platform),
      onSuccess,
      onError,
    );

    // Await here so the blocks are not GC'd before they are called.
    final response = await completer.future;
    return response;
  }
}

extension type _CelestAuthError(int code) {
  Object toException(String message) {
    return switch (code) {
      CelestAuthErrorCode.CelestAuthErrorCodeCanceled =>
        const PasskeyCancellationException(),
      CelestAuthErrorCode.CelestAuthErrorCodeUnsupported =>
        const PasskeyUnsupportedException(),
      CelestAuthErrorCode.CelestAuthErrorCodeFailed =>
        PasskeyFailedException(message),
      // This shouldn't happen
      CelestAuthErrorCode.CelestAuthErrorCodeSerde => StateError(message),
      // This shouldn't happen
      CelestAuthErrorCode.CelestAuthErrorCodeNotHandled => StateError(message),
      _ => PasskeyUnknownException(message),
    };
  }
}
